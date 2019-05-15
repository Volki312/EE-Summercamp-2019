const Contact = require("../models/contactModel.js");

listAllContacts = function(req, res) {
  Contact.getAllContacts(function(err, contact) {
    if (err) res.send(err);
    res.send(contact);
  });
};

createContact = function(req, res) {
  const newContact = new Contact(req.body);
  if (!newContact.name || !newContact.number) {
    res.status(400).send({
      error: true,
      message: "Please provide contact name and number!"
    });
  } else {
    Contact.createContact(newContact, function(err, contact) {
      if (err) res.send(err);
      res.json(contact);
    });
  }
};

readContact = function(req, res) {
  Contact.getContactById(req.params.contactId, function(err, contact) {
    if (err) res.send(err);
    res.json(contact);
  });
};

updateContact = function(req, res) {
  const updatedContact = new Contact(req.body[0]);
  Contact.updateById(req.params.contactId, updatedContact, function(err,contact) {
    if (err) res.send(err);
    res.json(contact);
  });
};

deleteContact = function(req, res) {
  Contact.remove(req.params.contactId, function(err) {
    if (err) res.send(err);
    res.json({ message: "Contact successfully deleted" });
  });
};

module.exports = { listAllContacts, createContact, readContact, updateContact, deleteContact };
