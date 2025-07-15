select * from blinkit_data;

#to remove spaces from the headers.
alter table blinkit_data rename column `Item Fat Content` to ItemFatContent;
alter table blinkit_data rename column `Item Identifier` to ItemIdentifier;
alter table blinkit_data rename column `Item Type` to ItemType;
alter table blinkit_data rename column `Outlet Establishment Year` to OutletEstablishmentYear;
alter table blinkit_data rename column `Outlet Identifier` to OutletIdentifier;
alter table blinkit_data rename column `Outlet Location Type` to OutletLocationType;
alter table blinkit_data rename column `Outlet Size` to OutletSize;
alter table blinkit_data rename column `Outlet Type` to OutletType;
alter table blinkit_data rename column `Item Visibility` to ItemVisibility;
alter table blinkit_data rename column `Item Weight` to ItemWeight;

/* This block of code normalizes the fat content.
It changes 'LF' and 'low fat' to 'Low Fat',
and 'reg' to 'Regular'*/ 
update blinkit_data
set ItemFatContent=
Case 
when ItemFatContent in ("LF", "low fat") then "Low Fat"
when ItemFatContent= 'reg' then 'regular'
else ItemFatContent
end 
WHERE ItemFatContent IN ('LF', 'low fat', 'reg');
#update statement withuot a where clause.
SET SQL_SAFE_UPDATES = 0;


#KPIs retrieving requierements.
select concat(cast(sum(sales)/1000000 as decimal(10,2)),'million') as total_sales 
from blinkit_data
where ItemFatContent='Low Fat';

select cast(avg(sales) as decimal(10,2)) as avg_sales
from blinkit_data;

select count(*) as no_of_items
from blinkit_data;

select cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data;

#granular requirements.
#total sales by fat content 
select ItemFatContent,
		cast(sum(sales) as decimal(10,2)) as total_sales ,
        cast(avg(sales) as decimal(10,2)) as avg_sales,
        count(*) as no_of_items,
        cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data
group by ItemFatContent
order by total_sales desc;

#total sales by item type
select ItemType,
		cast(sum(sales) as decimal(10,2)) as total_sales ,
        cast(avg(sales) as decimal(10,2)) as avg_sales,
        count(*) as no_of_items,
        cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data
group by ItemType
order by total_sales
limit 5;


# total sales by outlet location
select ItemFatContent, OutletLocationType,
		cast(sum(sales) as decimal(10,2)) as total_sales ,
        cast(avg(sales) as decimal(10,2)) as avg_sales,
        count(*) as no_of_items,
        cast(avg(rating) as decimal(10,2)) as avg_rating
from blinkit_data
group by ItemFatContent,OutletLocationType
order by total_sales desc;

#pivot function (transpose rows to columns)
select OutletLocationType,
	cast(sum(case when ItemFatContent='Low Fat' Then sales else 0 end) as decimal(10,2)) as Low_fat,
    cast(sum(case when ItemFatContent='Regular' Then sales else 0 end) as decimal(10,2)) as regular
from blinkit_data
group by OutletLocationType;

#total sales by outlet establishment 
select OutletEstablishmentYear, concat(cast(sum(sales)/10000 as decimal(10,2)), 'k') as total_sales
from blinkit_data
group by OutletEstablishmentYear
order by OutletEstablishmentYear asc;

select distinct(OutletEstablishmentYear)
from blinkit_data
order by OutletEstablishmentYear;

#chart requirements
#percentage of sales by outlet size
select OutletSize, 
cast(sum(sales)*100/ (select sum(sales) from blinkit_data) as decimal(10,2)) as percentage
from blinkit_data
group by OutletSize;