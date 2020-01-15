-- Enabling the replication database
use master
exec sp_replicationdboption @dbname = N'GoodFoodMaster', @optname = N'publish', @value = N'true'
GO

exec [GoodFoodMaster].sys.sp_addlogreader_agent @job_login = null, @job_password = null, @publisher_security_mode = 1
GO
-- Adding the transactional publication
use [GoodFoodMaster]
exec sp_addpublication @publication = N'Publication1', @description = N'Transactional publication of database ''GoodFoodMaster'' from Publisher ''DESKTOP-JIDDNB4\NODE0''.', @sync_method = N'concurrent', @retention = 0, @allow_push = N'true', @allow_pull = N'true', @allow_anonymous = N'true', @enabled_for_internet = N'false', @snapshot_in_defaultfolder = N'true', @compress_snapshot = N'false', @ftp_port = 21, @ftp_login = N'anonymous', @allow_subscription_copy = N'false', @add_to_active_directory = N'false', @repl_freq = N'continuous', @status = N'active', @independent_agent = N'true', @immediate_sync = N'true', @allow_sync_tran = N'false', @autogen_sync_procs = N'false', @allow_queued_tran = N'false', @allow_dts = N'false', @replicate_ddl = 1, @allow_initialize_from_backup = N'false', @enabled_for_p2p = N'false', @enabled_for_het_sub = N'false'
GO


exec sp_addpublication_snapshot @publication = N'Publication1', @frequency_type = 1, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @job_login = null, @job_password = null, @publisher_security_mode = 1
exec sp_grant_publication_access @publication = N'Publication1', @login = N'sa'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'DESKTOP-JIDDNB4\repl_snapshot'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'DESKTOP-JIDDNB4\repl_logreader'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'DESKTOP-JIDDNB4\repl_distribution'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'DESKTOP-JIDDNB4\repl_merge'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'DESKTOP-JIDDNB4\kolak'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'NT SERVICE\SQLAgent$NODE0'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'NT SERVICE\Winmgmt'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'NT SERVICE\SQLWriter'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'NT Service\MSSQL$NODE0'
GO
exec sp_grant_publication_access @publication = N'Publication1', @login = N'distributor_admin'
GO

-- Adding the transactional articles
use [GoodFoodMaster]
exec sp_addarticle @publication = N'Publication1', @article = N'Discount', @source_owner = N'dbo', @source_object = N'Discount', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Discount', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboDiscount]', @del_cmd = N'CALL [sp_MSdel_dboDiscount]', @upd_cmd = N'SCALL [sp_MSupd_dboDiscount]'
GO
use [GoodFoodMaster]
exec sp_addarticle @publication = N'Publication1', @article = N'Dish', @source_owner = N'dbo', @source_object = N'Dish', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Dish', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboDish]', @del_cmd = N'CALL [sp_MSdel_dboDish]', @upd_cmd = N'SCALL [sp_MSupd_dboDish]'
GO
use [GoodFoodMaster]
exec sp_addarticle @publication = N'Publication1', @article = N'Location', @source_owner = N'dbo', @source_object = N'Location', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Location', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboLocation]', @del_cmd = N'CALL [sp_MSdel_dboLocation]', @upd_cmd = N'SCALL [sp_MSupd_dboLocation]'
GO
use [GoodFoodMaster]
exec sp_addarticle @publication = N'Publication1', @article = N'Menu', @source_owner = N'dbo', @source_object = N'Menu', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Menu', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboMenu]', @del_cmd = N'CALL [sp_MSdel_dboMenu]', @upd_cmd = N'SCALL [sp_MSupd_dboMenu]'
GO
use [GoodFoodMaster]
exec sp_addarticle @publication = N'Publication1', @article = N'Restaurant', @source_owner = N'dbo', @source_object = N'Restaurant', @type = N'logbased', @description = N'', @creation_script = N'', @pre_creation_cmd = N'drop', @schema_option = 0x000000000803509F, @identityrangemanagementoption = N'manual', @destination_table = N'Restaurant', @destination_owner = N'dbo', @status = 24, @vertical_partition = N'false', @ins_cmd = N'CALL [sp_MSins_dboRestaurant]', @del_cmd = N'CALL [sp_MSdel_dboRestaurant]', @upd_cmd = N'SCALL [sp_MSupd_dboRestaurant]'
GO

-- Adding the transactional subscriptions
use [GoodFoodMaster]
exec sp_addsubscription @publication = N'Publication1', @subscriber = N'DESKTOP-JIDDNB4\NODE1', @destination_db = N'GoodFoodSub1', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'Publication1', @subscriber = N'DESKTOP-JIDDNB4\NODE1', @subscriber_db = N'GoodFoodSub1', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO
use [GoodFoodMaster]
exec sp_addsubscription @publication = N'Publication1', @subscriber = N'DESKTOP-JIDDNB4\NODE2', @destination_db = N'GoodFoodSub2', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'Publication1', @subscriber = N'DESKTOP-JIDDNB4\NODE2', @subscriber_db = N'GoodFoodSub2', @job_login = null, @job_password = null, @subscriber_security_mode = 1, @frequency_type = 64, @frequency_interval = 1, @frequency_relative_interval = 1, @frequency_recurrence_factor = 0, @frequency_subday = 4, @frequency_subday_interval = 5, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 0, @active_end_date = 0, @dts_package_location = N'Distributor'
GO

