package com.samic.samic.views.lagerobjekt_erfassen;

import com.samic.samic.components.UIFactory;
import com.samic.samic.components.form.CPEForm;
import com.samic.samic.components.form.SFPForm;
import com.samic.samic.components.form.SupplyForm;
import com.samic.samic.data.entity.CPE;
import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.Producer;
import com.samic.samic.data.entity.SFP;
import com.samic.samic.data.entity.Storage;
import com.samic.samic.data.entity.StorageObject;
import com.samic.samic.data.entity.Supply;
import com.samic.samic.data.entity.Type;
import com.samic.samic.services.ServiceLagerObjectErfassen;
import com.samic.samic.services.ServiceObjectType;
import com.samic.samic.services.ServiceProducer;
import com.samic.samic.services.ServiceStorage;
import com.samic.samic.services.ServiceStorageObject;
import com.samic.samic.views.MainLayout;
import com.vaadin.flow.component.UI;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import jakarta.annotation.security.RolesAllowed;
import java.util.List;

@PageTitle("Lagerobjekt erfassen")
@Route(value = "lagerobjektErfassen", layout = MainLayout.class)
@RolesAllowed({"FIELDSERVICETECHNICIAN", "STORAGEADMIN"})
public class LagerobjektErfassenView extends VerticalLayout {

  private final ServiceProducer producerService;
  private final ServiceStorage storageService;
  private final ServiceObjectType serviceObjectType;
  private final CPEForm cpeForm;
  private final SFPForm sfpForm;
  private final SupplyForm supplyForm;
  private final ServiceLagerObjectErfassen lagerObjectErfassenService;
  private final HorizontalLayout formChildContainer = UIFactory.childContainer(
      JustifyContentMode.START);
  private final ComboBox<Storage> storageComboBox = new ComboBox<>("Lager auswählen");
  private final ComboBox<Type> typeComboBox = new ComboBox<>("Typ auswählen");
  private final ComboBox<Producer> producerSelect = new ComboBox<>("Hersteller");

  public LagerobjektErfassenView(ServiceStorageObject storageObjectService,
      ServiceProducer producerService,
      ServiceStorage storageService, ServiceObjectType serviceObjectType,
      CPEForm cpeForm,
      SFPForm sfpForm,
      SupplyForm supplyForm, ServiceLagerObjectErfassen lagerObjectErfassenService) {

    this.producerService = producerService;
    this.storageService = storageService;
    this.serviceObjectType = serviceObjectType;
    this.cpeForm = cpeForm;
    this.sfpForm = sfpForm;
    this.supplyForm = supplyForm;
    this.lagerObjectErfassenService = lagerObjectErfassenService;

    initUI();
  }

  private void initUI() {
    add(
        UIFactory.rootComponentContainer(
            "",
            UIFactory.childContainer(JustifyContentMode.START, storageComboBox)));

    VerticalLayout formRootContainer =
        UIFactory.rootComponentContainer(
            "", UIFactory.childContainer(JustifyContentMode.START, typeComboBox, producerSelect));

    formRootContainer.add(
        formChildContainer,
        UIFactory.childContainer(
            JustifyContentMode.END,
            UIFactory.btnPrimary(
                "Speichern",
                buttonClickEvent -> onSave(typeComboBox.getValue(), storageComboBox.getValue(),
                    producerSelect.getValue())),
            UIFactory.btnPrimaryError("Abbrechen", buttonClickEvent -> onCancel())));

    add(formRootContainer);

    initProducerSelect();
    initProducerSelectData();
    initStorageComboBox();
    initStorageComboBoxData();
    initTypeComoBox();
    initTypeComboBoxData();
  }

  private void initTypeComoBox() {
    typeComboBox.setRequired(true);
    typeComboBox.setItemLabelGenerator(Type::getLongVersion);
    typeComboBox.addValueChangeListener(
        event -> changeForm(event.getValue(), storageComboBox.getValue()));
    typeComboBox.setRequired(true);
    typeComboBox.setAllowCustomValue(false);
  }

  private void initTypeComboBoxData() {
    typeComboBox.setItems(Type.class.getEnumConstants());
  }

  private void initStorageComboBox() {
    storageComboBox.setItemLabelGenerator(Storage::getName);
    storageComboBox.setRequired(true);
    storageComboBox.setAllowCustomValue(false);
  }

  private void initStorageComboBoxData() {
    List<Storage> storages =
        storageService.findAll().filter(storage -> !storage.getName().equals("Kunde")).toList();

    storageComboBox.setItems(storages);
    storageComboBox.setValue(storages.get(0));
  }

  private void initProducerSelect() {
    producerSelect.setRequired(true);
    producerSelect.setAllowCustomValue(false);
    producerSelect.setItemLabelGenerator(Producer::getName);
  }

  private void initProducerSelectData() {
    producerSelect.setItems(producerService.findAll().toList());
  }

  private void changeForm(Type value, Storage storage) {
    if (value.equals(Type.ROUTER) || value.equals(Type.SWITCH) || value.equals(Type.IP_PHONE)) {
      this.cpeForm.setCPEBeans(serviceObjectType.findAll().toList(),
          StorageObject.builder().objectTypeName(ObjectType.builder().build()).verbindungsnummer("")
              .cpe(CPE.builder().type(value)
                  .build()).storage(storage).build());
      producerSelect.setEnabled(true);
      formChildContainer.remove(sfpForm);
      formChildContainer.remove(supplyForm);
      formChildContainer.add(cpeForm);
    } else if (value.equals(Type.SFP)) {
      this.sfpForm.setSFPBeans(serviceObjectType.findAll().toList(),
          StorageObject.builder().objectTypeName(ObjectType.builder().build()).verbindungsnummer("")
              .sfp(SFP.builder().type(value).build()).storage(storage).build());
      producerSelect.setEnabled(true);
      formChildContainer.remove(supplyForm);
      formChildContainer.remove(cpeForm);
      formChildContainer.add(sfpForm);
    } else if (value.equals(Type.SUPPLY)) {
      this.supplyForm.setSupplyBeans(
          StorageObject.builder()
              .supply(Supply.builder().build()).storage(storage).build());
      producerSelect.setEnabled(false);
      formChildContainer.remove(sfpForm);
      formChildContainer.remove(cpeForm);
      formChildContainer.add(supplyForm);
    }
  }

  private void onCancel() {
    UI.getCurrent().getPage().reload();
  }

  private void onSave(Type selectedType, Storage value, Producer producer) {
    StorageObject saved;
    StorageObject persisted;
    if (selectedType.equals(Type.ROUTER) || selectedType.equals(Type.SWITCH) || selectedType.equals(
        Type.IP_PHONE)) {
      if (cpeForm.isValid()) {
        saved = cpeForm.saveStorageObject();
        saved.setStorage(value);
        saved.getCpe().setType(selectedType);
        saved.getCpe().setProducer(producer);

        persisted = lagerObjectErfassenService.LagerOBjectErfassenCPE(saved, value, producer,
            saved.getCpe());
        if (persisted != null) {
          UIFactory.notificationInfoNoDuration("LagerID: " + persisted.getId().toString() + " Ger"
              + "ätetyp: " + persisted.getObjectTypeName().getName()).open();
          UIFactory.notificationSuccess("Lagerobjekt erfolgreich gespeichert").open();

        }
      } else {
        UIFactory.notificationError("Speichern nicht möglich. Eingaben kontrollieren").open();
        return;
      }
    } else if (selectedType.equals(Type.SFP)) {
      if (sfpForm.isValid()) {
        saved = sfpForm.saveStorageObject();
        saved.getSfp().setProducer(producer);
        saved.getSfp().setType(selectedType);
        persisted = lagerObjectErfassenService.LagerOBjectErfassenSFP(saved, value, producer,
            saved.getSfp());
        if (persisted != null) {
          UIFactory.notificationInfoNoDuration("LagerID: " + persisted.getId().toString() + " Ger"
              + "ätetyp:" + persisted.getObjectTypeName().getName()).open();
          UIFactory.notificationSuccess("Lagerobjekt erfolgreich gespeichert").open();
        }
      } else {
        UIFactory.notificationError("Speichern nicht möglich . Eingaben kontrollieren").open();
        return;
      }
    } else if (selectedType.equals(Type.SUPPLY)) {
      if (supplyForm.isValid()) {
        saved = supplyForm.saveStorageObject();

        persisted = lagerObjectErfassenService.LagerOBjectErfassenSUPPLY(saved, value,
            saved.getSupply());
        if (persisted != null) {
          UIFactory.notificationInfoNoDuration("LagerID: " + persisted.getId().toString()).open();
          UIFactory.notificationSuccess("Lagerobjekt erfolgreich gespeichert").open();
        }
      } else {
        UIFactory.notificationError("Speichern nicht möglich. Eingaben kontrollieren").open();
        return;
      }
    }
    changeForm(selectedType, value);
  }
}
