USE sys;
create table store_revenue ( id int not null primary key auto_increment, date datetime, brand_id int, store_location varchar(250), revenue float);
SELECT * FROM store_revenue;
create table marketing_data ( id int not null primary key auto_increment, date datetime, geo varchar(2), impressions float, clicks float );
SELECT * FROM marketing_data;

#Question #1 Generate a query to get the sum of the clicks of the marketing data​
SELECT SUM(impressions) as impressions, geo, SUM(clicks) as clicks         
FROM marketing_data
GROUP BY geo;

#Question #2 Generate a query to gather the sum of revenue by geo from the store_revenue table​
SELECT substring(store_location, 15,16) as store_location, SUM(revenue) as revenue
FROM store_revenue
GROUP BY store_location;

#Question #3 Merge these two datasets so we can see impressions, clicks, and revenue together by date and geo. Please ensure all records from each table are accounted for.​
SELECT a.date, b.impressions, b.clicks, a.revenue, b.geo
FROM store_revenue a,  marketing_data b
WHERE a.date = b.date;

#Question #4 In your opinion, what is the most efficient store and why?​
# I belive Store located in CA is the most efficient. The reason is because the store in CA has the most revenue compare to other stores and it has the most impressions where there were only 310 clicks.

#Question #5 (Challenge) Generate a query to rank in order the top 10 revenue producing states​
SELECT substring(store_location, 15,16) as store_location, SUM(revenue) as revenue
FROM store_revenue
GROUP BY store_location
order by 1;


