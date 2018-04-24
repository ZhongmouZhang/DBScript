 IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueue_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueue_SourceSystem] FOREIGN KEY([UserSourceSystemID])
REFERENCES [SourceSystem] ([SourceSystemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueData_WorkQueueStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueData_WorkQueueStatus] FOREIGN KEY([WorkQueueStatusID])
REFERENCES [WorkQueueStatus] ([WorkQueueStatusID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueData_WorkQueueType]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueue]'))
ALTER TABLE [dbo].[WorkQueue]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueData_WorkQueueType] FOREIGN KEY([WorkQueueTypeID])
REFERENCES [WorkQueueType] ([WorkQueueTypeID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ActionAudit_UserAction]') AND parent_object_id = OBJECT_ID(N'[dbo].[ActionAudit]'))
ALTER TABLE [dbo].[ActionAudit]  WITH CHECK ADD  CONSTRAINT [FK_ActionAudit_UserAction] FOREIGN KEY([UserActionID])
REFERENCES [UserAction] ([UserActionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RecordAudit_ActionAudit]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecordAudit]'))
ALTER TABLE [dbo].[RecordAudit]  WITH CHECK ADD  CONSTRAINT [FK_RecordAudit_ActionAudit] FOREIGN KEY([ActionAuditID])
REFERENCES [ActionAudit] ([ActionAuditID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RecordAudit_RecordAction]') AND parent_object_id = OBJECT_ID(N'[dbo].[RecordAudit]'))
ALTER TABLE [dbo].[RecordAudit]  WITH CHECK ADD  CONSTRAINT [FK_RecordAudit_RecordAction] FOREIGN KEY([RecordActionID])
REFERENCES [RecordAction] ([RecordActionID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueSourceClient_SourceClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueSourceClient]'))
ALTER TABLE [dbo].[WorkQueueSourceClient]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueSourceClient_SourceClient] FOREIGN KEY([SourceClientID])
REFERENCES [SourceClient] ([SourceClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueSourceClient_WorkQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueSourceClient]'))
ALTER TABLE [dbo].[WorkQueueSourceClient]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueSourceClient_WorkQueue] FOREIGN KEY([WorkQueueID])
REFERENCES [WorkQueue] ([WorkQueueID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClientLinkID_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClientLink]'))
ALTER TABLE [dbo].[SourceClientLink]  WITH CHECK ADD  CONSTRAINT [FK_SourceClientLinkID_CompositeClientLink] FOREIGN KEY([CompositeClientLinkID])
REFERENCES [CompositeClientLink] ([CompositeClientLinkID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClientLinkID_SourceClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClientLink]'))
ALTER TABLE [dbo].[SourceClientLink]  WITH CHECK ADD  CONSTRAINT [FK_SourceClientLinkID_SourceClient] FOREIGN KEY([SourceClientID])
REFERENCES [SourceClient] ([SourceClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientHistory_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientHistory]'))
ALTER TABLE [dbo].[CompositeClientHistory]  WITH CHECK ADD  CONSTRAINT [FK_CompositeClientHistory_ClientCategory] FOREIGN KEY([ClientCategoryID])
REFERENCES [ClientCategory] ([ClientCategoryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientHistory_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientHistory]'))
ALTER TABLE [dbo].[CompositeClientHistory]  WITH CHECK ADD  CONSTRAINT [FK_CompositeClientHistory_CompositeClient] FOREIGN KEY([CompositeClientID])
REFERENCES [CompositeClient] ([CompositeClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientHistory_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientHistory]'))
ALTER TABLE [dbo].[CompositeClientHistory]  WITH CHECK ADD  CONSTRAINT [FK_CompositeClientHistory_SourceSystem] FOREIGN KEY([SourceSystemID])
REFERENCES [SourceSystem] ([SourceSystemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_OriginalCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLink]'))
ALTER TABLE [dbo].[CompositeClientLink]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCompositeClientID_CompositeClient] FOREIGN KEY([OriginalCompositeClientID])
REFERENCES [CompositeClient] ([CompositeClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TranslatedCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLink]'))
ALTER TABLE [dbo].[CompositeClientLink]  WITH CHECK ADD  CONSTRAINT [FK_TranslatedCompositeClientID_CompositeClient] FOREIGN KEY([TranslatedCompositeClientID])
REFERENCES [CompositeClient] ([CompositeClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClientLinkID_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLinkHistory]'))
ALTER TABLE [dbo].[CompositeClientLinkHistory]  WITH CHECK ADD  CONSTRAINT [FK_CompositeClientLinkID_CompositeClientLink] FOREIGN KEY([CompositeClientLinkID])
REFERENCES [CompositeClientLink] ([CompositeClientLinkID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryOriginalCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLinkHistory]'))
ALTER TABLE [dbo].[CompositeClientLinkHistory]  WITH CHECK ADD  CONSTRAINT [FK_HistoryOriginalCompositeClientID_CompositeClient] FOREIGN KEY([OriginalCompositeClientID])
REFERENCES [CompositeClient] ([CompositeClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistoryTranslatedCompositeClientID_CompositeClient]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClientLinkHistory]'))
ALTER TABLE [dbo].[CompositeClientLinkHistory]  WITH CHECK ADD  CONSTRAINT [FK_HistoryTranslatedCompositeClientID_CompositeClient] FOREIGN KEY([TranslatedCompositeClientID])
REFERENCES [CompositeClient] ([CompositeClientID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueCompositeClient_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueCompositeClient]'))
ALTER TABLE [dbo].[WorkQueueCompositeClient]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueCompositeClient_CompositeClientLink] FOREIGN KEY([CompositeClientLinkID])
REFERENCES [CompositeClientLink] ([CompositeClientLinkID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueCompositeClient_WorkQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueCompositeClient]'))
ALTER TABLE [dbo].[WorkQueueCompositeClient]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueCompositeClient_WorkQueue] FOREIGN KEY([WorkQueueID])
REFERENCES [WorkQueue] ([WorkQueueID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SSISPatientSearchResult_CompositeClientLink]') AND parent_object_id = OBJECT_ID(N'[dbo].[SSISPatientSearchResult]'))
ALTER TABLE [dbo].[SSISPatientSearchResult]  WITH CHECK ADD  CONSTRAINT [FK_SSISPatientSearchResult_CompositeClientLink] FOREIGN KEY([CompositeClientLinkID])
REFERENCES [CompositeClientLink] ([CompositeClientLinkID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SSISPatientSearchResult_SSISPatientSearch]') AND parent_object_id = OBJECT_ID(N'[dbo].[SSISPatientSearchResult]'))
ALTER TABLE [dbo].[SSISPatientSearchResult]  WITH CHECK ADD  CONSTRAINT [FK_SSISPatientSearchResult_SSISPatientSearch] FOREIGN KEY([SSISPatientSearchID])
REFERENCES [SSISPatientSearch] ([SSISPatientSearchID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueMessage_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueMessage]'))
ALTER TABLE [dbo].[WorkQueueMessage]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueMessage_ClientCategory] FOREIGN KEY([ClientCategoryID])
REFERENCES [ClientCategory] ([ClientCategoryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueMessage_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueMessage]'))
ALTER TABLE [dbo].[WorkQueueMessage]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueMessage_SourceSystem] FOREIGN KEY([SourceSystemID])
REFERENCES [SourceSystem] ([SourceSystemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_WorkQueueMessage_WorkQueue]') AND parent_object_id = OBJECT_ID(N'[dbo].[WorkQueueMessage]'))
ALTER TABLE [dbo].[WorkQueueMessage]  WITH CHECK ADD  CONSTRAINT [FK_WorkQueueMessage_WorkQueue] FOREIGN KEY([WorkQueueID])
REFERENCES [WorkQueue] ([WorkQueueID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClient_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClient]'))
ALTER TABLE [dbo].[CompositeClient]  WITH CHECK ADD  CONSTRAINT [FK_CompositeClient_ClientCategory] FOREIGN KEY([ClientCategoryID])
REFERENCES [ClientCategory] ([ClientCategoryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CompositeClient_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[CompositeClient]'))
ALTER TABLE [dbo].[CompositeClient]  WITH CHECK ADD  CONSTRAINT [FK_CompositeClient_SourceSystem] FOREIGN KEY([SourceSystemID])
REFERENCES [SourceSystem] ([SourceSystemID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClient_ClientCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClient]'))
ALTER TABLE [dbo].[SourceClient]  WITH CHECK ADD  CONSTRAINT [FK_SourceClient_ClientCategory] FOREIGN KEY([ClientCategoryID])
REFERENCES [ClientCategory] ([ClientCategoryID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SourceClient_SourceSystem]') AND parent_object_id = OBJECT_ID(N'[dbo].[SourceClient]'))
ALTER TABLE [dbo].[SourceClient]  WITH CHECK ADD  CONSTRAINT [FK_SourceClient_SourceSystem] FOREIGN KEY([SourceSystemID])
REFERENCES [SourceSystem] ([SourceSystemID])
