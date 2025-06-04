package com.samic.samic.components.form;

import com.samic.samic.components.UIFactory;
import com.samic.samic.data.constants.ConstantsDomain;
import com.samic.samic.data.entity.ObjectType;
import com.samic.samic.data.entity.StorageObject;
import com.vaadin.flow.component.checkbox.Checkbox;
import com.vaadin.flow.component.combobox.ComboBox;
import com.vaadin.flow.component.formlayout.FormLayout;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.textfield.TextField;
import com.vaadin.flow.data.binder.BeanValidationBinder;
import com.vaadin.flow.data.validator.StringLengthValidator;
import jakarta.annotation.PostConstruct;
import java.util.List;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class CPEForm extends FormLayout {

  private final Checkbox isProjectEquipment = new Checkbox("Projektequipment?");
  private final TextField connectionNumber = new TextField("Verbindungsnummer");
  private final TextField trackingNumber = new TextField("Sendungsnummer");
  private final BeanValidationBinder<StorageObject> binderStorageObject = new BeanValidationBinder<>(
      StorageObject.class, true);
  private final ComboBox<ObjectType> deviceType = new ComboBox<>("Gerätetyp");
  private final TextField macAdress = new TextField("MAC Adresse");
  private final TextField serialnumber = new TextField("Seriennummer");
  private final TextField remark = new TextField("Anmerkung");
  private final HorizontalLayout projectEquipmentContainer =
      UIFactory.childContainer(
          FlexComponent.JustifyContentMode.START, connectionNumber, trackingNumber);

  @PostConstruct
  private void initUI() {
    macAdress.setRequired(true);
    add(deviceType, macAdress, serialnumber, remark, isProjectEquipment);

    isProjectEquipment.addValueChangeListener(
        event -> {
          if (event.getValue().equals(true)) {
            add(projectEquipmentContainer);
          } else {
            remove(projectEquipmentContainer);
          }
        });

    initBinder();
  }

  private void initBinder() {
    binderStorageObject.bind(isProjectEquipment, StorageObject::getProjectDevice,
        StorageObject::setProjectDevice);

    binderStorageObject.forField(deviceType)
        .asRequired("Geraetetyp auswaehlen")
        .bind(so -> deviceType.getValue(),
            (so, value) -> so.setObjectTypeName(deviceType.getValue()));

    binderStorageObject.forField(serialnumber).asRequired("Seriennummer angeben")
        .withNullRepresentation("")
        .bind(so -> so.getCpe().getSerialnumber(),
            (so, value) -> so.getCpe().setSerialnumber(value));

    binderStorageObject.forField(macAdress).asRequired("MAC-Adresse angeben")
        .withValidator(mac -> mac.length() == 17,
            "MAC-Adresse ist ungueltig, Format: ??-??-??-??-??-??")
        .withNullRepresentation("")
        .bind(so -> so.getCpe().getMacAddress(), (so, value) -> so.getCpe().setMacAddress(value));

    binderStorageObject.forField(isProjectEquipment)
        .bind(StorageObject::getProjectDevice, StorageObject::setProjectDevice);

    binderStorageObject.forField(remark)
        .withValidator(new StringLengthValidator("Anmerkung zu lang! (max 55 Zeichen)", 0,
            ConstantsDomain.DEFAULT_LENGTH))
        .bind(StorageObject::getRemark, StorageObject::setRemark);

    binderStorageObject.forField(connectionNumber)
        .withNullRepresentation("")
        /*.withValidator(value -> isProjectEquipment.getValue() && !value.isEmpty(),
            "Verbindungsnummer darf nicht leer sein")
        */
        .bind(StorageObject::getVerbindungsnummer, StorageObject::setVerbindungsnummer);

    binderStorageObject.forField(trackingNumber)
        .bind(StorageObject::getTrackingNo, StorageObject::setTrackingNo);

  }

  public void setCPEBeans(List<ObjectType> objectTypes,
      StorageObject storageObject) {
    deviceType.setItemLabelGenerator(ObjectType::getName);
    deviceType.setItems(objectTypes);
    binderStorageObject.setBean(storageObject);
  }

  public void refresh() {
    binderStorageObject.setBean(new StorageObject());
  }

  public StorageObject saveStorageObject() {
    System.out.println(binderStorageObject.getBean().getCpe().getSerialnumber());
    return binderStorageObject.getBean();
  }

  public Boolean isValid() {
    binderStorageObject.validate();
    return binderStorageObject.isValid();
  }
}
