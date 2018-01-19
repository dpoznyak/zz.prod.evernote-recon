;
select '------tags-----------';

select t.name, parent.name, t.subtag_count, t.note_count 
	from tag_attr t
		left join tag_attr parent
			on t.parent_uid = parent.uid
 	order by t.name COLLATE BINARY;
select '------notebooks-----------';
select name, note_count from notebook_attr 
order by name COLLATE BINARY;
--select * from note_attr ;

select 'count from notebook_attr', sum(note_count) from notebook_attr;

select 'count from note_attr by is_deleted', is_deleted, count(*) from note_attr group by is_deleted ;

select '------notebooks with no tags-----------';
SELECT notebook, COUNT(*)
FROM note_attr
where 
	not (tags COLLATE BINARY is not null) and
	notebook COLLATE BINARY like "*****%" and 
	notebook COLLATE BINARY not in (
		"***** [IN]", 
		"***** IN:later")
GROUP BY notebook COLLATE BINARY;


select '------NOTEBOOKS/TAGS-----------';
SELECT notebook, tags, COUNT(*)
FROM note_attr
GROUP BY notebook COLLATE BINARY, tags COLLATE BINARY;