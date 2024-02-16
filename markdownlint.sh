#!/bin/bash -x

echo "Installing markdownlint-cli..."

npm install -g markdownlint-cli --yes

echo "Running markdownlint-cli..."

markdownlint --config .github/workflows/config/markdownlint.json .