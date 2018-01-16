select * from tag_attr;
select * from notebook_attr;
select * from note_attr 

select sum(note_count) from notebook_attr;

select is_deleted, count(*) from note_attr group by is_deleted 

select notebook, count(*) from note_attr 
where 
	notebook like "*****%" and 
	notebook not in (
		"***** [IN]", 
		"***** IN:later") and 
	tags is NULL
group by notebook