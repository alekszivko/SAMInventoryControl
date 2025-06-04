package com.samic.samic.views.administration;

import com.samic.samic.components.UIFactory;
import com.samic.samic.components.form.NotificationLimitForm;
import com.samic.samic.components.form.StorageForm;
import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.Storage;
import com.samic.samic.services.ServiceObjectType;
import com.samic.samic.services.ServiceStorage;
import com.vaadin.flow.component.dialog.Dialog;
import com.vaadin.flow.component.grid.Grid;
import com.vaadin.flow.component.grid.GridVariant;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.component.textfield.IntegerField;
import jakarta.annotation.PostConstruct;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.vaadin.lineawesome.LineAwesomeIcon;

@Component
@Scope("prototype")
public class AppSettings extends VerticalLayout {

  private final Grid<ObjectType> notificationLimitsGrid = new Grid<>(ObjectType.class,
      false);
  private final Grid<Storage> storageGrid = new Grid<>(Storage.class, false);
  private final DataProviderAdmin dataProvider;
  private final ServiceStorage storageService;
  private final ServiceObjectType objectTypeService;
  private final NotificationLimitForm notificationLimitForm;
  private final StorageForm storageForm;
  private final IntegerField reservationMaxDuration = new IntegerField(
      "Maximale erlaubte Reservierungsdauer:");

  public AppSettings(DataProviderAdmin dataProvider, ServiceStorage storageService,
      ServiceObjectType objectTypeService, ServiceObjectType objectTypeService1,
      NotificationLimitForm notificationLimitForm,
      StorageForm storageForm) {
    this.dataProvider = dataProvider;
    this.storageService = storageService;
    this.objectTypeService = objectTypeService1;
    this.notificationLimitForm = notificationLimitForm;
    this.storageForm = storageForm;
  }


  @PostConstruct
  private void initUI() {
    add(
        UIFactory.childContainer(JustifyContentMode.START,
            UIFactory.rootComponentContainer("Reservierungsdauer",
                reservationMaxDuration,
                UIFactory.btnPrimary("Speichern", e -> onSave(reservationMaxDuration.getValue()))
            ),
            UIFactory.rootComponentContainer("Benachrichtigungslimits",
                UIFactory.childContainer(JustifyContentMode.START,
                    notificationLimitsGrid,
                    storageGrid
                )),
            UIFactory.rootComponentContainer("Lager bearbeiten",
                UIFactory.childContainer(JustifyContentMode.START,
                    storageGrid)))
    );

    initStorageGrid();
    initStorageGridData();
    initNotificationLimitsGrid();
    initNotificationLimitsGridData();
    initMaxDuration();
    initMaxDurationData();
  }

  private void initStorageGrid() {
    storageGrid.addColumn(Storage::getName);
    storageGrid.addColumn(storage -> storage.getAddress().getStreet());
    storageGrid.addColumn(storage -> storage.getAddress().getHouseNo());
    storageGrid.addColumn(storage -> storage.getAddress().getDoorNo());
    storageGrid.addColumn(storage -> storage.getAddress().getZipCode());
    storageGrid.addColumn(storage -> storage.getAddress().getCity());
    storageGrid.getStyle().setBorder("0px");
    storageGrid.setMaxHeight("300px");
    storageGrid.addThemeVariants(GridVariant.LUMO_NO_ROW_BORDERS);
    storageGrid.addComponentColumn(item -> !item.getName().equals("Kunde") ? new Span(
        UIFactory.btnIconWithTooltip(LineAwesomeIcon.EDIT.create(), "Bearbeiten",
            e -> onEdit(item)),
        UIFactory.btnIconWithTooltip(LineAwesomeIcon.TRASH_SOLID.create(), "Löschen",
            e -> onRemove(item))) : new Span("")).setFrozenToEnd(true);
  }

  private void initStorageGridData() {
    storageGrid.setItems(storageService.findAll().toList());
  }

  private void initNotificationLimitsGrid() {
    notificationLimitsGrid.addColumn(ObjectType::getName);
    notificationLimitsGrid.getStyle().setBorder("0px");
    notificationLimitsGrid.setMaxHeight("200px");
    notificationLimitsGrid.addThemeVariants(GridVariant.LUMO_NO_ROW_BORDERS);
    notificationLimitsGrid.addComponentColumn(item -> new Span(
        UIFactory.btnIconWithTooltip(LineAwesomeIcon.EDIT.create(), "Bearbeiten",
            e -> onEdit(item)),
        UIFactory.btnIconWithTooltip(LineAwesomeIcon.TRASH_SOLID.create(), "Löschen",
            e -> onRemove(item)))).setFrozenToEnd(true);
  }

  private void initNotificationLimitsGridData() {
    notificationLimitsGrid.setItems(objectTypeService.findAll().toList());
  }

  private void initMaxDuration() {
    reservationMaxDuration.setRequired(true);
  }

  private void initMaxDurationData() {
    reservationMaxDuration.setValue(dataProvider.getReservationDuration());
  }

  private void onRemove(ObjectType item) {
    objectTypeService.saveObjectTypeByObject(item);
    notificationLimitsGrid.getDataProvider().refreshAll();
  }

  private void onRemove(Storage storage) {
    storageService.deleteByObject(storage);
    storageGrid.getDataProvider().refreshAll();
  }

  private void onEdit(ObjectType item) {
    Dialog dialog = new Dialog();
    notificationLimitForm.setBean(item);
    dialog.add(
        UIFactory.rootComponentContainer("Benachrichtigungslimit Bearbeiten",
            UIFactory.childContainer(
                JustifyContentMode.START,
                notificationLimitForm
            ),
            UIFactory.childContainer(
                JustifyContentMode.START,
                UIFactory.btnPrimary("Speichern", e -> {
                  onSaveNotificationLimit();
                  dialog.close();
                }),
                UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close())
            )
        )
    );
    dialog.open();
  }

  private void onEdit(Storage item) {
    Dialog dialog = new Dialog();
    storageForm.setBean(item);
    dialog.add(
        UIFactory.rootComponentContainer("Lager Bearbeiten",
            UIFactory.childContainer(
                JustifyContentMode.START,
                storageForm
            ),
            UIFactory.childContainer(
                JustifyContentMode.START,
                UIFactory.btnPrimary("Speichern", e -> {
                  onSave(item);
                  dialog.close();
                }),
                UIFactory.btnPrimaryError("Abbrechen", e -> dialog.close())
            )
        )
    );

    dialog.open();
  }

  private void onSaveNotificationLimit() {
    if (notificationLimitForm.isValid()) {
      objectTypeService.saveObjectTypeByObject(notificationLimitForm.saveBean());
      UIFactory.notificationSuccess("Benachrichtigungslimit gespeichert").open();
    } else {
      UIFactory.notificationError("Ändrungen können nicht übernommen werden, da Fehlerhaft").open();
    }
    notificationLimitsGrid.getDataProvider().refreshAll();
  }

  private void onSave(Storage storage) {
    if (storageForm.isValid()) {
      storageService.saveStorageByObject(storageForm.saveBean());
      UIFactory.notificationSuccess("Benachrichtigungslimit gespeichert").open();
    } else {
      UIFactory.notificationError("Ändrungen können nicht übernommen werden, da Fehlerhaft").open();
    }
    storageGrid.getDataProvider().refreshAll();
  }

  private void onSave(Integer value) {
    dataProvider.saveReservationDuration(value);
    reservationMaxDuration.setValue(dataProvider.getReservationDuration());
    UIFactory.notificationSuccess("Maximale Reservierungsdauer geändert").open();
  }

}
