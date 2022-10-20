# dbt_ad_reporting v1.0.1

## 🎉 Feature Enhancements 🎉 
[PR #57](https://github.com/fivetran/dbt_ad_reporting/pull/57) incorporates the following change:
- The package now includes a set of pre-defined [metrics](https://docs.getdbt.com/docs/building-a-dbt-project/metrics) related to clicks, impressions, and spend (definitions [here](https://github.com/fivetran/dbt_ad_reporting/blob/main/models/ad_reporting_metrics.yml)). 
  - Refer to the [README](https://github.com/fivetran/dbt_ad_reporting#optional-step-8-use-predefined-metrics) for the included metrics and instructions on how to use them.
  - Note: This requires you to manually add a dependency on the [dbt metrics package](https://github.com/dbt-labs/dbt_metrics) to use.

## Fixes
[PR #60](https://github.com/fivetran/dbt_ad_reporting/pull/60) incorporates the following change:
- The LinkedIn Ads schema and database variables were incorrectly documented within the README. The README has been updated to reflect the correct variable names. 
  - `linkedin_schema` has been properly updated to reflect `linkedin_ads_schema`
  - `linkedin_database` has been updated to reflect `linkedin_ads_database`. 

## Contributors
- [@clay-walker](https://github.com/clay-walker) ([#60](https://github.com/fivetran/dbt_ad_reporting/pull/60))

# dbt_ad_reporting v1.0.0
## 🚨 Breaking Changes 🚨
[PR #54](https://github.com/fivetran/dbt_ad_reporting/pull/54) incorporates these breaking changes:
- The previous `ad_reporting` model has been renamed to `ad_reporting__url_report` and will only include records that have non-null url values for more information on specific filters please refer to each platform package's `url_report` model.

## 🎉 Feature Enhancements 🎉 
[PR #54](https://github.com/fivetran/dbt_ad_reporting/pull/54) includes the following new features:
- Apple Search Ads has officially been released and added to Ad Reporting.
- In addition to the `ad_reporting__url_report` model update, we have added **five** new models:
  - `ad_reporting__account_report`
  - `ad_reporting__campaign_report`
  - `ad_reporting__ad_group_report`
  - `ad_reporting__ad_report`
  - `ad_reporting__keyword_search_report`
- This package now leverages `ad_reporting__<platform>_enabled` variables to enable/disable all upstream packages and respective models all in one place.
- New corresponding documentation and updated docs for new models.
- This package leverages several different macros in order to successfully build each model and features a `macros_docs.yml` within the `macros` directory that provides details for each macro.

# dbt_ad_reporting v0.8.0
## 🚨 Breaking Changes 🚨
- The `api_source` variable for the Google Ads package is now defaulted to `google_ads` as opposed to `adwords`. The Adwords API has since been deprecated by Google and is now no longer the standard API for the Google Ads connector. Please ensure you are using a Google Ads API version of the Fivetran connector before upgrading this package. ([#53](https://github.com/fivetran/dbt_ad_reporting/pull/53))
  - Please note, the `adwords` version of this package will be fully removed from the package in August of 2022. This means, models under `models/adwords_connector` will be removed in favor of `models/google_ads_connector` models.

## Updates
- The `ad_reporting` final model is now materialized in a schema `<target_schema>_ad_reporting` by default. This may be overwritten if desired. ([#53](https://github.com/fivetran/dbt_ad_reporting/pull/53))
# dbt_ad_reporting v0.7.0
## 🚨 Breaking Changes 🚨
- The Google Ads dependency has been updated to now reference the latest version of the `dbt_google_ads` package (v0.6.0). This version of the package incorporates new and modified tables within the `Google Ads API` version of the connector. For more information, refer to the relevant [dbt_google_ads](https://github.com/fivetran/dbt_google_ads_source/releases/tag/v0.6.0) and [dbt_google_ads_source](https://github.com/fivetran/dbt_google_ads/releases/tag/v0.6.0) v0.6.0 release notes.

# dbt_ad_reporting v0.6.0
TikTok Ads has been added as a dependency and is enabled by default. Be sure to disable the models via the README if you do not have a TikTok Ads connector.

## Feature Additions
- Added the TikTok Ads package to be included in the final `ad_reporting` model. ([#36](https://github.com/fivetran/dbt_ad_reporting/pull/36))

# dbt_ad_reporting v0.6.0-b1
🎉 dbt v1.0.0 Compatibility Pre Release 🎉 An official dbt v1.0.0 compatible version of the package will be released once existing feature/bug PRs are merged.

## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependencies to refer to the latest individual ad package versions. Additionally, the latest individual ad package versions have a dependency on the latest `dbt_fivetran_utils`. Further, the latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.
# dbt_ad_reporting v0.5.1
## Feature Additions
- Added the `account_name` and `account_id` to the `stg_snapchat_ads` model. This will allow for the relevant Snapchat Ads account information to flow downstream into the final `ad_reporting` model. ([#30](https://github.com/fivetran/dbt_ad_reporting/pull/30))

## Under the Hood
- Cast the `account_id` and `external_account_id` as strings within the `stg_google_ads` model.

# Contributors 
- @csoule-shaker ([#30](https://github.com/fivetran/dbt_ad_reporting/pull/30))
- @csoule1622 ([#30](https://github.com/fivetran/dbt_ad_reporting/pull/30))

# dbt_ad_reporting v0.1.0 -> v0.5.0
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
