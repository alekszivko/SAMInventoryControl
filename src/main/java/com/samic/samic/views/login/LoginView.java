package com.samic.samic.views.login;

import com.samic.samic.security.AuthenticatedUser;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.login.LoginForm;
import com.vaadin.flow.component.login.LoginI18n;
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
public class LoginView extends Div implements BeforeEnterObserver {

  private static final String USERNAME_LABEL = "Benutzername";
  private static final String PASSWORD_LABEL = "Passwort";
  private static final boolean HAS_FORGOT_PASSWORD = false;
  private static final String ANMELDE_BUTTON = "Anmelden";
  private static final String ERROR_MESSAGE = "Benutzername/Passwort ungültig";
  private static final String ERROR_TITLE = "Fehler beim Anmelden";
  private static final String TAGLINE =
      "Netzwerk-Hardware erfassen, reservieren und verfolgen — vom Hauptlager bis zum Kunden.";
  private final AuthenticatedUser authenticatedUser;
  private final LoginForm loginForm = new LoginForm();

  public LoginView(AuthenticatedUser authenticatedUser) {
    this.authenticatedUser = authenticatedUser;
    initUI();
  }

  private void initUI() {
    addClassName("login-view");

    Div card = new Div();
    card.addClassName("login-card");

    Image logo = new Image("images/logo_samic.svg", "SAMIC — Inventory Control");
    logo.addClassName("login-logo");

    LoginI18n i18n = LoginI18n.createDefault();
    i18n.setHeader(new LoginI18n.Header());
    i18n.getForm().setTitle("Anmeldung");
    i18n.getForm().setUsername(USERNAME_LABEL);
    i18n.getForm().setPassword(PASSWORD_LABEL);
    i18n.getForm().setSubmit(ANMELDE_BUTTON);
    i18n.getErrorMessage().setMessage(ERROR_MESSAGE);
    i18n.getErrorMessage().setTitle(ERROR_TITLE);
    loginForm.setI18n(i18n);
    loginForm.setForgotPasswordButtonVisible(HAS_FORGOT_PASSWORD);
    loginForm.getElement().setAttribute("no-autofocus", "");
    loginForm.setAction(
        RouteUtil.getRoutePath(VaadinService.getCurrent().getContext(), getClass()));

    card.add(logo, loginForm);

    Paragraph tagline = new Paragraph(TAGLINE);
    tagline.addClassName("login-tagline");

    add(card, tagline);
    setSizeFull();
  }

  @Override
  public void beforeEnter(BeforeEnterEvent event) {

    if (authenticatedUser.getUser().isPresent()) {
      event.forwardTo("");
    }

    loginForm.setError(
        event.getLocation().getQueryParameters().getParameters().containsKey("error"));
  }
}
