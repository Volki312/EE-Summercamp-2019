const express = require('express');
const router = express.Router();
const { listAllContacts, createContact, readContact, updateContact, deleteContact } = require('../controllers/contactsController');

router.get('/', function(req, res, next) {
    listAllContacts(req, res);
});

router.post('/', function(req, res, next) {
    createContact(req, res);
});

router.get('/:contactId', function(req, res, next) {
    readContact(req, res);
});

router.put('/:contactId', function(req, res, next) {
    updateContact(req, res);
});

router.delete('/:contactId', function(req, res, next) {
    deleteContact(req, res);
});

module.exports = router;
