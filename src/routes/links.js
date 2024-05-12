const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/add', (req, res) => {
    res.render('links/add');
});

router.post('/add', async (req, res) => {
    const {codigo, imagen, nombre, descripcion, precio, categoria, disponible}=req.body;
    const newProduct = {
        codigo,
        imagen,
        nombre,
        descripcion,
        precio,
        categoria,
        disponible
    };
    await pool.query('INSERT INTO Producto SET ?', [newProduct])
    req.flash('success', 'Product Saved Successfully');
    res.redirect('/links');
});

router.get('/', async (req, res)=>{
    const productos = await pool.query('SELECT * FROM Producto');
    console.log(productos)
    res.render('links/list', { productos });
});

module.exports = router;