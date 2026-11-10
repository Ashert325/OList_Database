-- 00_load_raw.sql
-- Loads the nine Olist CSVs from data/raw/ into a "raw" schema, unchanged.
--
-- Run from the project root (the folder that holds README.md):
--   duckdb -f sql/00_load_raw.sql data/olist.duckdb
--
-- Design choice (log it in docs/decisions.md): every column loads as text,
-- so raw stays an exact copy of the source and staging sets each type on
-- purpose. Left to guess, DuckDB reads prices as floating-point numbers,
-- and the order-item prices then sum to 13591643.700007..., not 13591643.70.
--
-- Safe to re-run: each table is replaced, never appended to.

create schema if not exists raw;

create or replace table raw.customers as
select * from read_csv('data/raw/olist_customers_dataset.csv', header = true, all_varchar = true);

create or replace table raw.geolocation as
select * from read_csv('data/raw/olist_geolocation_dataset.csv', header = true, all_varchar = true);

create or replace table raw.order_items as
select * from read_csv('data/raw/olist_order_items_dataset.csv', header = true, all_varchar = true);

create or replace table raw.order_payments as
select * from read_csv('data/raw/olist_order_payments_dataset.csv', header = true, all_varchar = true);

create or replace table raw.order_reviews as
select * from read_csv('data/raw/olist_order_reviews_dataset.csv', header = true, all_varchar = true);

create or replace table raw.orders as
select * from read_csv('data/raw/olist_orders_dataset.csv', header = true, all_varchar = true);

create or replace table raw.products as
select * from read_csv('data/raw/olist_products_dataset.csv', header = true, all_varchar = true);

create or replace table raw.sellers as
select * from read_csv('data/raw/olist_sellers_dataset.csv', header = true, all_varchar = true);

create or replace table raw.category_translation as
select * from read_csv('data/raw/product_category_name_translation.csv', header = true, all_varchar = true);

-- Check: row count per table. Expected:
--   category_translation 71      customers 99,441     geolocation 1,000,163
--   order_items 112,650          order_payments 103,886
--   order_reviews 99,224         orders 99,441
--   products 32,951              sellers 3,095
select 'customers' as table_name, count(*) as row_count from raw.customers
union all select 'geolocation', count(*) from raw.geolocation
union all select 'order_items', count(*) from raw.order_items
union all select 'order_payments', count(*) from raw.order_payments
union all select 'order_reviews', count(*) from raw.order_reviews
union all select 'orders', count(*) from raw.orders
union all select 'products', count(*) from raw.products
union all select 'sellers', count(*) from raw.sellers
union all select 'category_translation', count(*) from raw.category_translation
order by table_name;
