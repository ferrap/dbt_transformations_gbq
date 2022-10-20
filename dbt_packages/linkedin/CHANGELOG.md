# dbt_linkedin v0.5.0

PR [#21](https://github.com/fivetran/dbt_linkedin/pull/21) includes the following changes:

## 🚨 Breaking Changes 🚨
- **ALL** models and **ALL** variables now have the prefix `linkedin_ads_*`. They previously were prepended with `linkedin_*`. This includes the required schema and database variables. We made this change to better discern between Linkedin Ads and [Linkedin Pages](https://github.com/fivetran/dbt_linkedin_pages/tree/main).
- The following models have been renamed:
  - `linkedin__account_ad_report` -> `linkedin_ads__account_report`
  - `linkedin__campaign_ad_report` -> `linkedin_ads__campaign_report`
  - `linkedin__campaign_group_ad_report` -> `linkedin_ads__campaign_group_report`
- The `linkedin__ad_adapter` model has been renamed and refactored into two separate models:
  - `linkedin_ads__url_report`: Each record in this table represents the daily performance at the url level.
  - `linkedin_ads__creative_report`: Each record in this table represents the daily performance at the creative level.
- The declaration of passthrough variables within your root `dbt_project.yml` has changed. To allow for more flexibility and better tracking of passthrough columns, you will now want to define passthrough columns in the following format:
```yml
vars:
  linkedin_ads__campaign_passthrough_metrics: # this will pass through fields to the account, campaign, and campaign group report models. it pulls from `ad_analytics_by_campaign`
    - name: "my_field_to_include" # Required: Name of the field within the source.
      alias: "field_alias" # Optional: If you wish to alias the field within the staging model.
  linkedin_ads__creative_passthrough_metrics: # this will pass through fields to the creative and url report models.  it pulls from `ad_analytics_by_creative`
    - name: "my_field_to_include"
      alias: "field_alias"
```
- Staging models are now by default written within a schema titled (`<target_schema>` + `_linkedin_ads_source`) in your destination. Previously, this was titled (`<target_schema>` + `_stg_linkedin`).

## 🎉 Feature Enhancements 🎉
- README updates for easier navigation and use of the package.
- Addition of identifier variables for each of the source tables to allow for further flexibility in source table direction within the dbt project.
- Addition of new columns to `_report` models.
- More complete table and column documentation.
- More robust schema tests.

# dbt_linkedin v0.4.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_linkedin_source`. Additionally, the latest `dbt_linkedin_source` package has a dependency on the latest `dbt_fivetran_utils`. Further, the latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_linkedin v0.1.0 -> v0.3.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!