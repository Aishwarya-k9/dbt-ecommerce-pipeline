with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select
        order_id,
        sum(payment_value) as order_value
    from {{ ref('stg_order_payments') }}
    group by 1
),

final as (
    select
        c.customer_id,
        c.customer_unique_id,
        c.customer_city,
        c.customer_state,
        count(o.order_id)       as total_orders,
        sum(p.order_value)      as lifetime_value,
        avg(p.order_value)      as avg_order_value
    from customers c
    left join orders o on c.customer_id = o.customer_id
    left join payments p on o.order_id = p.order_id
    group by 1, 2, 3, 4
)

select * from final