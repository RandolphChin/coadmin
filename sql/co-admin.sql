/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50733
Source Host           : 127.0.0.1:3306
Source Database       : co-admin

Target Server Type    : MYSQL
Target Server Version : 50733
File Encoding         : 65001

Date: 2021-11-23 16:57:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ali_charger_cron
-- ----------------------------
DROP TABLE IF EXISTS `ali_charger_cron`;
CREATE TABLE `ali_charger_cron` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(6) DEFAULT NULL COMMENT '星期几',
  `cron_open` varchar(35) DEFAULT NULL COMMENT '开机cron表达式',
  `cron_close` varchar(35) DEFAULT NULL COMMENT '关机cron表达式',
  `status` bit(1) DEFAULT NULL COMMENT '是否暂停',
  `job_id` bigint(20) DEFAULT NULL COMMENT '场馆',
  `job_week` varchar(6) DEFAULT NULL COMMENT '场馆与星期数组合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of ali_charger_cron
-- ----------------------------
INSERT INTO `ali_charger_cron` VALUES ('218', '周一', '0 0 8 ? * 2', '0 30 17 ? * 2', '\0', '11', '11-2');
INSERT INTO `ali_charger_cron` VALUES ('219', '周二', '0 0 8 ? * 3', '0 30 17 ? * 3', '\0', '11', '11-3');
INSERT INTO `ali_charger_cron` VALUES ('220', '周三', '0 0 8 ? * 4', '0 30 17 ? * 4', '\0', '11', '11-4');
INSERT INTO `ali_charger_cron` VALUES ('221', '周四2', '0 0 8 ? * 5', '0 30 17 ? * 5', '\0', '11', '11-5');
INSERT INTO `ali_charger_cron` VALUES ('225', '周一', '0 0 8 ? * 2', '0 30 17 ? * 2', '', '12', '12-2');
INSERT INTO `ali_charger_cron` VALUES ('226', '周二', '0 0 8 ? * 3', '0 30 17 ? * 3', '', '12', '12-3');
INSERT INTO `ali_charger_cron` VALUES ('227', '周三', '0 0 8 ? * 4', '0 30 17 ? * 4', '', '12', '12-4');
INSERT INTO `ali_charger_cron` VALUES ('228', '周四', '0 0 8 ? * 5', '0 30 17 ? * 5', '', '12', '12-5');

-- ----------------------------
-- Table structure for app_user
-- ----------------------------
DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'ID',
  `is_enabled` bit(1) NOT NULL COMMENT '状态',
  `channel` tinyint(3) unsigned NOT NULL COMMENT '渠道(1=wxmp;2=wxliteapp;...)',
  `openid` varchar(40) NOT NULL COMMENT 'openid',
  `unionid` varchar(40) DEFAULT NULL COMMENT '微信unionid',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号（已注册标识）',
  `nickname` varchar(128) DEFAULT NULL COMMENT '昵称',
  `nickname_letter` varchar(128) DEFAULT NULL COMMENT '昵称首字母',
  `gender` tinyint(3) unsigned DEFAULT NULL COMMENT '1男、2女、3未知',
  `headimgurl` varchar(256) DEFAULT NULL COMMENT '头像URL',
  `country` varchar(10) DEFAULT NULL COMMENT '国家',
  `province` varchar(64) DEFAULT NULL COMMENT '省份',
  `city` varchar(64) DEFAULT NULL COMMENT '城市',
  `lang` varchar(10) DEFAULT NULL COMMENT '国家地区语言版本',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_OPENID` (`openid`),
  UNIQUE KEY `UNI_MOBILE` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='APP用户';

-- ----------------------------
-- Records of app_user
-- ----------------------------
INSERT INTO `app_user` VALUES ('1443814587805405185', '', '1', 'oHGmfw46AZ_mHntsHZ8HmipvFb6w', null, null, '进华?', 'jh?', '1', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqkBP5ia14zWSK269XBz5RTfhNiaia8KNVedlXMEvzmwx9glXUIDU1tiaE4WISz5eTkMMQcMS5uUvEhLA/132', '中国', '广东', '深圳', null, '2021-10-01 13:46:37', '', null, null);
INSERT INTO `app_user` VALUES ('1444203618829512706', '', '2', 'oIoKr6nNRp3bTXMk52JDxtvVb0v8', null, null, '进华?', 'jh?', '1', 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eov4bLvdnW9BwMKrBXL5lM77MQdbIVzsjnrHeET0I5prpudVfibOswjz45libhzMiapUbWTtqahlaI1g/132', '中国', '广东', '深圳', 'zh_CN', '2021-10-02 15:32:29', '', '2021-10-02 15:58:25', '1444203618829512706');
INSERT INTO `app_user` VALUES ('1462713806706049026', '', '2', 'oIoKr6nPRQdwJvRN3oQFwkipzaa4', null, null, '', null, null, null, null, null, null, null, '2021-11-22 17:25:22', '', null, null);

-- ----------------------------
-- Table structure for code_column_config
-- ----------------------------
DROP TABLE IF EXISTS `code_column_config`;
CREATE TABLE `code_column_config` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `column_type` varchar(255) NOT NULL,
  `dict_name` varchar(255) DEFAULT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `form_show` bit(1) DEFAULT NULL,
  `form_type` varchar(255) DEFAULT NULL,
  `key_type` varchar(255) DEFAULT NULL,
  `list_show` bit(1) DEFAULT NULL,
  `not_null` bit(1) DEFAULT NULL,
  `query_type` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `date_annotation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_table_name` (`table_name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='代码生成字段信息存储';

-- ----------------------------
-- Records of code_column_config
-- ----------------------------
INSERT INTO `code_column_config` VALUES ('1461152820371079170', 'ali_charger_cron', 'name', 'varchar', null, '', '', 'Input', '', '', '\0', 'Like', '星期几', null);
INSERT INTO `code_column_config` VALUES ('1461152820375273474', 'ali_charger_cron', 'cron_open', 'varchar', null, '', '', 'Input', '', '', '\0', '=', '开机cron表达式', null);
INSERT INTO `code_column_config` VALUES ('1461152820375273475', 'ali_charger_cron', 'cron_close', 'varchar', null, '', '', 'Input', '', '', '\0', '=', '关机cron表达式', null);
INSERT INTO `code_column_config` VALUES ('1461152820387856385', 'ali_charger_cron', 'status', 'bit', null, '', '\0', null, '', '', '\0', null, '是否暂停', null);
INSERT INTO `code_column_config` VALUES ('1461152820392050689', 'ali_charger_cron', 'job_id', 'bigint', null, '', '\0', null, '', '', '\0', null, '场馆', null);
INSERT INTO `code_column_config` VALUES ('1461152820392050690', 'ali_charger_cron', 'job_week', 'varchar', null, '', '\0', null, '', '', '\0', null, '场馆与星期数组合', null);
INSERT INTO `code_column_config` VALUES ('1461198775111790594', 'ali_charger_cron', 'id', 'bigint', null, 'auto_increment', '', null, 'PRI', '', '\0', null, 'ID', null);
INSERT INTO `code_column_config` VALUES ('1461955439880531970', 'sys_dept', 'id', 'bigint', null, 'auto_increment', '', null, 'PRI', '', '', null, 'ID', null);
INSERT INTO `code_column_config` VALUES ('1461955439893114882', 'sys_dept', 'pid', 'bigint', null, '', '', null, 'MUL', '', '', null, '上级id', null);
INSERT INTO `code_column_config` VALUES ('1461955439901503490', 'sys_dept', 'name', 'varchar', null, '', '', null, '', '', '', null, '机构名称', null);
INSERT INTO `code_column_config` VALUES ('1461955439905697794', 'sys_dept', 'sort', 'int', null, '', '', null, '', '', '', null, '本节点排序', null);
INSERT INTO `code_column_config` VALUES ('1461955439909892097', 'sys_dept', 'enabled', 'bit', null, '', '', null, 'MUL', '', '', null, '状态', null);
INSERT INTO `code_column_config` VALUES ('1461955439922475010', 'sys_dept', 'create_by', 'varchar', null, '', '', null, '', '', '\0', null, '创建者', null);
INSERT INTO `code_column_config` VALUES ('1461955439935057922', 'sys_dept', 'update_by', 'varchar', null, '', '', null, '', '', '\0', null, '更新者', null);
INSERT INTO `code_column_config` VALUES ('1461955439943446530', 'sys_dept', 'create_time', 'datetime', null, '', '', null, '', '', '', null, '创建日期', null);
INSERT INTO `code_column_config` VALUES ('1461955439951835138', 'sys_dept', 'update_time', 'datetime', null, '', '', null, '', '', '\0', null, '更新时间', null);

-- ----------------------------
-- Table structure for code_gen_config
-- ----------------------------
DROP TABLE IF EXISTS `code_gen_config`;
CREATE TABLE `code_gen_config` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `table_name` varchar(255) NOT NULL COMMENT '表名',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `cover` bit(1) DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `sub_module_name` varchar(20) DEFAULT NULL COMMENT '子模块名称',
  `pack` varchar(255) DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) DEFAULT NULL COMMENT '接口名称',
  `menu_pid` bigint(20) DEFAULT NULL COMMENT '父级菜单（用于自动生成sql）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_table_name` (`table_name`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='代码生成器配置';

-- ----------------------------
-- Records of code_gen_config
-- ----------------------------
INSERT INTO `code_gen_config` VALUES ('1461153132783812610', 'ali_charger_cron', 'wwe', '', 'coadmin-api', 'cron', 'com.gitee.coadmin.modules.cron', 'D:\\project\\coadmin-web-quasar\\src\\pages\\system', 'D:\\project\\coadmin-web-quasar\\src\\api', 'ali_', 'CRON定时', '121');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(190) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('SsmScheduler', 'test', 'default', '0/10 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('SsmScheduler', 'testTwo', 'default', '0/15 * * * * ? *', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(190) DEFAULT NULL,
  `JOB_GROUP` varchar(190) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('SsmScheduler', 'test', 'default', null, 'com.gitee.coadmin.modules.quartz.task.TestTask', '0', '1', '0', '0', 0x230D0A234D6F6E204E6F762032322031333A33303A33382043535420323032310D0A);
INSERT INTO `qrtz_job_details` VALUES ('SsmScheduler', 'testTwo', 'default', null, 'com.gitee.coadmin.modules.quartz.task.TestTwoTask', '0', '1', '0', '0', 0x230D0A234D6F6E204E6F762032322031343A35313A32322043535420323032310D0A);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('SsmScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('SsmScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(190) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('SsmScheduler', 'PC-20210322QHBE1637656355242', '1637657870427', '2000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(190) NOT NULL,
  `TRIGGER_GROUP` varchar(190) NOT NULL,
  `JOB_NAME` varchar(190) NOT NULL,
  `JOB_GROUP` varchar(190) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('SsmScheduler', 'test', 'default', 'test', 'default', '{\"username\":\"wwe\"}', '1637648030000', '1637648020000', '5', 'PAUSED', 'CRON', '1637559038000', '0', null, '2', 0x230D0A234D6F6E204E6F762032322031333A33303A33392043535420323032310D0A757365726E616D653D7777650D0A);
INSERT INTO `qrtz_triggers` VALUES ('SsmScheduler', 'testTwo', 'default', 'testTwo', 'default', '{}', '1637570595000', '1637570580000', '5', 'PAUSED', 'CRON', '1637563882000', '0', null, '2', '');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) NOT NULL COMMENT '上级id',
  `name` varchar(255) NOT NULL COMMENT '机构名称',
  `sort` int(11) NOT NULL DEFAULT '999' COMMENT '本节点排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `inx_pid` (`pid`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='公司&部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('5', '0', '运维部', '3', '', 'admin', 'admin', '2019-03-25 09:20:44', '2021-07-29 23:23:18');
INSERT INTO `sys_dept` VALUES ('6', '8', '测试部2', '2', '\0', 'admin', 'admin', '2019-03-25 09:52:18', '2021-08-25 07:06:47');
INSERT INTO `sys_dept` VALUES ('7', '0', '华南分部', '5', '', 'admin', 'admin', '2019-03-25 11:04:50', '2020-10-08 11:41:14');
INSERT INTO `sys_dept` VALUES ('8', '0', '华北分部啊', '1', '', 'admin', 'admin', '2019-03-25 11:04:53', '2021-08-25 07:06:47');
INSERT INTO `sys_dept` VALUES ('19', '5', '运维一组', '999', '', 'admin', 'admin', '2020-10-06 18:25:01', '2021-07-29 23:23:18');
INSERT INTO `sys_dept` VALUES ('21', '7', '华南之家', '1', '', 'admin', 'admin', '2020-10-08 09:01:17', '2020-10-09 19:44:47');
INSERT INTO `sys_dept` VALUES ('33', '7', '华南2', '999', '', 'admin', 'admin', '2020-10-09 19:42:45', '2020-10-09 19:44:47');
INSERT INTO `sys_dept` VALUES ('34', '21', '华南之家1', '2', '', 'admin', 'admin', '2020-10-09 19:44:04', '2020-11-07 16:24:02');
INSERT INTO `sys_dept` VALUES ('35', '0', '东北公司', '999', '', 'admin', 'admin', '2020-10-09 19:52:45', '2021-07-24 18:43:36');
INSERT INTO `sys_dept` VALUES ('36', '35', '吉林', '5', '', 'admin', 'admin', '2020-10-09 19:55:18', '2021-07-24 18:43:36');
INSERT INTO `sys_dept` VALUES ('37', '36', '运维部吉林', '333', '', 'admin', 'admin', '2020-10-09 19:58:58', '2021-07-24 18:43:36');
INSERT INTO `sys_dept` VALUES ('38', '36', '财务部吉林', '999', '', 'admin', 'admin', '2020-10-09 20:31:36', '2021-07-24 18:43:36');
INSERT INTO `sys_dept` VALUES ('39', '7', '华南之家5', '999', '', 'admin', 'admin', '2020-11-07 16:16:09', '2020-11-07 16:25:09');
INSERT INTO `sys_dept` VALUES ('41', '0', '西南', '333', '', 'admin', '西南用户1', '2020-11-07 16:17:43', '2020-11-07 17:55:57');
INSERT INTO `sys_dept` VALUES ('42', '21', '华南之家2', '3', '', 'admin', 'admin', '2020-11-07 16:24:19', '2020-11-07 16:24:19');
INSERT INTO `sys_dept` VALUES ('44', '39', '华南之家5.1', '999', '', 'admin', 'admin', '2020-11-07 16:25:09', '2020-11-07 16:25:09');
INSERT INTO `sys_dept` VALUES ('45', '39', '华南之家5.2', '3', '', 'admin', 'admin', '2020-11-07 16:25:18', '2020-11-07 16:25:18');
INSERT INTO `sys_dept` VALUES ('46', '5', '运维二组', '999', '', 'admin', 'admin', '2020-11-07 16:46:18', '2021-07-29 23:23:18');
INSERT INTO `sys_dept` VALUES ('48', '8', '研发部', '3', '', 'admin', 'admin', '2020-11-07 16:59:17', '2021-08-25 07:06:47');
INSERT INTO `sys_dept` VALUES ('49', '0', '西北', '444', '', 'admin', 'admin', '2020-11-07 17:50:57', '2021-07-24 18:43:31');
INSERT INTO `sys_dept` VALUES ('51', '41', '商务部', '999', '', '西南用户1', 'admin', '2020-11-07 17:56:12', '2020-12-27 05:59:06');
INSERT INTO `sys_dept` VALUES ('52', '8', '财务部2', '13', '', 'admin', 'admin', '2020-12-26 11:39:51', '2021-08-25 07:06:47');
INSERT INTO `sys_dept` VALUES ('53', '8', '总裁办', '12', '\0', 'admin', 'admin', '2020-12-26 14:35:17', '2021-08-25 07:06:47');
INSERT INTO `sys_dept` VALUES ('54', '7', '华南之家7', '11', '', 'admin', null, '2021-11-19 11:43:24', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '字典名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='数据字典';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('7', 'gender', '性别', 'admin', 'admin', '2020-12-31 10:29:09', '2020-12-31 10:29:09');
INSERT INTO `sys_dict` VALUES ('8', 'jobs_status', '定时任务状态', 'demo', 'admin', '2021-01-03 21:36:34', '2021-07-24 18:43:00');
INSERT INTO `sys_dict` VALUES ('9', 'mysql_engine', 'MySQL存储引擎', 'admin', 'admin', '2021-08-22 09:28:42', '2021-08-22 09:28:42');
INSERT INTO `sys_dict` VALUES ('10', 'app_user_channel', 'APP用户渠道', 'admin', null, '2021-09-20 12:01:41', null);
INSERT INTO `sys_dict` VALUES ('11', 'app_user_gender', 'APP用户性别', 'admin', null, '2021-09-20 12:02:33', null);

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(20) DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK5tpkputc6d9nboxojdbgnpmyb` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='数据字典详情';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail` VALUES ('7', null, 'label1', 'value1', '10', 'admin', 'admin', '2020-12-25 11:03:59', '2020-12-25 11:03:59');
INSERT INTO `sys_dict_detail` VALUES ('13', '7', '男', '男', '10', 'admin', 'admin', '2020-12-31 10:30:22', '2021-07-19 22:57:30');
INSERT INTO `sys_dict_detail` VALUES ('14', '7', '女', '女', '20', 'admin', 'admin', '2020-12-31 10:30:53', '2021-07-24 18:42:55');
INSERT INTO `sys_dict_detail` VALUES ('18', '9', 'InnoDB', '10', '10', 'admin', 'admin', '2021-08-22 09:29:06', '2021-08-22 09:55:22');
INSERT INTO `sys_dict_detail` VALUES ('19', '9', 'MyISAM', '20', '20', 'admin', 'admin', '2021-08-22 09:30:44', '2021-08-22 10:09:05');
INSERT INTO `sys_dict_detail` VALUES ('20', '9', 'Memory', '30', '30', 'admin', 'admin', '2021-08-22 09:30:57', '2021-08-22 09:30:57');
INSERT INTO `sys_dict_detail` VALUES ('22', '10', 'wxmp', '1', '10', 'admin', 'admin', '2021-09-20 12:03:09', '2021-09-20 12:04:36');
INSERT INTO `sys_dict_detail` VALUES ('23', '10', 'wxliteapp', '2', '20', 'admin', 'admin', '2021-09-20 12:03:21', '2021-09-20 12:04:43');
INSERT INTO `sys_dict_detail` VALUES ('25', '11', '男', '1', '10', 'admin', 'admin', '2021-09-20 12:04:06', '2021-09-20 12:04:06');
INSERT INTO `sys_dict_detail` VALUES ('26', '11', '女', '2', '20', 'admin', 'admin', '2021-09-20 12:04:12', '2021-09-20 12:04:12');
INSERT INTO `sys_dict_detail` VALUES ('27', '11', '未知', '3', '30', 'admin', 'admin', '2021-09-20 12:04:17', '2021-09-20 12:04:17');
INSERT INTO `sys_dict_detail` VALUES ('28', '8', '运行中', 'ACQUIRED', '1', 'admin', 'admin', '2021-11-22 13:38:05', '2021-11-22 13:38:05');
INSERT INTO `sys_dict_detail` VALUES ('29', '8', '已暂停', 'PAUSED', '2', 'admin', 'admin', '2021-11-22 13:39:25', '2021-11-22 13:39:25');
INSERT INTO `sys_dict_detail` VALUES ('30', '8', '运行中', 'WAITING', '3', 'admin', 'admin', '2021-11-22 15:37:57', '2021-11-22 15:37:57');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(150) NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `inx_enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='岗位';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('8', '人事专员', '', '3', null, 'admin', '2019-03-29 14:52:28', '2021-08-25 20:59:15');
INSERT INTO `sys_job` VALUES ('10', '产品经理', '', '4', null, 'admin', '2019-03-29 14:55:51', '2021-07-24 15:21:03');
INSERT INTO `sys_job` VALUES ('11', '全栈开发', '', '2', null, 'admin', '2019-03-31 13:39:30', '2021-07-31 11:46:52');
INSERT INTO `sys_job` VALUES ('12', '软件测试', '', '5', null, 'admin', '2019-03-31 13:39:43', '2021-07-24 14:44:49');
INSERT INTO `sys_job` VALUES ('16', '岗位', '\0', '33', 'demo', 'demo', '2021-07-23 22:24:56', '2021-07-23 22:36:09');
INSERT INTO `sys_job` VALUES ('18', '大大撒', '', '10', 'admin', 'admin', '2021-07-24 15:21:16', '2021-07-24 15:21:16');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) DEFAULT NULL,
  `log_type` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `params` text,
  `request_ip` varchar(255) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `browser` varchar(255) DEFAULT NULL,
  `exception_detail` text,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `log_create_time_index` (`create_time`),
  KEY `inx_log_type` (`log_type`(191))
) ENGINE=InnoDB AUTO_INCREMENT=1463040463333736451 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(11) DEFAULT '0' COMMENT '子菜单数目',
  `type` int(11) DEFAULT NULL COMMENT '0=目录，1=菜单，2=按钮',
  `title` varchar(150) DEFAULT NULL COMMENT '菜单标题',
  `component_name` varchar(150) DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) DEFAULT NULL COMMENT '组件',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `path` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_title` (`title`),
  UNIQUE KEY `uniq_name` (`component_name`),
  KEY `inx_pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', null, '8', '0', '系统管理', null, null, '900', 'settings', 'system', '\0', '\0', '\0', null, null, 'admin', '2021-11-23 14:12:24', '2021-11-23 14:12:25');
INSERT INTO `sys_menu` VALUES ('2', '1', '4', '1', '人员管理', 'User', 'system/user/index', '2', 'people_alt', 'user', '\0', '', '\0', 'user:list', null, 'admin', '2021-06-24 18:05:54', '2021-11-20 13:29:01');
INSERT INTO `sys_menu` VALUES ('3', '1', '4', '1', '角色管理', 'Role', 'system/role/index', '3', 'done_all', 'role', '\0', '', '\0', 'roles:list', null, 'admin', '2021-06-24 18:06:20', '2021-11-20 13:29:17');
INSERT INTO `sys_menu` VALUES ('5', '1', '4', '1', '菜单管理', 'Menu', 'system/menu/index', '5', 'menu', 'menu', '\0', '', '\0', 'menu:list', null, 'admin', '2021-06-24 18:06:38', '2021-06-24 18:06:39');
INSERT INTO `sys_menu` VALUES ('6', null, '5', '0', '系统监控', null, null, '935', 'monitor', 'monitor', '\0', '\0', '\0', null, null, 'admin', '2021-08-22 07:43:47', '2021-08-24 22:24:40');
INSERT INTO `sys_menu` VALUES ('7', '6', '0', '1', '操作日志', 'Log', 'monitor/log/index', '11', 'remove', 'logs', '\0', '', '\0', null, null, 'admin', '2018-12-18 15:18:26', '2020-12-30 14:52:33');
INSERT INTO `sys_menu` VALUES ('9', '6', '0', '1', 'SQL监控', 'Sql', 'monitor/sql/index', '18', ' ', 'druid', '\0', '\0', '\0', null, null, 'admin', '2018-12-18 15:19:34', '2021-08-22 07:43:48');
INSERT INTO `sys_menu` VALUES ('10', null, '5', '0', '组件管理', null, null, '950', 'category', 'components', '\0', '\0', '', null, null, 'admin', '2018-12-19 13:38:16', '2021-01-07 08:54:44');
INSERT INTO `sys_menu` VALUES ('11', '10', '0', '1', '图标库', 'Icons', 'components/icons/index', '51', 'icon', 'icon', '\0', '\0', '\0', null, null, null, '2018-12-19 13:38:49', null);
INSERT INTO `sys_menu` VALUES ('14', '36', '0', '1', '邮件工具', 'Email', 'tools/email/index', '35', 'email', 'email', '\0', '\0', '\0', null, null, null, '2018-12-27 10:13:09', null);
INSERT INTO `sys_menu` VALUES ('15', '10', '0', '1', '富文本', 'Editor', 'components/Editor', '52', 'fwb', 'tinymce', '\0', '\0', '\0', null, null, null, '2018-12-27 11:58:25', null);
INSERT INTO `sys_menu` VALUES ('18', '36', '3', '1', '存储管理', 'Storage', 'tools/storage/index', '34', 'S', 'storage', '\0', '\0', '\0', 'storage:list', null, 'admin', '2018-12-31 11:12:15', '2020-12-30 16:28:52');
INSERT INTO `sys_menu` VALUES ('19', '36', '0', '1', '支付宝工具', 'AliPay', 'tools/aliPay/index', '37', 'A', 'aliPay', '\0', '\0', '\0', null, null, 'admin', '2018-12-31 14:52:38', '2020-12-30 16:28:32');
INSERT INTO `sys_menu` VALUES ('21', null, '2', '0', '多级菜单', null, '', '945', 'menu', 'nested', '\0', '\0', '\0', null, null, 'admin', '2019-01-04 16:22:03', '2021-07-24 08:59:19');
INSERT INTO `sys_menu` VALUES ('22', '21', '2', '1', '二级菜单1', null, 'nested/menu1/index', '2', 'menu', 'menu1', '\0', '\0', '\0', null, null, 'admin', '2019-01-04 16:23:29', '2020-12-30 17:42:01');
INSERT INTO `sys_menu` VALUES ('23', '21', '1', '1', '二级菜单2', null, 'nested/menu2/index', '999', 'menu', 'menu2', '\0', '\0', '\0', null, null, 'admin', '2019-01-04 16:23:57', '2020-12-30 17:01:46');
INSERT INTO `sys_menu` VALUES ('24', '22', '0', '1', '三级菜单1', null, 'nested/menu1/menu1-1', '999', 'menu', 'menu1-1', '\0', '\0', '\0', null, null, null, '2019-01-04 16:24:48', null);
INSERT INTO `sys_menu` VALUES ('27', '22', '0', '1', '三级菜单2三级菜单2三级菜单2', null, 'nested/menu1/menu1-2', '999', 'menu', 'menu1-2', '\0', '\0', '\0', null, null, 'admin', '2019-01-07 17:27:32', '2020-12-30 17:42:01');
INSERT INTO `sys_menu` VALUES ('28', '1', '4', '1', '任务调度', 'Timing', 'system/timing/index', '999', 'today', 'timing', '\0', '\0', '\0', 'timing:list', null, 'admin', '2021-06-24 18:07:47', '2021-07-25 18:02:27');
INSERT INTO `sys_menu` VALUES ('30', '36', '0', '1', '代码生成', 'GeneratorIndex', 'generator/index', '32', 'code', 'generator', '\0', '', '\0', null, null, 'admin', '2019-01-11 15:45:55', '2020-12-30 16:28:02');
INSERT INTO `sys_menu` VALUES ('32', '6', '0', '1', '异常日志', 'ErrorLog', 'monitor/log/errorLog', '12', 'error', 'errorLog', '\0', '\0', '\0', null, null, null, '2019-01-13 13:49:03', null);
INSERT INTO `sys_menu` VALUES ('33', '10', '0', '1', 'Markdown', 'Markdown', 'components/MarkDown', '53', 'markdown', 'markdown', '\0', '\0', '\0', null, null, null, '2019-03-08 13:46:44', null);
INSERT INTO `sys_menu` VALUES ('34', '10', '0', '1', 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', '54', 'dev', 'yaml', '\0', '\0', '\0', null, null, null, '2019-03-08 15:49:40', null);
INSERT INTO `sys_menu` VALUES ('35', '1', '4', '1', '机构管理', 'Dept', 'system/dept/index', '6', 'perm_contact_calendar', 'dept', '\0', '', '\0', 'dept:list', null, 'admin', '2021-06-24 18:07:00', '2021-11-20 13:29:26');
INSERT INTO `sys_menu` VALUES ('36', null, '7', '0', '系统工具', null, '', '930', 'build', 'sys-tools', '\0', '\0', '\0', null, null, 'admin', '2019-03-29 10:57:35', '2021-07-24 18:55:16');
INSERT INTO `sys_menu` VALUES ('37', '1', '4', '1', '岗位管理', 'Job', 'system/job/index', '7', 'monetization_on', 'job', '\0', '', '\0', 'job:list', null, 'admin', '2021-06-24 18:07:14', '2021-11-20 13:29:46');
INSERT INTO `sys_menu` VALUES ('38', '36', '0', '1', '接口文档', 'Swagger', 'tools/swagger/index', '36', 'D', 'swagger2', '\0', '\0', '\0', null, null, 'admin', '2019-03-29 19:57:53', '2020-12-30 16:28:44');
INSERT INTO `sys_menu` VALUES ('39', '1', '4', '1', '字典管理', 'Dict', 'system/dict/index', '8', 'translate', 'dict', '\0', '', '\0', 'dict:list', null, 'admin', '2021-06-24 18:07:33', '2021-07-25 18:06:00');
INSERT INTO `sys_menu` VALUES ('41', '6', '0', '1', '在线用户', 'OnlineUser', 'monitor/online/index', '10', 'supervised_user_circle', 'online', '\0', '\0', '\0', null, null, 'admin', '2019-10-26 22:08:43', '2020-12-30 15:26:13');
INSERT INTO `sys_menu` VALUES ('44', '2', '0', '2', '用户新增', null, '', '2', '', '', '\0', '\0', '\0', 'user:add', null, null, '2019-10-29 10:59:46', null);
INSERT INTO `sys_menu` VALUES ('45', '2', '0', '2', '用户编辑', null, '', '3', '', '', '\0', '\0', '\0', 'user:edit', null, null, '2019-10-29 11:00:08', null);
INSERT INTO `sys_menu` VALUES ('46', '2', '0', '2', '用户删除', null, '', '4', '', '', '\0', '\0', '\0', 'user:del', null, null, '2019-10-29 11:00:23', null);
INSERT INTO `sys_menu` VALUES ('48', '3', '0', '2', '角色创建', null, '', '2', '', '', '\0', '\0', '\0', 'roles:add', null, null, '2019-10-29 12:45:34', null);
INSERT INTO `sys_menu` VALUES ('49', '3', '0', '2', '角色修改', null, '', '3', '', '', '\0', '\0', '\0', 'roles:edit', null, null, '2019-10-29 12:46:16', null);
INSERT INTO `sys_menu` VALUES ('50', '3', '0', '2', '角色删除', null, '', '4', '', '', '\0', '\0', '\0', 'roles:del', null, null, '2019-10-29 12:46:51', null);
INSERT INTO `sys_menu` VALUES ('52', '5', '0', '2', '菜单新增', null, '', '2', '', '', '\0', '\0', '\0', 'menu:add', null, null, '2019-10-29 12:55:07', null);
INSERT INTO `sys_menu` VALUES ('53', '5', '0', '2', '菜单编辑', null, '', '3', '', '', '\0', '\0', '\0', 'menu:edit', null, 'admin', '2019-10-29 12:55:40', '2020-12-31 09:28:38');
INSERT INTO `sys_menu` VALUES ('54', '5', '0', '2', '菜单删除', null, '', '4', '', '', '\0', '\0', '\0', 'menu:del', null, null, '2019-10-29 12:56:00', null);
INSERT INTO `sys_menu` VALUES ('56', '35', '0', '2', '机构新增', null, '', '2', '', '', '\0', '\0', '\0', 'dept:add', null, 'admin', '2019-10-29 12:57:09', '2020-10-12 12:22:40');
INSERT INTO `sys_menu` VALUES ('57', '35', '0', '2', '机构编辑', null, '', '3', '', '', '\0', '\0', '\0', 'dept:edit', null, 'admin', '2019-10-29 12:57:27', '2020-10-12 12:22:51');
INSERT INTO `sys_menu` VALUES ('58', '35', '0', '2', '机构删除', null, '', '4', '', '', '\0', '\0', '\0', 'dept:del', null, 'admin', '2019-10-29 12:57:41', '2020-10-12 12:23:02');
INSERT INTO `sys_menu` VALUES ('60', '37', '0', '2', '岗位新增', null, '', '2', '', '', '\0', '\0', '\0', 'job:add', null, null, '2019-10-29 12:58:27', null);
INSERT INTO `sys_menu` VALUES ('61', '37', '0', '2', '岗位编辑', null, '', '3', '', '', '\0', '\0', '\0', 'job:edit', null, null, '2019-10-29 12:58:45', null);
INSERT INTO `sys_menu` VALUES ('62', '37', '0', '2', '岗位删除', null, '', '4', '', '', '\0', '\0', '\0', 'job:del', null, null, '2019-10-29 12:59:04', null);
INSERT INTO `sys_menu` VALUES ('64', '39', '0', '2', '字典新增', null, '', '2', '', '', '\0', '\0', '\0', 'dict:add', null, null, '2019-10-29 13:00:17', null);
INSERT INTO `sys_menu` VALUES ('65', '39', '0', '2', '字典编辑', null, '', '3', '', '', '\0', '\0', '\0', 'dict:edit', null, null, '2019-10-29 13:00:42', null);
INSERT INTO `sys_menu` VALUES ('66', '39', '0', '2', '字典删除', null, '', '4', '', '', '\0', '\0', '\0', 'dict:del', null, null, '2019-10-29 13:00:59', null);
INSERT INTO `sys_menu` VALUES ('73', '28', '0', '2', '任务新增', null, '', '2', '', '', '\0', '\0', '\0', 'timing:add', null, null, '2019-10-29 13:07:28', null);
INSERT INTO `sys_menu` VALUES ('74', '28', '0', '2', '任务编辑', null, '', '3', '', '', '\0', '\0', '\0', 'timing:edit', null, null, '2019-10-29 13:07:41', null);
INSERT INTO `sys_menu` VALUES ('75', '28', '0', '2', '任务删除', null, '', '4', '', '', '\0', '\0', '\0', 'timing:del', null, null, '2019-10-29 13:07:54', null);
INSERT INTO `sys_menu` VALUES ('77', '18', '0', '2', '上传文件', null, '', '2', '', '', '\0', '\0', '\0', 'storage:add', null, null, '2019-10-29 13:09:09', null);
INSERT INTO `sys_menu` VALUES ('78', '18', '0', '2', '文件编辑', null, '', '3', '', '', '\0', '\0', '\0', 'storage:edit', null, null, '2019-10-29 13:09:22', null);
INSERT INTO `sys_menu` VALUES ('79', '18', '0', '2', '文件删除', null, '', '4', '', '', '\0', '\0', '\0', 'storage:del', null, null, '2019-10-29 13:09:34', null);
INSERT INTO `sys_menu` VALUES ('80', '6', '0', '1', '服务监控', 'ServerMonitor', 'monitor/server/index', '14', ' ', 'server', '\0', '\0', '\0', 'monitor:list', null, 'admin', '2019-11-07 13:06:39', '2021-08-22 07:43:44');
INSERT INTO `sys_menu` VALUES ('82', '36', '0', '1', '生成配置', 'GeneratorConfig', 'generator/config', '33', 'C', 'generator/config/:tableName', '\0', '', '', '', null, 'admin', '2019-11-17 20:08:56', '2020-12-30 16:28:20');
INSERT INTO `sys_menu` VALUES ('83', '10', '0', '1', '图表库', 'Echarts', 'components/Echarts', '50', 'chart', 'echarts', '\0', '', '\0', '', null, null, '2019-11-21 09:04:32', null);
INSERT INTO `sys_menu` VALUES ('92', '90', '3', '1', '服务器', 'ServerDeploy', 'mnt/server/index', '22', 'vpn_lock', 'mnt/serverDeploy', '\0', '\0', '\0', 'serverDeploy:list', null, 'admin', '2019-11-10 10:29:25', '2020-12-30 15:28:07');
INSERT INTO `sys_menu` VALUES ('93', '90', '3', '1', '应用管理', 'App', 'mnt/app/index', '23', 'A', 'mnt/app', '\0', '\0', '\0', 'app:list', null, 'admin', '2019-11-10 11:05:16', '2020-12-30 17:16:01');
INSERT INTO `sys_menu` VALUES ('94', '90', '3', '1', '部署管理', 'Deploy', 'mnt/deploy/index', '24', 'B', 'mnt/deploy', '\0', '\0', '\0', 'deploy:list', null, 'admin', '2019-11-10 15:56:55', '2020-12-30 16:27:32');
INSERT INTO `sys_menu` VALUES ('97', '90', '1', '1', '部署备份', 'DeployHistory', 'mnt/deployHistory/index', '25', 'backup', 'mnt/deployHistory', '\0', '\0', '\0', 'deployHistory:list', null, null, '2019-11-10 16:49:44', null);
INSERT INTO `sys_menu` VALUES ('98', '90', '3', '1', '数据库管理', 'Database', 'mnt/database/index', '26', 'D', 'mnt/database', '\0', '\0', '\0', 'database:list', null, 'admin', '2019-11-10 20:40:04', '2020-12-30 16:26:20');
INSERT INTO `sys_menu` VALUES ('102', '97', '0', '2', '删除', null, '', '999', '', '', '\0', '\0', '\0', 'deployHistory:del', null, null, '2019-11-17 09:32:48', null);
INSERT INTO `sys_menu` VALUES ('103', '92', '0', '2', '服务器新增', null, '', '999', '', '', '\0', '\0', '\0', 'serverDeploy:add', null, null, '2019-11-17 11:08:33', null);
INSERT INTO `sys_menu` VALUES ('104', '92', '0', '2', '服务器编辑', null, '', '999', '', '', '\0', '\0', '\0', 'serverDeploy:edit', null, 'admin', '2019-11-17 11:08:57', '2020-10-06 16:24:24');
INSERT INTO `sys_menu` VALUES ('105', '92', '0', '2', '服务器删除', null, '', '999', '', '', '\0', '\0', '\0', 'serverDeploy:del', null, null, '2019-11-17 11:09:15', null);
INSERT INTO `sys_menu` VALUES ('106', '93', '0', '2', '应用新增', null, '', '999', '', '', '\0', '\0', '\0', 'app:add', null, null, '2019-11-17 11:10:03', null);
INSERT INTO `sys_menu` VALUES ('107', '93', '0', '2', '应用编辑', null, '', '999', '', '', '\0', '\0', '\0', 'app:edit', null, null, '2019-11-17 11:10:28', null);
INSERT INTO `sys_menu` VALUES ('108', '93', '0', '2', '应用删除', null, '', '999', '', '', '\0', '\0', '\0', 'app:del', null, null, '2019-11-17 11:10:55', null);
INSERT INTO `sys_menu` VALUES ('109', '94', '0', '2', '部署新增', null, '', '999', '', '', '\0', '\0', '\0', 'deploy:add', null, null, '2019-11-17 11:11:22', null);
INSERT INTO `sys_menu` VALUES ('110', '94', '0', '2', '部署编辑', null, '', '999', '', '', '\0', '\0', '\0', 'deploy:edit', null, null, '2019-11-17 11:11:41', null);
INSERT INTO `sys_menu` VALUES ('111', '94', '0', '2', '部署删除', null, '', '999', '', '', '\0', '\0', '\0', 'deploy:del', null, null, '2019-11-17 11:12:01', null);
INSERT INTO `sys_menu` VALUES ('112', '98', '0', '2', '数据库新增', null, '', '999', '', '', '\0', '\0', '\0', 'database:add', null, null, '2019-11-17 11:12:43', null);
INSERT INTO `sys_menu` VALUES ('113', '98', '0', '2', '数据库编辑', null, '', '999', '', '', '\0', '\0', '\0', 'database:edit', null, null, '2019-11-17 11:12:58', null);
INSERT INTO `sys_menu` VALUES ('114', '98', '0', '2', '数据库删除', null, '', '999', '', '', '\0', '\0', '\0', 'database:del', null, null, '2019-11-17 11:13:14', null);
INSERT INTO `sys_menu` VALUES ('116', '36', '0', '1', '生成预览', 'Preview', 'generator/preview', '999', 'P', 'generator/preview/:tableName', '\0', '', '', null, null, 'admin', '2019-11-26 14:54:36', '2020-12-30 16:28:39');
INSERT INTO `sys_menu` VALUES ('118', '23', '0', '2', 'Test', null, 'demo/test', '10', 'T', 'test', '\0', '', '', 'test:list', 'admin', 'admin', '2020-12-30 15:31:09', '2020-12-30 17:01:46');
INSERT INTO `sys_menu` VALUES ('120', '119', '0', '0', '一一级菜单', null, null, '10', 'S', null, '\0', '\0', '\0', 'first:second', 'admin', 'admin', '2020-12-30 16:56:41', '2020-12-30 16:58:29');
INSERT INTO `sys_menu` VALUES ('121', null, '2', '0', '自动生成CRUD', null, null, '10', 'gavel', 'test', '\0', '\0', '\0', null, 'admin', 'admin', '2021-11-20 15:07:21', '2021-11-20 15:07:21');
INSERT INTO `sys_menu` VALUES ('153', '121', '4', '1', '演示', 'TestPerson', 'test-person/test/index', '10', ' ', 'test-person', '\0', '', '\0', 'testPerson:list', null, 'admin', '2021-06-24 20:00:53', '2021-08-25 21:04:47');
INSERT INTO `sys_menu` VALUES ('154', '153', '0', '2', '演示查看', null, null, '10', null, null, '\0', '\0', '\0', 'testPerson:view', null, 'admin', '2021-01-07 20:56:51', '2021-06-24 19:54:48');
INSERT INTO `sys_menu` VALUES ('155', '153', '0', '2', '演示新增', null, null, '10', null, null, '\0', '\0', '\0', 'testPerson:add', null, 'admin', '2021-01-07 20:56:51', '2021-06-24 20:00:18');
INSERT INTO `sys_menu` VALUES ('156', '153', '0', '2', '演示修改', null, null, '10', null, null, '\0', '\0', '\0', 'testPerson:edit', null, 'admin', '2021-01-07 20:56:51', '2021-06-24 20:00:53');
INSERT INTO `sys_menu` VALUES ('157', '153', '0', '2', '演示删除', null, null, '10', null, null, '\0', '\0', '\0', 'testPerson:del', null, 'admin', '2021-01-07 20:56:51', '2021-06-24 20:00:31');
INSERT INTO `sys_menu` VALUES ('158', '2', '0', '2', '用户查看', null, null, '1', null, null, '\0', '\0', '\0', 'user:list', 'admin', 'admin', '2021-06-24 18:05:47', '2021-06-24 18:05:55');
INSERT INTO `sys_menu` VALUES ('159', '3', '0', '2', '角色查看', null, null, '1', null, null, '\0', '\0', '\0', 'roles:list', 'admin', 'admin', '2021-06-24 18:06:21', '2021-06-24 18:06:21');
INSERT INTO `sys_menu` VALUES ('160', '5', '0', '2', '查到查看', null, null, '1', null, null, '\0', '\0', '\0', 'menu:list', 'admin', 'admin', '2021-06-24 18:06:39', '2021-06-24 18:06:39');
INSERT INTO `sys_menu` VALUES ('161', '35', '0', '2', '机构查看', null, null, '1', null, '', '\0', '\0', '\0', 'dept:list', 'admin', 'admin', '2021-06-24 18:07:01', '2021-06-24 18:07:01');
INSERT INTO `sys_menu` VALUES ('162', '37', '0', '2', '岗位查看', null, null, '1', null, null, '\0', '\0', '\0', 'job:list', 'admin', 'admin', '2021-06-24 18:07:14', '2021-06-24 18:07:14');
INSERT INTO `sys_menu` VALUES ('163', '39', '0', '2', '字典查看', null, null, '1', null, null, '\0', '\0', '\0', 'dict:list', 'admin', 'admin', '2021-06-24 18:07:34', '2021-06-24 18:07:34');
INSERT INTO `sys_menu` VALUES ('164', '28', '0', '2', '任务查看', null, null, '1', null, null, '\0', '\0', '\0', 'timing:list', 'admin', 'admin', '2021-06-24 18:07:47', '2021-06-24 18:07:47');
INSERT INTO `sys_menu` VALUES ('187', '121', '0', '1', '定时', '定时页面测试', 'system/cron/index', '2', 'bluetooth_searching', 'cron', '\0', '\0', '\0', 'chargerCron:list', 'admin', null, '2021-11-20 15:07:21', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(150) NOT NULL COMMENT '名称',
  `level` int(11) DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`),
  KEY `role_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '1', '-', '自定义', null, 'admin', '2018-11-23 11:04:37', '2020-12-31 08:02:30');
INSERT INTO `sys_role` VALUES ('2', '普通用户', '2', '-', '自定义', null, 'admin', '2018-11-23 13:09:06', '2020-12-31 08:26:35');
INSERT INTO `sys_role` VALUES ('3', '最小权限', '3', null, '全部', 'admin', 'admin', '2020-10-01 23:35:23', '2020-12-31 08:08:11');
INSERT INTO `sys_role` VALUES ('4', '普通管理员', '2', null, '全部', 'admin', 'admin', '2020-11-07 17:53:40', '2021-09-20 10:31:04');

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts` (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE,
  KEY `FK7qg6itn5ajdoa9h9o78v9ksur` (`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色-机构关联';

-- ----------------------------
-- Records of sys_roles_depts
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus` (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`,`role_id`) USING BTREE,
  KEY `FKcngg2qadojhi3a651a5adkvbq` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色菜单关联';

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES ('1', '1');
INSERT INTO `sys_roles_menus` VALUES ('2', '1');
INSERT INTO `sys_roles_menus` VALUES ('3', '1');
INSERT INTO `sys_roles_menus` VALUES ('5', '1');
INSERT INTO `sys_roles_menus` VALUES ('6', '1');
INSERT INTO `sys_roles_menus` VALUES ('7', '1');
INSERT INTO `sys_roles_menus` VALUES ('9', '1');
INSERT INTO `sys_roles_menus` VALUES ('10', '1');
INSERT INTO `sys_roles_menus` VALUES ('11', '1');
INSERT INTO `sys_roles_menus` VALUES ('14', '1');
INSERT INTO `sys_roles_menus` VALUES ('15', '1');
INSERT INTO `sys_roles_menus` VALUES ('18', '1');
INSERT INTO `sys_roles_menus` VALUES ('19', '1');
INSERT INTO `sys_roles_menus` VALUES ('21', '1');
INSERT INTO `sys_roles_menus` VALUES ('22', '1');
INSERT INTO `sys_roles_menus` VALUES ('23', '1');
INSERT INTO `sys_roles_menus` VALUES ('24', '1');
INSERT INTO `sys_roles_menus` VALUES ('27', '1');
INSERT INTO `sys_roles_menus` VALUES ('28', '1');
INSERT INTO `sys_roles_menus` VALUES ('30', '1');
INSERT INTO `sys_roles_menus` VALUES ('32', '1');
INSERT INTO `sys_roles_menus` VALUES ('33', '1');
INSERT INTO `sys_roles_menus` VALUES ('34', '1');
INSERT INTO `sys_roles_menus` VALUES ('35', '1');
INSERT INTO `sys_roles_menus` VALUES ('36', '1');
INSERT INTO `sys_roles_menus` VALUES ('37', '1');
INSERT INTO `sys_roles_menus` VALUES ('38', '1');
INSERT INTO `sys_roles_menus` VALUES ('39', '1');
INSERT INTO `sys_roles_menus` VALUES ('41', '1');
INSERT INTO `sys_roles_menus` VALUES ('44', '1');
INSERT INTO `sys_roles_menus` VALUES ('45', '1');
INSERT INTO `sys_roles_menus` VALUES ('46', '1');
INSERT INTO `sys_roles_menus` VALUES ('48', '1');
INSERT INTO `sys_roles_menus` VALUES ('49', '1');
INSERT INTO `sys_roles_menus` VALUES ('50', '1');
INSERT INTO `sys_roles_menus` VALUES ('52', '1');
INSERT INTO `sys_roles_menus` VALUES ('53', '1');
INSERT INTO `sys_roles_menus` VALUES ('54', '1');
INSERT INTO `sys_roles_menus` VALUES ('56', '1');
INSERT INTO `sys_roles_menus` VALUES ('57', '1');
INSERT INTO `sys_roles_menus` VALUES ('58', '1');
INSERT INTO `sys_roles_menus` VALUES ('60', '1');
INSERT INTO `sys_roles_menus` VALUES ('61', '1');
INSERT INTO `sys_roles_menus` VALUES ('62', '1');
INSERT INTO `sys_roles_menus` VALUES ('64', '1');
INSERT INTO `sys_roles_menus` VALUES ('65', '1');
INSERT INTO `sys_roles_menus` VALUES ('66', '1');
INSERT INTO `sys_roles_menus` VALUES ('73', '1');
INSERT INTO `sys_roles_menus` VALUES ('74', '1');
INSERT INTO `sys_roles_menus` VALUES ('75', '1');
INSERT INTO `sys_roles_menus` VALUES ('77', '1');
INSERT INTO `sys_roles_menus` VALUES ('78', '1');
INSERT INTO `sys_roles_menus` VALUES ('79', '1');
INSERT INTO `sys_roles_menus` VALUES ('80', '1');
INSERT INTO `sys_roles_menus` VALUES ('82', '1');
INSERT INTO `sys_roles_menus` VALUES ('83', '1');
INSERT INTO `sys_roles_menus` VALUES ('92', '1');
INSERT INTO `sys_roles_menus` VALUES ('93', '1');
INSERT INTO `sys_roles_menus` VALUES ('94', '1');
INSERT INTO `sys_roles_menus` VALUES ('97', '1');
INSERT INTO `sys_roles_menus` VALUES ('98', '1');
INSERT INTO `sys_roles_menus` VALUES ('102', '1');
INSERT INTO `sys_roles_menus` VALUES ('103', '1');
INSERT INTO `sys_roles_menus` VALUES ('104', '1');
INSERT INTO `sys_roles_menus` VALUES ('105', '1');
INSERT INTO `sys_roles_menus` VALUES ('106', '1');
INSERT INTO `sys_roles_menus` VALUES ('107', '1');
INSERT INTO `sys_roles_menus` VALUES ('108', '1');
INSERT INTO `sys_roles_menus` VALUES ('109', '1');
INSERT INTO `sys_roles_menus` VALUES ('110', '1');
INSERT INTO `sys_roles_menus` VALUES ('111', '1');
INSERT INTO `sys_roles_menus` VALUES ('112', '1');
INSERT INTO `sys_roles_menus` VALUES ('113', '1');
INSERT INTO `sys_roles_menus` VALUES ('114', '1');
INSERT INTO `sys_roles_menus` VALUES ('116', '1');
INSERT INTO `sys_roles_menus` VALUES ('118', '1');
INSERT INTO `sys_roles_menus` VALUES ('121', '1');
INSERT INTO `sys_roles_menus` VALUES ('153', '1');
INSERT INTO `sys_roles_menus` VALUES ('154', '1');
INSERT INTO `sys_roles_menus` VALUES ('155', '1');
INSERT INTO `sys_roles_menus` VALUES ('156', '1');
INSERT INTO `sys_roles_menus` VALUES ('157', '1');
INSERT INTO `sys_roles_menus` VALUES ('158', '1');
INSERT INTO `sys_roles_menus` VALUES ('159', '1');
INSERT INTO `sys_roles_menus` VALUES ('160', '1');
INSERT INTO `sys_roles_menus` VALUES ('161', '1');
INSERT INTO `sys_roles_menus` VALUES ('162', '1');
INSERT INTO `sys_roles_menus` VALUES ('163', '1');
INSERT INTO `sys_roles_menus` VALUES ('164', '1');
INSERT INTO `sys_roles_menus` VALUES ('187', '1');
INSERT INTO `sys_roles_menus` VALUES ('1', '2');
INSERT INTO `sys_roles_menus` VALUES ('2', '2');
INSERT INTO `sys_roles_menus` VALUES ('3', '2');
INSERT INTO `sys_roles_menus` VALUES ('5', '2');
INSERT INTO `sys_roles_menus` VALUES ('6', '2');
INSERT INTO `sys_roles_menus` VALUES ('7', '2');
INSERT INTO `sys_roles_menus` VALUES ('10', '2');
INSERT INTO `sys_roles_menus` VALUES ('11', '2');
INSERT INTO `sys_roles_menus` VALUES ('14', '2');
INSERT INTO `sys_roles_menus` VALUES ('15', '2');
INSERT INTO `sys_roles_menus` VALUES ('18', '2');
INSERT INTO `sys_roles_menus` VALUES ('19', '2');
INSERT INTO `sys_roles_menus` VALUES ('21', '2');
INSERT INTO `sys_roles_menus` VALUES ('22', '2');
INSERT INTO `sys_roles_menus` VALUES ('23', '2');
INSERT INTO `sys_roles_menus` VALUES ('24', '2');
INSERT INTO `sys_roles_menus` VALUES ('27', '2');
INSERT INTO `sys_roles_menus` VALUES ('28', '2');
INSERT INTO `sys_roles_menus` VALUES ('32', '2');
INSERT INTO `sys_roles_menus` VALUES ('33', '2');
INSERT INTO `sys_roles_menus` VALUES ('34', '2');
INSERT INTO `sys_roles_menus` VALUES ('35', '2');
INSERT INTO `sys_roles_menus` VALUES ('36', '2');
INSERT INTO `sys_roles_menus` VALUES ('37', '2');
INSERT INTO `sys_roles_menus` VALUES ('38', '2');
INSERT INTO `sys_roles_menus` VALUES ('39', '2');
INSERT INTO `sys_roles_menus` VALUES ('41', '2');
INSERT INTO `sys_roles_menus` VALUES ('44', '2');
INSERT INTO `sys_roles_menus` VALUES ('60', '2');
INSERT INTO `sys_roles_menus` VALUES ('61', '2');
INSERT INTO `sys_roles_menus` VALUES ('64', '2');
INSERT INTO `sys_roles_menus` VALUES ('80', '2');
INSERT INTO `sys_roles_menus` VALUES ('83', '2');
INSERT INTO `sys_roles_menus` VALUES ('92', '2');
INSERT INTO `sys_roles_menus` VALUES ('118', '2');
INSERT INTO `sys_roles_menus` VALUES ('121', '2');
INSERT INTO `sys_roles_menus` VALUES ('153', '2');
INSERT INTO `sys_roles_menus` VALUES ('154', '2');
INSERT INTO `sys_roles_menus` VALUES ('155', '2');
INSERT INTO `sys_roles_menus` VALUES ('156', '2');
INSERT INTO `sys_roles_menus` VALUES ('157', '2');
INSERT INTO `sys_roles_menus` VALUES ('158', '2');
INSERT INTO `sys_roles_menus` VALUES ('159', '2');
INSERT INTO `sys_roles_menus` VALUES ('160', '2');
INSERT INTO `sys_roles_menus` VALUES ('161', '2');
INSERT INTO `sys_roles_menus` VALUES ('163', '2');
INSERT INTO `sys_roles_menus` VALUES ('164', '2');
INSERT INTO `sys_roles_menus` VALUES ('6', '3');
INSERT INTO `sys_roles_menus` VALUES ('21', '3');
INSERT INTO `sys_roles_menus` VALUES ('36', '3');
INSERT INTO `sys_roles_menus` VALUES ('121', '3');
INSERT INTO `sys_roles_menus` VALUES ('153', '3');
INSERT INTO `sys_roles_menus` VALUES ('154', '3');
INSERT INTO `sys_roles_menus` VALUES ('155', '3');
INSERT INTO `sys_roles_menus` VALUES ('156', '3');
INSERT INTO `sys_roles_menus` VALUES ('1', '4');
INSERT INTO `sys_roles_menus` VALUES ('2', '4');
INSERT INTO `sys_roles_menus` VALUES ('3', '4');
INSERT INTO `sys_roles_menus` VALUES ('5', '4');
INSERT INTO `sys_roles_menus` VALUES ('6', '4');
INSERT INTO `sys_roles_menus` VALUES ('7', '4');
INSERT INTO `sys_roles_menus` VALUES ('21', '4');
INSERT INTO `sys_roles_menus` VALUES ('22', '4');
INSERT INTO `sys_roles_menus` VALUES ('23', '4');
INSERT INTO `sys_roles_menus` VALUES ('24', '4');
INSERT INTO `sys_roles_menus` VALUES ('27', '4');
INSERT INTO `sys_roles_menus` VALUES ('30', '4');
INSERT INTO `sys_roles_menus` VALUES ('32', '4');
INSERT INTO `sys_roles_menus` VALUES ('35', '4');
INSERT INTO `sys_roles_menus` VALUES ('36', '4');
INSERT INTO `sys_roles_menus` VALUES ('37', '4');
INSERT INTO `sys_roles_menus` VALUES ('39', '4');
INSERT INTO `sys_roles_menus` VALUES ('41', '4');
INSERT INTO `sys_roles_menus` VALUES ('44', '4');
INSERT INTO `sys_roles_menus` VALUES ('45', '4');
INSERT INTO `sys_roles_menus` VALUES ('48', '4');
INSERT INTO `sys_roles_menus` VALUES ('49', '4');
INSERT INTO `sys_roles_menus` VALUES ('53', '4');
INSERT INTO `sys_roles_menus` VALUES ('56', '4');
INSERT INTO `sys_roles_menus` VALUES ('57', '4');
INSERT INTO `sys_roles_menus` VALUES ('61', '4');
INSERT INTO `sys_roles_menus` VALUES ('80', '4');
INSERT INTO `sys_roles_menus` VALUES ('118', '4');
INSERT INTO `sys_roles_menus` VALUES ('121', '4');
INSERT INTO `sys_roles_menus` VALUES ('153', '4');
INSERT INTO `sys_roles_menus` VALUES ('154', '4');
INSERT INTO `sys_roles_menus` VALUES ('155', '4');
INSERT INTO `sys_roles_menus` VALUES ('156', '4');
INSERT INTO `sys_roles_menus` VALUES ('157', '4');
INSERT INTO `sys_roles_menus` VALUES ('163', '4');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(150) NOT NULL COMMENT '用户名',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) NOT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(150) DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `pwd_reset_time` datetime DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `create_by` varchar(255) NOT NULL COMMENT '创建者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新着',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'admin', '男', '18888888888', '201507802', 'avatar-2021010504071782.png', 'C:\\coadmin\\avatar\\avatar-2021010504071782.png', '$2a$10$teIV/KA8s2lqN/Gaiqxnm.dK5d8Ld/mH/NYtMGQVIF3Yhb/xrAif2', '', '', '2021-01-05 16:09:45', '2018-08-23 09:11:56', 'admin', '2021-01-05 16:09:45', 'admin');
INSERT INTO `sys_user` VALUES ('4', 'jinjin', '吕进华', '男', '13800138002', 'jinjin@gmail.com', 'avatar-20201011111043576.png', 'C:\\coadmin\\avatar\\avatar-20201011111043576.png', '$2a$10$vklJaXZ6mUbYc9ulI0uuVOUVUHBr/49l7jYifZdXadLM84cdh9Qjm', '\0', '', '2021-11-18 11:19:48', '2020-09-26 17:19:53', 'admin', '2021-11-18 14:32:08', 'admin');
INSERT INTO `sys_user` VALUES ('8', 'wwe', null, '男', null, null, 'avatar-20201011111043576.png', 'C:\\coadmin\\avatar\\avatar-20201011111043576.png', '$2a$10$HVx1E.n1BHJVXwSrfFDrAe3PqOqdQHFIW77XCdCc8tXqNDv7cdZk2', '\0', '', '2021-11-18 11:19:48', '2021-11-23 15:03:04', 'admin', '2021-11-23 15:03:19', 'admin');

-- ----------------------------
-- Table structure for sys_users_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_depts`;
CREATE TABLE `sys_users_depts` (
  `user_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户-机构关联';

-- ----------------------------
-- Records of sys_users_depts
-- ----------------------------
INSERT INTO `sys_users_depts` VALUES ('1', '7');
INSERT INTO `sys_users_depts` VALUES ('1', '8');
INSERT INTO `sys_users_depts` VALUES ('1', '41');
INSERT INTO `sys_users_depts` VALUES ('4', '7');
INSERT INTO `sys_users_depts` VALUES ('8', '5');

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
INSERT INTO `sys_users_jobs` VALUES ('1', '11');
INSERT INTO `sys_users_jobs` VALUES ('4', '10');
INSERT INTO `sys_users_jobs` VALUES ('4', '12');
INSERT INTO `sys_users_jobs` VALUES ('8', '10');
INSERT INTO `sys_users_jobs` VALUES ('8', '11');

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE,
  KEY `FKq4eq273l04bpu4efj0jd0jb98` (`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户角色关联';

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES ('1', '1');
INSERT INTO `sys_users_roles` VALUES ('4', '1');
INSERT INTO `sys_users_roles` VALUES ('8', '2');

-- ----------------------------
-- Table structure for test_person
-- ----------------------------
DROP TABLE IF EXISTS `test_person`;
CREATE TABLE `test_person` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL COMMENT '姓名',
  `gender` varchar(8) DEFAULT NULL COMMENT '性别（男、女、未知）',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `mysql_engine` tinyint(4) DEFAULT NULL COMMENT '测试enum',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(100) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(100) DEFAULT NULL COMMENT '修改人',
  `remarks` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='测试表';

-- ----------------------------
-- Records of test_person
-- ----------------------------
INSERT INTO `test_person` VALUES ('1419195907637448706', '你倒是', '男', '2020-07-01', '30', '2021-07-25 15:20:46', null, '2021-08-22 10:12:39', 'admin', '无');
INSERT INTO `test_person` VALUES ('1429265607297781761', '测试', '男', '2021-08-04', '10', '2021-08-22 10:14:10', 'admin', null, null, '对对对');
INSERT INTO `test_person` VALUES ('1429267665325281282', '女生', '女', '2021-08-06', '20', '2021-08-22 10:22:21', null, '2021-08-22 10:26:33', 'admin', '好好');
INSERT INTO `test_person` VALUES ('1439775378803159041', '新民2', '女', '2021-09-07', null, '2021-09-20 10:16:15', 'admin', '2021-09-20 10:16:32', 'admin', null);

-- ----------------------------
-- Table structure for tool_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_alipay_config`;
CREATE TABLE `tool_alipay_config` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `app_id` varchar(255) DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) DEFAULT NULL COMMENT '编码',
  `format` varchar(255) DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) DEFAULT NULL COMMENT '异步回调',
  `private_key` text COMMENT '私钥',
  `public_key` text COMMENT '公钥',
  `return_url` varchar(255) DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='支付宝配置类';

-- ----------------------------
-- Records of tool_alipay_config
-- ----------------------------
INSERT INTO `tool_alipay_config` VALUES ('1', '2016091700532697', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://api.auauz.net/api/aliPay/notify', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQC5js8sInU10AJ0cAQ8UMMyXrQ+oHZEkVt5lBwsStmTJ7YikVYgbskx1YYEXTojRsWCb+SH/kDmDU4pK/u91SJ4KFCRMF2411piYuXU/jF96zKrADznYh/zAraqT6hvAIVtQAlMHN53nx16rLzZ/8jDEkaSwT7+HvHiS+7sxSojnu/3oV7BtgISoUNstmSe8WpWHOaWv19xyS+Mce9MY4BfseFhzTICUymUQdd/8hXA28/H6osUfAgsnxAKv7Wil3aJSgaJczWuflYOve0dJ3InZkhw5Cvr0atwpk8YKBQjy5CdkoHqvkOcIB+cYHXJKzOE5tqU7inSwVbHzOLQ3XbnAgMBAAECggEAVJp5eT0Ixg1eYSqFs9568WdetUNCSUchNxDBu6wxAbhUgfRUGZuJnnAll63OCTGGck+EGkFh48JjRcBpGoeoHLL88QXlZZbC/iLrea6gcDIhuvfzzOffe1RcZtDFEj9hlotg8dQj1tS0gy9pN9g4+EBH7zeu+fyv+qb2e/v1l6FkISXUjpkD7RLQr3ykjiiEw9BpeKb7j5s7Kdx1NNIzhkcQKNqlk8JrTGDNInbDM6inZfwwIO2R1DHinwdfKWkvOTODTYa2MoAvVMFT9Bec9FbLpoWp7ogv1JMV9svgrcF9XLzANZ/OQvkbe9TV9GWYvIbxN6qwQioKCWO4GPnCAQKBgQDgW5MgfhX8yjXqoaUy/d1VjI8dHeIyw8d+OBAYwaxRSlCfyQ+tieWcR2HdTzPca0T0GkWcKZm0ei5xRURgxt4DUDLXNh26HG0qObbtLJdu/AuBUuCqgOiLqJ2f1uIbrz6OZUHns+bT/jGW2Ws8+C13zTCZkZt9CaQsrp3QOGDx5wKBgQDTul39hp3ZPwGNFeZdkGoUoViOSd5Lhowd5wYMGAEXWRLlU8z+smT5v0POz9JnIbCRchIY2FAPKRdVTICzmPk2EPJFxYTcwaNbVqL6lN7J2IlXXMiit5QbiLauo55w7plwV6LQmKm9KV7JsZs5XwqF7CEovI7GevFzyD3w+uizAQKBgC3LY1eRhOlpWOIAhpjG6qOoohmeXOphvdmMlfSHq6WYFqbWwmV4rS5d/6LNpNdL6fItXqIGd8I34jzql49taCmi+A2nlR/E559j0mvM20gjGDIYeZUz5MOE8k+K6/IcrhcgofgqZ2ZED1ksHdB/E8DNWCswZl16V1FrfvjeWSNnAoGAMrBplCrIW5xz+J0Hm9rZKrs+AkK5D4fUv8vxbK/KgxZ2KaUYbNm0xv39c+PZUYuFRCz1HDGdaSPDTE6WeWjkMQd5mS6ikl9hhpqFRkyh0d0fdGToO9yLftQKOGE/q3XUEktI1XvXF0xyPwNgUCnq0QkpHyGVZPtGFxwXiDvpvgECgYA5PoB+nY8iDiRaJNko9w0hL4AeKogwf+4TbCw+KWVEn6jhuJa4LFTdSqp89PktQaoVpwv92el/AhYjWOl/jVCm122f9b7GyoelbjMNolToDwe5pF5RnSpEuDdLy9MfE8LnE3PlbE7E5BipQ3UjSebkgNboLHH/lNZA5qvEtvbfvQ==', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAut9evKRuHJ/2QNfDlLwvN/S8l9hRAgPbb0u61bm4AtzaTGsLeMtScetxTWJnVvAVpMS9luhEJjt+Sbk5TNLArsgzzwARgaTKOLMT1TvWAK5EbHyI+eSrc3s7Awe1VYGwcubRFWDm16eQLv0k7iqiw+4mweHSz/wWyvBJVgwLoQ02btVtAQErCfSJCOmt0Q/oJQjj08YNRV4EKzB19+f5A+HQVAKy72dSybTzAK+3FPtTtNen/+b5wGeat7c32dhYHnGorPkPeXLtsqqUTp1su5fMfd4lElNdZaoCI7osZxWWUo17vBCZnyeXc9fk0qwD9mK6yRAxNbrY72Xx5VqIqwIDAQAB', 'http://api.auauz.net/api/aliPay/return', 'RSA2', '2088102176044281');

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `user` varchar(255) DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='邮箱配置';

-- ----------------------------
-- Records of tool_email_config
-- ----------------------------
INSERT INTO `tool_email_config` VALUES ('1', 'test@gmail.com', 'http://smtp.test.cn', '85A6CF07C91D9DAB', '33', 'test');

-- ----------------------------
-- Table structure for tool_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_local_storage`;
CREATE TABLE `tool_local_storage` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `real_name` varchar(255) DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) DEFAULT NULL COMMENT '路径',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `size` varchar(100) DEFAULT NULL COMMENT '大小',
  `create_by` varchar(255) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='本地存储';

-- ----------------------------
-- Records of tool_local_storage
-- ----------------------------
INSERT INTO `tool_local_storage` VALUES ('1408005497130364929', 'qq-tencent-20210624061404656.png', 'qq-tencent.png', 'png', 'C:\\coadmin\\file\\图片\\qq-tencent-20210624061404656.png', '图片', '8.90KB   ', 'admin', 'admin', '2021-06-24 18:14:05', '2021-06-24 18:14:05');

-- ----------------------------
-- Table structure for tool_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_config`;
CREATE TABLE `tool_qiniu_config` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `access_key` text COMMENT 'accessKey',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) NOT NULL COMMENT '外链域名',
  `secret_key` text COMMENT 'secretKey',
  `type` varchar(255) DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='七牛云配置';

-- ----------------------------
-- Records of tool_qiniu_config
-- ----------------------------
INSERT INTO `tool_qiniu_config` VALUES ('1', '33333', 'test', 'http://test.com', '44444', '私有', '华北');

-- ----------------------------
-- Table structure for tool_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_content`;
CREATE TABLE `tool_qiniu_content` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `bucket` varchar(255) DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(150) DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) DEFAULT NULL COMMENT '文件类型：私有或公开',
  `url` varchar(255) DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) DEFAULT NULL COMMENT '文件后缀',
  `update_time` datetime DEFAULT NULL COMMENT '上传或同步的时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uniq_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='七牛云文件存储';

-- ----------------------------
-- Records of tool_qiniu_content
-- ----------------------------
