with issue_label as (

    select *
    from {{ ref('stg_github__issue_label_tmp') }}

), macro as (
    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_github_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_github_source/macros/).

        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */
            {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_github__issue_label_tmp')),
                staging_columns=get_issue_label_columns()
            )
        }}

    from issue_label

), fields as (

    select 
      issue_id,
      label_id
    from macro
)

select *
from fields