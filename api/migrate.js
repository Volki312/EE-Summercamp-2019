const migration = require('mysql-migrations');
const sql = require('./db');

migration.init(sql, __dirname + '/migrations');
