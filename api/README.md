# ExpressJS App

This project is bootstrapped with [Express app generator](https://www.npmjs.com/package/express-generator).

## Installing Node packages

**`npm install`**

## Folder structure

```sh
.
├── app.js
├── db.js
├── migrate.js
├── README.md
├── bin/
│   └── www
├── package.json
├── public/
│   ├── images
│   ├── javascripts
│   └── stylesheets
│       └── style.css
├── routes/
│   ├── index.js
│   └── contacts.js
├── migrations/
│   └── create_table_contacts.js
├── models/
│   └── contactModel.js
├── controllers/
│   └── contactsController.js
└── views/
    ├── error.pug
    ├── index.pug
    └── layout.pug
```

## Available scripts

In the project directory you can run:

**`npm start`**

or if you have nodemon installed:

**`nodemon`**

This will start the server on PORT 3000 (nodemon will also listen to the live changes).

**`node migrate.js up`**

Create a table 'contacts' and populate it with example data

**`node migrate.js refresh`**

Runs all down migrations followed by all up.

For more commands on migrating check out [mysql-migrations npm page](https://www.npmjs.com/package/mysql-migrations#executing-migrations).
N.B. on npm page they named their file migration.js, whilst i named mine migrate.js!

### TODO:

- [Optizations before deploying](https://expressjs.com/en/advanced/best-practice-performance.html)
