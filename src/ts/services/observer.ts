interface observerOptions {
  id: string;
  root?: Element;
  rootMargin?: string;
  threshold?: number;
  keepObserving?: boolean;
}

const instanceMap = new Map();

/**
 * Singleton for intersecion observer used in the lazy
 * loading service and trigger animations.
 */
export class Observer {
  constructor() {}

  static getInstance(
    options: observerOptions,
    callback: (data?: any) => void,
    notIntersectingCallback: ((data?: any) => void | null)
  ): IntersectionObserver {
    const observerId = options?.id;

    if (instanceMap.get(observerId) != undefined) {
      return instanceMap.get(observerId);
    }

    const observerInstance = new IntersectionObserver(
      (entries, elementObserver) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            const target = entry.target;

            callback(entry.target);

            if (!options?.keepObserving) {
              elementObserver.unobserve(target);
            }
          } else {
            if (notIntersectingCallback) {
              notIntersectingCallback(entry.target);
            }
          }
        });
      },
      options
    );

    instanceMap.set(observerId, observerInstance);

    return observerInstance;
  }
}
