import '../scss/main.scss';
import { EVENTS } from './constants/events';
import REGISTRY from './constants/registry';
import { Aplication } from './services/aplications';     

window.addEventListener(EVENTS.load, () => {
    new Aplication(REGISTRY);
});