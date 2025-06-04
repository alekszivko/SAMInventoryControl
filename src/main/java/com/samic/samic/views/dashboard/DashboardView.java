package com.samic.samic.views.dashboard;

import com.samic.samic.components.UIFactory;
import com.samic.samic.components.form.CPEForm;
import com.samic.samic.components.form.SFPForm;
import com.samic.samic.components.form.StorageForm;
import com.samic.samic.components.form.SupplyForm;
import com.samic.samic.components.form.UserForm;
import com.samic.samic.components.grid.ReservationGrid;
import com.samic.samic.components.grid.StorageObjectGrid;
import com.samic.samic.data.entity.Address;
import com.samic.samic.data.entity.CPE;
import com.samic.samic.data.entity.Producer;
import com.samic.samic.data.entity.Profile;
import com.samic.samic.data.entity.Role;
import com.samic.samic.data.entity.SFP;
import com.samic.samic.data.entity.Storage;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.entity.Supply;
import com.samic.samic.data.entity.User;
import com.samic.samic.security.AuthenticatedUser;
import com.samic.samic.security.UserDetailsServiceImpl;
import com.samic.samic.services.ServiceObjectType;
import com.samic.samic.services.ServiceProducer;
import com.samic.samic.services.ServiceReservation;
import com.samic.samic.services.ServiceStorage;
import com.samic.samic.services.ServiceStorageObject;
import com.samic.samic.views.MainLayout;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.contextmenu.MenuItem;
import com.vaadin.flow.component.contextmenu.SubMenu;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.menubar.MenuBar;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.dom.Style.JustifyContent;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.router.RouteAlias;
import jakarta.annotation.security.PermitAll;
import java.util.concurrent.atomic.AtomicInteger;


@PageTitle("Dashboard")
@Route(value = "dashboard", layout = MainLayout.class)
@RouteAlias(value = "", layout = MainLayout.class)
@PermitAll
public class DashboardView extends VerticalLayout implements BeforeEnterObserver {

  private final ServiceReservation reservationService;
  private final ServiceStorageObject storageObjectService;
  private final AuthenticatedUser authenticatedUser;
  private final ServiceObjectType serviceObjectType;
  private final MenuBar menuBar = new MenuBar();
  private final CPEForm cpeForm;
  private final SFPForm sfpForm;
  private final SupplyForm supplyForm;
  private final UserForm userForm;
  private final StorageForm storageForm;
  private final ServiceObjectType objectTypeService;
  private final ServiceStorage storageService;
  private final ServiceProducer producerService;
  private final ComboBox<Storage> storageComboBox = new ComboBox<>("Lager");
  private final ComboBox<Producer> producerComboBox = new ComboBox<>("Hersteller");

  private final ReservationGrid reservationGrid;
  private final StorageObjectGrid hardwareGrid;
  private final UserDetailsServiceImpl userDetailsService;


  public DashboardView(ServiceReservation reservationService,
      ServiceStorageObject storageObjectService, AuthenticatedUser authenticatedUser,
      ServiceProducer producerService, ServiceObjectType serviceObjectType,
      CPEForm cpeForm, SFPForm sfpForm, SupplyForm supplyForm, UserForm userForm,
      ServiceObjectType objectTypeService, ServiceStorage storageService, StorageForm storageForm,
      ReservationGrid reservationGrid,
      StorageObjectGrid hardwareGrid,
      UserDetailsServiceImpl userDetailsService) {
    this.reservationService = reservationService;
    this.storageObjectService = storageObjectService;
    this.authenticatedUser = authenticatedUser;
    this.serviceObjectType = serviceObjectType;
    this.cpeForm = cpeForm;
    this.sfpForm = sfpForm;
    this.supplyForm = supplyForm;
    this.userForm = userForm;
    this.objectTypeService = objectTypeService;
    this.storageService = storageService;
    this.storageForm = storageForm;
    this.reservationGrid = reservationGrid;
    this.hardwareGrid = hardwareGrid;
    this.producerService = producerService;
    this.userDetailsService = userDetailsService;

    initUI();
    initDropdowns();

  }

  private void initUI() {
    initStats();
    initQuickAccess();

    if (authenticatedUser.getUser().get().getRole() == Role.STORAGEADMIN
        || authenticatedUser.getUser().get().getRole() == Role.FIELDSERVICETECHNICIAN) {
      initReservation();
      initHardware();
    }
  }

  private void initDropdowns() {
    storageComboBox.setItems(storageService.findAll().toList());
    producerComboBox.setItems(producerService.findAll().toList());

    storageComboBox.setItemLabelGenerator(Storage::getName);
    storageComboBox.setAllowCustomValue(false);

    producerComboBox.setAllowCustomValue(false);
    producerComboBox.setItemLabelGenerator(Producer::getName);
  }

  private void initStats() {
    VerticalLayout statsContainer = UIFactory.rootComponentContainer("Statistiken");
    HorizontalLayout statsComponents = UIFactory.childContainer(JustifyContentMode.START);

    storageObjectService.findAmountOfObjectType2().forEach(
        (key, value) -> {
          AtomicInteger objectTypeMin = new AtomicInteger();
          serviceObjectType.findObjectTypeByNameOptional(key)
              .ifPresent(o -> objectTypeMin.set(o.getMinValue().intValue()));
          Span sp = new Span(key + " " + value + "/" + objectTypeMin);

          if (value <= objectTypeMin.get()) {
            sp.getElement().getThemeList().add("badge error");
          } else {
            sp.getElement().getThemeList().add("badge success");
          }
          statsComponents.add(sp);
        });
    statsContainer.add(statsComponents);
    add(statsContainer);
  }

  private void initQuickAccess() {
    var role = authenticatedUser.getUser().get().getRole();
    menuBar.setOpenOnHover(true);
    menuBar.addItem("Lagerobjekt aufnehmen", onClick -> onGetDevice());
    menuBar.setWidth("100%");
    menuBar.getStyle().setJustifyContent(JustifyContent.SPACE_BETWEEN);

    if (role == Role.STORAGEADMIN || role == Role.FIELDSERVICETECHNICIAN) {
      MenuItem addSo = menuBar.addItem("Lagerobjekt erfassen");
      SubMenu addSoSubmenu = addSo.getSubMenu();
      addSoSubmenu.addItem("CPE", onClick -> onAddCPE());
      addSoSubmenu.addItem("SFP", onClick -> onAddSFP());
      addSoSubmenu.addItem("Verbrauchsmaterial", onClick -> onAddSupply());
    }
    if (role == Role.STORAGEADMIN) {
      menuBar.addItem("Lager hinzufügen", onClick -> {
        Dialog dialog = new Dialog();
        dialog.add(storageForm);
        storageForm.setBean(Storage.builder().address(Address.builder().build()).build());
        dialog.add(UIFactory.btnPrimary("Speichern", e -> {
          dialog.close();
          onSave(storageForm.isValid() ? storageForm.saveBean() : null);
        }), UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close()));
        dialog.open();
      });
      menuBar.addItem("Benutzer hinzufügen", onClick -> {
        Dialog dialog = new Dialog();
        dialog.add(userForm);
        userForm.setBean(User.builder().profile(Profile.builder().build()).build());
        dialog.add(UIFactory.btnPrimary("Speichern", e -> {
          dialog.close();
          onSave(userForm.isValid() ? userForm.saveBean() : null);
        }), UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close()));
        dialog.open();
      });

      add(
          UIFactory.rootComponentContainer(
              "Quick-Access", UIFactory.childContainer(JustifyContentMode.START, menuBar)));
    }
  }

  private void onAddSupply() {
    supplyForm.setSupplyBeans(StorageObject.builder().supply(Supply.builder().build()).build());
    createDialog(supplyForm).open();
  }

  private void onAddSFP() {
    sfpForm.setSFPBeans(objectTypeService.findAll().toList(),
        StorageObject.builder().sfp(SFP.builder().build()).build());
    createDialog(sfpForm).open();
  }

  private Dialog createDialog(SFPForm sfpForm) {
    Dialog dialog = new Dialog();

    dialog.setCloseOnOutsideClick(false);
    dialog.add(producerComboBox, storageComboBox, sfpForm);

    dialog.add(UIFactory.btnPrimary("Speichern", e -> {
      dialog.close();
      onSave(sfpForm.isValid() ? sfpForm.saveStorageObject() : null);
    }), UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close()));

    return dialog;

  }

  private Dialog createDialog(SupplyForm supplyForm) {
    Dialog dialog = new Dialog();

    dialog.setCloseOnOutsideClick(false);
    dialog.add(storageComboBox);
    dialog.add(supplyForm);

    dialog.add(UIFactory.btnPrimary("Speichern", e -> {
      dialog.close();
      onSave(supplyForm.isValid() ? supplyForm.saveStorageObject() : null);
    }), UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close()));

    return dialog;

  }

  private void onAddCPE() {
    cpeForm.setCPEBeans(objectTypeService.findAll().toList(),
        StorageObject.builder().cpe(CPE.builder().build()).build());
    createDialog(cpeForm).open();
  }

  private void onGetDevice() {
    createDialog(new TextField("Lager ID")).open();
  }

  private Dialog createDialog(CPEForm form) {
    Dialog dialog = new Dialog();

    dialog.setCloseOnOutsideClick(false);
    dialog.add(producerComboBox, storageComboBox, form);

    dialog.add(UIFactory.btnPrimary("Speichern", e -> {
      dialog.close();
      onSave(cpeForm.isValid() ? cpeForm.saveStorageObject() : null);
    }), UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close()));

    return dialog;

  }

  private Dialog createDialog(TextField field) {
    Dialog dialog = new Dialog();
    dialog.add(field);
    dialog.setCloseOnOutsideClick(false);

    dialog.add(UIFactory.btnPrimary("Speichern", e -> {
      dialog.close();
      onSetUser(field.getValue());
    }), UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close()));

    return dialog;

  }

  private void onSetUser(String id) {
    StorageObject storageObject = storageObjectService.findStorageObjectById(Long.valueOf(id));
    storageObject.setStoredAtUser(authenticatedUser.getUser().get());
    UIFactory.notificationSuccess("Lagerobjekt umgebucht").close();
    storageObjectService.saveStorageObject(storageObject);
    hardwareGrid.getDataProvider().refreshAll();
  }

  private void onSave(User user) {
    if (user == null) {
      UIFactory.notificationError("Benutzer konnte nicht gespeichert werden").open();
      return;
    }
    userDetailsService.register(user);
    UIFactory.notificationSuccess("Benutzer erfolgreich gespeichert").open();
    userForm.clearFields();
  }

  private void onSave(Storage storage) {
    if (storage == null) {
      UIFactory.notificationError("Lager konnte nicht gespeichert werden").open();
      return;
    }
    var persisted = storageService.saveStorageByObject(storage);
    UIFactory.notificationSuccess("Lager erfolgreich gespeichert").open();
  }


  private void onSave(StorageObject storageObject) {
    if (storageObject == null) {
      UIFactory.notificationError("Lagerobjekt konnte nicht gespeichert werden").open();
      return;
    }

    storageObject.setStorage(storageComboBox.getValue());
    if (storageObject.getCpe() != null) {
      storageObject.getCpe().setProducer(producerComboBox.getValue());
    } else if (storageObject.getSfp() != null) {
      storageObject.getSfp().setProducer(producerComboBox.getValue());
    }

    var persisted = storageObjectService.saveStorageObject(storageObject);
    if (storageObject.getObjectTypeName() != null) {
      UIFactory.notificationInfoNoDuration("LagerID: " + persisted.getId().toString() + " Ger"
          + "ätetyp: " + persisted.getObjectTypeName().getName()).open();
      UIFactory.notificationSuccess("Lagerobjekt erfolgreich gespeichert").open();

    } else {
      UIFactory.notificationInfoNoDuration("LagerID: " + persisted.getId().toString()).open();
      UIFactory.notificationSuccess("Lagerobjekt erfolgreich gespeichert").open();
    }
  }

  private void initHardware() {
    hardwareGrid.isAllRowsVisible();
    hardwareGrid.setMaxHeight("300px");
    hardwareGrid.getStyle().setBorder("0px");

    initHardwareData();
    add(UIFactory.rootComponentContainer("Meine Hardware", hardwareGrid));
  }

  private void initHardwareData() {
    hardwareGrid.setItems(
        storageObjectService.findStorageObjectByGivenUser(authenticatedUser.getUser().get())
            .toList());
  }

  private void initReservation() {
    reservationGrid.isAllRowsVisible();
    reservationGrid.setMaxHeight("300px");
    reservationGrid.getStyle().setBorder("0px");

    initReservationData();

    add(UIFactory.rootComponentContainer("Meine Reservierungen", reservationGrid));
  }


  void initReservationData() {
    reservationGrid.setItems(
        reservationService.findAllReservationByGivenUser(authenticatedUser.getUser().get()));
  }


  @Override
  public void beforeEnter(BeforeEnterEvent beforeEnterEvent) {
  }
}
