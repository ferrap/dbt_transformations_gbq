{{ config(enabled=fivetran_utils.enabled_vars(['hubspot_marketing_enabled','hubspot_email_event_enabled','hubspot_email_event_forward_enabled'])) }}

with base as (

    select *
    from {{ ref('stg_hubspot__email_event_forward_tmp') }}

), macro as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_hubspot__email_event_forward_tmp')),
                staging_columns=get_email_event_forward_columns()
            )
        }}
    from base

), fields as (

    select
        _fivetran_synced,
        browser,
        id as event_id,
        ip_address,
        location as geo_location,
        user_agent
    from macro
    
)

select *
from fields


