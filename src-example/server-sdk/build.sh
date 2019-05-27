#!/usr/bin/env bash
set -euxo pipefail

# Set working directory to script directory
cd "$(dirname "$0")" || exit

OPEN_API_VERSION="v4.0.0"
SDK_DIR="sdk"
ELM_VERSION="0.19"
ELM_FORMAT_CMD="npx elm-format --elm-version=$ELM_VERSION --yes $SDK_DIR/elm/src/*"
GENERATORS=( elm )
TARGET_DIR="../client/ext/server-sdk"

# build

## TODO For your own project, you can build here a fresh version of swagger.yaml / swagger.json before copying it. For the sake of the tutorial, we skip this step.

rm -rf ${SDK_DIR:?}/*
cp ../server/api/swagger/swagger.yaml swagger.yaml

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

# post processing
eval "${ELM_FORMAT_CMD}"

rm -rf ${TARGET_DIR:?}
mv -f ${SDK_DIR:?}/elm/src ${TARGET_DIR:?}
