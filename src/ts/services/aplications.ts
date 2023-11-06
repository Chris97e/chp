import { SYSTEM_ERRORS } from '../constants/errors';
import { createObjectFromString, errorWarn } from '../utils/utils';

enum ATTRIBUTES {
  component = 'data-comp',
  props = 'data-props',
}

let instance: null | Aplication = null;

/**
 * Application (class)
 * Container class encompassing all application functionality. The instance
 * returned by the constructor is a singleton.
 */
export class Aplication {
  registry: object;

  constructor(registry: object) {
    if (!instance) {
      instance = this;
      this.registry = registry;
      this.init();
    }

    return instance;
  }

  /**
   * Initializes component within the document.
   */
  init() {
    this.executecomponent(document);
  }

  /**
   * Scans the DOM for elements containing elements with data-comp attributes.
   * @param {Element | Document} el An element from which to start scanning.
   * @return {Array<HTMLElement>} Array of DOM elements to use as basis for component instantiation.
   */
  scan(el: Element | Document = document): Array<Element> {
    return Array.from(el.querySelectorAll(`[${ATTRIBUTES.component}]`));
  }

  /**
   * Initializes the component instantiation by first searching the DOM for
   * 'data-comp' references, and then invoking the class.
   * @param {Element|Document} doc A specified DOM element.
   */
  executecomponent(doc: Element | Document) {
    this.scan(doc)?.forEach((el) => {
        this.instantiatecomponent(el);
    });
  }

  /**
   * Identifies all component associated with the supplied element and
   * instantiates each, along with a namespaced config, if provided.
   * @param {Element} el A DOM element found from the initial DOM query.
   */
  instantiatecomponent(el: Element) {
    
    const components: Array<string> = el
      .getAttribute(ATTRIBUTES.component)
      .split(' ');

    components.forEach((name: string) => {
      const component: any | boolean =
        this.registry[name as keyof typeof this.registry];
      if (!component) return errorWarn(SYSTEM_ERRORS.appNotFound, name);

      const propName = `${ATTRIBUTES.props}-${name.toLowerCase()}`;

      const prop = createObjectFromString(el.getAttribute(propName));
      new component(el, prop);
    });
  }
}
