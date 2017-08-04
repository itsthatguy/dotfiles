'use strict'

const RED = '#e26b73';
const GREEN = '#6ac38a';
const YELLOW = '#e6c176';
const BLUE = '#5e9ccf';
const MAGENTA = '#8b3f91';
const CYAN = '#51b6c3';
const WHITE = '#ebebff';
const BLACK = 'rgba(0,0,0,0.15)';

const BRIGHT_RED = '#C9525A';
const BRIGHT_GREEN = '#51AA71';
const BRIGHT_YELLOW = '#CDA85D';
const BRIGHT_BLUE = '#4583B6';
const BRIGHT_MAGENTA = '#e493eb';
const BRIGHT_CYAN = '#389DAA';
const BRIGHT_BLACK = '#3a424e';
const LIGHT_WHITE = '#525A67';

const DEEP_BLACK = '#202228';

const WINDOW_BACKGROUND_COLOR = 'rgba(40, 44, 52, 0.75)';
const TERMINAL_BACKGROUND_COLOR = 'rgba(0, 0, 0, 0.15)';
const FOREGROUND_COLOR = WHITE;
const BORDER_COLOR = DEEP_BLACK;

const COLORS = {
  red: RED,
  green: GREEN,
  yellow: YELLOW,
  blue: BLUE,
  magenta: MAGENTA,
  cyan: CYAN,
  white: WHITE,
  black: BLACK,

  lightRed: BRIGHT_RED,
  lightGreen: BRIGHT_GREEN,
  lightYellow: BRIGHT_YELLOW,
  lightBlue: BRIGHT_BLUE,
  lightMagenta: BRIGHT_MAGENTA,
  lightCyan: BRIGHT_CYAN,
  lightWhite: LIGHT_WHITE,
  lightBlack: BRIGHT_BLACK,
};

const TERM_CSS = `
  ::-webkit-scrollbar {
    width: 7px;
  }

  ::-webkit-scrollbar-thumb {
    border-radius: 4px;
  }
`;

const CSS = `
  .hyper_main {
    border: 0 !important;
  }

  .header_header {
    top: 0;
    left: 0;
    right: 0;
  }

  .tabs_borderShim {
    display: none !important;
  }

  .tabs_nav > .tabs_title {
  	width: 100%;
  	height: 100%;
  	background-color: ${TERMINAL_BACKGROUND_COLOR} !important;
  }

  .tabs_list {
    margin-left: 0;
  }

  .tab_tab {
    color: ${FOREGROUND_COLOR} !important;
    border: 0 !important;
    padding-left: 0 !important;
  }

  .tab_active {
    color: ${WHITE};
    height: calc(100% + 1px);
  }

  .tabs_list .tab_active {
    background-color: ${TERMINAL_BACKGROUND_COLOR} !important;
  }

  .tab_text {
    color: ${FOREGROUND_COLOR};
    border: 0 !important;
    opacity: 0.5;
  }

  .tab_active .tab_text {
    opacity: 1;
  }

  .hyper_main {
  	border: none !important;
  }

  .term_active {
    background-color: ${TERMINAL_BACKGROUND_COLOR};
  }
`;

exports.onWindow = browserWindow => browserWindow.setVibrancy('dark');

exports.decorateConfig = (config) => (
  Object.assign({}, config, {
    backgroundColor: WINDOW_BACKGROUND_COLOR,
    foregroundColor: FOREGROUND_COLOR,
    borderColor: BORDER_COLOR,
    cursorColor: FOREGROUND_COLOR,
    colors: COLORS,
    cursorBlink: false,
    css: `
      ${config.css || ''}
      ${CSS}
    `,
    termCSS: `
      ${config.termCSS || ''}
      ${TERM_CSS}
    `,
  })
);

exports.middleware = () => (next) => (action) => {
  /* eslint-disable no-param-reassign, default-case */
  switch (action.type) {
    case 'CONFIG_LOAD':
    case 'CONFIG_RELOAD':
      action.config.foregroundColor = FOREGROUND_COLOR;
      action.config.backgroundColor = WINDOW_BACKGROUND_COLOR;
      action.config.cursorColor = FOREGROUND_COLOR;
      action.config.borderColor = BORDER_COLOR;
      action.config.colors = COLORS;
      action.config.css = `${action.config.css || ''}${CSS}`;
  }
  next(action);
}
