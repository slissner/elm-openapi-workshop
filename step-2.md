# Step 2: Setting up our Client-SDK build-Script

## Folders

Let's now create a new folder which will contain our build script for generating our sdk files.

```bash
cd src
mkdir server-sdk

cd server-sdk
touch build.sh
chmod +x build.sh
```

## SDK-Build Script

Let's first introduce some safeguards for our generator script. Begin `build.sh` file with:

```bash
#!/usr/bin/env bash
set -euxo pipefail

# Set working directory to script directory
cd "$(dirname "$0")" || exit
```

We then add some environment variables to configurate our generator runs:

```bash
OPEN_API_VERSION="v4.0.0"
SDK_DIR="sdk"
ELM_VERSION="0.19"
ELM_FORMAT_CMD="npx elm-format --elm-version=$ELM_VERSION --yes $SDK_DIR/elm/src/*"
GENERATORS=( elm )
TARGET_DIR="../client/ext/server-sdk"
```

We then start our build routine with the following commands.
First,
Second, we clear the build output directory, here `sdk`.
Third, we copy the current built swagger.yaml file of our server into our

```bash
# build

## TODO For your own project, you can build here a fresh version of swagger.yaml / swagger.json before copying it. For the sake of the tutorial, we skip this step.

rm -rf ${SDK_DIR:?}/*
cp ../server/api/swagger/swagger.yaml swagger.yaml
```

## Calling openapi-generator

Being the central step, we now call openapi-generator. That will create later our SDK files, when we run `build.sh`.

```bash
for generator in "${GENERATORS[@]}"
do
    docker run --rm \
                -v "$PWD:/local" \
                openapitools/openapi-generator-cli:${OPEN_API_VERSION} generate \
                    -i /local/swagger.yaml \
                    -o "/local/$SDK_DIR/$generator" \
                    -g "$generator" \
                    --invoker-package "example" \
                    --additional-properties elmEnableCustomBasePaths=true \
                    --additional-properties elmPrefixCustomTypeVariants=true
done
```

Some observations:
* Note here, that we are iterating over the array defined in **GENERATORS**. This is seriously cool! We can simply pick more languages from the [offical docs](https://github.com/OpenAPITools/openapi-generator#overview) for which we want to create Client-SDK code. Let's try that later, by adding `elixir` or `rust` or whatever language you like.
* We rely on **docker for running openapi-generator**. There are also other ways running the tool, such as Maven Plugins, npm,... (see [Installation](https://github.com/OpenAPITools/openapi-generator#1---installation))
* Parameters:
  * `-i` input file, can also be URL
  * `-o` output of our sdk files
  * `-g` our current generator
* Elm generator specific configuration:
  * `--additional-properties elmEnableCustomBasePaths=true` lets you pass the `basePath` to our API with each request. Particuarly useful, if your api is running under various stages (like dev, staging, prod...)
  * `--additional-properties elmPrefixCustomTypeVariants=true`, as the name suggests, a concrete custom type will be prefixed with its type (like `type Pets = PetsDOG | PetsCAT`)

## The Elm Generator

As we were talking about elm generator properties... Let's have a look at the generator code:

* Elm-Generator Code https://github.com/OpenAPITools/openapi-generator/blob/master/modules/openapi-generator/src/main/java/org/openapitools/codegen/languages/ElmClientCodegen.java
* Elm Templates https://github.com/OpenAPITools/openapi-generator/tree/master/modules/openapi-generator/src/main/resources/elm

## Post-processing

## Run `build.sh`

```bash
./build.sh
```
