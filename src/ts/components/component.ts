/**
 * @class Component
 * @abstract
 */
export class Component {
  el: Element;
  props: object;

  /**
   * @param {Element} el DOM element for which the component was initialized.
   * @param {Object} props Name/value pair of properties with which to
   * initialize the component.
   */
  constructor(el: Element, props: object) {
    this.el = el;
    this.props = props;
  }
}
