/*
Navicat MySQL Data Transfer

Source Server         : Awary_He
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2018-01-17 08:59:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_code` varchar(50) default NULL,
  `role_name` varchar(50) default NULL,
  `role_info` varchar(50) default NULL,
  `ststus` int(11) default NULL,
  `menu_id` varchar(500) default NULL,
  `create_time` varchar(500) default NULL,
  `modify_time` varchar(500) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'administrator', '超级管理员', '最大权限', '1', '1,2,3,4,5,6,7', '2016-01-26 10:42:09', '2017-10-27 13:51:25');
INSERT INTO `role` VALUES ('23', 'CWZY', '财务专员', '对后台设计资金部分进行操作、维护', null, '1,2,3,4,5', '2016-02-01 19:27:59', '2017-03-14 08:52:00');
INSERT INTO `role` VALUES ('25', 'FWZY', '服务专员', '油卡业务服务', null, '1,2,3,4', '2016-02-01 19:38:01', '2016-05-16 14:49:43');
INSERT INTO `role` VALUES ('52', 'ys001', '营销管理员', '油卡管理', null, '1,2,3,4', '2016-03-18 14:54:22', '2017-04-07 16:23:18');
INSERT INTO `role` VALUES ('53', 'SJ-01', '审计', '对业务信息进行查询操作', null, '1,2,3,4', '2016-03-24 09:33:01', '2017-03-14 08:52:12');
INSERT INTO `role` VALUES ('54', 'test', '测试', '测试', null, '1,2,3,4', '2016-03-28 11:07:45', '2017-04-07 17:20:52');
INSERT INTO `role` VALUES ('55', 'servic01', '服务部主管', '建账号及油卡充值', null, '1,2,3,4', '2016-06-02 10:05:03', '2017-04-07 17:22:26');
INSERT INTO `role` VALUES ('56', 'YX02', '营销管理员2', '通行卡业务管理', null, '1,2,3,4', '2016-12-16 14:15:13', null);
INSERT INTO `role` VALUES ('57', 'kf-01', '客服', '在线客服提供咨询解答', null, '1,2,3,4', '2016-12-22 17:26:13', '2017-04-07 16:27:03');
INSERT INTO `role` VALUES ('58', 'YF-03', '产品经理', '体验平台新增功能', null, '1,2,3,4', '2016-12-23 10:26:40', '2017-04-07 16:30:52');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(20) NOT NULL auto_increment,
  `user_name` varchar(255) character set latin1 default NULL,
  `user_phone` varchar(255) character set latin1 default NULL,
  `user_email` varchar(255) character set latin1 default NULL,
  `user_pwd` varchar(255) character set latin1 default NULL,
  `create_time` varchar(255) collate utf8_unicode_ci default NULL,
  `modify_time` varchar(255) collate utf8_unicode_ci default NULL,
  `is_delete` smallint(6) default NULL,
  `QQ` varchar(255) character set latin1 default NULL,
  `status` int(10) default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `user_sex` varchar(255) collate utf8_unicode_ci default NULL,
  `role_id` int(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'zhangsan', '13840328681', '809958766@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-06-28', '2017-06-28', '14245', '809958766', '0', '无锡新区', '男', '1');
INSERT INTO `t_user` VALUES ('2', 'lisi', '13840328682', '705757205@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-06-28', '2017-06-28', '7575', '809958766', '0', '苏州吴江区', '女', '3');
INSERT INTO `t_user` VALUES ('3', 'wangwu', '13664345345', '457552424@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-14', '2017-09-14', '4445', '809958766', '0', '无锡南长区', '男', '2');
INSERT INTO `t_user` VALUES ('4', 'lilei', '13664345342', '324354646@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '2017-09-14', '2017-09-13', '4444', '809958766', '0', '苏州', '女', '4');
