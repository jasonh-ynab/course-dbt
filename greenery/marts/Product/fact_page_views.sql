
-- UNFINISHED DRAFT 

with
source as (
    select * from {{ source('postgres', 'addresses')}}
),

renamed_recast as (


)

select * from renamed_recast