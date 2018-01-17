select '------tags-----------';
select count(*) from tag_attr;
select '------notebooks-----------';
select count(*) from notebook_attr;
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