module.exports = {
    "up": `CREATE TABLE contacts (
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(28) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
        number VARCHAR(18) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
        email VARCHAR(36) CHARACTER SET utf8 COLLATE utf8_bin
        ) ENGINE=InnoDB DEFAULT CHARSET=latin1;`,
    "down": `DROP TABLE contacts`
};
