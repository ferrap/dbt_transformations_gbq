{% macro get_ad_group_history_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "campaign_id", "datatype": dbt_utils.type_string()},
    {"name": "created_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "end_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "start_time", "datatype": dbt_utils.type_timestamp()},
    {"name": "status", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
