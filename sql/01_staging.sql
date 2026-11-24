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

--create the staging view for order_payments table
create or replace view staging.stg_order_payments as
        select
            order_id,
            cast(payment_sequential as integer) as Payment_Sequential,
            cast(payment_type as string) as Payment_Type,
            cast(payment_installments as integer) as Payment_Installments,
            cast(payment_value as decimal(10,2)) as Payment_Value
        from raw.order_payments;
        
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

--create the staging view for products table
create or replace view staging.stg_products as
        select
            product_id,
            product_category_name as Category_Name,
            product_name_lenght as Name_Length,
            product_description_lenght as Description_Length,
            cast(product_photos_qty as integer) as Photos_Qty,
            cast(product_weight_g as decimal(10,2)) as Weight_g,
            cast(product_length_cm as decimal(10,2)) as Length_cm,
            cast(product_height_cm as decimal(10,2)) as Height_cm,
            cast(product_width_cm as decimal(10,2)) as Width_cm
        from raw.products;

--create the staging view for category_translation table
create or replace view staging.stg_category_translation as 
        select
            product_category_name as Category_Name,
            product_category_name_english as Category_Name_English
        from raw.category_translation;