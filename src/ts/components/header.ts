import { EVENTS } from '../constants/events';
import { Component } from './component';
import { EventBus } from '../services/event-bus';

enum SELECTORS {
  'openMenu' = 'header__open-mobile',
  'closeMenu' = 'nav-mobile__close',
  'logo' = 'logo-chp',
  'navDesktopContainer' = 'nav-desktop__links',
  'desktopLinks' = 'link-desktop',
  'desktopNetworks' = 'nav-social-networks',
  'iconButton' = 'icon-button ',
}

enum CLASSES {
  'menuMobileActive' = 'header--mobile-menu-active',
  'logoGreen' = 'logo-chp--green',
  'linksGreen' = 'link-desktop--green',
  'iconButtonGreen' = 'icon-button--green',
}

enum THEME {
  'white' = '',
  'green' = '--green',
  'black' = '--black',
}

export class Header extends Component {
  logo_: HTMLElement | null;
  openMenu_: HTMLElement | null;
  closeMenu_: HTMLElement | null;
  desktopLinks_: NodeListOf<HTMLElement>;
  desktopNetworks_: NodeListOf<HTMLElement>;
  navThemeElements_: Array<HTMLElement>;

  constructor(el: Element, props: object) {
    super(el, props);
    this.init_();
  }

  init_() {
    this.setUpComponent_();
    this.addEventListener_();
  }

  setUpComponent_() {
    this.initElements_();

    this.navThemeElements_ = [
      this.logo_,
      this.openMenu_,
      ...Array.from(this.desktopLinks_),
      ...Array.from(this.desktopNetworks_),
    ];
  }

  addEventListener_() {
    this.openMenu_.addEventListener(EVENTS.click, () => {
      this.el.classList.add(CLASSES.menuMobileActive);
    });
    this.closeMenu_.addEventListener(EVENTS.click, () => {
      this.el.classList.remove(CLASSES.menuMobileActive);
    });

    EventBus.listen(EVENTS.themeBlack, () => {
      this.navThemeElements_.forEach((item) =>
        this.changeColorTheme_(item, THEME.black)
      );
    });

    EventBus.listen(EVENTS.themeGreen, () => {
      this.navThemeElements_.forEach((item) =>
        this.changeColorTheme_(item, THEME.green)
      );
    });

    EventBus.listen(EVENTS.themeWite, () => {
      this.navThemeElements_.forEach((item) =>
        this.changeColorTheme_(item, THEME.white)
      );
    });
  }

  changeColorTheme_(item: HTMLElement, colorTheme: THEME) {
    const baseClass = item.classList[0];
    item.classList.remove(`${baseClass}${THEME.green}`);
    item.classList.remove(`${baseClass}${THEME.black}`);

    if (colorTheme == THEME.white) return;
    item.classList.add(`${baseClass}${colorTheme}`);
  }

  initElements_() {
    this.openMenu_ = this.el.querySelector(`.${SELECTORS.openMenu}`);
    this.closeMenu_ = this.el.querySelector(`.${SELECTORS.closeMenu}`);
    this.logo_ = this.el.querySelector(`.${SELECTORS.logo}`);
    this.desktopLinks_ = this.el
      .querySelector(`.${SELECTORS.navDesktopContainer}`)
      .querySelectorAll(`.${SELECTORS.desktopLinks}`);
    this.desktopNetworks_ = this.el
      .querySelector(`.${SELECTORS.desktopNetworks}`)
      .querySelectorAll(`.${SELECTORS.iconButton}`);
  }
}
