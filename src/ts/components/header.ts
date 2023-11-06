import { EVENTS } from '../constants/events';
import { Component } from './component';

enum SELECTORS {
  'openMenu' = 'header__open-mobile',
  'closeMenu' = 'nav-mobile__close'
}

enum CLASSES {
  'menuMobileActive' = 'header--mobile-menu-active'
}

export class Header extends Component {
  openMenu_: HTMLElement | null;
  closeMenu_: HTMLElement | null;

  constructor(el: Element, props: object) {
    super(el, props);
    this.init_();
  }

  init_() {
    this.setUpComponent_();
    this.addEventListener_();
  }

  setUpComponent_() {
    this.openMenu_ = this.el.querySelector(`.${SELECTORS.openMenu}`);
    this.closeMenu_ = this.el.querySelector(`.${SELECTORS.closeMenu}`);
  }

  addEventListener_(){
    this.openMenu_.addEventListener(EVENTS.click, () => {
        this.el.classList.add(CLASSES.menuMobileActive);
    });
    this.closeMenu_.addEventListener(EVENTS.click, () => {
      this.el.classList.remove(CLASSES.menuMobileActive);
  });
  }
}
