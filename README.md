# Berlin Budgetary Data

This repository publishes Berlin’s official budgetary data as RDF / Linked Open Data.

The data are prepared from the budget datasets provided by the Senate Department for Finance (Senatsverwaltung für Finanzen). This repository takes the prepared RDF data and generates a browsable Linked Open Data website.

**[Start browsing the data!](https://berlin.github.io/lod-budget/)**

Currently, the dataset contains budgetary data for the years 2022–2027.

## Data preparation

The original budget data are published by the Senate Department for Finance (Senatsverwaltung für Finanzen) via the [Berlin Open Data Portal](https://daten.berlin.de/datensaetze). Search for **"Doppelhaushalt"** to find the relevant datasets.

The data are then prepared in a separate repository, [`budget2lod`](https://gitlab.opencode.de/sh/zit/opendata/budget2lod).

`budget2lod` processes the source data and generates the corresponding RDF data as a Turtle (TTL) dataset. The resulting dataset is then used in this repository to generate and publish the Linked Open Data website.

The basic workflow is:

```text
Berlin Open Data Portal
        ↓
   budget2lod
        ↓
    RDF / TTL
        ↓
    lod-budget
        ↓
Static Linked Open Data website
```

## Generating the site

The complete TTL dataset is relatively large. Consequently, generating the complete static website can take some time, especially when working with the full dataset.

To generate the static site locally, you need Python 3 and the dependencies listed in `requirements.txt`.

Create a Python virtual environment:

```shell
python3 -m venv .venv
```

Activate the virtual environment:

```shell
source .venv/bin/activate
```

Install the dependencies:

```shell
pip install -r requirements.txt
```

Create the combined N-Triples dataset:

```shell
make data/temp/all.nt
```

Generate the static website:

```shell
make generate
```

### Run the site locally

To generate the website and start a local web server in one step:

```shell
make generate+serve_locally
```

The website is then available at:

```text
http://localhost:8000
```

## Automated deployment

The static website is generated and deployed automatically using GitHub Actions when changes are pushed to the `main` branch.

The published website is available at:

**https://berlin.github.io/lod-budget/**


## License

All code in this repository is published under the [MIT License](License). All data are published under [CC0](https://creativecommons.org/publicdomain/zero/1.0/).
