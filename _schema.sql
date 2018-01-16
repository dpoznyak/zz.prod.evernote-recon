BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `user_attr` (
	`uid`	INTEGER,
	`id`	INTEGER DEFAULT NULL,
	`name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`email`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`full_name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`business_title`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`shard_id`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`notebooks_count`	INTEGER DEFAULT NULL,
	`is_business`	INTEGER DEFAULT NULL,
	`image_updated`	REAL DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `usage` (
	`session`	INTEGER,
	PRIMARY KEY(`session`)
);
CREATE TABLE IF NOT EXISTS `threadchange_attr` (
	`uid`	INTEGER,
	`thread_uid`	INTEGER DEFAULT NULL,
	`id`	INTEGER DEFAULT NULL,
	`thread_id`	INTEGER DEFAULT NULL,
	`user_id`	INTEGER DEFAULT NULL,
	`event_id`	INTEGER DEFAULT NULL,
	`type`	INTEGER DEFAULT NULL,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`change_date`	REAL DEFAULT NULL,
	`identity_id`	INTEGER DEFAULT NULL,
	`string_value`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `thread_attr` (
	`uid`	INTEGER,
	`id`	INTEGER DEFAULT NULL,
	`name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`max_message_id`	INTEGER DEFAULT NULL,
	`last_read_message_id`	INTEGER DEFAULT NULL,
	`max_deleted_message_id`	INTEGER DEFAULT NULL,
	`snippet`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`message_count`	INTEGER DEFAULT NULL,
	`has_unread`	INTEGER DEFAULT NULL,
	`is_deleted`	INTEGER DEFAULT NULL,
	`is_group`	INTEGER DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE VIRTUAL TABLE tastermscxt USING fts3tasterms(tasfts);
CREATE VIRTUAL TABLE tasfts_terms USING fts4aux(tasfts);
CREATE TABLE IF NOT EXISTS `tasfts_segments` (
	`blockid`	INTEGER,
	`block`	BLOB,
	PRIMARY KEY(`blockid`)
);
CREATE TABLE IF NOT EXISTS `tasfts_segdir` (
	`level`	INTEGER,
	`idx`	INTEGER,
	`start_block`	INTEGER,
	`leaves_end_block`	INTEGER,
	`end_block`	INTEGER,
	`root`	BLOB,
	PRIMARY KEY(`level`,`idx`)
);
CREATE TABLE IF NOT EXISTS `tasfts_content` (
	`docid`	INTEGER,
	`c0text`	TEXT,
	PRIMARY KEY(`docid`)
);
CREATE TABLE IF NOT EXISTS `tasfts_aux` (
	`uid`	INTEGER NOT NULL
);
CREATE VIRTUAL TABLE tasfts USING fts3(text, tokenize=tas);
CREATE TABLE IF NOT EXISTS `tag_attr` (
	`uid`	INTEGER,
	`parent_uid`	INTEGER DEFAULT NULL,
	`name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`item_color`	INTEGER DEFAULT NULL,
	`item_style`	INTEGER DEFAULT NULL,
	`local_flags`	INTEGER DEFAULT NULL,
	`subtag_count`	INTEGER DEFAULT NULL,
	`note_count`	INTEGER DEFAULT NULL,
	`is_linked`	INTEGER DEFAULT NULL,
	`business_id`	INTEGER DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `src_uid` (
	`uid`	INTEGER
);
CREATE TABLE IF NOT EXISTS `src_csn` (
	`csn`	INTEGER
);
CREATE TABLE IF NOT EXISTS `resources` (
	`uid`	INTEGER NOT NULL,
	`md5`	BLOB NOT NULL,
	`data`	BLOB NOT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `resource_attr` (
	`uid`	INTEGER,
	`note`	INTEGER DEFAULT 0,
	`original`	INTEGER DEFAULT 0,
	`mime`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`width`	INTEGER DEFAULT 0,
	`height`	INTEGER DEFAULT 0,
	`duration`	INTEGER DEFAULT 0,
	`source_url`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`timestamp`	REAL DEFAULT NULL,
	`latitude`	REAL DEFAULT NULL,
	`longitude`	REAL DEFAULT NULL,
	`altitude`	REAL DEFAULT NULL,
	`camera_make`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`camera_model`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`reco_type`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`file_name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`partial_sync`	INTEGER DEFAULT NULL,
	`is_attachment`	INTEGER DEFAULT NULL,
	`has_search_text`	INTEGER DEFAULT NULL,
	`size`	INTEGER DEFAULT 0,
	`hash`	TEXT DEFAULT NULL COLLATE NOCASE,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `notebook_attr` (
	`uid`	INTEGER,
	`name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`stack`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`restrictions`	INTEGER DEFAULT NULL,
	`flags`	INTEGER DEFAULT NULL,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`date_last_chosen`	REAL DEFAULT NULL,
	`item_color`	INTEGER DEFAULT NULL,
	`item_style`	INTEGER DEFAULT NULL,
	`note_count`	INTEGER DEFAULT NULL,
	`is_local`	INTEGER DEFAULT NULL,
	`is_linked`	INTEGER DEFAULT NULL,
	`is_offline`	INTEGER DEFAULT NULL,
	`is_accessible`	INTEGER DEFAULT NULL,
	`business_id`	INTEGER DEFAULT NULL,
	`shared_notebook_guid`	TEXT DEFAULT NULL,
	`business_notebook_owner`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`linked_notebook_username`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`linked_notebook_userid`	INTEGER DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `note_usage` (
	`uid`	INTEGER,
	`date`	REAL DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `note_attr` (
	`uid`	INTEGER,
	`title`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`author`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`creator_id`	INTEGER DEFAULT NULL,
	`last_edited_by`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`last_editor_id`	INTEGER DEFAULT NULL,
	`notebook`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`notebook_uid`	INTEGER DEFAULT NULL,
	`tags`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`date_deleted`	REAL DEFAULT NULL,
	`date_subject`	REAL DEFAULT NULL,
	`date_share`	REAL DEFAULT NULL,
	`source`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`source_url`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`source_app`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`latitude`	REAL DEFAULT NULL,
	`longitude`	REAL DEFAULT NULL,
	`altitude`	REAL DEFAULT NULL,
	`geo_address`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`geo_country`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`geo_adminlevel1`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`geo_adminlevel2`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`geo_adminlevel3`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`reminder_order`	REAL DEFAULT NULL,
	`reminder_time`	REAL DEFAULT NULL,
	`reminder_done_time`	REAL DEFAULT NULL,
	`place_name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`content_class`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`title_quality`	INTEGER DEFAULT NULL,
	`restrictions`	INTEGER DEFAULT NULL,
	`flags`	INTEGER DEFAULT NULL,
	`local_flags`	INTEGER DEFAULT NULL,
	`has_encryption`	INTEGER DEFAULT NULL,
	`has_todo`	INTEGER DEFAULT NULL,
	`is_deleted`	INTEGER DEFAULT NULL,
	`is_linked`	INTEGER DEFAULT NULL,
	`is_shared`	INTEGER DEFAULT NULL,
	`is_published`	INTEGER DEFAULT NULL,
	`shared_with_business`	INTEGER DEFAULT NULL,
	`shared_via_messaging`	INTEGER DEFAULT NULL,
	`partial_sync`	INTEGER DEFAULT NULL,
	`sync_required`	INTEGER DEFAULT NULL,
	`has_sync_error_info`	INTEGER DEFAULT NULL,
	`size`	INTEGER DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `message_attr` (
	`uid`	INTEGER,
	`thread_uid`	INTEGER DEFAULT NULL,
	`id`	INTEGER DEFAULT NULL,
	`thread_id`	INTEGER DEFAULT NULL,
	`sender_id`	INTEGER DEFAULT NULL,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`sent_date`	REAL DEFAULT NULL,
	`body`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`is_reshare`	INTEGER DEFAULT NULL,
	`attachments_count`	INTEGER DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `items` (
	`uid`	INTEGER,
	`guid`	BLOB UNIQUE,
	`type`	INTEGER DEFAULT 0,
	`csn`	INTEGER DEFAULT 0,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `identity_attr` (
	`uid`	INTEGER,
	`id`	INTEGER DEFAULT NULL,
	`contact_name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`contact_id`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`contact_type`	INTEGER DEFAULT NULL,
	`contact_photo_url`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`contact_photo_last_updated`	REAL DEFAULT NULL,
	`user_id`	INTEGER DEFAULT NULL,
	`deactivated`	INTEGER DEFAULT NULL,
	`same_business`	INTEGER DEFAULT NULL,
	`blocked`	INTEGER DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `fts_stat` (
	`id`	INTEGER,
	`value`	BLOB,
	PRIMARY KEY(`id`)
);
CREATE TABLE IF NOT EXISTS `fts_segments` (
	`blockid`	INTEGER,
	`block`	BLOB,
	PRIMARY KEY(`blockid`)
);
CREATE TABLE IF NOT EXISTS `fts_segdir` (
	`level`	INTEGER,
	`idx`	INTEGER,
	`start_block`	INTEGER,
	`leaves_end_block`	INTEGER,
	`end_block`	INTEGER,
	`root`	BLOB,
	PRIMARY KEY(`level`,`idx`)
);
CREATE TABLE IF NOT EXISTS `fts_docsize` (
	`docid`	INTEGER,
	`size`	BLOB,
	PRIMARY KEY(`docid`)
);
CREATE TABLE IF NOT EXISTS `fts_content` (
	`docid`	INTEGER,
	`c0text`	TEXT,
	PRIMARY KEY(`docid`)
);
CREATE TABLE IF NOT EXISTS `fts_aux` (
	`uid`	INTEGER NOT NULL,
	`type`	INTEGER
);
CREATE VIRTUAL TABLE fts USING fts4(text);
CREATE TABLE IF NOT EXISTS `extUser_attr` (
	`uid`	INTEGER,
	`name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`id`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`comment`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`source`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`source_data`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `expunged_items` (
	`guid`	BLOB,
	`type`	INTEGER DEFAULT 0,
	`csn`	INTEGER DEFAULT 0,
	`data`	BLOB DEFAULT NULL,
	PRIMARY KEY(`guid`)
);
CREATE TABLE IF NOT EXISTS `contact_attr` (
	`uid`	INTEGER,
	`name`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`id`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`type`	INTEGER DEFAULT NULL,
	`photo_url`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`photo_last_updated`	REAL DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE TABLE IF NOT EXISTS `attrs` (
	`uid`	INTEGER NOT NULL,
	`aid`	INTEGER DEFAULT 0,
	`afl`	INTEGER DEFAULT 0,
	`csn`	INTEGER DEFAULT 0,
	`data`	BLOB NOT NULL,
	PRIMARY KEY(`uid`,`aid`,`afl`)
);
CREATE TABLE IF NOT EXISTS `attachment_attr` (
	`uid`	INTEGER,
	`message_uid`	INTEGER DEFAULT NULL,
	`type`	INTEGER DEFAULT NULL,
	`title`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`date_created`	REAL DEFAULT NULL,
	`date_updated`	REAL DEFAULT NULL,
	`user_id`	INTEGER DEFAULT NULL,
	`shard_id`	TEXT DEFAULT NULL,
	`snippet`	TEXT DEFAULT NULL COLLATE NOCASEUTF8,
	`dont_sync`	INTEGER DEFAULT NULL,
	`item_uid`	INTEGER DEFAULT NULL,
	`item_guid`	TEXT DEFAULT NULL,
	PRIMARY KEY(`uid`)
);
CREATE INDEX IF NOT EXISTS `user_attr_shard_id_idx` ON `user_attr` (
	`shard_id`
);
CREATE INDEX IF NOT EXISTS `user_attr_notebooks_count_idx` ON `user_attr` (
	`notebooks_count`
);
CREATE INDEX IF NOT EXISTS `user_attr_name_idx` ON `user_attr` (
	`name`
);
CREATE INDEX IF NOT EXISTS `user_attr_is_business_idx` ON `user_attr` (
	`is_business`
);
CREATE INDEX IF NOT EXISTS `user_attr_image_updated_idx` ON `user_attr` (
	`image_updated`
);
CREATE INDEX IF NOT EXISTS `user_attr_id_idx` ON `user_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `user_attr_full_name_idx` ON `user_attr` (
	`full_name`
);
CREATE INDEX IF NOT EXISTS `user_attr_email_idx` ON `user_attr` (
	`email`
);
CREATE INDEX IF NOT EXISTS `user_attr_date_updated_idx` ON `user_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `user_attr_date_created_idx` ON `user_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `user_attr_business_title_idx` ON `user_attr` (
	`business_title`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_user_id_idx` ON `threadchange_attr` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_type_idx` ON `threadchange_attr` (
	`type`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_thread_uid_idx` ON `threadchange_attr` (
	`thread_uid`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_thread_id_idx` ON `threadchange_attr` (
	`thread_id`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_string_value_idx` ON `threadchange_attr` (
	`string_value`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_identity_id_idx` ON `threadchange_attr` (
	`identity_id`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_id_idx` ON `threadchange_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_event_id_idx` ON `threadchange_attr` (
	`event_id`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_date_updated_idx` ON `threadchange_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_date_created_idx` ON `threadchange_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `threadchange_attr_change_date_idx` ON `threadchange_attr` (
	`change_date`
);
CREATE INDEX IF NOT EXISTS `thread_attr_snippet_idx` ON `thread_attr` (
	`snippet`
);
CREATE INDEX IF NOT EXISTS `thread_attr_name_idx` ON `thread_attr` (
	`name`
);
CREATE INDEX IF NOT EXISTS `thread_attr_message_count_idx` ON `thread_attr` (
	`message_count`
);
CREATE INDEX IF NOT EXISTS `thread_attr_max_message_id_idx` ON `thread_attr` (
	`max_message_id`
);
CREATE INDEX IF NOT EXISTS `thread_attr_max_deleted_message_id_idx` ON `thread_attr` (
	`max_deleted_message_id`
);
CREATE INDEX IF NOT EXISTS `thread_attr_last_read_message_id_idx` ON `thread_attr` (
	`last_read_message_id`
);
CREATE INDEX IF NOT EXISTS `thread_attr_is_group_idx` ON `thread_attr` (
	`is_group`
);
CREATE INDEX IF NOT EXISTS `thread_attr_is_deleted_idx` ON `thread_attr` (
	`is_deleted`
);
CREATE INDEX IF NOT EXISTS `thread_attr_id_idx` ON `thread_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `thread_attr_has_unread_idx` ON `thread_attr` (
	`has_unread`
);
CREATE INDEX IF NOT EXISTS `thread_attr_date_updated_idx` ON `thread_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `thread_attr_date_created_idx` ON `thread_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `tasfts_aux_uid_idx` ON `tasfts_aux` (
	`uid`
);
CREATE INDEX IF NOT EXISTS `tag_attr_subtag_count_idx` ON `tag_attr` (
	`subtag_count`
);
CREATE INDEX IF NOT EXISTS `tag_attr_parent_uid_idx` ON `tag_attr` (
	`parent_uid`
);
CREATE INDEX IF NOT EXISTS `tag_attr_note_count_idx` ON `tag_attr` (
	`note_count`
);
CREATE INDEX IF NOT EXISTS `tag_attr_name_idx` ON `tag_attr` (
	`name`
);
CREATE INDEX IF NOT EXISTS `tag_attr_local_flags_idx` ON `tag_attr` (
	`local_flags`
);
CREATE INDEX IF NOT EXISTS `tag_attr_item_style_idx` ON `tag_attr` (
	`item_style`
);
CREATE INDEX IF NOT EXISTS `tag_attr_item_color_idx` ON `tag_attr` (
	`item_color`
);
CREATE INDEX IF NOT EXISTS `tag_attr_is_linked_idx` ON `tag_attr` (
	`is_linked`
);
CREATE INDEX IF NOT EXISTS `tag_attr_date_updated_idx` ON `tag_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `tag_attr_date_created_idx` ON `tag_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `tag_attr_business_id_idx` ON `tag_attr` (
	`business_id`
);
CREATE INDEX IF NOT EXISTS `resource_attr_width_idx` ON `resource_attr` (
	`width`
);
CREATE INDEX IF NOT EXISTS `resource_attr_timestamp_idx` ON `resource_attr` (
	`timestamp`
);
CREATE INDEX IF NOT EXISTS `resource_attr_source_url_idx` ON `resource_attr` (
	`source_url`
);
CREATE INDEX IF NOT EXISTS `resource_attr_size_idx` ON `resource_attr` (
	`size`
);
CREATE INDEX IF NOT EXISTS `resource_attr_reco_type_idx` ON `resource_attr` (
	`reco_type`
);
CREATE INDEX IF NOT EXISTS `resource_attr_partial_sync_idx` ON `resource_attr` (
	`partial_sync`
);
CREATE INDEX IF NOT EXISTS `resource_attr_original_idx` ON `resource_attr` (
	`original`
);
CREATE INDEX IF NOT EXISTS `resource_attr_note_idx` ON `resource_attr` (
	`note`
);
CREATE INDEX IF NOT EXISTS `resource_attr_mime_idx` ON `resource_attr` (
	`mime`
);
CREATE INDEX IF NOT EXISTS `resource_attr_longitude_idx` ON `resource_attr` (
	`longitude`
);
CREATE INDEX IF NOT EXISTS `resource_attr_latitude_idx` ON `resource_attr` (
	`latitude`
);
CREATE INDEX IF NOT EXISTS `resource_attr_is_attachment_idx` ON `resource_attr` (
	`is_attachment`
);
CREATE INDEX IF NOT EXISTS `resource_attr_height_idx` ON `resource_attr` (
	`height`
);
CREATE INDEX IF NOT EXISTS `resource_attr_hash_idx` ON `resource_attr` (
	`hash`
);
CREATE INDEX IF NOT EXISTS `resource_attr_has_search_text_idx` ON `resource_attr` (
	`has_search_text`
);
CREATE INDEX IF NOT EXISTS `resource_attr_file_name_idx` ON `resource_attr` (
	`file_name`
);
CREATE INDEX IF NOT EXISTS `resource_attr_duration_idx` ON `resource_attr` (
	`duration`
);
CREATE INDEX IF NOT EXISTS `resource_attr_date_updated_idx` ON `resource_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `resource_attr_date_created_idx` ON `resource_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `resource_attr_camera_model_idx` ON `resource_attr` (
	`camera_model`
);
CREATE INDEX IF NOT EXISTS `resource_attr_camera_make_idx` ON `resource_attr` (
	`camera_make`
);
CREATE INDEX IF NOT EXISTS `resource_attr_altitude_idx` ON `resource_attr` (
	`altitude`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_stack_idx` ON `notebook_attr` (
	`stack`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_shared_notebook_guid_idx` ON `notebook_attr` (
	`shared_notebook_guid`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_restrictions_idx` ON `notebook_attr` (
	`restrictions`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_note_count_idx` ON `notebook_attr` (
	`note_count`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_name_idx` ON `notebook_attr` (
	`name`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_linked_notebook_username_idx` ON `notebook_attr` (
	`linked_notebook_username`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_linked_notebook_userid_idx` ON `notebook_attr` (
	`linked_notebook_userid`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_item_style_idx` ON `notebook_attr` (
	`item_style`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_item_color_idx` ON `notebook_attr` (
	`item_color`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_is_offline_idx` ON `notebook_attr` (
	`is_offline`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_is_local_idx` ON `notebook_attr` (
	`is_local`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_is_linked_idx` ON `notebook_attr` (
	`is_linked`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_is_accessible_idx` ON `notebook_attr` (
	`is_accessible`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_flags_idx` ON `notebook_attr` (
	`flags`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_date_updated_idx` ON `notebook_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_date_last_chosen_idx` ON `notebook_attr` (
	`date_last_chosen`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_date_created_idx` ON `notebook_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_business_notebook_owner_idx` ON `notebook_attr` (
	`business_notebook_owner`
);
CREATE INDEX IF NOT EXISTS `notebook_attr_business_id_idx` ON `notebook_attr` (
	`business_id`
);
CREATE INDEX IF NOT EXISTS `note_usage_date_idx` ON `note_usage` (
	`date`
);
CREATE INDEX IF NOT EXISTS `note_attr_title_quality_idx` ON `note_attr` (
	`title_quality`
);
CREATE INDEX IF NOT EXISTS `note_attr_title_idx` ON `note_attr` (
	`title`
);
CREATE INDEX IF NOT EXISTS `note_attr_tags_idx` ON `note_attr` (
	`tags`
);
CREATE INDEX IF NOT EXISTS `note_attr_sync_required_idx` ON `note_attr` (
	`sync_required`
);
CREATE INDEX IF NOT EXISTS `note_attr_source_url_idx` ON `note_attr` (
	`source_url`
);
CREATE INDEX IF NOT EXISTS `note_attr_source_idx` ON `note_attr` (
	`source`
);
CREATE INDEX IF NOT EXISTS `note_attr_source_app_idx` ON `note_attr` (
	`source_app`
);
CREATE INDEX IF NOT EXISTS `note_attr_size_idx` ON `note_attr` (
	`size`
);
CREATE INDEX IF NOT EXISTS `note_attr_shared_with_business_idx` ON `note_attr` (
	`shared_with_business`
);
CREATE INDEX IF NOT EXISTS `note_attr_shared_via_messaging_idx` ON `note_attr` (
	`shared_via_messaging`
);
CREATE INDEX IF NOT EXISTS `note_attr_restrictions_idx` ON `note_attr` (
	`restrictions`
);
CREATE INDEX IF NOT EXISTS `note_attr_reminder_time_idx` ON `note_attr` (
	`reminder_time`
);
CREATE INDEX IF NOT EXISTS `note_attr_reminder_order_idx` ON `note_attr` (
	`reminder_order`
);
CREATE INDEX IF NOT EXISTS `note_attr_reminder_done_time_idx` ON `note_attr` (
	`reminder_done_time`
);
CREATE INDEX IF NOT EXISTS `note_attr_place_name_idx` ON `note_attr` (
	`place_name`
);
CREATE INDEX IF NOT EXISTS `note_attr_partial_sync_idx` ON `note_attr` (
	`partial_sync`
);
CREATE INDEX IF NOT EXISTS `note_attr_notebook_uid_idx` ON `note_attr` (
	`notebook_uid`
);
CREATE INDEX IF NOT EXISTS `note_attr_notebook_idx` ON `note_attr` (
	`notebook`
);
CREATE INDEX IF NOT EXISTS `note_attr_longitude_idx` ON `note_attr` (
	`longitude`
);
CREATE INDEX IF NOT EXISTS `note_attr_local_flags_idx` ON `note_attr` (
	`local_flags`
);
CREATE INDEX IF NOT EXISTS `note_attr_latitude_idx` ON `note_attr` (
	`latitude`
);
CREATE INDEX IF NOT EXISTS `note_attr_last_editor_id_idx` ON `note_attr` (
	`last_editor_id`
);
CREATE INDEX IF NOT EXISTS `note_attr_last_edited_by_idx` ON `note_attr` (
	`last_edited_by`
);
CREATE INDEX IF NOT EXISTS `note_attr_is_shared_idx` ON `note_attr` (
	`is_shared`
);
CREATE INDEX IF NOT EXISTS `note_attr_is_published_idx` ON `note_attr` (
	`is_published`
);
CREATE INDEX IF NOT EXISTS `note_attr_is_linked_idx` ON `note_attr` (
	`is_linked`
);
CREATE INDEX IF NOT EXISTS `note_attr_is_deleted_idx` ON `note_attr` (
	`is_deleted`
);
CREATE INDEX IF NOT EXISTS `note_attr_has_todo_idx` ON `note_attr` (
	`has_todo`
);
CREATE INDEX IF NOT EXISTS `note_attr_has_sync_error_info_idx` ON `note_attr` (
	`has_sync_error_info`
);
CREATE INDEX IF NOT EXISTS `note_attr_has_encryption_idx` ON `note_attr` (
	`has_encryption`
);
CREATE INDEX IF NOT EXISTS `note_attr_geo_country_idx` ON `note_attr` (
	`geo_country`
);
CREATE INDEX IF NOT EXISTS `note_attr_geo_adminlevel3_idx` ON `note_attr` (
	`geo_adminlevel3`
);
CREATE INDEX IF NOT EXISTS `note_attr_geo_adminlevel2_idx` ON `note_attr` (
	`geo_adminlevel2`
);
CREATE INDEX IF NOT EXISTS `note_attr_geo_adminlevel1_idx` ON `note_attr` (
	`geo_adminlevel1`
);
CREATE INDEX IF NOT EXISTS `note_attr_geo_address_idx` ON `note_attr` (
	`geo_address`
);
CREATE INDEX IF NOT EXISTS `note_attr_flags_idx` ON `note_attr` (
	`flags`
);
CREATE INDEX IF NOT EXISTS `note_attr_date_updated_idx` ON `note_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `note_attr_date_subject_idx` ON `note_attr` (
	`date_subject`
);
CREATE INDEX IF NOT EXISTS `note_attr_date_share_idx` ON `note_attr` (
	`date_share`
);
CREATE INDEX IF NOT EXISTS `note_attr_date_deleted_idx` ON `note_attr` (
	`date_deleted`
);
CREATE INDEX IF NOT EXISTS `note_attr_date_created_idx` ON `note_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `note_attr_creator_id_idx` ON `note_attr` (
	`creator_id`
);
CREATE INDEX IF NOT EXISTS `note_attr_content_class_idx` ON `note_attr` (
	`content_class`
);
CREATE INDEX IF NOT EXISTS `note_attr_author_idx` ON `note_attr` (
	`author`
);
CREATE INDEX IF NOT EXISTS `note_attr_altitude_idx` ON `note_attr` (
	`altitude`
);
CREATE INDEX IF NOT EXISTS `message_attr_thread_uid_idx` ON `message_attr` (
	`thread_uid`
);
CREATE INDEX IF NOT EXISTS `message_attr_thread_id_idx` ON `message_attr` (
	`thread_id`
);
CREATE INDEX IF NOT EXISTS `message_attr_sent_date_idx` ON `message_attr` (
	`sent_date`
);
CREATE INDEX IF NOT EXISTS `message_attr_sender_id_idx` ON `message_attr` (
	`sender_id`
);
CREATE INDEX IF NOT EXISTS `message_attr_is_reshare_idx` ON `message_attr` (
	`is_reshare`
);
CREATE INDEX IF NOT EXISTS `message_attr_id_idx` ON `message_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `message_attr_date_updated_idx` ON `message_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `message_attr_date_created_idx` ON `message_attr` (
	`date_created`
);
CREATE INDEX IF NOT EXISTS `message_attr_body_idx` ON `message_attr` (
	`body`
);
CREATE INDEX IF NOT EXISTS `message_attr_attachments_count_idx` ON `message_attr` (
	`attachments_count`
);
CREATE INDEX IF NOT EXISTS `items_type_idx` ON `items` (
	`type`
);
CREATE INDEX IF NOT EXISTS `items_csn_idx` ON `items` (
	`csn`
);
CREATE INDEX IF NOT EXISTS `identity_attr_user_id_idx` ON `identity_attr` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `identity_attr_same_business_idx` ON `identity_attr` (
	`same_business`
);
CREATE INDEX IF NOT EXISTS `identity_attr_id_idx` ON `identity_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `identity_attr_deactivated_idx` ON `identity_attr` (
	`deactivated`
);
CREATE INDEX IF NOT EXISTS `identity_attr_contact_type_idx` ON `identity_attr` (
	`contact_type`
);
CREATE INDEX IF NOT EXISTS `identity_attr_contact_photo_url_idx` ON `identity_attr` (
	`contact_photo_url`
);
CREATE INDEX IF NOT EXISTS `identity_attr_contact_photo_last_updated_idx` ON `identity_attr` (
	`contact_photo_last_updated`
);
CREATE INDEX IF NOT EXISTS `identity_attr_contact_name_idx` ON `identity_attr` (
	`contact_name`
);
CREATE INDEX IF NOT EXISTS `identity_attr_contact_id_idx` ON `identity_attr` (
	`contact_id`
);
CREATE INDEX IF NOT EXISTS `identity_attr_blocked_idx` ON `identity_attr` (
	`blocked`
);
CREATE INDEX IF NOT EXISTS `fts_aux_uid_idx` ON `fts_aux` (
	`uid`
);
CREATE INDEX IF NOT EXISTS `extUser_attr_source_idx` ON `extUser_attr` (
	`source`
);
CREATE INDEX IF NOT EXISTS `extUser_attr_source_data_idx` ON `extUser_attr` (
	`source_data`
);
CREATE INDEX IF NOT EXISTS `extUser_attr_name_idx` ON `extUser_attr` (
	`name`
);
CREATE INDEX IF NOT EXISTS `extUser_attr_id_idx` ON `extUser_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `extUser_attr_comment_idx` ON `extUser_attr` (
	`comment`
);
CREATE INDEX IF NOT EXISTS `expunged_items_type_idx` ON `expunged_items` (
	`type`
);
CREATE INDEX IF NOT EXISTS `expunged_items_csn_idx` ON `expunged_items` (
	`csn`
);
CREATE INDEX IF NOT EXISTS `contact_attr_type_idx` ON `contact_attr` (
	`type`
);
CREATE INDEX IF NOT EXISTS `contact_attr_photo_url_idx` ON `contact_attr` (
	`photo_url`
);
CREATE INDEX IF NOT EXISTS `contact_attr_photo_last_updated_idx` ON `contact_attr` (
	`photo_last_updated`
);
CREATE INDEX IF NOT EXISTS `contact_attr_name_idx` ON `contact_attr` (
	`name`
);
CREATE INDEX IF NOT EXISTS `contact_attr_id_idx` ON `contact_attr` (
	`id`
);
CREATE INDEX IF NOT EXISTS `attrs_uid_idx` ON `attrs` (
	`uid`
);
CREATE INDEX IF NOT EXISTS `attrs_csn_idx` ON `attrs` (
	`csn`
);
CREATE INDEX IF NOT EXISTS `attrs_aid_idx` ON `attrs` (
	`aid`
);
CREATE INDEX IF NOT EXISTS `attrs_afl_idx` ON `attrs` (
	`afl`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_user_id_idx` ON `attachment_attr` (
	`user_id`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_type_idx` ON `attachment_attr` (
	`type`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_title_idx` ON `attachment_attr` (
	`title`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_snippet_idx` ON `attachment_attr` (
	`snippet`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_shard_id_idx` ON `attachment_attr` (
	`shard_id`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_message_uid_idx` ON `attachment_attr` (
	`message_uid`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_item_uid_idx` ON `attachment_attr` (
	`item_uid`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_item_guid_idx` ON `attachment_attr` (
	`item_guid`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_dont_sync_idx` ON `attachment_attr` (
	`dont_sync`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_date_updated_idx` ON `attachment_attr` (
	`date_updated`
);
CREATE INDEX IF NOT EXISTS `attachment_attr_date_created_idx` ON `attachment_attr` (
	`date_created`
);
COMMIT;
