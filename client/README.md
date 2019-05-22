# Elm App

This project is bootstrapped with [Create Elm App](https://github.com/halfzebra/create-elm-app).

## Installing Elm packages

```sh
elm-app install <package-name>
```

## Folder structure

```sh
.
├── README.md
├── elmapp.config.js
├── elm.json
├── package-lock.json
├── package.json
├── public/
│   ├── favicon.png
│   ├── index.html
│   ├── logo.svg
│   └── manifest.json
├── src/
│   ├── Main.elm
│   ├── index.js
│   ├── main.css
│   └── registerServiceWorker.js
└── tests/
    └── Tests.elm
```

## Available scripts

In the project directory you can run:

**`elm-app build`**

Builds the app for production to the `build` folder.

The build is minified, and the filenames include the hashes.

**`elm-app start`**

Runs the app in the development mode.
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.
You will also see any lint errors in the console.

You may change the listening port number by using the `PORT` environment variable. For example type `PORT=8000 elm-app start ` into the terminal/bash to run it from: [http://localhost:8000/](http://localhost:8000/).

**`elm-app install`**

Alias for [`elm install`](http://guide.elm-lang.org/get_started.html#elm-install)

Use it for installing Elm packages from [package.elm-lang.org](http://package.elm-lang.org/)

**`elm-app test`**

Run tests with [node-test-runner](https://github.com/rtfeldman/node-test-runner/tree/master)

You can make test runner watch project files by running:

**`elm-app test --watch`**
