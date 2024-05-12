const express = require('express');
const morgan = require('morgan');
const path = require('path');
const {engine} = require('express-handlebars');
const flash = require('connect-flash');
const passport = require('passport');
const session = require('express-session');
const MySQLStore = require('express-mysql-session')(session);


const  {database} = require('./keys');
// inicializaciones 
const app = express();
require('./lib/passport');
// configuraciones que necesita el servidor de express
app.set('port', process.env.PORT || 4000); //si existe un puerto en el sistema cogelo, si no pilla el 4k
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', engine({
  defaultLayout: 'main',
  layoutsDir: path.join(app.get('views'), 'layouts'),
  partialsDir: path.join(app.get('views'), 'partials'),
  extname: '.hbs',
  helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs');

// middlewares , o sea funciones que se ejecutan cada ves que un usuario envia una peticion.
// ejemplo de eso es morgan que esta instalado en package.json eso te muestra las peticion en consolas y tales
app.use(express.static(path.join(__dirname, 'public')));
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

// variables globales 
app.use((req, res, next) => {
    next();
});

//rutas 
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/links', require('./routes/links'));


// public
app.use(express.static(path.join(__dirname, 'public')));


// empezar el servidor 
app.listen(app.get('port'), ()  => {
    console.log('Server on port', app.get('port'));
}); //aca ya iniciamos el servidor en algun puerto o el 4k,