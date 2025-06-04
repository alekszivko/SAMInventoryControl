package com.samic.samic.components;

import com.vaadin.flow.component.ClickEvent;
import com.vaadin.flow.component.Component;
import com.vaadin.flow.component.ComponentEventListener;
import com.vaadin.flow.component.Text;
import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.html.H4;
import com.vaadin.flow.component.icon.VaadinIcon;
import com.vaadin.flow.component.notification.Notification;
import com.vaadin.flow.component.notification.NotificationVariant;
import com.vaadin.flow.component.orderedlayout.FlexComponent;
import com.vaadin.flow.component.orderedlayout.HorizontalLayout;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.function.SerializableSupplier;
import java.util.HashMap;

public class UIFactory {


  public static VerticalLayout rootComponentContainer(String heading, Component... containers) {
    VerticalLayout container = new VerticalLayout();
    // class for styling
    container.addClassName("container");

    container.add(new H4(heading));
    container.add(containers);
    return container;
  }

  public static VerticalLayout rootComponentContainerFullHeight(String heading,
      Component... containers) {
    VerticalLayout container = rootComponentContainer(heading, containers);
    container.setHeightFull();
    return container;
  }

  public static HorizontalLayout childContainer(
      FlexComponent.JustifyContentMode justifyContentMode, Component... components) {
    HorizontalLayout childContainer = new HorizontalLayout();
    childContainer.setJustifyContentMode(justifyContentMode);
    childContainer.getStyle().set("flex-wrap", "wrap");
    childContainer.setWidthFull();
    childContainer.add(components);

    return childContainer;
  }

  public static HorizontalLayout childContainerFullHeight(
      FlexComponent.JustifyContentMode justifyContentMode, Component... components) {
    HorizontalLayout childContainer = childContainer(justifyContentMode, components);
    childContainer.setHeightFull();
    return childContainer;
  }

  public static Button btnPrimary(
      String text, ComponentEventListener<ClickEvent<Button>> listener) {
    Button btnPrimary = new Button(text);
    btnPrimary.addClickListener(listener);
    btnPrimary.getStyle().setBackground("#108AB2").setColor("#FFFFFF");
    return btnPrimary;
  }

  public static Button btnPrimary(String text, HashMap<String, String> cssKeyValue) {
    Button btnPrimary = new Button(text);
    cssKeyValue.forEach(
        (cssKey, cssValue) -> btnPrimary.getStyle().set(cssKey, cssValue));
    return btnPrimary;
  }

  public static Button btnPrimaryError(String text) {
    Button btnPrimary = new Button(text);
    btnPrimary.getStyle().setBackground("#FF3101").setColor("#FFFFFF");
    return btnPrimary;
  }

  public static Button btnPrimaryError(
      String text, ComponentEventListener<ClickEvent<Button>> listener) {
    Button btnPrimary = UIFactory.btnPrimaryError(text);
    btnPrimary.addClickListener(listener);
    return btnPrimary;
  }

  public static Button btnIconWithTooltip(Component icon, String text,
      ComponentEventListener<ClickEvent<Button>> event) {

    Button btnIconWithTooltip = new Button(icon, event);
    btnIconWithTooltip.setTooltipText(text);

    return btnIconWithTooltip;
  }

  public static Notification notificationSuccess(String text) {
    Notification notification = new Notification(text);
    notification.setDuration(5000);
    notification.setPosition(Notification.Position.BOTTOM_CENTER);
    notification.addThemeVariants(NotificationVariant.LUMO_SUCCESS);
    return notification;
  }

  public static Notification notificationError(String text) {
    Notification notification = new Notification(text);
    notification.setDuration(5000);
    notification.setPosition(Notification.Position.BOTTOM_CENTER);
    notification.addThemeVariants(NotificationVariant.LUMO_ERROR);
    return notification;
  }

  public static Notification notificationErrorCenter(String text) {
    var notification = notificationError(text);
    notification.setPosition(Notification.Position.MIDDLE);
    
    return notification;
  }

  public static Notification notificationInfoNoDuration(String text) {
    Notification notification = new Notification();
    notification.setPosition(Notification.Position.BOTTOM_CENTER);
    notification.addThemeVariants(NotificationVariant.LUMO_PRIMARY);
    notification.setDuration(0);
    notification.add(new Text(text),
        new Button(VaadinIcon.CLOSE.create(), e -> notification.close()));
    return notification;
  }

  public static VerticalLayout LazyComponent(SerializableSupplier<? extends Component> component) {
    VerticalLayout container = UIFactory.rootComponentContainer("");
    container.setHeightFull();
    container.addAttachListener(e -> {
      if (container.getElement().getChildCount() == 1) {
        container.add(component.get());
      }
    });

    return container;
  }
}