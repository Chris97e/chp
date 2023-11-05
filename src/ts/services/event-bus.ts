import { EVENTS } from '../constants/events';
export class EventBus {
  static eventSubscriptions: { [key: string]: Array<(data?: any) => void> } =
    {};

  /**
   * Adds a listener
   */
  static listen(event: keyof typeof EVENTS, callback: (data?: any) => void) {
    if (EventBus.eventSubscriptions[event]) {
      EventBus.eventSubscriptions[event] = [];
    }

    EventBus.eventSubscriptions[event].push(callback);
  }

  /**
   * Remove a listener
   */
  static removeEventListener(
    event: keyof typeof EVENTS,
    callback: (data?: any) => void
  ) {
    if (!EventBus.eventSubscriptions[event]) {
      return;
    }
    const index = EventBus.eventSubscriptions[event].indexOf(callback);

    if (index > -1) {
      EventBus.eventSubscriptions[event].splice(index, 1);
    }
  }

  /**
   * Dispatch an event.
   */
  static dispatchEvent(event: keyof typeof EVENTS, data:any = {}) {
    if (!EventBus.eventSubscriptions[event]) {
      return;
    }
    EventBus.eventSubscriptions[event].forEach((element) => element(data));
  }
}
