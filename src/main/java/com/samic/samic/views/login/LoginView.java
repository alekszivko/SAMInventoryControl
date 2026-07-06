package com.samic.samic.views.login;

import com.samic.samic.security.AuthenticatedUser;
import com.vaadin.flow.component.login.LoginI18n;
import com.vaadin.flow.component.login.LoginOverlay;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.BeforeEnterEvent;
import com.vaadin.flow.router.BeforeEnterObserver;
import com.vaadin.flow.router.PageTitle;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.router.internal.RouteUtil;
import com.vaadin.flow.server.VaadinService;
import com.vaadin.flow.server.auth.AnonymousAllowed;

@AnonymousAllowed
@PageTitle("Login")
@Route(value = "login")
public class LoginView extends VerticalLayout implements BeforeEnterObserver {

  private static final String USERNAME_LABEL = "Benutzername";
  private static final String PASSWORD_LABEL = "Passwort";
  private static final boolean HAS_FORGOT_PASSWORD = false;
  private static final String ANMELDE_BUTTON = "Anmelden";
  private static final String ERROR_MESSAGE = "Benutzername/Passwort ungültig";
  private static final String ERROR_TITLE = "Fehler beim Anmelden";
  private final AuthenticatedUser authenticatedUser;
  private final LoginOverlay loginOverlay = new LoginOverlay();

  public LoginView(AuthenticatedUser authenticatedUser) {
    this.authenticatedUser = authenticatedUser;
    initUI();
  }

  private void initUI() {
    LoginI18n i18n = LoginI18n.createDefault();
    i18n.setHeader(new LoginI18n.Header());
    i18n.getForm().setUsername(USERNAME_LABEL);
    i18n.getForm().setPassword(PASSWORD_LABEL);
    i18n.getForm().setSubmit(ANMELDE_BUTTON);
    i18n.getErrorMessage().setMessage(ERROR_MESSAGE);
    i18n.getErrorMessage().setTitle(ERROR_TITLE);
    loginOverlay.setI18n(i18n);
    loginOverlay.setForgotPasswordButtonVisible(HAS_FORGOT_PASSWORD);
    loginOverlay.setOpened(true);
    add(loginOverlay);
    loginOverlay.getElement().setAttribute("no-autofocus", "");
    loginOverlay.setAction(
        RouteUtil.getRoutePath(VaadinService.getCurrent().getContext(), getClass()));
  }

  @Override
  public void beforeEnter(BeforeEnterEvent event) {

    if (authenticatedUser.getUser().isPresent()) {
      event.forwardTo("");
    }

    loginOverlay.setError(
        event.getLocation().getQueryParameters().getParameters().containsKey("error"));
  }
}
