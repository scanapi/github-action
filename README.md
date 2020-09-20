# scanapi
An action that allows developers to run ScanAPI using github actions.

## Inputs

### `arguments`

Desired arguments to run scanapi. Allow multiple parameters separated by spaces. Default value is `--help`

## Example usage

The following will take the yaml file and produce a scanapi-report.html file as output.

```yaml
- name: Run automated API tests
  uses: scanapi/scanapi@v1
  with:
    arguments: 'scanapi.yaml'
```

## Example workflow

Complete example used in a workflow/yaml file. This produce a scanapi-report.html file as output.

```yaml
name: Run tests
on:
  pull_request:
    types: [opened, synchronize]:

jobs:
  Test:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Run automated API tests
      uses: scanapi/scanapi@v1
      with:
        arguments: 'scanapi.yml' 
```
