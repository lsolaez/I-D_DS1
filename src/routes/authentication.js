const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
const passport = require('passport');
const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/signup', (req, res) => {
    res.render('auth/signup');
});

router.post('/signup', [
    body('username').notEmpty().isLength({ min: 5 }).withMessage('Username must be at least 5 characters long'),
    body('password').notEmpty().isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
], (req, res, next) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.status(400).json({ errors: errors.array() });
    }
    passport.authenticate('local.signup', {
        successRedirect: '/links',
        failureRedirect: '/signup',
        failureFlash: true
    })(req, res, next);
});

router.get('/signin', (req, res) => {
    res.render('auth/signin');
});

router.post('/signin', [
  body('username').notEmpty().withMessage('Username is required'),
  body('password').notEmpty().withMessage('Password is required'),
], (req, res, next) => {
  const errors = validationResult(req);
  if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
  }
  passport.authenticate('local.signin', (err, user, info) => {
      if (err) {
          return next(err);
      }
      if (!user) {
          return res.redirect('/signin');
      }
      req.logIn(user, async (err) => {
          if (err) {
              return next(err);
          }
          const userCart = user.cart ? JSON.parse(user.cart) : [];
          req.session.cart = userCart;
          return res.redirect('/links');
      });
  })(req, res, next);
});


router.get('/profile', isLoggedIn, (req, res) => {
    res.render('profile');
});

router.get('/logout', async (req, res) => {
    if (req.isAuthenticated() && req.user && req.session.cart) {
        const cart = JSON.stringify(req.session.cart);
        await pool.query('UPDATE users SET cart = ? WHERE id = ?', [cart, req.user.id]);
    }
    req.logOut(() => {});
    res.redirect('signin');
});

module.exports = router;
