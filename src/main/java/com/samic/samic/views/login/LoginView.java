package com.samic.samic.views.login;

import com.samic.samic.security.AuthenticatedUser;
import com.vaadin.flow.component.html.Div;
import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.html.Image;
import com.vaadin.flow.component.html.ListItem;
import com.vaadin.flow.component.html.Paragraph;
import com.vaadin.flow.component.html.Span;
import com.vaadin.flow.component.html.UnorderedList;
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
  private final AuthenticatedUser authenticatedUser;
  private final LoginForm loginForm = new LoginForm();

  public LoginView(AuthenticatedUser authenticatedUser) {
    this.authenticatedUser = authenticatedUser;
    initUI();
  }

  private void initUI() {
    addClassName("login-view");
    add(buildShowcase(), buildFormPane());
    setSizeFull();
  }

  private Div buildShowcase() {
    Div showcase = new Div();
    showcase.addClassName("login-showcase");

    H1 headline = new H1("Netzwerk-Hardware im Griff");
    Paragraph subline =
        new Paragraph(
            "Erfassen, reservieren und verfolgen Sie Ihre gesamte Hardware — "
                + "vom Hauptlager bis zum Kunden.");

    UnorderedList features =
        new UnorderedList(
            feature("Live-Bestandsübersicht mit Mindestbestands-Warnungen"),
            feature("Reservierungen und Übergaben zwischen Technikern"),
            feature("Rollenbasierte Verwaltung von Benutzern und Lagerorten"));

    Image preview = new Image("images/preview-dashboard.png", "SAMIC Dashboard Vorschau");
    preview.addClassName("login-preview");

    showcase.add(headline, subline, features, preview);
    return showcase;
  }

  private ListItem feature(String text) {
    Span check = new Span("✓");
    check.addClassName("login-feature-check");
    return new ListItem(check, new Span(text));
  }

  private Div buildFormPane() {
    Div formPane = new Div();
    formPane.addClassName("login-form-pane");

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

    formPane.add(logo, loginForm);
    return formPane;
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
