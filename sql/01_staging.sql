-- Create the staging schema if it doesn't exist
create schema if not exists staging;

-- Create the staging view for customers table
create or replace view staging.stg_customers as
select
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix  as Zip_Code_Prefix,
    customer_city             as City,
    upper(customer_state)     as State
from raw.customers;


--create the staging view for orders table
create or replace view staging.stg_orders as
        select
            order_id,
            customer_id,
            order_status as Status,
            cast(order_purchase_timestamp as timestamp) as Purchase_At,
            cast(order_approved_at as timestamp) as Approved_At,
            cast(order_delivered_carrier_date as timestamp) as Delivered_To_Carrier_Date_At,
            cast(order_delivered_customer_date as timestamp) as Delivered_To_Customer_At,
            cast(order_estimated_delivery_date as date) as Estimated_Delivery_At
        from raw.orders;

--create the staging view for orders items table
create or replace view staging.stg_order_items as
        select
            order_id,
            cast(order_item_id as integer) as order_item_id,
            product_id,
            seller_id,
            cast(shipping_limit_date as timestamp) as Shipping_Limit_At,
            cast(price as decimal(10,2)) as Price,
            cast(freight_value as decimal(10,2)) as Freight_Value
        from raw.order_items;