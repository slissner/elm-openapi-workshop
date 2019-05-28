# Generating a swagger definition file for the server

## Getting started

First set up your workspace in the source folder.

```bash
cd src
```

## Setting up the client

We use [create-elm-app](https://github.com/halfzebra/create-elm-app) to just get some elm app running out of the box:

```bash
# create an elm app with create-elm-app
npm install create-elm-app -g
create-elm-app client

# set up sdk dir (later this will be useful)
mkdir -p client/ext/server-sdk
```

Make sure you stay in `src` throughout the workshop. (Note: my final results are committed into `src-example`)

## Setting up the server with swagger (npm)

```bash
npm install -g swagger
swagger project create server
```

When asked for framework, let's choose `express`, as I assume it is widespread to be know by almost everybody.

## Run server, client, and swagger-editor

Now, let's run the stuff we have just set up:

```bash
# server
cd server
swagger project start # terminal 1 – starts our backend
swagger project edit # terminal 2 – starts our UI-editor

# client
cd client
elm-app start # terminal 3 - client app
```

## Continue

[Go to step 2](step-2.md)
