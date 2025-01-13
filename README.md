# Berlin Budgetary Data

This repository is the home for the official budgetary data for Berlin by the Senate Department for Finance (Senatsverwaltung für Finanzen) as RDF / Linked Open Data.

**[Start browsing the data!](https://berlin.github.io/lod-budget/)**

Currently contained in the dataset are data regarding the years 2022–2025.

## Generating the site

To generate the static site locally, you need to do the following:

Create a Python virtual environment:

```shell
python -m venv venv
```

Activate the virtual environment:

```shell
. venv/bin/activate
```

Install the dependencies:

```shell
pip install -r requirements.txt
```

Merge the dataset metadata and data:

```shell
make data/temp/all.nt
```


## License

All code in this repository is published under the [MIT License](License). All data are published under [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
