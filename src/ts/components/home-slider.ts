import { Component } from './component';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { EventBus } from '../services/event-bus';
import { EVENTS } from '../constants/events';

enum SELECTORS {
  'WAVE_GREEN' = '.banner-slide__wave-green',
  'WAVE_BLACK' = '.banner-slide__wave-black',
  'WAVE_BLACK_2' = '.banner-slide__wave-container-2',
  'SLIDE_2' = '.banner-slide--2',
  'SLIDE_3' = '.banner-slide--3',
  'HEADER' = '.header'
}

export class HomeSlider extends Component {
  slides_: HTMLElement | null;
  closeMenu_: HTMLElement | null;

  constructor(el: Element, props: object) {
    super(el, props);
    this.init_();
  }

  init_() {
    this.setUpComponent_();
  }

  setUpComponent_() {
    gsap.registerPlugin(ScrollTrigger);
    this.slide2Animation_();
    this.slide3Animation_();
  }

  slide2Animation_ () {
    gsap.to(SELECTORS.WAVE_GREEN, {
      scrollTrigger: {
        trigger: SELECTORS.SLIDE_2,
        toggleActions: 'restart pause reverse pause',
        scrub: 1,
        start: '-=80%',
        end: 'top',
        snap: 1,
      },
      scale: this.getScaleWaveFactor_(SELECTORS.WAVE_GREEN),
      duration: 2,
    });

  
    gsap.to(SELECTORS.SLIDE_2, {
      scrollTrigger: {
        trigger: SELECTORS.SLIDE_2,
        toggleActions: 'restart pause reverse pause',
        scrub: 1,
        start: '-=20%',
        end: 'top',
        snap: 1,
      },
      opacity: 1,
      duration: 2,
    });

    gsap.to(SELECTORS.WAVE_BLACK, {
      scrollTrigger: {
        trigger: SELECTORS.SLIDE_2,
        toggleActions: 'restart pause reverse pause',
        scrub: 1,
        start: '-=80%',
        end: '-=10%',
        onLeave: () => {
          EventBus.dispatchEvent(EVENTS.themeGreen, {});
        },
        onLeaveBack: () => {
          EventBus.dispatchEvent(EVENTS.themeWite, {});
        },
        snap: 1,
      },
      scale: 0,
      right: '-50%',
      duration: 6,
    });

  }

  slide3Animation_() {
    gsap.to(SELECTORS.WAVE_BLACK_2, {
      scrollTrigger: {
        trigger: SELECTORS.SLIDE_3,
        toggleActions: 'restart pause reverse pause',
        scrub: 1,
        start: '-=70%',
        end: 'top',
        snap: 1,
      },
      scale: this.getScaleWaveFactor_(SELECTORS.WAVE_BLACK_2),
      duration: 2,
    });

    gsap.to(SELECTORS.SLIDE_3, {
      scrollTrigger: {
        trigger: SELECTORS.SLIDE_3,
        toggleActions: 'restart pause reverse pause',
        scrub: 1,
        start: '-=20%',
        onLeave: () => {
          EventBus.dispatchEvent(EVENTS.themeBlack, {});
        },
        onLeaveBack: () => {
          EventBus.dispatchEvent(EVENTS.themeGreen, {});
        },
        end: 'top',
        snap: 1,
      },
      opacity: 1,
      duration: 2,
    });
  }

  getScaleWaveFactor_(selector: string): number {
    const wave = this.el.querySelector(selector) as HTMLElement;
    if (!wave) return 6;

    const vpWidth = window.innerWidth;
    const vpHeight = window.innerHeight;

    const scaleFactor = Math.max(
      vpWidth / (wave.clientWidth / 2),
      vpHeight / (wave.clientHeight / 2)
    );
    return scaleFactor + 0.6;
  }
}
