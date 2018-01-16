select ifnull(date_updated, date_created), * from note_attr where tags REGEXP '(^|\s)U'


update note_attr
set sync_required = 1, date_updated = ifnull(date_updated, date_created) + (1.0/24/60)
-- select * from from note_attr 
where tags REGEXP '(^|\s)U'