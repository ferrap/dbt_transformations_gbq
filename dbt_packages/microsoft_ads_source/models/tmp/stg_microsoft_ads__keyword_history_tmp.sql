{{ config(enabled=var('ad_reporting__microsoft_ads_enabled', True)) }}

select * 
from {{ var('keyword_history') }}
