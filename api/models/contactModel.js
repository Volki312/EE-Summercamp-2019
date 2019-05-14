const sql = require("../db");

let Contact = function(req) {
  this.name = req.name;
  this.number = req.number;
  this.email = req.email;
};

Contact.getAllContacts = result => {
  sql.query("Select * FROM contacts", function(err, res) {
    if (err) {
      console.log("error: ", err);
      result(null, err);
    } else {
      result(null, res);
    }
  });
};

Contact.createContact = (contact, result) => {
  sql.query("INSERT INTO contacts SET ?", [contact], function(err, res) {
    if (err) {
      console.log("error: ", err);
      result(err, null);
    } else {
      console.log(res.insertId);
      result(null, res.insertId);
    }
  });
};

Contact.getContactById = (contactId, result) => {
  sql.query("Select * FROM contacts WHERE id = ? ", [contactId], function(err, res) {
    if (err) {
      console.log("error: ", err);
      result(err, null);
    } else result(null, res);
  });
};

Contact.updateById = (contactId, updatedContact, result) => {
  sql.query(
    "UPDATE contacts SET ? WHERE id = ?",
    [updatedContact, contactId],
    function(err, res) {
      if (err) {
        console.log("error: ", err);
        result(null, err);
      } else result(null, res);
    }
  );
};

Contact.remove = function(contactId, result) {
  sql.query("DELETE FROM contacts WHERE id = ?", [contactId], function(err, res) {
    if (err) {
      console.log("error: ", err);
      result(null, err);
    } else result(null, res);
  });
};

module.exports = Contact;
