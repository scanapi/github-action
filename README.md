![](https://github.com/scanapi/design/raw/master/images/github-hero-dark.png)

# ScanaAPI
An action that allows developers to run ScanAPI using github actions.

## Inputs

### `scanapi_version`

The version of ScanAPI to install (default: latest).

### `arguments`

Desired arguments to run scanapi. Allow multiple parameters separated by spaces. Default value is `--help`

## Example usage

The following will take the yaml file and produce a scanapi-report.html file as output.

```yaml
- name: Run automated API tests
  uses: scanapi/github-action@v1
  with:
    scanapi_version: '==2.0.0'
    arguments: 'run ./scanapi.yaml'
```

## Example workflow

Complete example used in a workflow/yaml file. This produce a scanapi-report.html file as output.

```yaml
name: Run tests
on:
  pull_request:
    types: [opened, synchronize]:

jobs:
  scanapi:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Run automated API tests
        uses: scanapi/github-action@v1
        with:
          arguments: "run ./scanapi.yaml"
      - name: Upload scanapi-report.html
        uses: actions/upload-artifact@v2
        if: ${{ always() }}
        with:
          name: ScanAPI Report
          path: scanapi-report.html
```
