# nRF Asset Tracker for AWS firmware

![Build and Release](https://github.com/NordicSemiconductor/asset-tracker-cloud-firmware-aws/workflows/Build%20and%20Release/badge.svg)
[![@commitlint/config-conventional](https://img.shields.io/badge/%40commitlint-config--conventional-brightgreen
)](https://github.com/conventional-changelog/commitlint/tree/master/@commitlint/config-conventional)
[![Nordic ClangFormat](https://img.shields.io/static/v1?label=Nordic&message=ClangFormat&labelColor=00A9CE&color=337ab7)](https://github.com/nrfconnect/sdk-nrf/blob/main/.clang-format)
[![Zephyr compliance](https://img.shields.io/static/v1?label=Zephyr&message=compliance&labelColor=4e109e&color=337ab7)](https://docs.zephyrproject.org/latest/contribute/index.html#coding-style)

This repository maintains an out-of-tree **copy** of the
[Asset Tracker v2](https://github.com/nrfconnect/sdk-nrf/tree/main/applications/asset_tracker_v2)
application to show how to use open-source tools for automating the creation of
building HEX files, and continuously integrating the firmware against the cloud
implementation of the
[nRF Asset Tracker for AWS](https://github.com/NordicSemiconductor/asset-tracker-cloud-aws-js).

The copy is regularly updated from source and kept in sync with the NCS release
branches.

## Memfault integration

Symbol files can be automatically uploaded to Memfault, so core dumps can be
parsed.

In order for the [GitHub action](./.github/workflows/build-and-release.yaml) to
upload the `.elf` file on every build, additional secrets need to be configured.

`MEMFAULT_ORGANIZATION_TOKEN`: the organization auth token can be accessed and
managed by Administrators at Admin → Organization Auth Tokens in the Memfault
UI.

`MEMFAULT_ORGANIZATION_SLUG`, `MEMFAULT_PROJECT_SLUG`, and
`MEMFAULT_PROJECT_KEY`: You can retrieve the project settings from the settings
page of the Memfault dashboard of your organization.

You can set the secrets through the GitHub UI.

Alternatively you can use the [GitHub CLI](https://cli.github.com/):

    gh secret set -a actions MEMFAULT_ORGANIZATION_TOKEN --body <your memfault project key>
    gh secret set -a actions MEMFAULT_ORGANIZATION_SLUG --body <your organization slug>
    gh secret set -a actions MEMFAULT_PROJECT_SLUG --body <your project slug>
    gh secret set -a actions MEMFAULT_PROJECT_KEY --body <your project key>

---

> :information_source:
> [Read the complete nRF Asset Tracker documentation](https://nordicsemiconductor.github.io/asset-tracker-cloud-docs/).
