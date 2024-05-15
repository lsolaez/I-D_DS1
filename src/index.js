const express = require('express');
const morgan = require('morgan');
const path = require('path');
const { engine } = require('express-handlebars');
const session = require('express-session');
const { body, validationResult } = require('express-validator');
const passport = require('passport');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session')(session);
const bodyParser = require('body-parser');
const { database } = require('./keys');

// inicializaciones 
const app = express();
require('./lib/passport');

// configuraciones que necesita el servidor de express
app.set('port', process.env.PORT || 4000); // si existe un puerto en el sistema, usarlo, si no usar el 4000
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', engine({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

// middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

app.use(session({
  secret: 'team4mysqlnodemysql',
  resave: false,
  saveUninitialized: false,
  store: new MySQLStore(database)
}));
app.use(flash());
app.use(passport.initialize());
app.use(passport.session());

// Middleware para pasar el carrito a las vistas
app.use((req, res, next) => {
  res.locals.cart = req.session.cart || [];
  next();
});

// variables globales
app.use((req, res, next) => {
  app.locals.message = req.flash('message');
  app.locals.success = req.flash('success');
  app.locals.user = req.user;
  next();
});

// rutas
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/links', require('./routes/links'));

// Debe estar incluido en tu archivo principal de configuración de Express
const linksRouter = require('./routes/links');
app.use('/links', linksRouter);


// public
app.use(express.static(path.join(__dirname, 'public')));

// empezar el servidor
app.listen(app.get('port'), () => {
  console.log('Server on port', app.get('port'));
});
