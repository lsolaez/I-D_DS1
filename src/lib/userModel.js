//Este archivo se encargará de interactuar con la base de datos para realizar operaciones como buscar un usuario por nombre de usuario y crear un nuevo usuario.
const pool = require('../../database');

const User = {
  async findByUsername(username) {
    const result = await pool.query('SELECT * FROM users WHERE username = ?', [username]);
    return result[0];
  },

  async create(username, password, role) {
    await pool.query('INSERT INTO users (username, password, role) VALUES (?, ?, ?)', [username, password, role]);
  }
};

module.exports = User;
