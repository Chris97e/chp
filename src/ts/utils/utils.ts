import { BP_NAMES, BREAKPOINTS } from '../constants/breakpoints';
import { SYSTEM_ERRORS } from '../constants/errors';

const errorWarn = (
  message: string = SYSTEM_ERRORS.parsingObject,
  location: string,
  customError: string = ''
) => {
  console.warn(`${message} ${location}: ${customError}`);
};

const createObjectFromString = (text: string | null): object => {
  let newObject = {};
  if (!text) return newObject;

  try {
    newObject = JSON.parse(text);
  } catch (e) {
    errorWarn(undefined, text, e.message);
  }

  return newObject;
};

const getBreakpoint = (): string => {
  const vpWidth = window.innerWidth;

  if (vpWidth < BREAKPOINTS.TABLET) {
    return BP_NAMES.MOBILE;
  }

  if (vpWidth < BREAKPOINTS.DESKTOP) {
    return BP_NAMES.TABLET;
  }

  if (vpWidth < BREAKPOINTS.LARGE_DESKTOP) {
    return BP_NAMES.DESKTOP;
  }

  return BP_NAMES.LARGE_DESKTOP;
};

export { createObjectFromString, errorWarn, getBreakpoint };
