import { CLASSES } from '../constants/classes';
import { EVENTS } from '../constants/events';

export class scrollDirection {
  previousScrollPosition_: number;

  constructor() {
    this.previousScrollPosition_ = 0;
    this.init_();
  }

  init_() {
    this.addEventListeners_();
  }

  addEventListeners_() {
    window.addEventListener(
      EVENTS.scroll,
      this.handleScroll_,
    );
  }

  scrollInspector_() {
    const scrollPosition = window.scrollY;

    if (scrollPosition < this.previousScrollPosition_) {
      document.body.classList.remove(CLASSES.SCROLL_DOWN);
      document.body.classList.add(CLASSES.SCROLL_UP);

    } else if (scrollPosition > this.previousScrollPosition_) {
      document.body.classList.remove(CLASSES.SCROLL_UP);
      document.body.classList.add(CLASSES.SCROLL_DOWN);
    }

    this.previousScrollPosition_ = scrollPosition; 
  }
  
  handleScroll_() {
    const scrollPosition = window.scrollY;

    if (scrollPosition < this.previousScrollPosition_) {
      document.body.classList.remove(CLASSES.SCROLL_DOWN);
      document.body.classList.add(CLASSES.SCROLL_UP);

    } else if (scrollPosition > this.previousScrollPosition_) {
      document.body.classList.remove(CLASSES.SCROLL_UP);
      document.body.classList.add(CLASSES.SCROLL_DOWN);
    }

    this.previousScrollPosition_ = scrollPosition; 
  }  
}
