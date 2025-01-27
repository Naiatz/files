-- כתוב רקורסיה של נחמן מאומן
with NC (ID,letter)
as
(
	\select 1,cast(left('Nachman meuman',1)as varchar(20))
union all
select id+1,cast(left('Nachman meuman',id+1)as varchar(20))
from NC
where ID<len('Nachman meuman')
)
select *
from NC
where RIGHT letter <>' '