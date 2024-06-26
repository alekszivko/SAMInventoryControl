package com.samic.samic.views.freie_lagerobjekte;

import com.samic.samic.components.UIFactory;
import com.samic.samic.components.form.ReservationForm;
import com.samic.samic.data.entity.Customer;
import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.Reservation;
import com.samic.samic.data.entity.Role;
import com.samic.samic.data.entity.Storage;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.security.AuthenticatedUser;
import com.samic.samic.services.ServiceObjectType;
import com.samic.samic.services.ServiceReservation;
import com.samic.samic.services.ServiceStorage;
import com.samic.samic.services.ServiceStorageObject;
import com.samic.samic.views.MainLayout;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.icon.Icon;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.data.renderer.ComponentRenderer;
import com.vaadin.flow.data.value.ValueChangeMode;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import jakarta.annotation.security.PermitAll;
import java.util.stream.Stream;
import org.springframework.data.domain.PageRequest;

@PageTitle("Freie Lagerobjekte")
@Route(value = "freieLagerobjekte", layout = MainLayout.class)
@PermitAll
public class FreieLagerobjekteView extends VerticalLayout {

  private final TextField searchField = new TextField();
  private final ComboBox<Storage> filterStorage = new ComboBox<>();
  private final ComboBox<ObjectType> filterObjectType = new ComboBox<>();
  private final Dialog reservationDialog = new Dialog();
  private final Grid<StorageObject> grid = new Grid<>(StorageObject.class, false);
  private final ServiceStorageObject storageObjectService;
  private final ServiceObjectType objectTypeService;
  private final AuthenticatedUser authenticatedUser;
  private final ServiceStorage storageService;
  private final ReservationForm reservationForm;
  private final ServiceReservation reservationService;
  private StorageObject storageObjectToSave;


  public FreieLagerobjekteView(ServiceStorageObject storageObjectService,
      ServiceObjectType objectTypeService,
      ServiceStorage storageService, AuthenticatedUser authenticatedUser,
      ReservationForm reservationForm,
      ServiceReservation reservationService) {
    this.storageObjectService = storageObjectService;
    this.objectTypeService = objectTypeService;
    this.authenticatedUser = authenticatedUser;
    this.storageService = storageService;
    this.reservationForm = reservationForm;
    this.reservationService = reservationService;

    initUI();
  }

  private void initUI() {
    setHeightFull();

    reservationDialog.add(
        UIFactory.rootComponentContainer("Gerät reservieren", reservationForm,
            UIFactory.childContainer(JustifyContentMode.START,
                UIFactory.btnPrimary("Reservieren", onClick -> onReserve()),
                UIFactory.btnPrimaryError("Abbrechen", onClick -> onCancel())))
    );

    add(
        UIFactory.rootComponentContainer("",
            UIFactory.childContainer(
                JustifyContentMode.START,
                searchField,
                filterStorage,
                filterObjectType
            )),
        UIFactory.rootComponentContainerFullHeight("",
            UIFactory.childContainerFullHeight(
                JustifyContentMode.START,
                grid)),
        reservationDialog);

    initSearchField();
    initFilterStorage();
    initGrid();
    initGridData();
    initFilterObjectType();
    initValueChangeListeners();
  }

  private void initValueChangeListeners() {
    searchField.addValueChangeListener(
        e -> {
          listFilteredStorageObjects(e.getValue(), filterStorage.getValue()
              .getId());
          filterObjectType.clear();
        });
    filterStorage.addValueChangeListener(
        e -> listFilteredStorageObjects(searchField.getValue(), e.getValue().getId()));
    filterObjectType.addValueChangeListener(
        e -> {
          searchField.setValue(e.getValue().getName());
          listFilteredStorageObjectsExactly(e.getValue().getName(),
              filterStorage.getValue().getId());
        });
  }

  private void initFilterObjectType() {
    filterStorage.setAllowCustomValue(false);
    filterObjectType.setItemLabelGenerator(ObjectType::getName);
    filterObjectType.setPlaceholder("Gerätetyp auswählen");
    filterObjectType.setWidth("250px");
    initFilterObjectTypeData();
  }

  private void initFilterObjectTypeData() {
    filterObjectType.setItems(objectTypeService.findAll().toList());
  }

  private void initSearchField() {
    searchField.setWidth("20%");
    searchField.setPlaceholder("Suchen...");
    searchField.setPrefixComponent(new Icon(VaadinIcon.SEARCH));
    searchField.setValueChangeMode(ValueChangeMode.EAGER);
  }

  private void initFilterStorage() {
    filterStorage.setAllowCustomValue(false);
    initFilterStorageData();

    filterStorage.setItemLabelGenerator(Storage::getName);
    filterStorage.setAllowCustomValue(false);
    filterStorage.setValue(filterStorage.getListDataView()
        .getItem(0));
    filterStorage.setPlaceholder("Lager auswählen");
  }

  private void initFilterStorageData() {
    filterStorage.setItems(
        storageService.findAll().filter(storage -> !storage.getName().equals("Kunde")).toList());
  }

  private void initGrid() {
    grid.addColumn(StorageObject::getId).setHeader("Lager ID").setAutoWidth(true).setFlexGrow(0);
    grid.addColumn(so -> so.getObjectTypeName() != null ? so.getObjectTypeName().getName()
            : so.getSupply().getDescription()).setHeader("Gerätetyp").setAutoWidth(true)
        .setFlexGrow(1);
    grid.addColumn(StorageObject::getRemark).setHeader("Anmerkung").setAutoWidth(true)
        .setFlexGrow(2);
    grid.addColumn(so -> so.getStorage().getName()).setHeader("Lager");
    if (authenticatedUser.getUser().get().getRole() == Role.STORAGEADMIN
        || authenticatedUser.getUser().get().getRole() == Role.FIELDSERVICETECHNICIAN) {
      grid.addComponentColumn(item -> new Span(
              UIFactory.btnIconWithTooltip(VaadinIcon.BOOKMARK.create(),
                  "Reservieren", e -> openReservationForm(item)),
              UIFactory.btnIconWithTooltip(VaadinIcon.INSERT.create(),
                  "Aufnehmen", e -> addToUser(item)))).setHeader("Aktionen")
          .setAutoWidth(true).setFrozenToEnd(true);
    }
    grid.setItemDetailsRenderer(createStorageObjectDetailsRenderer());
    grid.getStyle().setBorder("0px");
    grid.setHeightFull();
  }

  private void initGridData() {
    listFilteredStorageObjects("%", filterStorage.getValue().getId());
  }

  private void listFilteredStorageObjects(String filterString, Long storageId) {
    String filter = "%" + filterString + "%";
    grid.setItems(query ->
        storageObjectService.searchSto(filter,
            PageRequest.of(query.getPage(), query.getPageSize()), storageId));
  }

  private void listFilteredStorageObjectsExactly(String filterString, Long storageId) {
    grid.setItems(query -> storageObjectService.searchSto(filterString,
        PageRequest.of(query.getPage(), query.getPageSize()), storageId));
  }

  private void onCancel() {
    this.reservationDialog.close();
    this.storageObjectToSave = null;
  }

  private void onReserve() {
    Reservation reservationToSave = reservationForm.save();

    reservationToSave.setReservedFrom(authenticatedUser.getUser().get());

    var persistedReservation = reservationService.saveReservationByObject(reservationToSave);
    this.storageObjectToSave.setReservation(persistedReservation);
    storageObjectService.saveStorageObject(storageObjectToSave);

    this.storageObjectToSave = null;
    reservationDialog.close();

    UIFactory.notificationSuccess("Reservierung erfolgreich durchgeführt").open();
    grid.getDataProvider().refreshAll();
  }

  private ComponentRenderer<StorageObjectDetailsForm, StorageObject> createStorageObjectDetailsRenderer() {
    return new ComponentRenderer<>(StorageObjectDetailsForm::new,
        StorageObjectDetailsForm::setStorageObject);
  }

  private void openReservationForm(StorageObject storageObject) {
    this.storageObjectToSave = storageObject;
    reservationForm.setBean(
        Reservation.builder().customer(Customer.builder().connectionNo("").build()).build());
    reservationDialog.open();
  }

  private void addToUser(StorageObject item) {
    item.setStoredAtUser(authenticatedUser.getUser().get());
    item.setStorage(null);

    storageObjectService.saveStorageObject(item);
    UIFactory.notificationSuccess("Lagerobjekt erfolgreich deinem Lager hinzugefügt").open();
    grid.getDataProvider().refreshAll();
  }


  private class StorageObjectDetailsForm extends FormLayout {

    private final TextField remark = new TextField("Anmerkung");

    public StorageObjectDetailsForm() {
      remark.setWidth("200px");
      Stream.of(remark).forEach(field -> {
        field.setReadOnly(true);
        add(field);
      });

    }

    protected void setStorageObject(StorageObject storageObject) {
      if (storageObject.getRemark() != null) {
        remark.setValue(storageObject.getRemark());
      } else {
        remark.setValue("");
      }
    }
  }
}
