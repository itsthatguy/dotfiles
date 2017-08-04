exports.decorateConfig = config => {

  return Object.assign({}, config, {
    termCSS: `
    ${config.termCSS || ''}
    x-row:not(:empty) {
      position: fixed;
      bottom: 0;
    }
    `
  });
};
