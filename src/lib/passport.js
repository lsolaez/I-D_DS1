const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    const { id_cliente } = req.body;
    let newUser = {
        username,
        password,
        id_cliente
    };
    newUser.password = await helpers.encryptPassword(password);
    // Guardar en la base de datos
    const result = await pool.query('INSERT INTO users SET ?', newUser);
    newUser.id = result.insertId;
    return done(null, newUser);
}));

passport.use('local.signin', new LocalStrategy({
  usernameField: 'username',
  passwordField: 'password',
  passReqToCallback: true
}, async (req, username, password, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
  if (rows.length > 0) {
      const user = rows[0];
      const validPassword = await helpers.matchPassword(password, user.password);
      if (validPassword) {
          // Cargar carrito desde la base de datos
          req.session.cart = user.cart ? JSON.parse(user.cart) : [];
          done(null, user, req.flash('success', 'Welcome ' + user.username));
      } else {
          done(null, false, req.flash('message', 'Incorrect Password'));
      }
  } else {
      return done(null, false, req.flash('message', 'The Username does not exist.'));
  }
}));

passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
  if (rows.length > 0) {
      const user = rows[0];
      done(null, user);
  } else {
      done(new Error('User not found'));
  }
});


module.exports = passport;
