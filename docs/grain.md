raw.orders: one row per order.
Key: order_id

raw.order_items: one row per item on an order
Key: order_id + order_item_id

raw.order_payments: one row per payment on an order
Key: order_id + payment_sequential

raw.order_reviews: one row per review per order
Key: order_id + review_id

raw.customers: one row per customer per order
Key: customer_id

The reason the joined total is bigger than just the single total is because in order_items table we could have the same order with different items therefore the order for the order_payments will copy each payment once of each item. 
What I learned: From this I learned that you don’t sum a value after joining to a table with a finer grain; aggregate first or join at the matching grain (same number of rows per order).