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

router.get('/delete/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    await pool.query('DELETE FROM producto WHERE Codigo = ?', [Codigo]);
    req.flash('success', 'Link Removed Successfully');
    res.redirect('/links');
});

router.get('/edit/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const productos = await pool.query('SELECT * FROM producto WHERE Codigo = ?', [Codigo]);
    res.render('links/edit', {productos: productos[0]});
});

router.post('/edit/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const { imagen, nombre, descripcion, precio, categoria, disponible}=req.body;
    const newProduct = {
        imagen,
        nombre,
        descripcion,
        precio,
        categoria,
        disponible
    };
    await pool.query('UPDATE producto set ? WHERE Codigo = ?', [newProduct, Codigo]);
    req.flash('success', 'Link Updated Successfully');
    res.redirect('/links');

});
router.get('/cart', (req, res) => {
    req.flash('success', 'Link Updated Successfully');
    res.render('links/cart');
});


module.exports = router;