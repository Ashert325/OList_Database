# Olist Dimensional Model

A Kimball-style star schema built on the Brazilian E-Commerce Public Dataset by Olist, using SQL and DuckDB.

## Purpose

A portfolio project to practise and demonstrate dimensional modelling: choosing business processes, declaring grain, designing conformed dimensions, and building transaction and accumulating-snapshot fact tables. Later phases add data tests and a dbt version.

## Data

- **Source:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) (Kaggle)
- **Licence:** CC BY-NC-SA 4.0. Dataset by Olist.
- **Scope:** ~100k orders from 2016 to 2018, across nine linked tables

Raw data is not committed. To reproduce, download the dataset from Kaggle and unzip the CSVs into `data/raw/`.

## Roadmap

- [x] Repository set up
- [ ] Bus matrix and grain statements
- [ ] Star schema in SQL on DuckDB
- [ ] Entity-relationship diagram
- [ ] Data tests
- [ ] dbt version

## Design decisions

Every modelling choice, the alternatives considered and the reasoning are logged in [`docs/decisions.md`](docs/decisions.md).
