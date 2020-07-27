create sequence ATTACHMENT_ID_SEQ start 1 increment 1;
create sequence AUDIT_ID_SEQ start 1 increment 1;
create sequence BAM_TASK_ID_SEQ start 1 increment 50;
create sequence BOOLEANEXPR_ID_SEQ start 1 increment 1;
create sequence CASE_FILE_DATA_LOG_ID_SEQ start 1 increment 1;
create sequence CASE_ID_INFO_ID_SEQ start 1 increment 50;
create sequence CASE_ROLE_ASSIGN_LOG_ID_SEQ start 1 increment 1;
create sequence COMMENT_ID_SEQ start 1 increment 1;
create sequence CONTENT_ID_SEQ start 1 increment 1;
create sequence CONTEXT_MAPPING_INFO_ID_SEQ start 1 increment 50;
create sequence CORRELATION_KEY_ID_SEQ start 1 increment 50;
create sequence CORRELATION_PROP_ID_SEQ start 1 increment 50;
create sequence DEADLINE_ID_SEQ start 1 increment 1;
create sequence DEPLOY_STORE_ID_SEQ start 1 increment 1;
create sequence EMAILNOTIFHEAD_ID_SEQ start 1 increment 1;
create sequence ERROR_INFO_ID_SEQ start 1 increment 50;
create sequence ESCALATION_ID_SEQ start 1 increment 1;
create sequence EXEC_ERROR_INFO_ID_SEQ start 1 increment 1;
create sequence I18NTEXT_ID_SEQ start 1 increment 1;
create sequence NODE_INST_LOG_ID_SEQ start 1 increment 1;
create sequence NOTIFICATION_ID_SEQ start 1 increment 1;
create sequence PROC_INST_LOG_ID_SEQ start 1 increment 1;
create sequence PROCESS_INSTANCE_INFO_ID_SEQ start 1 increment 50;
create sequence QUERY_DEF_ID_SEQ start 1 increment 1;
create sequence REASSIGNMENT_ID_SEQ start 1 increment 1;
create sequence REQUEST_INFO_ID_SEQ start 1 increment 50;
create sequence SESSIONINFO_ID_SEQ start 1 increment 50;
create sequence TASK_DEF_ID_SEQ start 1 increment 50;
create sequence TASK_EVENT_ID_SEQ start 1 increment 50;
create sequence TASK_ID_SEQ start 1 increment 1;
create sequence TASK_VAR_ID_SEQ start 1 increment 1;
create sequence VAR_INST_LOG_ID_SEQ start 1 increment 1;
create sequence WORKITEMINFO_ID_SEQ start 1 increment 50;
create table Attachment (id int8 not null, accessType int4, attachedAt timestamp, attachmentContentId int8 not null, contentType varchar(255), name varchar(255), attachment_size int4, attachedBy_id varchar(255), TaskData_Attachments_Id int8, primary key (id));
create table AuditTaskImpl (id int8 not null, activationTime timestamp, actualOwner varchar(255), createdBy varchar(255), createdOn timestamp, deploymentId varchar(255), description varchar(255), dueDate timestamp, lastModificationDate timestamp, name varchar(255), parentId int8 not null, priority int4 not null, processId varchar(255), processInstanceId int8 not null, processSessionId int8 not null, status varchar(255), taskId int8, workItemId int8, primary key (id));
create table BAMTaskSummary (pk int8 not null, createdDate timestamp, duration int8, endDate timestamp, processInstanceId int8 not null, startDate timestamp, status varchar(255), taskId int8 not null, taskName varchar(255), userId varchar(255), OPTLOCK int4, primary key (pk));
create table BooleanExpression (id int8 not null, expression text, type varchar(255), Escalation_Constraints_Id int8, primary key (id));
create table CaseFileDataLog (id int8 not null, caseDefId varchar(255), caseId varchar(255), itemName varchar(255), itemType varchar(255), itemValue varchar(255), lastModified timestamp, lastModifiedBy varchar(255), primary key (id));
create table CaseIdInfo (id int8 not null, caseIdPrefix varchar(255), currentValue int8, primary key (id));
create table CaseRoleAssignmentLog (id int8 not null, caseId varchar(255), entityId varchar(255), processInstanceId int8 not null, roleName varchar(255), type int4 not null, primary key (id));
create table Content (id int8 not null, content oid, primary key (id));
create table ContextMappingInfo (mappingId int8 not null, CONTEXT_ID varchar(255) not null, KSESSION_ID int8 not null, OWNER_ID varchar(255), OPTLOCK int4, primary key (mappingId));
create table CorrelationKeyInfo (keyId int8 not null, name varchar(255), processInstanceId int8 not null, OPTLOCK int4, primary key (keyId));
create table CorrelationPropertyInfo (propertyId int8 not null, name varchar(255), value varchar(255), OPTLOCK int4, correlationKey_keyId int8, primary key (propertyId));
create table Deadline (id int8 not null, deadline_date timestamp, escalated int2, Deadlines_StartDeadLine_Id int8, Deadlines_EndDeadLine_Id int8, primary key (id));
create table Delegation_delegates (task_id int8 not null, entity_id varchar(255) not null);
create table DeploymentStore (id int8 not null, attributes varchar(255), DEPLOYMENT_ID varchar(255), deploymentUnit text, state int4, updateDate timestamp, primary key (id));
create table email_header (id int8 not null, body text, fromAddress varchar(255), language varchar(255), replyToAddress varchar(255), subject varchar(255), primary key (id));
create table ErrorInfo (id int8 not null, message varchar(255), stacktrace varchar(5000), timestamp timestamp, REQUEST_ID int8 not null, primary key (id));
create table Escalation (id int8 not null, name varchar(255), Deadline_Escalation_Id int8, primary key (id));
create table EventTypes (InstanceId int8 not null, element varchar(255));
create table ExecutionErrorInfo (id int8 not null, ERROR_ACK int2, ERROR_ACK_AT timestamp, ERROR_ACK_BY varchar(255), ACTIVITY_ID int8, ACTIVITY_NAME varchar(255), DEPLOYMENT_ID varchar(255), ERROR_INFO text, ERROR_DATE timestamp, ERROR_ID varchar(255), ERROR_MSG varchar(255), INIT_ACTIVITY_ID int8, JOB_ID int8, PROCESS_ID varchar(255), PROCESS_INST_ID int8, ERROR_TYPE varchar(255), primary key (id));
create table I18NText (id int8 not null, language varchar(255), shortText varchar(255), text text, Task_Subjects_Id int8, Task_Names_Id int8, Task_Descriptions_Id int8, Reassignment_Documentation_Id int8, Notification_Subjects_Id int8, Notification_Names_Id int8, Notification_Documentation_Id int8, Notification_Descriptions_Id int8, Deadline_Documentation_Id int8, primary key (id));
create table NodeInstanceLog (id int8 not null, connection varchar(255), log_date timestamp, externalId varchar(255), nodeContainerId varchar(255), nodeId varchar(255), nodeInstanceId varchar(255), nodeName varchar(255), nodeType varchar(255), processId varchar(255), processInstanceId int8 not null, referenceId int8, slaCompliance int4, sla_due_date timestamp, type int4 not null, workItemId int8, primary key (id));
create table Notification (DTYPE varchar(31) not null, id int8 not null, priority int4 not null, Escalation_Notifications_Id int8, primary key (id));
create table Notification_BAs (task_id int8 not null, entity_id varchar(255) not null);
create table Notification_email_header (Notification_id int8 not null, emailHeaders_id int8 not null, mapkey varchar(255) not null, primary key (Notification_id, mapkey));
create table Notification_Recipients (task_id int8 not null, entity_id varchar(255) not null);
create table OrganizationalEntity (DTYPE varchar(31) not null, id varchar(255) not null, primary key (id));
create table PeopleAssignments_BAs (task_id int8 not null, entity_id varchar(255) not null);
create table PeopleAssignments_ExclOwners (task_id int8 not null, entity_id varchar(255) not null);
create table PeopleAssignments_PotOwners (task_id int8 not null, entity_id varchar(255) not null);
create table PeopleAssignments_Recipients (task_id int8 not null, entity_id varchar(255) not null);
create table PeopleAssignments_Stakeholders (task_id int8 not null, entity_id varchar(255) not null);
create table ProcessInstanceInfo (InstanceId int8 not null, lastModificationDate timestamp, lastReadDate timestamp, processId varchar(255), processInstanceByteArray oid, startDate timestamp, state int4 not null, OPTLOCK int4, primary key (InstanceId));
create table ProcessInstanceLog (id int8 not null, correlationKey varchar(255), duration int8, end_date timestamp, externalId varchar(255), user_identity varchar(255), outcome varchar(255), parentProcessInstanceId int8, processId varchar(255), processInstanceDescription varchar(255), processInstanceId int8 not null, processName varchar(255), processType int4, processVersion varchar(255), slaCompliance int4, sla_due_date timestamp, start_date timestamp, status int4, primary key (id));
create table QueryDefinitionStore (id int8 not null, qExpression text, qName varchar(255), qSource varchar(255), qTarget varchar(255), primary key (id));
create table Reassignment (id int8 not null, Escalation_Reassignments_Id int8, primary key (id));
create table Reassignment_potentialOwners (task_id int8 not null, entity_id varchar(255) not null);
create table RequestInfo (id int8 not null, commandName varchar(255), deploymentId varchar(255), executions int4 not null, businessKey varchar(255), message varchar(255), owner varchar(255), priority int4 not null, processInstanceId int8, requestData oid, responseData oid, retries int4 not null, status varchar(255), timestamp timestamp, primary key (id));
create table SessionInfo (id int8 not null, lastModificationDate timestamp, rulesByteArray oid, startDate timestamp, OPTLOCK int4, primary key (id));
create table Task (id int8 not null, archived int2, allowedToDelegate varchar(255), description varchar(255), formName varchar(255), name varchar(255), priority int4 not null, subTaskStrategy varchar(255), subject varchar(255), activationTime timestamp, createdOn timestamp, deploymentId varchar(255), documentAccessType int4, documentContentId int8 not null, documentType varchar(255), expirationTime timestamp, faultAccessType int4, faultContentId int8 not null, faultName varchar(255), faultType varchar(255), outputAccessType int4, outputContentId int8 not null, outputType varchar(255), parentId int8 not null, previousStatus int4, processId varchar(255), processInstanceId int8 not null, processSessionId int8 not null, skipable boolean not null, status varchar(255), workItemId int8 not null, taskType varchar(255), OPTLOCK int4, taskInitiator_id varchar(255), actualOwner_id varchar(255), createdBy_id varchar(255), primary key (id));
create table task_comment (id int8 not null, addedAt timestamp, text text, addedBy_id varchar(255), TaskData_Comments_Id int8, primary key (id));
create table TaskDef (id int8 not null, name varchar(255), priority int4 not null, primary key (id));
create table TaskEvent (id int8 not null, logTime timestamp, message varchar(255), processInstanceId int8, taskId int8, type varchar(255), userId varchar(255), OPTLOCK int4, workItemId int8, correlationKey varchar(255), processType int4, primary key (id));
create table TaskVariableImpl (id int8 not null, modificationDate timestamp, name varchar(255), processId varchar(255), processInstanceId int8, taskId int8, type int4, value varchar(4000), primary key (id));
create table VariableInstanceLog (id int8 not null, log_date timestamp, externalId varchar(255), oldValue varchar(255), processId varchar(255), processInstanceId int8 not null, value varchar(255), variableId varchar(255), variableInstanceId varchar(255), primary key (id));
create table WorkItemInfo (workItemId int8 not null, creationDate timestamp, name varchar(255), processInstanceId int8 not null, state int8 not null, OPTLOCK int4, workItemByteArray oid, primary key (workItemId));
create index IDX_Attachment_Id on Attachment (attachedBy_id);
create index IDX_Attachment_DataId on Attachment (TaskData_Attachments_Id);
create index IDX_AuditTaskImpl_taskId on AuditTaskImpl (taskId);
create index IDX_AuditTaskImpl_pInstId on AuditTaskImpl (processInstanceId);
create index IDX_AuditTaskImpl_workItemId on AuditTaskImpl (workItemId);
create index IDX_AuditTaskImpl_name on AuditTaskImpl (name);
create index IDX_AuditTaskImpl_processId on AuditTaskImpl (processId);
create index IDX_AuditTaskImpl_status on AuditTaskImpl (status);
create index IDX_BAMTaskSumm_createdDate on BAMTaskSummary (createdDate);
create index IDX_BAMTaskSumm_duration on BAMTaskSummary (duration);
create index IDX_BAMTaskSumm_endDate on BAMTaskSummary (endDate);
create index IDX_BAMTaskSumm_pInstId on BAMTaskSummary (processInstanceId);
create index IDX_BAMTaskSumm_startDate on BAMTaskSummary (startDate);
create index IDX_BAMTaskSumm_status on BAMTaskSummary (status);
create index IDX_BAMTaskSumm_taskId on BAMTaskSummary (taskId);
create index IDX_BAMTaskSumm_taskName on BAMTaskSummary (taskName);
create index IDX_BAMTaskSumm_userId on BAMTaskSummary (userId);
create index IDX_BoolExpr_Id on BooleanExpression (Escalation_Constraints_Id);
alter table CaseIdInfo add constraint UKftvt225gyxpjnl3d06alqkqyj unique (caseIdPrefix);
create index IDX_CMI_Context on ContextMappingInfo (CONTEXT_ID);
create index IDX_CMI_KSession on ContextMappingInfo (KSESSION_ID);
create index IDX_CMI_Owner on ContextMappingInfo (OWNER_ID);
alter table CorrelationKeyInfo add constraint IDX_CorrelationKeyInfo_name unique (name);
create index IDX_CorrPropInfo_Id on CorrelationPropertyInfo (correlationKey_keyId);
create index IDX_Deadline_StartId on Deadline (Deadlines_StartDeadLine_Id);
create index IDX_Deadline_EndId on Deadline (Deadlines_EndDeadLine_Id);
create index IDX_Delegation_EntityId on Delegation_delegates (entity_id);
create index IDX_Delegation_TaskId on Delegation_delegates (task_id);
alter table DeploymentStore add constraint UK85rgskt09thd8mkkfl3tb0y81 unique (DEPLOYMENT_ID);
create index IDX_ErrorInfo_Id on ErrorInfo (REQUEST_ID);
create index IDX_Escalation_Id on Escalation (Deadline_Escalation_Id);
create index IDX_EventTypes_Id on EventTypes (InstanceId);
create index IDX_EventTypes_element on EventTypes (element);
create index IDX_ErrorInfo_pInstId on ExecutionErrorInfo (PROCESS_INST_ID);
create index IDX_ErrorInfo_errorAck on ExecutionErrorInfo (ERROR_ACK);
create index IDX_I18NText_SubjId on I18NText (Task_Subjects_Id);
create index IDX_I18NText_NameId on I18NText (Task_Names_Id);
create index IDX_I18NText_DescrId on I18NText (Task_Descriptions_Id);
create index IDX_I18NText_ReassignId on I18NText (Reassignment_Documentation_Id);
create index IDX_I18NText_NotSubjId on I18NText (Notification_Subjects_Id);
create index IDX_I18NText_NotNamId on I18NText (Notification_Names_Id);
create index IDX_I18NText_NotDocId on I18NText (Notification_Documentation_Id);
create index IDX_I18NText_NotDescrId on I18NText (Notification_Descriptions_Id);
create index IDX_I18NText_DeadDocId on I18NText (Deadline_Documentation_Id);
create index IDX_NInstLog_pInstId on NodeInstanceLog (processInstanceId);
create index IDX_NInstLog_nodeType on NodeInstanceLog (nodeType);
create index IDX_NInstLog_pId on NodeInstanceLog (processId);
create index IDX_Not_EscId on Notification (Escalation_Notifications_Id);
create index IDX_NotBAs_Entity on Notification_BAs (entity_id);
create index IDX_NotBAs_Task on Notification_BAs (task_id);
alter table Notification_email_header add constraint UK_ptaka5kost68h7l3wflv7w6y8 unique (emailHeaders_id);
create index IDX_NotRec_Entity on Notification_Recipients (entity_id);
create index IDX_NotRec_Task on Notification_Recipients (task_id);
create index IDX_PAsBAs_Entity on PeopleAssignments_BAs (entity_id);
create index IDX_PAsBAs_Task on PeopleAssignments_BAs (task_id);
create index IDX_PAsExcl_Entity on PeopleAssignments_ExclOwners (entity_id);
create index IDX_PAsExcl_Task on PeopleAssignments_ExclOwners (task_id);
create index IDX_PAsPot_TaskEntity on PeopleAssignments_PotOwners (task_id, entity_id);
create index IDX_PAsRecip_Entity on PeopleAssignments_Recipients (entity_id);
create index IDX_PAsRecip_Task on PeopleAssignments_Recipients (task_id);
create index IDX_PAsStake_Entity on PeopleAssignments_Stakeholders (entity_id);
create index IDX_PAsStake_Task on PeopleAssignments_Stakeholders (task_id);
create index IDX_PInstLog_duration on ProcessInstanceLog (duration);
create index IDX_PInstLog_end_date on ProcessInstanceLog (end_date);
create index IDX_PInstLog_extId on ProcessInstanceLog (externalId);
create index IDX_PInstLog_user_identity on ProcessInstanceLog (user_identity);
create index IDX_PInstLog_outcome on ProcessInstanceLog (outcome);
create index IDX_PInstLog_parentPInstId on ProcessInstanceLog (parentProcessInstanceId);
create index IDX_PInstLog_pId on ProcessInstanceLog (processId);
create index IDX_PInstLog_pInsteDescr on ProcessInstanceLog (processInstanceDescription);
create index IDX_PInstLog_pInstId on ProcessInstanceLog (processInstanceId);
create index IDX_PInstLog_pName on ProcessInstanceLog (processName);
create index IDX_PInstLog_pVersion on ProcessInstanceLog (processVersion);
create index IDX_PInstLog_start_date on ProcessInstanceLog (start_date);
create index IDX_PInstLog_status on ProcessInstanceLog (status);
create index IDX_PInstLog_correlation on ProcessInstanceLog (correlationKey);
alter table QueryDefinitionStore add constraint UK1dmy087nhbykucpgjipcnyluv unique (qName);
create index IDX_Reassign_Esc on Reassignment (Escalation_Reassignments_Id);
create index IDX_ReassignPO_Entity on Reassignment_potentialOwners (entity_id);
create index IDX_ReassignPO_Task on Reassignment_potentialOwners (task_id);
create index IDX_RequestInfo_status on RequestInfo (status);
create index IDX_RequestInfo_owner on RequestInfo (owner);
create index IDX_Task_Initiator on Task (taskInitiator_id);
create index IDX_Task_ActualOwner on Task (actualOwner_id);
create index IDX_Task_CreatedBy on Task (createdBy_id);
create index IDX_Task_processInstanceId on Task (processInstanceId);
create index IDX_Task_processId on Task (processId);
create index IDX_Task_status on Task (status);
create index IDX_Task_archived on Task (archived);
create index IDX_Task_workItemId on Task (workItemId);
create index IDX_TaskComments_CreatedBy on task_comment (addedBy_id);
create index IDX_TaskComments_Id on task_comment (TaskData_Comments_Id);
create index IDX_TaskVariableImpl_taskId on TaskVariableImpl (taskId);
create index IDX_TaskVariableImpl_pInstId on TaskVariableImpl (processInstanceId);
create index IDX_TaskVariableImpl_processId on TaskVariableImpl (processId);
create index IDX_VInstLog_pInstId on VariableInstanceLog (processInstanceId);
create index IDX_VInstLog_varId on VariableInstanceLog (variableId);
create index IDX_VInstLog_pId on VariableInstanceLog (processId);
alter table Attachment add constraint FKd5xpm81gxg8n40167lbu5rbfb foreign key (attachedBy_id) references OrganizationalEntity;
alter table Attachment add constraint FKjj9psk52ifamilliyo16epwpc foreign key (TaskData_Attachments_Id) references Task;
alter table BooleanExpression add constraint FKqth56a8k6d8pv6ngsu2vjp4kj foreign key (Escalation_Constraints_Id) references Escalation;
alter table CorrelationPropertyInfo add constraint FKbchyl7kb8i6ghvi3dbr86bgo0 foreign key (correlationKey_keyId) references CorrelationKeyInfo;
alter table Deadline add constraint FK361ggw230po88svgfasg36i2w foreign key (Deadlines_StartDeadLine_Id) references Task;
alter table Deadline add constraint FKpeiadnoy228t35213t63c3imm foreign key (Deadlines_EndDeadLine_Id) references Task;
alter table Delegation_delegates add constraint FKewkdyi0wrgy9byp6abyglpcxq foreign key (entity_id) references OrganizationalEntity;
alter table Delegation_delegates add constraint FK85x3trafk3wfbrv719cafr591 foreign key (task_id) references Task;
alter table ErrorInfo add constraint FKdarp6ushq06q39jmij3fdpdbs foreign key (REQUEST_ID) references RequestInfo;
alter table Escalation add constraint FK37v8ova8ti6jiblda7n6j298e foreign key (Deadline_Escalation_Id) references Deadline;
alter table EventTypes add constraint FKj0o3uve2nqo5yrjwrkc9jfttq foreign key (InstanceId) references ProcessInstanceInfo;
alter table I18NText add constraint FKcd6eb4q62d9ab8p0di8pb99ch foreign key (Task_Subjects_Id) references Task;
alter table I18NText add constraint FKiogka67sji8fk4cp7a369895i foreign key (Task_Names_Id) references Task;
alter table I18NText add constraint FKrisdlmalotmk64mdeqpo4s5m0 foreign key (Task_Descriptions_Id) references Task;
alter table I18NText add constraint FKqxgws3fnukyqlaet11tivqg5u foreign key (Reassignment_Documentation_Id) references Reassignment;
alter table I18NText add constraint FKthf8ix3t3opf9hya1s04hwsx8 foreign key (Notification_Subjects_Id) references Notification;
alter table I18NText add constraint FKg2jsybeuc8pbj8ek8xwxutuyo foreign key (Notification_Names_Id) references Notification;
alter table I18NText add constraint FKp0m7uhipskrljktvfeubdgfid foreign key (Notification_Documentation_Id) references Notification;
alter table I18NText add constraint FK6k8hmfvhko069970eghiy2ifp foreign key (Notification_Descriptions_Id) references Notification;
alter table I18NText add constraint FK8wn7sw34q6bifsi1pvl2b1yyb foreign key (Deadline_Documentation_Id) references Deadline;
alter table Notification add constraint FKoxq5uqfg4ylwyijsg2ubyflna foreign key (Escalation_Notifications_Id) references Escalation;
alter table Notification_BAs add constraint FK378pb1cvjv54w4ljqpw99s3wr foreign key (entity_id) references OrganizationalEntity;
alter table Notification_BAs add constraint FKb123fgeomc741s9yc014421yy foreign key (task_id) references Notification;
alter table Notification_email_header add constraint FKd74pdu41avy2f7a8qyp7wn2n foreign key (emailHeaders_id) references email_header;
alter table Notification_email_header add constraint FKfdnoyp8rl0kxu29l4pyaa5566 foreign key (Notification_id) references Notification;
alter table Notification_Recipients add constraint FKot769nimyq1jvw0m61pgsq5g3 foreign key (entity_id) references OrganizationalEntity;
alter table Notification_Recipients add constraint FKn7v944d0hw37bh0auv4gr3hsf foreign key (task_id) references Notification;
alter table PeopleAssignments_BAs add constraint FKa90cdfgc4km384n1ataqigq67 foreign key (entity_id) references OrganizationalEntity;
alter table PeopleAssignments_BAs add constraint FKt4xs0glwhbsa0xwg69r6xduv9 foreign key (task_id) references Task;
alter table PeopleAssignments_ExclOwners add constraint FK5ituvd6t8uvp63hsx6282xo6h foreign key (entity_id) references OrganizationalEntity;
alter table PeopleAssignments_ExclOwners add constraint FKqxbjm1b3dl7w8w2f2y6sk0fv8 foreign key (task_id) references Task;
alter table PeopleAssignments_PotOwners add constraint FKsa3rrrjsm1qw98ajbbu2s7cjr foreign key (entity_id) references OrganizationalEntity;
alter table PeopleAssignments_PotOwners add constraint FKh8oqmk4iuh2pmpgby6g8r3jd1 foreign key (task_id) references Task;
alter table PeopleAssignments_Recipients add constraint FKrd0h9ud1bhs9waf2mdmiv6j2r foreign key (entity_id) references OrganizationalEntity;
alter table PeopleAssignments_Recipients add constraint FK9gnbv6bplxkxoedj35vg8n7ir foreign key (task_id) references Task;
alter table PeopleAssignments_Stakeholders add constraint FK9uy76cu650rg1nnkrtjwj1e9t foreign key (entity_id) references OrganizationalEntity;
alter table PeopleAssignments_Stakeholders add constraint FKaeyk4nwslvx0jywjomjq7083i foreign key (task_id) references Task;
alter table Reassignment add constraint FKessy30safh44b30f1cfoujv2k foreign key (Escalation_Reassignments_Id) references Escalation;
alter table Reassignment_potentialOwners add constraint FKsqrmpvehlc4qe9i0km22nmkjl foreign key (entity_id) references OrganizationalEntity;
alter table Reassignment_potentialOwners add constraint FKftegfexshix752bh2jfxf6bnh foreign key (task_id) references Reassignment;
alter table Task add constraint FK48d1bfgwf0jqow1yk8ku4xcpi foreign key (taskInitiator_id) references OrganizationalEntity;
alter table Task add constraint FKpmkxvqq63aed2y2boruu53a0s foreign key (actualOwner_id) references OrganizationalEntity;
alter table Task add constraint FKexuboqnbla7jfyyesyo61ucmb foreign key (createdBy_id) references OrganizationalEntity;
alter table task_comment add constraint FKqb4mkarf209y9546w7n75lb7a foreign key (addedBy_id) references OrganizationalEntity;
alter table task_comment add constraint FKm2mwc1ukcpdsiqwgkoroy6ise foreign key (TaskData_Comments_Id) references Task;
