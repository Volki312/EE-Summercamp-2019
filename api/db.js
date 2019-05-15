const mysql = require('mysql');

const db = mysql.createPool({
  connectionLimit : 10,
  host     : 'localhost',
  user     : 'root',
  password : '',
  database : 'phonebook_db'
});

module.exports = db;

/*
const mysql = require('mysql');

const db = mysql.createPool({
  connectionLimit : 10,
  host     : 'us-cdbr-iron-east-02.cleardb.net',
  user     : 'b2ac4e03d3bfd4',
  password : 'ee6be443',
  database : 'heroku_0237a7abd515da3'
});

module.exports = db;
*/
