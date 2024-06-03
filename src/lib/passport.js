const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helpers = require('../lib/helpers');

passport.use('local.signup', new LocalStrategy({
    usernameField: 'username',
    passwordField: 'password',
    passReqToCallback: true
}, async (req, username, password, done) => {
    const { nombre_completo, telefono, id_cliente } = req.body;
    const newUser = {
        username,
        password: await helpers.encryptPassword(password),
        id_persona: id_cliente,
        roles: 'usuario'
    };

    try {
        // Insertar en la tabla users
        const result = await pool.query('INSERT INTO users SET ?', [newUser]);
        const id_usuario = await pool.query ('SELECT id from users where id_persona=?', [id_cliente]);
        // Insertar en la tabla clientes
        const newClient = {
            id: id_usuario[0].id,
            nombre_completo,
            telefono,
        };
        await pool.query('INSERT INTO cliente SET ?', [newClient]);

        newUser.id = result.insertId; // Obtener el ID insertado

        done(null, newUser);
    } catch (err) {
        console.error(err);
        done(err);
    }
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
            // Load cart from database
            req.session.cart = user.cart ? JSON.parse(user.cart) : [];
            done(null, user, req.flash('success', 'Welcome ' + user.username));
        } else {
            done(null, false, req.flash('message', 'Incorrect Password'));
        }
    } else {
        return done(null, false, req.flash('message', 'The Username does not exists.'));
    }
}));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
    const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
    done(null, rows[0]);
});

module.exports = passport;
