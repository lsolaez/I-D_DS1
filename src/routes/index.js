//aca van todas las rutas principales de la app, o sea asi como teniamos antes templates
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    res.send('Hello, world!');
});

module.exports = router;
