const Handlebars = require('handlebars');

// Helper para permitir asignar variables dentro de templates
Handlebars.registerHelper('let', (variableName, value, options) => {
  if (options.data.root) {
    options.data.root[variableName] = value;
  } else {
    options.data[variableName] = value;
  }
  return;
});

// Helper para incrementar valores numéricos
Handlebars.registerHelper('inc', (value, increment) => {
  return value + increment;
});

// Helper para multiplicar dos valores, útil para calcular subtotales
Handlebars.registerHelper('multiply', (value1, value2) => {
  return (value1 * value2).toFixed(2);
});

// Helper para calcular el precio total del carrito
Handlebars.registerHelper('total', (cart) => {
  if (!cart || !Array.isArray(cart)) {
    cart = [];
  }
  let total = 0;
  cart.forEach(item => {
    total += item.precio * item.cantidad;
  });
  return total.toFixed(2);
});

// Helper para verificar el rol del usuario
Handlebars.registerHelper('isRole', function(user, role, options) {
  if (user && user.roles && user.roles === role) {
    return options.fn(this);
  }
  return options.inverse(this);
});

module.exports = Handlebars;
