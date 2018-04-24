 SELECT host.name           AS host, 
       volume_type.host_id AS host_entity_id, 
       CASE volume_type.TYPE 
         WHEN 'parallelScsi' THEN CAST(volume_type.host_id AS VARCHAR(255)) + 
                                  '-' + 
                                  volume_type.uuid 
         WHEN 'block' THEN CAST(volume_type.host_id AS VARCHAR(255)) + '-' + 
                           volume_type.uuid 
         ELSE volume_type.uuid 
       END                 AS scsi_volume_entity_id 
FROM   vpx_entity host, 
       (SELECT DISTINCT vpx_psa_path.host_id AS host_id, 
                        scsi_lun.uuid        AS uuid, 
                        CASE host_bus_adapter.vpx_type 
                          WHEN N'vim.host.ParallelScsiHba' THEN 'parallelScsi' 
                          WHEN N'vim.host.FibreChannelHba' THEN 'fc' 
                          WHEN N'vim.host.InternetScsiHba' THEN 'iscsi' 
                          ELSE 'block' 
                        END                  AS TYPE 
        FROM   vpx_psa_path, 
               (SELECT vpx_scsi_lun.uuid      AS uuid, 
                       vpx_scsi_lun.host_id   AS host_id, 
                       vpx_psa_device.key_val AS key_val 
                FROM   vpx_psa_device, 
                       vpx_scsi_lun 
                WHERE  vpx_psa_device.scsi_lun_id = vpx_scsi_lun.id) scsi_lun, 
               (SELECT vpx_host_bus_adapter.vpx_type AS vpx_type, 
                       vpx_psa_adapter.key_val       AS key_val, 
                       vpx_psa_adapter.host_id       AS host_id 
                FROM   vpx_psa_adapter, 
                       vpx_host_bus_adapter 
                WHERE  vpx_psa_adapter.host_id = vpx_host_bus_adapter.host_id 
                       AND vpx_psa_adapter.link_key = 
                           vpx_host_bus_adapter.key_val) 
               host_bus_adapter 
        WHERE  vpx_psa_path.lun_link_key = scsi_lun.key_val 
               AND vpx_psa_path.host_id = scsi_lun.host_id 
               AND vpx_psa_path.adapter_link_key = host_bus_adapter.key_val 
               AND vpx_psa_path.host_id = host_bus_adapter.host_id) volume_type 
WHERE  host.type_id = '1' 
       AND host.id = volume_type.host_id  
       
       
-- update the statistics of the six tables:

UPDATE STATISTICS VPX_ENTITY
    WITH FULLSCAN, NORECOMPUTE;

UPDATE STATISTICS VPX_HOST_BUS_ADAPTER
    WITH FULLSCAN, NORECOMPUTE;

UPDATE STATISTICS VPX_PSA_ADAPTER
    WITH FULLSCAN, NORECOMPUTE;

UPDATE STATISTICS VPX_PSA_DEVICE
    WITH FULLSCAN, NORECOMPUTE;

UPDATE STATISTICS VPX_PSA_PATH
    WITH FULLSCAN, NORECOMPUTE;

UPDATE STATISTICS VPX_SCSI_LUN
    WITH FULLSCAN, NORECOMPUTE;
    
     
------------------------------------------  

/****** Object:  Index [PK_VPX_ENTITY]    Script Date: 07/20/2011 14:33:53 ******/
ALTER TABLE [dbo].[VPX_ENTITY] ADD  CONSTRAINT [PK_VPX_ENTITY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]

/****** Object:  Index [PK_VPX_HOST_BUS_ADAPTER]    Script Date: 07/20/2011 14:35:22 ******/
ALTER TABLE [dbo].[VPX_HOST_BUS_ADAPTER] ADD  CONSTRAINT [PK_VPX_HOST_BUS_ADAPTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

/****** Object:  Index [PK_PSA_ADAPTER]    Script Date: 07/20/2011 14:36:27 ******/
ALTER TABLE [dbo].[VPX_PSA_ADAPTER] ADD  CONSTRAINT [PK_PSA_ADAPTER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


USE [VMCenterdb]
GO
/****** Object:  Index [PK_PSA_DEVICE]    Script Date: 07/20/2011 14:37:18 ******/
ALTER TABLE [dbo].[VPX_PSA_DEVICE] ADD  CONSTRAINT [PK_PSA_DEVICE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


USE [VMCenterdb]
GO
/****** Object:  Index [PK_PSA_PATH]    Script Date: 07/20/2011 14:38:07 ******/
ALTER TABLE [dbo].[VPX_PSA_PATH] ADD  CONSTRAINT [PK_PSA_PATH] PRIMARY KEY CLUSTERED 
(
	[PATH_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]


USE [VMCenterdb]
GO
/****** Object:  Index [PK_VPX_SCSI_LUN]    Script Date: 07/20/2011 14:39:02 ******/
ALTER TABLE [dbo].[VPX_SCSI_LUN] ADD  CONSTRAINT [PK_VPX_SCSI_LUN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]