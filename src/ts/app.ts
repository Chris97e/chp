import '../scss/main.scss';
import { EVENTS } from './constants/events';
import REGISTRY from './constants/registry';
import { Aplication } from './services/aplications';     
import { scrollDirection } from './services/scroll-direction';

window.addEventListener(EVENTS.load, () => {
    new Aplication(REGISTRY);
    new scrollDirection();
});