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

export { createObjectFromString, errorWarn };
