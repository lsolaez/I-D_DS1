const Handlebars = require('handlebars');

Handlebars.registerHelper('let', (variableName, value, options) => {
  if (options.data.root) {
    options.data.root[variableName] = value;
  } else {
    options.data[variableName] = value;
  }
  return;
});

Handlebars.registerHelper('inc', (value, increment) => {
  return value + increment;
});

module.exports = Handlebars;