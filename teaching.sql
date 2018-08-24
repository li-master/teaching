/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : teaching

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-08-22 13:42:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名',
  `url` varchar(100) DEFAULT NULL COMMENT '菜单url',
  `perm` varchar(100) DEFAULT NULL COMMENT '权限',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '用户管理', '/home/user', 'home:user', null);
INSERT INTO `sys_menu` VALUES ('2', '系统用户', '/home/user?type=1', 'home:user:1', '1');
INSERT INTO `sys_menu` VALUES ('3', '教务', '/home/user?type=2', 'home:user:2', '1');
INSERT INTO `sys_menu` VALUES ('4', '学生', '/home/user?type=3', 'home:user:3', '1');
INSERT INTO `sys_menu` VALUES ('5', '用户增加', null, 'home:user:add', '1');
INSERT INTO `sys_menu` VALUES ('7', '用户修改', null, 'home:user:update', '1');
INSERT INTO `sys_menu` VALUES ('8', '用户删除', null, 'home:user:delete', '1');
INSERT INTO `sys_menu` VALUES ('11', '教学资源', '/home/source', 'home:source', null);
INSERT INTO `sys_menu` VALUES ('12', '资源', '/home/source/list', 'home:source', '11');
INSERT INTO `sys_menu` VALUES ('13', '学籍管理', '/home/source/list', 'home:guanlis', null);
INSERT INTO `sys_menu` VALUES ('14', '教学计划', '/home/source/list', 'home:jihua', null);
INSERT INTO `sys_menu` VALUES ('15', '开课/排课管理', '/home/source/list', 'home:paike', null);
INSERT INTO `sys_menu` VALUES ('16', '选课管理', '/home/source/list', 'home:xuanke', null);
INSERT INTO `sys_menu` VALUES ('17', '考勤', '/home/source/list', 'home:kaoqin', '21');
INSERT INTO `sys_menu` VALUES ('18', '教材管理', '/home/source/list', 'home:jiaocai', null);
INSERT INTO `sys_menu` VALUES ('19', '作业', '/home/source/list', 'home:zuoye', '21');
INSERT INTO `sys_menu` VALUES ('20', '月考', '/home/source/list', 'home:yuekao', '21');
INSERT INTO `sys_menu` VALUES ('21', '报表', '/home/source/list', 'home:baobiao', null);
INSERT INTO `sys_menu` VALUES ('22', '学籍', '/home/source/list', 'home:xue', '13');
INSERT INTO `sys_menu` VALUES ('23', '计划', '/home/source/list', 'home:ji', '14');
INSERT INTO `sys_menu` VALUES ('24', '开课', '/home/source/list', 'home:kai', '15');
INSERT INTO `sys_menu` VALUES ('25', '排课', '/home/source/list', 'home:pai', '15');
INSERT INTO `sys_menu` VALUES ('26', '选课', '/home/source/list', 'home:xuan', '16');
INSERT INTO `sys_menu` VALUES ('27', '教材', '/home/source/list', 'home:jiao', '18');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员');
INSERT INTO `sys_role` VALUES ('2', '学生');
INSERT INTO `sys_role` VALUES ('3', '老师');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FK_roleMenu_menu` (`menu_id`),
  CONSTRAINT `FK_roleMenu_menu` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`),
  CONSTRAINT `FK_role_menu` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '5');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '8');
INSERT INTO `sys_role_menu` VALUES ('1', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('1', '12');
INSERT INTO `sys_role_menu` VALUES ('2', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '15');
INSERT INTO `sys_role_menu` VALUES ('1', '16');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '18');
INSERT INTO `sys_role_menu` VALUES ('1', '19');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '21');
INSERT INTO `sys_role_menu` VALUES ('1', '22');
INSERT INTO `sys_role_menu` VALUES ('1', '23');
INSERT INTO `sys_role_menu` VALUES ('1', '24');
INSERT INTO `sys_role_menu` VALUES ('1', '25');
INSERT INTO `sys_role_menu` VALUES ('1', '26');
INSERT INTO `sys_role_menu` VALUES ('1', '27');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `login_username` varchar(50) DEFAULT NULL COMMENT '登录名',
  `login_password` varchar(50) DEFAULT NULL COMMENT '密码',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '2', '33', '223', '2018-08-06 13:29:47');
INSERT INTO `sys_user` VALUES ('2', '皮卡奥西亚', '皮卡奥西亚', '123', '2018-08-22 09:46:51');
INSERT INTO `sys_user` VALUES ('3', '氪*达斯布冲', '氪*达斯布冲', '123', '2018-08-22 09:49:04');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_userRole_role` (`role_id`),
  CONSTRAINT `FK_userRole_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`),
  CONSTRAINT `FK_user_role` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '3');

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '张三');


-- ----------------------------
-- Table structure for teach_plan
-- ----------------------------
DROP TABLE IF EXISTS `teach_plan`;
CREATE TABLE `teach_plan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '计划名称',
  `content` longtext COMMENT '计划类容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teach_plan
-- ----------------------------
INSERT INTO `teach_plan` VALUES ('1', '2', '123');
INSERT INTO `teach_plan` VALUES ('2', 'ces', 'saf');

