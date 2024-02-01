-- ques 4. select only member_id and first_name cols for the members who are not from Australia

select member_id, first_name
from members
where region != 'Australia';

-- ques 5. return the unique region values from the members table and sort the output by reverse alphabetical order.

select distinct (region ) 
from members
order by region desc;

-- ques 6. how many mentors are there from australia or the united states?

select 
	count(*) as mentor_count
from members
where region in ('Australia', 'United States');

-- ques 7. how many mentors are not from Australia or the United States?

select 
	count(*) as mentor_count
from members 
where region not in ('Australia', 'United States');

-- ques 8. how many members are there per region? sort the output by regions with the most mentors to the least.

select 
	region, 
    count(*) as mentor_count
from members
group by region
order by mentor_count desc;

-- ques 9. how many US mentors and non US mentors are there?

select -- this is really interesting way to divide the group into us and non us mentors. 
	case
		when region != 'United States' then 'Non US'
		else region
	end As mentor_region, 
    count(*) as mentor_count
from members
group by mentor_region
order by mentor_count desc;

-- ques 10. how many mentors have a first name starting with a letter before 'E'?

select * from members;

select
	count(*) as mentor_count
from members
where Left(first_name, 1) < 'E';


    
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 asdfasdf