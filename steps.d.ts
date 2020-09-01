/// <reference types='codeceptjs' />
type steps_file = typeof import('./steps_file.js');
type SIC = typeof import('./pages/SIC.js');
type CredentialHelper = import('./credential_helper.js');

declare namespace CodeceptJS {
  interface SupportObject { I: CodeceptJS.I, SIC: SIC }
  interface CallbackOrder { [0]: CodeceptJS.I; [1]: SIC }
  interface Methods extends CodeceptJS.Playwright, CredentialHelper {}
  interface I extends ReturnType<steps_file> {}
  namespace Translation {
    interface Actions {}
  }
}
