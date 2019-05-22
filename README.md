# Phonebook

This project is a full stack PWA with CRUD functionalities, presented as a mockup of a standard Phonebook. Backend is made with NodeJS([ExpressJS](https://expressjs.com/)), DB is [MySQL](https://www.mysql.com/), and frontend is made with [Elm](https://elm-lang.org/).

## Project structure

```sh
.
├── README.md
├── .editorconfig
├── .gitignore
├── api/
│   ├── README.md <-- api structure is explained in its own README.md
│   └── ...
└── client/
    ├── README.md <-- client structure is explained in its own README.md
    └── ...

```

## Available scripts

In the root of this project there are no scripts avaliable at the moment. Hopefully, I will get my hands a bit dirty and make some later.

But for now, navigate to **api** or **client** folder and use their scripts.

For a starter, you will most likely want to open up two terminals like so:

**Terminal 1:**

**`cd api`**

**`npm install`** <-- Install all the NodeJS package dependencies

**`npm start`** or **`nodemon`** if you have it installed <-- Run the server. Open http://localhost:9000 to view it in the browser.

**Terminal 2:**

**`npm install create-elm-app -g`** <-- This will install create-elm-app necessary for app start

**`cd client`**

**`npm install`** <-- Install all the NodeJS package dependencies

**`elm install`** <-- Install all the Elm package dependencies

**`elm-app start`** <-- Run the app in development mode. Open http://localhost:3000 to view it in the browser.

You have a list of all the avaliable scripts in the corresponding README.md files.

## Summary

This app is made as an entry task to [Extension Engine Summer Camp](https://summercamp.extensionengine.com/).
App theme and technologies used were all optional, so I decided for a simple CRUD application (Phonebook). NodeJS (Express) for Backend is a reasonable choice, MySQL is kind of picked at random. But why Elm?

Elm promotes itself as "a delightful language for reliable webapps", and they sure live up to those words. There are many perks of using this language, but I will point out only two of them. Elm generates JavaScript with **great performance** and **no runtime exceptions**. If you are interested in other pros of using Elm, check out [Elm homepage](https://elm-lang.org/) for more info.

With that being said, I have used this occasion (EE Summercamp) to polish my knowledge of Elm, and to promote language itself.

## Live example

Api is deployed [here](https://simplephonebook.herokuapp.com/) with Heroku, whilst client is deployed [here](https://volki312.github.io/Phonebook/) with GitHub Pages or [here](http://student.oss.unist.hr/~jv46250/) with my College pages.

//TODO
Technologies used:

//TODO
## Progressive web app
