select
    order_id,
    product_id,
    seller_id,
    price,
    freight_value
from {{ ref('olist_order_items_dataset') }}