const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');

const passport= require('passport');
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
      successRedirect: '/profile',
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
    passport.authenticate('local.signin', {
      successRedirect: '/profile',
      failureRedirect: '/signin',
      failureFlash: true
    })(req, res, next);
  });

router.get('/profile', isLoggedIn ,(req, res) => {
    res.render('profile');
});

router.get('/logout', (req, res) => {
  req.logOut(() => {}); // Función de devolución de llamada vacía
  res.redirect('signin');
});

module.exports = router;