select * from {{ source('stripe','raw_payments') }}
