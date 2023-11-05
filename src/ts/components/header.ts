import { Component } from './component';

export class Header extends Component {
  constructor(el:Element, props:object) {
    super(el, props);
    this.init_();
  }

  /**
   * init header component
   */
  init_() {
    console.log('Hello world Im the header component', this.el);
  }
}
