with orders as (
    select
        r.id as order_id
        , r.customer_id
        , r.ordered_at as order_date
        , r.store_id
        , r.sub_total as gross_revenue
        , r.tax_paid as tax
        , r.order_total as net_revenue
    from
        {{ source('jaffle_data','raw_order') }} as r
)

select
    o.order_id
    , o.customer_id
    , o.order_date
    , o.store_id
    , o.gross_revenue
    , o.tax
    , o.net_revenue
from
    orders as o
