with
source as (
    select * from {{ source('postgres', 'addresses')}}
),

renamed_recast as (
    select
      address_id,
      address,
      zipcode,
      state,
      country
    from source
)

select * from renamed_recast