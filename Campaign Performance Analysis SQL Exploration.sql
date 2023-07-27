-- Campaign Performance Analysis

select
   *
from
   `uber-data-393909.uber_data_yt.dataset`;

-- Count All Ads
select
   count(*) as all_ads
from
   `uber-data-393909.uber_data_yt.dataset`;


-- Total Unique Ads
select
   count(distinct campaign_item_id) as Unique_ads
from
   `uber-data-393909.uber_data_yt.dataset`;

-- Write an SQL query to retrieve the total number of impressions, clicks, and media cost.
select
  sum(impressions) as total_impressions,
  sum(clicks) as total_clicks,
  sum(media_cost_usd) as total_cost
from
  `uber-data-393909.uber_data_yt.dataset`;


-- Write an SQL query to retrieve the Overall CPC and CTR.

select
   (sum(clicks)/sum(impressions))*100 as CTR,
   (sum(media_cost_usd)/sum(clicks))*100 as CTR
from
  `uber-data-393909.uber_data_yt.dataset`;

-- Create an SQL query to calculate the click-through rate (CTR) and CPC for each Ads Platform,
select
   platform_name,
    (sum(clicks)/sum(impressions))*100 as CTR,
   (sum(media_cost_usd)/sum(clicks))*100 as CPC
from
  `uber-data-393909.uber_data_yt.dataset`
group by
  platform_name;

-- Generate an SQL query to find the top 10 campaign items with the highest media cost in USD.
select
   platform_name,
   media_cost_usd
from
  `uber-data-393909.uber_data_yt.dataset`
order by
    media_cost_usd desc
  limit 10;

-- Write an SQL query to calculate the average media cost per day for each campaign.
select
   day,
   avg(media_cost_usd) as avg_cost_per_day
from
   `uber-data-393909.uber_data_yt.dataset`
group by
    day
order by
     day asc;


-- Create an SQL query to identify the platform with the highest number of impressions and clicks.

select
    platform_name,
    sum(impressions) as total_impressions,
    sum(clicks) as total_clicks
from
  `uber-data-393909.uber_data_yt.dataset`
group by
    platform_name
order by total_impressions desc,total_clicks desc;


-- Generate an SQL query to calculate the total media cost in USD for each advertiser.
select
   advertiser_name,
   sum(media_cost_usd) as total_ads_cost
from
  `uber-data-393909.uber_data_yt.dataset`
group by 
    advertiser_name
order by
     total_ads_cost desc;


-- Write an SQL query to find the total number of impressions, clicks, and media cost for each advertiser in a specific timezone
select
    advertiser_name,
    timezone,
    sum(impressions) as total_impressions,
    sum(clicks) as total_clicks
from
  `uber-data-393909.uber_data_yt.dataset`
group by
    advertiser_name,timezone
order by total_impressions desc,total_clicks desc;

-- -- Create an SQL query to calculate the click-through rate (CTR) and CPC , impression,clicks and media cost for each ads channel,
select
   channel_name,
   sum(impressions) as total_impression,
   sum(clicks) as total_clicks,
   sum(media_cost_usd) as total_cost,
    (sum(clicks)/sum(impressions))*100 as CTR,
   (sum(media_cost_usd)/sum(clicks))*100 as CPC
from
  `uber-data-393909.uber_data_yt.dataset`
group by
  channel_name;



-- Write an SQL query to find the campaign items that exceeded their approved budget.

select
    platform_name,
    approved_budget,
    campaign_budget_usd
from
   `uber-data-393909.uber_data_yt.dataset`
where
    campaign_budget_usd>approved_budget;


-- -- Write an SQL query to find the which search tags  has the get highest impression and clicks.

select
   search_tag_cat,
   sum(impressions) as total_impression,
   sum(clicks) as total_clicks
from
  `uber-data-393909.uber_data_yt.dataset`
group by
   search_tag_cat;

