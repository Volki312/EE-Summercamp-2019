const mysql = require('mysql');

const db = mysql.createPool({
  connectionLimit : 10,
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'phonebook_db'
});

module.exports = db;
// db = connection
