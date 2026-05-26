create database filpkarts;
use filpkarts;

select *from mobiles;

-- differenty price range segments for mobiles in india

select brand,
sum(case when MRP between 0 and 9999 then 1 else 0 end) as 'Price Below 10k',
sum(case when MRP between 10000 and 19999 then 1 else 0 end) as 'Price Between 10k - 20k',
sum(case when MRP between 20000 and 39999 then 1 else 0 end) as 'Price Between 20k - 40k',
sum(case when MRP >= 40000 then 1 else 0 end) as 'Price Above 40k'
from mobiles
group by brand
order by brand;

-- the brand that has the highest discounted price
select brand,
max(MRP -MSP) as MaxDiscount
from mobiles
group by brand
order by MaxDiscount desc
limit 1;

-- top 5 brands by average ratings
select brand ,avg(ratings) as avg_ratings
from mobiles
group by brand
order by avg_ratings desc
limit 5;

-- top 5 brands by total number of reviews
select brand , sum(NO_of_review) as total_reviews
from mobiles
group by brand
order by total_reviews
desc
limit 5;

-- products with ratings greater than 4.5
select * from mobiles
where ratings > 4.5;

-- products with discounts greater tahn 40%
select * from  mobiles
where discount > 40;

-- average ratings number of reviews per brand

select brand,avg(ratings) as avg_rating,sum(no_of_reviews) as total_reviews
from mobiles
group by brand
order by avg_rating desc;

-- products with the highest discounts
select * from mobiles
order by discount desc
limit 5;

-- get unique brand names
select distinct brand
from mobiles;
