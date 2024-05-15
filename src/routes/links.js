const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/add', (req, res) => {
    res.render('links/add');
});

router.post('/add', async (req, res) => {
    const { codigo, imagen, nombre, descripcion, precio, categoria, disponible } = req.body;
    const newProduct = { codigo, imagen, nombre, descripcion, precio, categoria, disponible };
    await pool.query('INSERT INTO Producto SET ?', [newProduct]);
    req.flash('success', 'Product Saved Successfully');
    res.redirect('/links');
});

router.get('/', async (req, res) => {
    const productos = await pool.query('SELECT * FROM Producto');
    res.render('links/list', { productos });
});

router.get('/delete/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    await pool.query('DELETE FROM producto WHERE Codigo = ?', [Codigo]);
    req.flash('success', 'Product Removed Successfully');
    res.redirect('/links');
});

router.get('/edit/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const productos = await pool.query('SELECT * FROM producto WHERE Codigo = ?', [Codigo]);
    res.render('links/edit', { productos: productos[0] });
});

router.post('/edit/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const { imagen, nombre, descripcion, precio, categoria, disponible } = req.body;
    const newProduct = { imagen, nombre, descripcion, precio, categoria, disponible };
    await pool.query('UPDATE producto SET ? WHERE Codigo = ?', [newProduct, Codigo]);
    req.flash('success', 'Product Updated Successfully');
    res.redirect('/links');
});

// Agregar producto al carrito
router.post('/cart/add/:Codigo', async (req, res) => {
    const { Codigo } = req.params;
    const producto = await pool.query('SELECT * FROM producto WHERE Codigo = ?', [Codigo]);

    if (producto.length > 0) {
        const item = producto[0];
        if (!req.session.cart) {
            req.session.cart = [];
        }
        req.session.cart.push(item);
        res.json({ success: true, message: 'Product added to cart successfully!' });
    } else {
        res.json({ success: false, message: 'Product not found' });
    }
});

// Mostrar carrito
router.get('/cart', (req, res) => {
    res.render('links/cart', { cart: req.session.cart });
});

router.post('/cart/delete/:Codigo', (req, res) => {
    console.log("Intentando eliminar el producto con código:", req.params.codigo);
    console.log("Estado actual del carrito:", req.session.cart);
    const { codigo } = req.params;
    if (req.session.cart) {
        const initialLength = req.session.cart.length;
        req.session.cart = req.session.cart.filter(producto => producto.codigo !== codigo);
        console.log("Nuevo estado del carrito:", req.session.cart);
        if (req.session.cart.length < initialLength) {
            res.json({ success: true, message: 'El producto ha sido eliminado correctamente.' });
        } else {
            res.status(404).json({ success: false, message: 'Producto no encontrado.' });
        }
    } else {
        res.status(404).json({ success: false, message: 'No hay productos en el carrito.' });
    }
});



module.exports = router;