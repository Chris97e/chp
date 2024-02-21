import { Component } from './component';
import { gsap } from 'gsap';
import { ScrollTrigger } from 'gsap/ScrollTrigger';
import { EventBus } from '../services/event-bus';
import { EVENTS } from '../constants/events';
import { getBreakpoint } from '../utils/utils';
import { BP_NAMES } from '../constants/breakpoints';

enum SELECTORS {
  'WAVE_GREEN' = '.home-banner-slide__wave-green-1',
  'WAVE_BLACK' = '.home-banner-slide__wave-black-1',
  'WAVE_BLACK_2' = '.home-banner-slide__wave-container-2',
  'SLIDE_1' = '.home-banner-slide--1',
  'SLIDE_2' = '.home-banner-slide--2',
  'SLIDE_3' = '.home-banner-slide--3',
  'HEADER' = '.header',
  'EMPHASIS' = '.home-banner-slide__word-emphasis'
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

  slide2Animation_() {
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

    gsap.to(SELECTORS.EMPHASIS, {
      scrollTrigger: {
        trigger:SELECTORS.SLIDE_2,
        toggleActions: 'restart pause reverse pause',
        scrub: 1,
        start: 'top ',
        end: 'bottom +=50%',
        snap: 1,
      },
      width: '120%',
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
    const currentBP = getBreakpoint();
    const waveWidthVisible = 4;
    let waveHeightVisible = 1;

    if (currentBP == BP_NAMES.TABLET) {
      waveHeightVisible = 4;
    }

    if (currentBP == BP_NAMES.DESKTOP || currentBP == BP_NAMES.LARGE_DESKTOP) {
       waveHeightVisible = 2;
    }

    const scaleFactor = Math.max(
      vpWidth / (wave.clientWidth / waveWidthVisible),
      vpHeight / (wave.clientHeight / waveHeightVisible)
    );
    
    console.log(scaleFactor);
    return scaleFactor;
  }
}
