# nRF Asset Tracker Web Application for AWS

[![GitHub Actions](https://github.com/NordicSemiconductor/asset-tracker-cloud-app-aws-js/workflows/Test%20and%20Release/badge.svg)](https://github.com/NordicSemiconductor/asset-tracker-cloud-app-aws-js/actions)
[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)
[![Renovate](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com)
[![Mergify Status](https://img.shields.io/endpoint.svg?url=https://api.mergify.com/v1/badges/NordicSemiconductor/asset-tracker-cloud-app-aws-js)](https://mergify.io)
[![@commitlint/config-conventional](https://img.shields.io/badge/%40commitlint-config--conventional-brightgreen)](https://github.com/conventional-changelog/commitlint/tree/master/@commitlint/config-conventional)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg)](https://github.com/prettier/prettier/)
[![ESLint: TypeScript](https://img.shields.io/badge/ESLint-TypeScript-blue.svg)](https://github.com/typescript-eslint/typescript-eslint)
[![React](https://github.com/aleen42/badges/raw/master/src/react.svg)](https://reactjs.org/)
[![Bootstrap 5](https://img.shields.io/badge/Bootstrap-5-ffffff?labelColor=7952b3)](https://getbootstrap.com/docs/5.0/)
[![CSS modules](https://img.shields.io/badge/CSS-modules-yellow)](https://github.com/css-modules/css-modules)
[![Vite](https://github.com/aleen42/badges/raw/master/src/vitejs.svg)](https://vitejs.dev/)

The nRF Asset Tracker Web Application for AWS is a reference single-page
application (SPA) developed with [React](https://reactjs.org/) in
[TypeScript](https://www.typescriptlang.org/).

The UI components are themed using
[Bootstrap 5](https://getbootstrap.com/docs/5.0/) and
[CSS modules](https://github.com/css-modules/css-modules). All complex UI logic
is extracted using [React hooks](https://reactjs.org/docs/hooks-custom.html) to
allow re-use when changing the UI framework.

[Vite](https://vitejs.dev/) is used as the frontend toolchain.

> :information_source:
> [Read the complete nRF Asset Tracker documentation](https://nordicsemiconductor.github.io/asset-tracker-cloud-docs/).

## Set up

    npm ci

## Configuration

In the
[nRF Asset Tracker for AWS](https://github.com/NordicSemiconductor/asset-tracker-cloud-aws-js)
folder, run `node cli web-app-config` and store the output in a local `.envrc`
file. Then run `direnv allow` to allow it.

```bash
# .envrc
export PUBLIC_CELL_GEO_LOCATION_CACHE_TABLE_NAME=...
export PUBLIC_CLOUDFRONT_DISTRIBUTION_ID=...
export PUBLIC_FOTA_BUCKET_NAME=...
export PUBLIC_GEOLOCATION_API_URL=...
export PUBLIC_HISTORICALDATA_TABLE_INFO=...
export PUBLIC_IDENTITY_POOL_ID=...
export PUBLIC_NETWORK_SURVEY_GEOLOCATION_API_URL=...
export PUBLIC_NETWORKSURVEY_STORAGE_TABLE_NAME=...
export PUBLIC_USER_IOT_POLICY_NAME=...
export PUBLIC_USER_POOL_ID=...
export PUBLIC_USER_POOL_CLIENT_ID=...
export PUBLIC_WEB_APP_BUCKET_NAME=...
export PUBLIC_WEB_APP_DOMAIN_NAME=...
export PUBLIC_SENTRY_DSN=...
export PUBLIC_REGION=...
export PUBLIC_MQTT_ENDPOINT=...
```

## Running

    npm start

## End-to-end tests using Playwright

The frontend provides [end-to-end tests](./e2e-tests) using
[Playwright](https://playwright.dev/).

### Configure AWS credentials

The end-to-end tests run against an instance of the
[nRF Asset Tracker for AWS](https://github.com/NordicSemiconductor/asset-tracker-cloud-aws-js).

Either, use the credentials you created, when setting up the solution, or enable
the Web App CI feature and use the dedicated credentials created for this task.
The latter option is the recommended approach since it limits the permission
scope to only the needed ones. They can also be used to
[run the end-to-end tests on GitHub Actions](#running-end-to-end-tests-using-github-actions).

Add these environment variables to your `.envrc`. Then run `direnv allow` to
allow it.

```bash
# .envrc
export AWS_REGION=...
export AWS_ACCESS_KEY_ID=...
export AWS_SECRET_ACCESS_KEY=...
export WEBAPP_STACK_NAME=...
```

### Running the tests

You can then run the tests using

    npm run test:e2e

### Running individual tests

    npx playwright test authenticated/map/locationHistory/gnss.spec.ts

### Playwright Inspector

For developing tests it is helpful to run the
[Playwright Inspector](https://playwright.dev/docs/inspector).

You can enabled the inspector during the tests by running

    PWDEBUG=1 npm run test:e2e

### Running end-to-end tests using GitHub Actions

[This workflow](./.github/workflows/test-and-release.yaml) runs the end-to-end
tests for every commit. For this to work a running instance of
[nRF Asset Tracker for AWS](https://github.com/NordicSemiconductor/asset-tracker-cloud-aws-js)
is needed. The tests will be run against this instance. Typically it will be the
production instance, to ensure that the web application works with the current
production setup.

In order for the test runner to interact with the instance for retrieving the
app configuration and for providing test data you need to configure AWS
credentials as
[GitHub environment secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-an-environment).

Set these secrets:

- `AWS_REGION`
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `WEBAPP_STACK_NAME`

If you have enabled the web application CI of the nRF Asset Tracker for AWS
(`node cli configure context stack web-app-ci 1`) you can acquire them using the
nRF Asset Tracker for AWS CLI:

```bash
node cli web-app-ci -s
```

You can set the secrets through the GitHub UI (make sure to create the
`production`
[environment](https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment)
in your repository first).

Alternatively you can use the [GitHub CLI](https://cli.github.com/) using the
environment settings from above:

```bash
gh secret set AWS_REGION --env production --body "${AWS_REGION}"
gh secret set AWS_ACCESS_KEY_ID --env production --body "${AWS_ACCESS_KEY_ID}"
gh secret set AWS_SECRET_ACCESS_KEY --env production --body "${AWS_SECRET_ACCESS_KEY}"
gh secret set WEBAPP_STACK_NAME --env production --body "${WEBAPP_STACK_NAME}"
```

## Sentry

Optionally, Sentry can be enabled for the web application. Export the
`PUBLIC_SENTRY_DSN` environment variable.

To enable this in the continuous deployment pipeline of nRF Asset Tracker,
configure the DSN using the CLI:

```bash
./cli.sh configure thirdParty sentry sentryDsn https://4f901247818d46099a3f15b6ada9390e@o4504255385174016.ingest.sentry.io/4504684789170176
```

When the next deployment is triggered, the DSN becomes available via

```bash
./cli.sh web-app-config
```
