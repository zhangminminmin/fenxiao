/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : fenxiao

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-12-04 17:09:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_config`
-- ----------------------------
DROP TABLE IF EXISTS `admin_config`;
CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_config
-- ----------------------------
INSERT INTO `admin_config` VALUES ('1', '__configx__', 'do not delete', '{\"base.parent_id\":{\"options\":[],\"element\":\"rate\",\"help\":null,\"name\":\"\\u4e00\\u7ea7\\u8fd4\\u4f63\\u6bd4\\u4f8b\",\"order\":5},\"base.parent_two_id\":{\"options\":[],\"element\":\"rate\",\"help\":null,\"name\":\"\\u4e8c\\u7ea7\\u5206\\u4f63\\u6bd4\\u4f8b\",\"order\":10},\"__configx_tabs__\":{\"options\":{\"base\":\"\\u57fa\\u672c\\u8bbe\\u7f6e\",\"uplaod\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\"}},\"uplaod.register_deal\":{\"options\":[],\"element\":\"editor\",\"help\":null,\"name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"order\":5},\"base.kefu_path\":{\"options\":[],\"element\":\"textarea\",\"help\":null,\"name\":\"\\u5728\\u7ebf\\u5ba2\\u670d\\u94fe\\u63a5\",\"order\":15},\"base.kefu_mobile\":{\"options\":[],\"element\":\"normal\",\"help\":null,\"name\":\"\\u5ba2\\u670d\\u7535\\u8bdd\",\"order\":20},\"uplaod.about_us\":{\"options\":[],\"element\":\"editor\",\"help\":null,\"name\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"order\":10},\"uplaod.user_deal\":{\"options\":[],\"element\":\"editor\",\"help\":null,\"name\":\"\\u7528\\u6237\\u534f\\u8bae\",\"order\":15},\"base.banner\":{\"options\":[],\"element\":\"image\",\"help\":null,\"name\":\"\\u9996\\u9875\\u9876\\u7aefbanner\\u56fe\",\"order\":25},\"base.ios_path\":{\"options\":[],\"element\":\"textarea\",\"help\":null,\"name\":\"ios\\u4e0b\\u8f7d\\u94fe\\u63a5\",\"order\":30},\"base.andr_path\":{\"options\":[],\"element\":\"textarea\",\"help\":null,\"name\":\"\\u5b89\\u5353\\u4e0b\\u8f7d\\u94fe\\u63a5\",\"order\":35},\"base.versions_code\":{\"options\":[],\"element\":\"normal\",\"help\":null,\"name\":\"\\u7248\\u672c\\u53f7\",\"order\":40}}', '2020-12-01 06:49:21', '2020-12-04 09:00:50');
INSERT INTO `admin_config` VALUES ('7', 'base.parent_two_id', '10', '二级分佣比例', '2020-12-02 03:57:20', '2020-12-02 03:57:33');
INSERT INTO `admin_config` VALUES ('6', 'base.parent_id', '20', '一级返佣比例', '2020-12-02 03:55:30', '2020-12-02 03:57:33');
INSERT INTO `admin_config` VALUES ('9', 'uplaod.register_deal', '<p>注册协议</p><p><img src=\"http://fenxiao.com/storage/uploads/image/2020/12/03/img_logo@2x.png\" title=\"/uploads/image/2020/12/03/img_logo@2x.png\" alt=\"img_logo@2x.png\"/></p>', '注册协议', '2020-12-03 05:43:51', '2020-12-03 09:25:44');
INSERT INTO `admin_config` VALUES ('11', 'base.kefu_path', 'http://www.baidu.com', '在线客服链接', '2020-12-03 09:07:32', '2020-12-03 09:09:23');
INSERT INTO `admin_config` VALUES ('12', 'base.kefu_mobile', '18715465555', '客服电话', '2020-12-03 09:08:55', '2020-12-03 09:09:23');
INSERT INTO `admin_config` VALUES ('13', 'uplaod.about_us', '<p>关于我们</p>', '关于我们', '2020-12-03 09:10:24', '2020-12-03 09:10:36');
INSERT INTO `admin_config` VALUES ('14', 'uplaod.user_deal', '<p>用户协议</p>', '用户协议', '2020-12-03 09:11:05', '2020-12-03 09:11:14');
INSERT INTO `admin_config` VALUES ('15', 'base.banner', 'images/76954ff102dd37e6d8da511e5c6853e2.png', '首页顶端banner图', '2020-12-04 01:05:12', '2020-12-04 01:07:15');
INSERT INTO `admin_config` VALUES ('16', 'base.ios_path', '1', 'ios下载链接', '2020-12-04 08:59:30', '2020-12-04 08:59:30');
INSERT INTO `admin_config` VALUES ('17', 'base.andr_path', '1', '安卓下载链接', '2020-12-04 09:00:13', '2020-12-04 09:00:13');
INSERT INTO `admin_config` VALUES ('18', 'base.versions_code', 'V1.0', '版本号', '2020-12-04 09:00:50', '2020-12-04 09:01:03');

-- ----------------------------
-- Table structure for `admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-home', '/', null, null, '2020-12-01 06:43:36');
INSERT INTO `admin_menu` VALUES ('2', '0', '2', '系统管理', 'fa-cogs', null, null, null, '2020-12-01 06:43:06');
INSERT INTO `admin_menu` VALUES ('3', '2', '3', '管理员管理', 'fa-users', 'auth/users', null, null, null);
INSERT INTO `admin_menu` VALUES ('4', '2', '4', '角色管理', 'fa-user', 'auth/roles', null, null, null);
INSERT INTO `admin_menu` VALUES ('5', '2', '5', '权限管理', 'fa-ban', 'auth/permissions', null, null, null);
INSERT INTO `admin_menu` VALUES ('6', '2', '6', '菜单管理', 'fa-bars', 'auth/menu', null, null, null);
INSERT INTO `admin_menu` VALUES ('7', '2', '7', '操作权限', 'fa-history', 'auth/logs', null, null, null);
INSERT INTO `admin_menu` VALUES ('9', '0', '9', '网站配置', 'fa-arrows-alt', 'configx/edit', null, '2020-12-01 06:48:44', '2020-12-01 06:58:48');
INSERT INTO `admin_menu` VALUES ('11', '0', '0', '数据管理', 'fa-area-chart', 'orders', null, '2020-12-02 03:06:58', '2020-12-02 03:06:58');

-- ----------------------------
-- Table structure for `admin_operation_log`
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:20:06', '2020-12-01 06:20:06');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:20:10', '2020-12-01 06:20:10');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:20:14', '2020-12-01 06:20:14');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:21:10', '2020-12-01 06:21:10');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:32:28', '2020-12-01 06:32:28');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:35:55', '2020-12-01 06:35:55');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:37:20', '2020-12-01 06:37:20');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:37:24', '2020-12-01 06:37:24');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:39:21', '2020-12-01 06:39:21');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:39:30', '2020-12-01 06:39:30');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:39:37', '2020-12-01 06:39:37');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:39:39', '2020-12-01 06:39:39');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:39:41', '2020-12-01 06:39:41');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:40:14', '2020-12-01 06:40:14');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:41:43', '2020-12-01 06:41:43');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:41:45', '2020-12-01 06:41:45');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:41:52', '2020-12-01 06:41:52');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu/2/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:41:55', '2020-12-01 06:41:55');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu/2', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-cogs\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/fenxiao.com\\/admin\\/auth\\/menu\"}', '2020-12-01 06:43:06', '2020-12-01 06:43:06');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:43:06', '2020-12-01 06:43:06');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:43:11', '2020-12-01 06:43:11');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:43:16', '2020-12-01 06:43:16');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:43:20', '2020-12-01 06:43:20');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:43:23', '2020-12-01 06:43:23');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/menu/1', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-home\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/fenxiao.com\\/admin\\/auth\\/menu\"}', '2020-12-01 06:43:36', '2020-12-01 06:43:36');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:43:36', '2020-12-01 06:43:36');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:43:40', '2020-12-01 06:43:40');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:47:14', '2020-12-01 06:47:14');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/config', 'GET', '127.0.0.1', '[]', '2020-12-01 06:47:17', '2020-12-01 06:47:17');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/config/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:47:26', '2020-12-01 06:47:26');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin/config', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:47:29', '2020-12-01 06:47:29');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:49:21', '2020-12-01 06:49:21');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:49:28', '2020-12-01 06:49:28');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:49:30', '2020-12-01 06:49:30');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:49:33', '2020-12-01 06:49:33');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:49:36', '2020-12-01 06:49:36');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:49:38', '2020-12-01 06:49:38');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:49:42', '2020-12-01 06:49:42');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:51:22', '2020-12-01 06:51:22');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:51:34', '2020-12-01 06:51:34');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"tabs_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:51:38', '2020-12-01 06:51:38');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:51:41', '2020-12-01 06:51:41');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:11', '2020-12-01 06:52:11');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:11', '2020-12-01 06:52:11');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:13', '2020-12-01 06:52:13');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:25', '2020-12-01 06:52:25');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:30', '2020-12-01 06:52:30');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.new_key_here\",\"c_name\":\"s\",\"c_element\":\"image\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:52:43', '2020-12-01 06:52:43');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-01 06:52:43', '2020-12-01 06:52:43');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:48', '2020-12-01 06:52:48');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-01 06:52:50', '2020-12-01 06:52:50');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:50', '2020-12-01 06:52:50');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:51', '2020-12-01 06:52:51');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:51', '2020-12-01 06:52:51');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:52', '2020-12-01 06:52:52');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:53', '2020-12-01 06:52:53');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:53', '2020-12-01 06:52:53');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:52:54', '2020-12-01 06:52:54');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:52:54', '2020-12-01 06:52:54');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:52:55', '2020-12-01 06:52:55');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:52:56', '2020-12-01 06:52:56');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:52:58', '2020-12-01 06:52:58');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:52:59', '2020-12-01 06:52:59');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:00', '2020-12-01 06:53:00');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:01', '2020-12-01 06:53:01');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:02', '2020-12-01 06:53:02');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:03', '2020-12-01 06:53:03');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:05', '2020-12-01 06:53:05');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:06', '2020-12-01 06:53:06');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:07', '2020-12-01 06:53:07');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:08', '2020-12-01 06:53:08');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:09', '2020-12-01 06:53:09');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:10', '2020-12-01 06:53:10');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:12', '2020-12-01 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:53:12', '2020-12-01 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:54:29', '2020-12-01 06:54:29');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 06:54:31', '2020-12-01 06:54:31');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:54:33', '2020-12-01 06:54:33');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:54:41', '2020-12-01 06:54:41');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/config/2', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:54:44', '2020-12-01 06:54:44');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:54:44', '2020-12-01 06:54:44');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.new_key_here\",\"c_name\":\"banner\",\"c_element\":\"image\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:54:51', '2020-12-01 06:54:51');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-01 06:54:52', '2020-12-01 06:54:52');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:54:58', '2020-12-01 06:54:58');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 06:55:47', '2020-12-01 06:55:47');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:55:55', '2020-12-01 06:55:55');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/config/3', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:55:59', '2020-12-01 06:55:59');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:55:59', '2020-12-01 06:55:59');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.new_key_here\",\"c_name\":\"banner\",\"c_element\":\"image\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:56:08', '2020-12-01 06:56:08');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-01 06:56:08', '2020-12-01 06:56:08');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin/configx/sort', 'PUT', '127.0.0.1', '{\"data\":[{\"id\":\"4\"}],\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_method\":\"PUT\"}', '2020-12-01 06:56:16', '2020-12-01 06:56:16');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:56:18', '2020-12-01 06:56:18');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"tabindex\":\"0\",\"do\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:57:03', '2020-12-01 06:57:03');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-01 06:57:03', '2020-12-01 06:57:03');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:57:16', '2020-12-01 06:57:16');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:57:17', '2020-12-01 06:57:17');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:57:18', '2020-12-01 06:57:18');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:57:19', '2020-12-01 06:57:19');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:57:19', '2020-12-01 06:57:19');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:57:55', '2020-12-01 06:57:55');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:58:05', '2020-12-01 06:58:05');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/auth/menu/8', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:58:10', '2020-12-01 06:58:10');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:58:10', '2020-12-01 06:58:10');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:58:13', '2020-12-01 06:58:13');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\",\"icon\":\"fa-toggle-on\",\"uri\":\"configx\\/edit\",\"roles\":[null],\"permission\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/fenxiao.com\\/admin\\/auth\\/menu\"}', '2020-12-01 06:58:25', '2020-12-01 06:58:25');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:58:25', '2020-12-01 06:58:25');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:58:29', '2020-12-01 06:58:29');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/auth/menu/9/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:58:37', '2020-12-01 06:58:37');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/auth/menu/9', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\",\"icon\":\"fa-arrows-alt\",\"uri\":\"configx\\/edit\",\"roles\":[null],\"permission\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/fenxiao.com\\/admin\\/auth\\/menu\"}', '2020-12-01 06:58:47', '2020-12-01 06:58:47');
INSERT INTO `admin_operation_log` VALUES ('110', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:58:48', '2020-12-01 06:58:48');
INSERT INTO `admin_operation_log` VALUES ('111', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:58:50', '2020-12-01 06:58:50');
INSERT INTO `admin_operation_log` VALUES ('112', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 06:58:54', '2020-12-01 06:58:54');
INSERT INTO `admin_operation_log` VALUES ('113', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:58:58', '2020-12-01 06:58:58');
INSERT INTO `admin_operation_log` VALUES ('114', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:04', '2020-12-01 06:59:04');
INSERT INTO `admin_operation_log` VALUES ('115', '1', 'admin/config/4', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 06:59:06', '2020-12-01 06:59:06');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:07', '2020-12-01 06:59:07');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:16', '2020-12-01 06:59:16');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:39', '2020-12-01 06:59:39');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:41', '2020-12-01 06:59:41');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:45', '2020-12-01 06:59:45');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 06:59:57', '2020-12-01 06:59:57');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 07:00:02', '2020-12-01 07:00:02');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:09:21', '2020-12-01 07:09:21');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:09:23', '2020-12-01 07:09:23');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:09:25', '2020-12-01 07:09:25');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:09:26', '2020-12-01 07:09:26');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:09:27', '2020-12-01 07:09:27');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:09:52', '2020-12-01 07:09:52');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:16:51', '2020-12-01 07:16:51');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:16:52', '2020-12-01 07:16:52');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:16:53', '2020-12-01 07:16:53');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:16:54', '2020-12-01 07:16:54');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:16:58', '2020-12-01 07:16:58');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:16:58', '2020-12-01 07:16:58');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:00', '2020-12-01 07:17:00');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:04', '2020-12-01 07:17:04');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:07', '2020-12-01 07:17:07');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:09', '2020-12-01 07:17:09');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:48', '2020-12-01 07:17:48');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:49', '2020-12-01 07:17:49');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:51', '2020-12-01 07:17:51');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:53', '2020-12-01 07:17:53');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:55', '2020-12-01 07:17:55');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:57', '2020-12-01 07:17:57');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:17:58', '2020-12-01 07:17:58');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:18:01', '2020-12-01 07:18:01');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:20:58', '2020-12-01 07:20:58');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:21:02', '2020-12-01 07:21:02');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d4b\\u8bd5\\u6570\\u636e\\u5217\\u8868\",\"icon\":\"fa-american-sign-language-interpreting\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 07:22:46', '2020-12-01 07:22:46');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:22:46', '2020-12-01 07:22:46');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:22:50', '2020-12-01 07:22:50');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:22:52', '2020-12-01 07:22:52');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:22:54', '2020-12-01 07:22:54');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:22:56', '2020-12-01 07:22:56');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:00', '2020-12-01 07:23:00');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:01', '2020-12-01 07:23:01');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:01', '2020-12-01 07:23:01');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:02', '2020-12-01 07:23:02');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/users/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:07', '2020-12-01 07:23:07');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:09', '2020-12-01 07:23:09');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:11', '2020-12-01 07:23:11');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:11', '2020-12-01 07:23:11');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:11', '2020-12-01 07:23:11');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:11', '2020-12-01 07:23:11');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:13', '2020-12-01 07:23:13');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:14', '2020-12-01 07:23:14');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:15', '2020-12-01 07:23:15');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:15', '2020-12-01 07:23:15');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:23:15', '2020-12-01 07:23:15');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 07:30:43', '2020-12-01 07:30:43');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:30:44', '2020-12-01 07:30:44');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:30:45', '2020-12-01 07:30:45');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:31:16', '2020-12-01 07:31:16');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/auth/menu/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:31:18', '2020-12-01 07:31:18');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/auth/menu/4', 'PUT', '127.0.0.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/fenxiao.com\\/admin\\/auth\\/menu\"}', '2020-12-01 07:31:27', '2020-12-01 07:31:27');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-01 07:31:27', '2020-12-01 07:31:27');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/auth/menu/5/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:31:30', '2020-12-01 07:31:30');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/auth/menu/5/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 07:32:09', '2020-12-01 07:32:09');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/auth/menu/5/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 07:32:09', '2020-12-01 07:32:09');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin/auth/menu/5/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 07:32:09', '2020-12-01 07:32:09');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:32:11', '2020-12-01 07:32:11');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:32:13', '2020-12-01 07:32:13');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:32:13', '2020-12-01 07:32:13');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 07:32:22', '2020-12-01 07:32:22');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:32:23', '2020-12-01 07:32:23');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:32:23', '2020-12-01 07:32:23');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:32:23', '2020-12-01 07:32:23');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:32:24', '2020-12-01 07:32:24');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 07:33:00', '2020-12-01 07:33:00');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:36:49', '2020-12-01 07:36:49');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:36:50', '2020-12-01 07:36:50');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:36:54', '2020-12-01 07:36:54');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:36:55', '2020-12-01 07:36:55');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:37:49', '2020-12-01 07:37:49');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:37:50', '2020-12-01 07:37:50');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:38:01', '2020-12-01 07:38:01');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:38:01', '2020-12-01 07:38:01');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:39:30', '2020-12-01 07:39:30');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:39:32', '2020-12-01 07:39:32');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:39:48', '2020-12-01 07:39:48');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:39:49', '2020-12-01 07:39:49');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:39:51', '2020-12-01 07:39:51');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 07:49:20', '2020-12-01 07:49:20');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 07:49:56', '2020-12-01 07:49:56');
INSERT INTO `admin_operation_log` VALUES ('205', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:50:22', '2020-12-01 07:50:22');
INSERT INTO `admin_operation_log` VALUES ('206', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 07:51:30', '2020-12-01 07:51:30');
INSERT INTO `admin_operation_log` VALUES ('207', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:51:42', '2020-12-01 07:51:42');
INSERT INTO `admin_operation_log` VALUES ('208', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:52:27', '2020-12-01 07:52:27');
INSERT INTO `admin_operation_log` VALUES ('209', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:54:46', '2020-12-01 07:54:46');
INSERT INTO `admin_operation_log` VALUES ('210', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:54:46', '2020-12-01 07:54:46');
INSERT INTO `admin_operation_log` VALUES ('211', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:55:01', '2020-12-01 07:55:01');
INSERT INTO `admin_operation_log` VALUES ('212', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:55:01', '2020-12-01 07:55:01');
INSERT INTO `admin_operation_log` VALUES ('213', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:57:18', '2020-12-01 07:57:18');
INSERT INTO `admin_operation_log` VALUES ('214', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:57:24', '2020-12-01 07:57:24');
INSERT INTO `admin_operation_log` VALUES ('215', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:57:24', '2020-12-01 07:57:24');
INSERT INTO `admin_operation_log` VALUES ('216', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:57:45', '2020-12-01 07:57:45');
INSERT INTO `admin_operation_log` VALUES ('217', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:57:45', '2020-12-01 07:57:45');
INSERT INTO `admin_operation_log` VALUES ('218', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:58:43', '2020-12-01 07:58:43');
INSERT INTO `admin_operation_log` VALUES ('219', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:58:44', '2020-12-01 07:58:44');
INSERT INTO `admin_operation_log` VALUES ('220', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:58:45', '2020-12-01 07:58:45');
INSERT INTO `admin_operation_log` VALUES ('221', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 07:58:46', '2020-12-01 07:58:46');
INSERT INTO `admin_operation_log` VALUES ('222', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 07:59:04', '2020-12-01 07:59:04');
INSERT INTO `admin_operation_log` VALUES ('223', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:22:32', '2020-12-01 08:22:32');
INSERT INTO `admin_operation_log` VALUES ('224', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:23:21', '2020-12-01 08:23:21');
INSERT INTO `admin_operation_log` VALUES ('225', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:23:22', '2020-12-01 08:23:22');
INSERT INTO `admin_operation_log` VALUES ('226', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:24:07', '2020-12-01 08:24:07');
INSERT INTO `admin_operation_log` VALUES ('227', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:24:09', '2020-12-01 08:24:09');
INSERT INTO `admin_operation_log` VALUES ('228', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.new_key_here\",\"c_name\":\"banner\",\"c_element\":\"image\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 08:24:18', '2020-12-01 08:24:18');
INSERT INTO `admin_operation_log` VALUES ('229', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-01 08:24:19', '2020-12-01 08:24:19');
INSERT INTO `admin_operation_log` VALUES ('230', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:24:21', '2020-12-01 08:24:21');
INSERT INTO `admin_operation_log` VALUES ('231', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:24:21', '2020-12-01 08:24:21');
INSERT INTO `admin_operation_log` VALUES ('232', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:24:21', '2020-12-01 08:24:21');
INSERT INTO `admin_operation_log` VALUES ('233', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"tabindex\":\"0\",\"do\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 08:24:40', '2020-12-01 08:24:40');
INSERT INTO `admin_operation_log` VALUES ('234', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-01 08:24:40', '2020-12-01 08:24:40');
INSERT INTO `admin_operation_log` VALUES ('235', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"tabindex\":\"0\",\"do\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 08:24:48', '2020-12-01 08:24:48');
INSERT INTO `admin_operation_log` VALUES ('236', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-01 08:24:48', '2020-12-01 08:24:48');
INSERT INTO `admin_operation_log` VALUES ('237', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"tabindex\":\"0\",\"do\":null,\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\"}', '2020-12-01 08:25:01', '2020-12-01 08:25:01');
INSERT INTO `admin_operation_log` VALUES ('238', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-01 08:25:01', '2020-12-01 08:25:01');
INSERT INTO `admin_operation_log` VALUES ('239', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-01 08:25:47', '2020-12-01 08:25:47');
INSERT INTO `admin_operation_log` VALUES ('240', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:25:49', '2020-12-01 08:25:49');
INSERT INTO `admin_operation_log` VALUES ('241', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:30:17', '2020-12-01 08:30:17');
INSERT INTO `admin_operation_log` VALUES ('242', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 08:30:18', '2020-12-01 08:30:18');
INSERT INTO `admin_operation_log` VALUES ('243', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 08:30:18', '2020-12-01 08:30:18');
INSERT INTO `admin_operation_log` VALUES ('244', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-01 08:30:18', '2020-12-01 08:30:18');
INSERT INTO `admin_operation_log` VALUES ('245', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:30:20', '2020-12-01 08:30:20');
INSERT INTO `admin_operation_log` VALUES ('246', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 08:30:27', '2020-12-01 08:30:27');
INSERT INTO `admin_operation_log` VALUES ('247', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:30:49', '2020-12-01 08:30:49');
INSERT INTO `admin_operation_log` VALUES ('248', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:30:49', '2020-12-01 08:30:49');
INSERT INTO `admin_operation_log` VALUES ('249', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 08:30:59', '2020-12-01 08:30:59');
INSERT INTO `admin_operation_log` VALUES ('250', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 08:32:14', '2020-12-01 08:32:14');
INSERT INTO `admin_operation_log` VALUES ('251', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 08:32:14', '2020-12-01 08:32:14');
INSERT INTO `admin_operation_log` VALUES ('252', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 08:32:14', '2020-12-01 08:32:14');
INSERT INTO `admin_operation_log` VALUES ('253', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 08:32:14', '2020-12-01 08:32:14');
INSERT INTO `admin_operation_log` VALUES ('254', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:32:16', '2020-12-01 08:32:16');
INSERT INTO `admin_operation_log` VALUES ('255', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 08:32:32', '2020-12-01 08:32:32');
INSERT INTO `admin_operation_log` VALUES ('256', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:32:39', '2020-12-01 08:32:39');
INSERT INTO `admin_operation_log` VALUES ('257', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:34:45', '2020-12-01 08:34:45');
INSERT INTO `admin_operation_log` VALUES ('258', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:34:45', '2020-12-01 08:34:45');
INSERT INTO `admin_operation_log` VALUES ('259', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 08:34:51', '2020-12-01 08:34:51');
INSERT INTO `admin_operation_log` VALUES ('260', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 08:36:02', '2020-12-01 08:36:02');
INSERT INTO `admin_operation_log` VALUES ('261', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 08:36:07', '2020-12-01 08:36:07');
INSERT INTO `admin_operation_log` VALUES ('262', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 09:05:58', '2020-12-01 09:05:58');
INSERT INTO `admin_operation_log` VALUES ('263', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:06:05', '2020-12-01 09:06:05');
INSERT INTO `admin_operation_log` VALUES ('264', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 09:06:41', '2020-12-01 09:06:41');
INSERT INTO `admin_operation_log` VALUES ('265', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 09:06:43', '2020-12-01 09:06:43');
INSERT INTO `admin_operation_log` VALUES ('266', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:06:48', '2020-12-01 09:06:48');
INSERT INTO `admin_operation_log` VALUES ('267', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 09:07:01', '2020-12-01 09:07:01');
INSERT INTO `admin_operation_log` VALUES ('268', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:07:06', '2020-12-01 09:07:06');
INSERT INTO `admin_operation_log` VALUES ('269', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:07:15', '2020-12-01 09:07:15');
INSERT INTO `admin_operation_log` VALUES ('270', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 09:10:15', '2020-12-01 09:10:15');
INSERT INTO `admin_operation_log` VALUES ('271', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:10:15', '2020-12-01 09:10:15');
INSERT INTO `admin_operation_log` VALUES ('272', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:10:21', '2020-12-01 09:10:21');
INSERT INTO `admin_operation_log` VALUES ('273', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 09:11:48', '2020-12-01 09:11:48');
INSERT INTO `admin_operation_log` VALUES ('274', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 09:11:50', '2020-12-01 09:11:50');
INSERT INTO `admin_operation_log` VALUES ('275', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:11:55', '2020-12-01 09:11:55');
INSERT INTO `admin_operation_log` VALUES ('276', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 09:16:59', '2020-12-01 09:16:59');
INSERT INTO `admin_operation_log` VALUES ('277', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 09:17:00', '2020-12-01 09:17:00');
INSERT INTO `admin_operation_log` VALUES ('278', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 09:17:05', '2020-12-01 09:17:05');
INSERT INTO `admin_operation_log` VALUES ('279', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:12:52', '2020-12-01 10:12:52');
INSERT INTO `admin_operation_log` VALUES ('280', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:12:59', '2020-12-01 10:12:59');
INSERT INTO `admin_operation_log` VALUES ('281', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:14:20', '2020-12-01 10:14:20');
INSERT INTO `admin_operation_log` VALUES ('282', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:18:22', '2020-12-01 10:18:22');
INSERT INTO `admin_operation_log` VALUES ('283', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:18:27', '2020-12-01 10:18:27');
INSERT INTO `admin_operation_log` VALUES ('284', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:20:31', '2020-12-01 10:20:31');
INSERT INTO `admin_operation_log` VALUES ('285', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:20:37', '2020-12-01 10:20:37');
INSERT INTO `admin_operation_log` VALUES ('286', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:22:24', '2020-12-01 10:22:24');
INSERT INTO `admin_operation_log` VALUES ('287', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:22:25', '2020-12-01 10:22:25');
INSERT INTO `admin_operation_log` VALUES ('288', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:22:31', '2020-12-01 10:22:31');
INSERT INTO `admin_operation_log` VALUES ('289', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:23:04', '2020-12-01 10:23:04');
INSERT INTO `admin_operation_log` VALUES ('290', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:23:09', '2020-12-01 10:23:09');
INSERT INTO `admin_operation_log` VALUES ('291', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:24:20', '2020-12-01 10:24:20');
INSERT INTO `admin_operation_log` VALUES ('292', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:24:20', '2020-12-01 10:24:20');
INSERT INTO `admin_operation_log` VALUES ('293', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:24:20', '2020-12-01 10:24:20');
INSERT INTO `admin_operation_log` VALUES ('294', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:24:20', '2020-12-01 10:24:20');
INSERT INTO `admin_operation_log` VALUES ('295', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:24:26', '2020-12-01 10:24:26');
INSERT INTO `admin_operation_log` VALUES ('296', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:28:18', '2020-12-01 10:28:18');
INSERT INTO `admin_operation_log` VALUES ('297', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:28:19', '2020-12-01 10:28:19');
INSERT INTO `admin_operation_log` VALUES ('298', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:28:19', '2020-12-01 10:28:19');
INSERT INTO `admin_operation_log` VALUES ('299', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:28:26', '2020-12-01 10:28:26');
INSERT INTO `admin_operation_log` VALUES ('300', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:29:01', '2020-12-01 10:29:01');
INSERT INTO `admin_operation_log` VALUES ('301', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-01 10:29:02', '2020-12-01 10:29:02');
INSERT INTO `admin_operation_log` VALUES ('302', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:29:06', '2020-12-01 10:29:06');
INSERT INTO `admin_operation_log` VALUES ('303', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:18', '2020-12-01 10:29:18');
INSERT INTO `admin_operation_log` VALUES ('304', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:19', '2020-12-01 10:29:19');
INSERT INTO `admin_operation_log` VALUES ('305', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:19', '2020-12-01 10:29:19');
INSERT INTO `admin_operation_log` VALUES ('306', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:19', '2020-12-01 10:29:19');
INSERT INTO `admin_operation_log` VALUES ('307', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:19', '2020-12-01 10:29:19');
INSERT INTO `admin_operation_log` VALUES ('308', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:19', '2020-12-01 10:29:19');
INSERT INTO `admin_operation_log` VALUES ('309', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-01 10:29:20', '2020-12-01 10:29:20');
INSERT INTO `admin_operation_log` VALUES ('310', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:29:25', '2020-12-01 10:29:25');
INSERT INTO `admin_operation_log` VALUES ('311', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"GLDNCa2kwlSmJSQIraQZJYRl7bZcRbAh9roQmKkG\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-01 10:30:37', '2020-12-01 10:30:37');
INSERT INTO `admin_operation_log` VALUES ('312', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:09:29', '2020-12-02 01:09:29');
INSERT INTO `admin_operation_log` VALUES ('313', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:09:38', '2020-12-02 01:09:38');
INSERT INTO `admin_operation_log` VALUES ('314', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:10:48', '2020-12-02 01:10:48');
INSERT INTO `admin_operation_log` VALUES ('315', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:10:53', '2020-12-02 01:10:53');
INSERT INTO `admin_operation_log` VALUES ('316', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:12:04', '2020-12-02 01:12:04');
INSERT INTO `admin_operation_log` VALUES ('317', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:12:12', '2020-12-02 01:12:12');
INSERT INTO `admin_operation_log` VALUES ('318', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:14:45', '2020-12-02 01:14:45');
INSERT INTO `admin_operation_log` VALUES ('319', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:14:53', '2020-12-02 01:14:53');
INSERT INTO `admin_operation_log` VALUES ('320', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:16:56', '2020-12-02 01:16:56');
INSERT INTO `admin_operation_log` VALUES ('321', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:17:06', '2020-12-02 01:17:06');
INSERT INTO `admin_operation_log` VALUES ('322', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:17:42', '2020-12-02 01:17:42');
INSERT INTO `admin_operation_log` VALUES ('323', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:17:49', '2020-12-02 01:17:49');
INSERT INTO `admin_operation_log` VALUES ('324', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:21:20', '2020-12-02 01:21:20');
INSERT INTO `admin_operation_log` VALUES ('325', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:21:26', '2020-12-02 01:21:26');
INSERT INTO `admin_operation_log` VALUES ('326', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:22:39', '2020-12-02 01:22:39');
INSERT INTO `admin_operation_log` VALUES ('327', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:31:18', '2020-12-02 01:31:18');
INSERT INTO `admin_operation_log` VALUES ('328', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:31:36', '2020-12-02 01:31:36');
INSERT INTO `admin_operation_log` VALUES ('329', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:31:42', '2020-12-02 01:31:42');
INSERT INTO `admin_operation_log` VALUES ('330', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:32:19', '2020-12-02 01:32:19');
INSERT INTO `admin_operation_log` VALUES ('331', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:32:25', '2020-12-02 01:32:25');
INSERT INTO `admin_operation_log` VALUES ('332', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:33:23', '2020-12-02 01:33:23');
INSERT INTO `admin_operation_log` VALUES ('333', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:33:29', '2020-12-02 01:33:29');
INSERT INTO `admin_operation_log` VALUES ('334', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:34:16', '2020-12-02 01:34:16');
INSERT INTO `admin_operation_log` VALUES ('335', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:34:28', '2020-12-02 01:34:28');
INSERT INTO `admin_operation_log` VALUES ('336', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:35:20', '2020-12-02 01:35:20');
INSERT INTO `admin_operation_log` VALUES ('337', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:35:25', '2020-12-02 01:35:25');
INSERT INTO `admin_operation_log` VALUES ('338', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:37:17', '2020-12-02 01:37:17');
INSERT INTO `admin_operation_log` VALUES ('339', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-02 01:54:07', '2020-12-02 01:54:07');
INSERT INTO `admin_operation_log` VALUES ('340', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:54:09', '2020-12-02 01:54:09');
INSERT INTO `admin_operation_log` VALUES ('341', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 01:55:16', '2020-12-02 01:55:16');
INSERT INTO `admin_operation_log` VALUES ('342', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:55:21', '2020-12-02 01:55:21');
INSERT INTO `admin_operation_log` VALUES ('343', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:55:21', '2020-12-02 01:55:21');
INSERT INTO `admin_operation_log` VALUES ('344', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:55:37', '2020-12-02 01:55:37');
INSERT INTO `admin_operation_log` VALUES ('345', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:55:37', '2020-12-02 01:55:37');
INSERT INTO `admin_operation_log` VALUES ('346', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:56:02', '2020-12-02 01:56:02');
INSERT INTO `admin_operation_log` VALUES ('347', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 01:56:07', '2020-12-02 01:56:07');
INSERT INTO `admin_operation_log` VALUES ('348', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:57:27', '2020-12-02 01:57:27');
INSERT INTO `admin_operation_log` VALUES ('349', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:57:28', '2020-12-02 01:57:28');
INSERT INTO `admin_operation_log` VALUES ('350', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:57:28', '2020-12-02 01:57:28');
INSERT INTO `admin_operation_log` VALUES ('351', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 01:57:38', '2020-12-02 01:57:38');
INSERT INTO `admin_operation_log` VALUES ('352', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 02:48:43', '2020-12-02 02:48:43');
INSERT INTO `admin_operation_log` VALUES ('353', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:49:51', '2020-12-02 02:49:51');
INSERT INTO `admin_operation_log` VALUES ('354', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:49:52', '2020-12-02 02:49:52');
INSERT INTO `admin_operation_log` VALUES ('355', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:49:53', '2020-12-02 02:49:53');
INSERT INTO `admin_operation_log` VALUES ('356', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:50:06', '2020-12-02 02:50:06');
INSERT INTO `admin_operation_log` VALUES ('357', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:50:08', '2020-12-02 02:50:08');
INSERT INTO `admin_operation_log` VALUES ('358', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:50:12', '2020-12-02 02:50:12');
INSERT INTO `admin_operation_log` VALUES ('359', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:50:14', '2020-12-02 02:50:14');
INSERT INTO `admin_operation_log` VALUES ('360', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:50:16', '2020-12-02 02:50:16');
INSERT INTO `admin_operation_log` VALUES ('361', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:50:44', '2020-12-02 02:50:44');
INSERT INTO `admin_operation_log` VALUES ('362', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:51:07', '2020-12-02 02:51:07');
INSERT INTO `admin_operation_log` VALUES ('363', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:51:37', '2020-12-02 02:51:37');
INSERT INTO `admin_operation_log` VALUES ('364', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:51:45', '2020-12-02 02:51:45');
INSERT INTO `admin_operation_log` VALUES ('365', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 02:51:57', '2020-12-02 02:51:57');
INSERT INTO `admin_operation_log` VALUES ('366', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 02:51:58', '2020-12-02 02:51:58');
INSERT INTO `admin_operation_log` VALUES ('367', '1', 'admin/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 02:51:58', '2020-12-02 02:51:58');
INSERT INTO `admin_operation_log` VALUES ('368', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:52:07', '2020-12-02 02:52:07');
INSERT INTO `admin_operation_log` VALUES ('369', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:52:29', '2020-12-02 02:52:29');
INSERT INTO `admin_operation_log` VALUES ('370', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:54:15', '2020-12-02 02:54:15');
INSERT INTO `admin_operation_log` VALUES ('371', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 02:55:04', '2020-12-02 02:55:04');
INSERT INTO `admin_operation_log` VALUES ('372', '1', 'admin/users', 'GET', '127.0.0.1', '[]', '2020-12-02 03:06:05', '2020-12-02 03:06:05');
INSERT INTO `admin_operation_log` VALUES ('373', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:06:07', '2020-12-02 03:06:07');
INSERT INTO `admin_operation_log` VALUES ('374', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:06:10', '2020-12-02 03:06:10');
INSERT INTO `admin_operation_log` VALUES ('375', '1', 'admin/auth/menu', 'POST', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"\\u6570\\u636e\\u7ba1\\u7406\",\"icon\":\"fa-area-chart\",\"uri\":\"orders\",\"roles\":[null],\"permission\":null,\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:06:58', '2020-12-02 03:06:58');
INSERT INTO `admin_operation_log` VALUES ('376', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-02 03:06:58', '2020-12-02 03:06:58');
INSERT INTO `admin_operation_log` VALUES ('377', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-02 03:07:07', '2020-12-02 03:07:07');
INSERT INTO `admin_operation_log` VALUES ('378', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:07:09', '2020-12-02 03:07:09');
INSERT INTO `admin_operation_log` VALUES ('379', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:08:51', '2020-12-02 03:08:51');
INSERT INTO `admin_operation_log` VALUES ('380', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:09:34', '2020-12-02 03:09:34');
INSERT INTO `admin_operation_log` VALUES ('381', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:09:35', '2020-12-02 03:09:35');
INSERT INTO `admin_operation_log` VALUES ('382', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:09:35', '2020-12-02 03:09:35');
INSERT INTO `admin_operation_log` VALUES ('383', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:09:41', '2020-12-02 03:09:41');
INSERT INTO `admin_operation_log` VALUES ('384', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:10:04', '2020-12-02 03:10:04');
INSERT INTO `admin_operation_log` VALUES ('385', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:10:40', '2020-12-02 03:10:40');
INSERT INTO `admin_operation_log` VALUES ('386', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:11:14', '2020-12-02 03:11:14');
INSERT INTO `admin_operation_log` VALUES ('387', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:11:16', '2020-12-02 03:11:16');
INSERT INTO `admin_operation_log` VALUES ('388', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:11:16', '2020-12-02 03:11:16');
INSERT INTO `admin_operation_log` VALUES ('389', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:11:25', '2020-12-02 03:11:25');
INSERT INTO `admin_operation_log` VALUES ('390', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:12:17', '2020-12-02 03:12:17');
INSERT INTO `admin_operation_log` VALUES ('391', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-02 03:12:48', '2020-12-02 03:12:48');
INSERT INTO `admin_operation_log` VALUES ('392', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:12:58', '2020-12-02 03:12:58');
INSERT INTO `admin_operation_log` VALUES ('393', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:12:59', '2020-12-02 03:12:59');
INSERT INTO `admin_operation_log` VALUES ('394', '1', 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:13:05', '2020-12-02 03:13:05');
INSERT INTO `admin_operation_log` VALUES ('395', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:13:06', '2020-12-02 03:13:06');
INSERT INTO `admin_operation_log` VALUES ('396', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:21', '2020-12-02 03:15:21');
INSERT INTO `admin_operation_log` VALUES ('397', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:24', '2020-12-02 03:15:24');
INSERT INTO `admin_operation_log` VALUES ('398', '1', 'admin/auth/menu/10', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:15:28', '2020-12-02 03:15:28');
INSERT INTO `admin_operation_log` VALUES ('399', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:28', '2020-12-02 03:15:28');
INSERT INTO `admin_operation_log` VALUES ('400', '1', 'admin/auth/menu', 'GET', '127.0.0.1', '[]', '2020-12-02 03:15:31', '2020-12-02 03:15:31');
INSERT INTO `admin_operation_log` VALUES ('401', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:33', '2020-12-02 03:15:33');
INSERT INTO `admin_operation_log` VALUES ('402', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:34', '2020-12-02 03:15:34');
INSERT INTO `admin_operation_log` VALUES ('403', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:36', '2020-12-02 03:15:36');
INSERT INTO `admin_operation_log` VALUES ('404', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:15:37', '2020-12-02 03:15:37');
INSERT INTO `admin_operation_log` VALUES ('405', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:15:45', '2020-12-02 03:15:45');
INSERT INTO `admin_operation_log` VALUES ('406', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:19:45', '2020-12-02 03:19:45');
INSERT INTO `admin_operation_log` VALUES ('407', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:19:45', '2020-12-02 03:19:45');
INSERT INTO `admin_operation_log` VALUES ('408', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:19:50', '2020-12-02 03:19:50');
INSERT INTO `admin_operation_log` VALUES ('409', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:20:04', '2020-12-02 03:20:04');
INSERT INTO `admin_operation_log` VALUES ('410', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:20:44', '2020-12-02 03:20:44');
INSERT INTO `admin_operation_log` VALUES ('411', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:20:50', '2020-12-02 03:20:50');
INSERT INTO `admin_operation_log` VALUES ('412', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:20:50', '2020-12-02 03:20:50');
INSERT INTO `admin_operation_log` VALUES ('413', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:20:50', '2020-12-02 03:20:50');
INSERT INTO `admin_operation_log` VALUES ('414', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:20:56', '2020-12-02 03:20:56');
INSERT INTO `admin_operation_log` VALUES ('415', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:21:07', '2020-12-02 03:21:07');
INSERT INTO `admin_operation_log` VALUES ('416', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:52:29', '2020-12-02 03:52:29');
INSERT INTO `admin_operation_log` VALUES ('417', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:52:38', '2020-12-02 03:52:38');
INSERT INTO `admin_operation_log` VALUES ('418', '1', 'admin/config/5', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:52:41', '2020-12-02 03:52:41');
INSERT INTO `admin_operation_log` VALUES ('419', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:52:41', '2020-12-02 03:52:41');
INSERT INTO `admin_operation_log` VALUES ('420', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.parent_id\",\"c_name\":\"\\u4e00\\u7ea7\\u8fd4\\u4f63\\u6bd4\\u4f8b\",\"c_element\":\"rate\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:55:29', '2020-12-02 03:55:29');
INSERT INTO `admin_operation_log` VALUES ('421', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:55:29', '2020-12-02 03:55:29');
INSERT INTO `admin_operation_log` VALUES ('422', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:55:29', '2020-12-02 03:55:29');
INSERT INTO `admin_operation_log` VALUES ('423', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:55:30', '2020-12-02 03:55:30');
INSERT INTO `admin_operation_log` VALUES ('424', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"10\",\"tabindex\":\"0\",\"do\":null,\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:55:55', '2020-12-02 03:55:55');
INSERT INTO `admin_operation_log` VALUES ('425', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-02 03:55:55', '2020-12-02 03:55:55');
INSERT INTO `admin_operation_log` VALUES ('426', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:01', '2020-12-02 03:56:01');
INSERT INTO `admin_operation_log` VALUES ('427', '1', 'admin/configx/sort', 'PUT', '127.0.0.1', '{\"data\":[{\"id\":\"6\"}],\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_method\":\"PUT\"}', '2020-12-02 03:56:11', '2020-12-02 03:56:11');
INSERT INTO `admin_operation_log` VALUES ('428', '1', 'admin/configx/edit/6', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:13', '2020-12-02 03:56:13');
INSERT INTO `admin_operation_log` VALUES ('429', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:19', '2020-12-02 03:56:19');
INSERT INTO `admin_operation_log` VALUES ('430', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:28', '2020-12-02 03:56:28');
INSERT INTO `admin_operation_log` VALUES ('431', '1', 'admin/configx/sort', 'PUT', '127.0.0.1', '{\"data\":[{\"id\":\"6\"}],\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_method\":\"PUT\"}', '2020-12-02 03:56:29', '2020-12-02 03:56:29');
INSERT INTO `admin_operation_log` VALUES ('432', '1', 'admin/configx/edit/6', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:31', '2020-12-02 03:56:31');
INSERT INTO `admin_operation_log` VALUES ('433', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:37', '2020-12-02 03:56:37');
INSERT INTO `admin_operation_log` VALUES ('434', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:56:40', '2020-12-02 03:56:40');
INSERT INTO `admin_operation_log` VALUES ('435', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.parent_two_id\",\"c_name\":\"\\u4e8c\\u7ea7\\u5206\\u4f63\\u6bd4\\u4f8b\",\"c_element\":\"rate\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:57:20', '2020-12-02 03:57:20');
INSERT INTO `admin_operation_log` VALUES ('436', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-02 03:57:20', '2020-12-02 03:57:20');
INSERT INTO `admin_operation_log` VALUES ('437', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:57:21', '2020-12-02 03:57:21');
INSERT INTO `admin_operation_log` VALUES ('438', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"tabindex\":\"0\",\"do\":null,\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:57:33', '2020-12-02 03:57:33');
INSERT INTO `admin_operation_log` VALUES ('439', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-02 03:57:33', '2020-12-02 03:57:33');
INSERT INTO `admin_operation_log` VALUES ('440', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:57:47', '2020-12-02 03:57:47');
INSERT INTO `admin_operation_log` VALUES ('441', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:58:27', '2020-12-02 03:58:27');
INSERT INTO `admin_operation_log` VALUES ('442', '1', 'admin/configx/edit/7', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:58:29', '2020-12-02 03:58:29');
INSERT INTO `admin_operation_log` VALUES ('443', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:58:39', '2020-12-02 03:58:39');
INSERT INTO `admin_operation_log` VALUES ('444', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 03:58:45', '2020-12-02 03:58:45');
INSERT INTO `admin_operation_log` VALUES ('445', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 03:59:29', '2020-12-02 03:59:29');
INSERT INTO `admin_operation_log` VALUES ('446', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-02 03:59:31', '2020-12-02 03:59:31');
INSERT INTO `admin_operation_log` VALUES ('447', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-02 03:59:31', '2020-12-02 03:59:31');
INSERT INTO `admin_operation_log` VALUES ('448', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-02 03:59:31', '2020-12-02 03:59:31');
INSERT INTO `admin_operation_log` VALUES ('449', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-02 03:59:32', '2020-12-02 03:59:32');
INSERT INTO `admin_operation_log` VALUES ('450', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"tabindex\":\"0\",\"do\":null,\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\"}', '2020-12-02 03:59:56', '2020-12-02 03:59:56');
INSERT INTO `admin_operation_log` VALUES ('451', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-02 03:59:56', '2020-12-02 03:59:56');
INSERT INTO `admin_operation_log` VALUES ('452', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:00:24', '2020-12-02 04:00:24');
INSERT INTO `admin_operation_log` VALUES ('453', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:00:26', '2020-12-02 04:00:26');
INSERT INTO `admin_operation_log` VALUES ('454', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:00:26', '2020-12-02 04:00:26');
INSERT INTO `admin_operation_log` VALUES ('455', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:00:30', '2020-12-02 04:00:30');
INSERT INTO `admin_operation_log` VALUES ('456', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:01:36', '2020-12-02 04:01:36');
INSERT INTO `admin_operation_log` VALUES ('457', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:01:53', '2020-12-02 04:01:53');
INSERT INTO `admin_operation_log` VALUES ('458', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:02:06', '2020-12-02 04:02:06');
INSERT INTO `admin_operation_log` VALUES ('459', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:02:10', '2020-12-02 04:02:10');
INSERT INTO `admin_operation_log` VALUES ('460', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:02:11', '2020-12-02 04:02:11');
INSERT INTO `admin_operation_log` VALUES ('461', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2020-12-02 04:04:30', '2020-12-02 04:04:30');
INSERT INTO `admin_operation_log` VALUES ('462', '1', 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:06:51', '2020-12-02 04:06:51');
INSERT INTO `admin_operation_log` VALUES ('463', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:06:53', '2020-12-02 04:06:53');
INSERT INTO `admin_operation_log` VALUES ('464', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:07:00', '2020-12-02 04:07:00');
INSERT INTO `admin_operation_log` VALUES ('465', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:11:05', '2020-12-02 04:11:05');
INSERT INTO `admin_operation_log` VALUES ('466', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:11:05', '2020-12-02 04:11:05');
INSERT INTO `admin_operation_log` VALUES ('467', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 04:51:49', '2020-12-02 04:51:49');
INSERT INTO `admin_operation_log` VALUES ('468', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:51:55', '2020-12-02 04:51:55');
INSERT INTO `admin_operation_log` VALUES ('469', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 04:52:47', '2020-12-02 04:52:47');
INSERT INTO `admin_operation_log` VALUES ('470', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:10:04', '2020-12-02 05:10:04');
INSERT INTO `admin_operation_log` VALUES ('471', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:10:17', '2020-12-02 05:10:17');
INSERT INTO `admin_operation_log` VALUES ('472', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:10:17', '2020-12-02 05:10:17');
INSERT INTO `admin_operation_log` VALUES ('473', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:10:23', '2020-12-02 05:10:23');
INSERT INTO `admin_operation_log` VALUES ('474', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:33', '2020-12-02 05:11:33');
INSERT INTO `admin_operation_log` VALUES ('475', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:33', '2020-12-02 05:11:33');
INSERT INTO `admin_operation_log` VALUES ('476', '1', 'admin/orders/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:35', '2020-12-02 05:11:35');
INSERT INTO `admin_operation_log` VALUES ('477', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:37', '2020-12-02 05:11:37');
INSERT INTO `admin_operation_log` VALUES ('478', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:11:44', '2020-12-02 05:11:44');
INSERT INTO `admin_operation_log` VALUES ('479', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:44', '2020-12-02 05:11:44');
INSERT INTO `admin_operation_log` VALUES ('480', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:51', '2020-12-02 05:11:51');
INSERT INTO `admin_operation_log` VALUES ('481', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:51', '2020-12-02 05:11:51');
INSERT INTO `admin_operation_log` VALUES ('482', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:11:52', '2020-12-02 05:11:52');
INSERT INTO `admin_operation_log` VALUES ('483', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:12:41', '2020-12-02 05:12:41');
INSERT INTO `admin_operation_log` VALUES ('484', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:12:49', '2020-12-02 05:12:49');
INSERT INTO `admin_operation_log` VALUES ('485', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-02 05:14:30', '2020-12-02 05:14:30');
INSERT INTO `admin_operation_log` VALUES ('486', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:14:39', '2020-12-02 05:14:39');
INSERT INTO `admin_operation_log` VALUES ('487', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:15:21', '2020-12-02 05:15:21');
INSERT INTO `admin_operation_log` VALUES ('488', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:15:21', '2020-12-02 05:15:21');
INSERT INTO `admin_operation_log` VALUES ('489', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:15:30', '2020-12-02 05:15:30');
INSERT INTO `admin_operation_log` VALUES ('490', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:15:44', '2020-12-02 05:15:44');
INSERT INTO `admin_operation_log` VALUES ('491', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:16:51', '2020-12-02 05:16:51');
INSERT INTO `admin_operation_log` VALUES ('492', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:17:13', '2020-12-02 05:17:13');
INSERT INTO `admin_operation_log` VALUES ('493', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:17:21', '2020-12-02 05:17:21');
INSERT INTO `admin_operation_log` VALUES ('494', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:18:40', '2020-12-02 05:18:40');
INSERT INTO `admin_operation_log` VALUES ('495', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:20:18', '2020-12-02 05:20:18');
INSERT INTO `admin_operation_log` VALUES ('496', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:21:12', '2020-12-02 05:21:12');
INSERT INTO `admin_operation_log` VALUES ('497', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:21:20', '2020-12-02 05:21:20');
INSERT INTO `admin_operation_log` VALUES ('498', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-02 05:38:11', '2020-12-02 05:38:11');
INSERT INTO `admin_operation_log` VALUES ('499', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:38:13', '2020-12-02 05:38:13');
INSERT INTO `admin_operation_log` VALUES ('500', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:38:16', '2020-12-02 05:38:16');
INSERT INTO `admin_operation_log` VALUES ('501', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:38:31', '2020-12-02 05:38:31');
INSERT INTO `admin_operation_log` VALUES ('502', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:38:31', '2020-12-02 05:38:31');
INSERT INTO `admin_operation_log` VALUES ('503', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:38:47', '2020-12-02 05:38:47');
INSERT INTO `admin_operation_log` VALUES ('504', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:38:47', '2020-12-02 05:38:47');
INSERT INTO `admin_operation_log` VALUES ('505', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:41:16', '2020-12-02 05:41:16');
INSERT INTO `admin_operation_log` VALUES ('506', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:41:29', '2020-12-02 05:41:29');
INSERT INTO `admin_operation_log` VALUES ('507', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:41:29', '2020-12-02 05:41:29');
INSERT INTO `admin_operation_log` VALUES ('508', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:41:39', '2020-12-02 05:41:39');
INSERT INTO `admin_operation_log` VALUES ('509', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:41:40', '2020-12-02 05:41:40');
INSERT INTO `admin_operation_log` VALUES ('510', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:45', '2020-12-02 05:42:45');
INSERT INTO `admin_operation_log` VALUES ('511', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:45', '2020-12-02 05:42:45');
INSERT INTO `admin_operation_log` VALUES ('512', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:47', '2020-12-02 05:42:47');
INSERT INTO `admin_operation_log` VALUES ('513', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:47', '2020-12-02 05:42:47');
INSERT INTO `admin_operation_log` VALUES ('514', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:48', '2020-12-02 05:42:48');
INSERT INTO `admin_operation_log` VALUES ('515', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:49', '2020-12-02 05:42:49');
INSERT INTO `admin_operation_log` VALUES ('516', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:42:58', '2020-12-02 05:42:58');
INSERT INTO `admin_operation_log` VALUES ('517', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:42:58', '2020-12-02 05:42:58');
INSERT INTO `admin_operation_log` VALUES ('518', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:48:38', '2020-12-02 05:48:38');
INSERT INTO `admin_operation_log` VALUES ('519', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:48:40', '2020-12-02 05:48:40');
INSERT INTO `admin_operation_log` VALUES ('520', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"oRRLhRwfvRyqhtRaga7YvLirC8p9OOI7mBmOoshr\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 05:48:52', '2020-12-02 05:48:52');
INSERT INTO `admin_operation_log` VALUES ('521', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:48:52', '2020-12-02 05:48:52');
INSERT INTO `admin_operation_log` VALUES ('522', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 05:49:34', '2020-12-02 05:49:34');
INSERT INTO `admin_operation_log` VALUES ('523', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-02 06:22:32', '2020-12-02 06:22:32');
INSERT INTO `admin_operation_log` VALUES ('524', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 10:40:36', '2020-12-02 10:40:36');
INSERT INTO `admin_operation_log` VALUES ('525', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-02 10:40:51', '2020-12-02 10:40:51');
INSERT INTO `admin_operation_log` VALUES ('526', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"qx6TgwQaPopjtykH18uXQa1fyYHGwPPVq1Ltrva0\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 10:40:59', '2020-12-02 10:40:59');
INSERT INTO `admin_operation_log` VALUES ('527', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 10:41:00', '2020-12-02 10:41:00');
INSERT INTO `admin_operation_log` VALUES ('528', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 10:41:26', '2020-12-02 10:41:26');
INSERT INTO `admin_operation_log` VALUES ('529', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"qx6TgwQaPopjtykH18uXQa1fyYHGwPPVq1Ltrva0\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 10:41:52', '2020-12-02 10:41:52');
INSERT INTO `admin_operation_log` VALUES ('530', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 10:41:52', '2020-12-02 10:41:52');
INSERT INTO `admin_operation_log` VALUES ('531', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"qx6TgwQaPopjtykH18uXQa1fyYHGwPPVq1Ltrva0\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-02 10:43:06', '2020-12-02 10:43:06');
INSERT INTO `admin_operation_log` VALUES ('532', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-02 10:43:06', '2020-12-02 10:43:06');
INSERT INTO `admin_operation_log` VALUES ('533', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-03 01:14:45', '2020-12-03 01:14:45');
INSERT INTO `admin_operation_log` VALUES ('534', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:14:51', '2020-12-03 01:14:51');
INSERT INTO `admin_operation_log` VALUES ('535', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:15:12', '2020-12-03 01:15:12');
INSERT INTO `admin_operation_log` VALUES ('536', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"tabs_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:15:14', '2020-12-03 01:15:14');
INSERT INTO `admin_operation_log` VALUES ('537', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_tabs_key\":\"__configx_tabs__\",\"c_tabs_options\":\"base  :  \\u57fa\\u672c\\u8bbe\\u7f6e\\r\\nuplaod  :  \\u7f51\\u7ad9\\u914d\\u7f6e\"},\"tabindex\":\"0\",\"do\":\"tabs_config\",\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\"}', '2020-12-03 01:15:31', '2020-12-03 01:15:31');
INSERT INTO `admin_operation_log` VALUES ('538', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"tabs_config\"}', '2020-12-03 01:15:31', '2020-12-03 01:15:31');
INSERT INTO `admin_operation_log` VALUES ('539', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:15:34', '2020-12-03 01:15:34');
INSERT INTO `admin_operation_log` VALUES ('540', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:15:37', '2020-12-03 01:15:37');
INSERT INTO `admin_operation_log` VALUES ('541', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"uplaod\",\"c_key\":\"uplaod.register_deal\",\"c_name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\"}', '2020-12-03 01:16:31', '2020-12-03 01:16:31');
INSERT INTO `admin_operation_log` VALUES ('542', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 01:16:31', '2020-12-03 01:16:31');
INSERT INTO `admin_operation_log` VALUES ('543', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:16:33', '2020-12-03 01:16:33');
INSERT INTO `admin_operation_log` VALUES ('544', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_8_\":\"1\",\"tabindex\":\"1\",\"do\":null,\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\"}', '2020-12-03 01:16:45', '2020-12-03 01:16:45');
INSERT INTO `admin_operation_log` VALUES ('545', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 01:16:45', '2020-12-03 01:16:45');
INSERT INTO `admin_operation_log` VALUES ('546', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:17:10', '2020-12-03 01:17:10');
INSERT INTO `admin_operation_log` VALUES ('547', '1', 'admin/configx/edit/8', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:17:20', '2020-12-03 01:17:20');
INSERT INTO `admin_operation_log` VALUES ('548', '1', 'admin/configx/saveall/8', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\",\"c_key\":\"uplaod.register_deal\",\"c_name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\"}', '2020-12-03 01:17:42', '2020-12-03 01:17:42');
INSERT INTO `admin_operation_log` VALUES ('549', '1', 'admin/configx/edit/8', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 01:17:42', '2020-12-03 01:17:42');
INSERT INTO `admin_operation_log` VALUES ('550', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 01:58:01', '2020-12-03 01:58:01');
INSERT INTO `admin_operation_log` VALUES ('551', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:00:21', '2020-12-03 02:00:21');
INSERT INTO `admin_operation_log` VALUES ('552', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:00:28', '2020-12-03 02:00:28');
INSERT INTO `admin_operation_log` VALUES ('553', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:00:30', '2020-12-03 02:00:30');
INSERT INTO `admin_operation_log` VALUES ('554', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:00:33', '2020-12-03 02:00:33');
INSERT INTO `admin_operation_log` VALUES ('555', '1', 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:00:34', '2020-12-03 02:00:34');
INSERT INTO `admin_operation_log` VALUES ('556', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:00:36', '2020-12-03 02:00:36');
INSERT INTO `admin_operation_log` VALUES ('557', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:03:20', '2020-12-03 02:03:20');
INSERT INTO `admin_operation_log` VALUES ('558', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:03:28', '2020-12-03 02:03:28');
INSERT INTO `admin_operation_log` VALUES ('559', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:03:28', '2020-12-03 02:03:28');
INSERT INTO `admin_operation_log` VALUES ('560', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:03:39', '2020-12-03 02:03:39');
INSERT INTO `admin_operation_log` VALUES ('561', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:10:35', '2020-12-03 02:10:35');
INSERT INTO `admin_operation_log` VALUES ('562', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:10:36', '2020-12-03 02:10:36');
INSERT INTO `admin_operation_log` VALUES ('563', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:12:00', '2020-12-03 02:12:00');
INSERT INTO `admin_operation_log` VALUES ('564', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:12:01', '2020-12-03 02:12:01');
INSERT INTO `admin_operation_log` VALUES ('565', '1', 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:12:02', '2020-12-03 02:12:02');
INSERT INTO `admin_operation_log` VALUES ('566', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:12:04', '2020-12-03 02:12:04');
INSERT INTO `admin_operation_log` VALUES ('567', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:12:49', '2020-12-03 02:12:49');
INSERT INTO `admin_operation_log` VALUES ('568', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:12:57', '2020-12-03 02:12:57');
INSERT INTO `admin_operation_log` VALUES ('569', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:12:57', '2020-12-03 02:12:57');
INSERT INTO `admin_operation_log` VALUES ('570', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:13:18', '2020-12-03 02:13:18');
INSERT INTO `admin_operation_log` VALUES ('571', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:19:25', '2020-12-03 02:19:25');
INSERT INTO `admin_operation_log` VALUES ('572', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:19:33', '2020-12-03 02:19:33');
INSERT INTO `admin_operation_log` VALUES ('573', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:19:33', '2020-12-03 02:19:33');
INSERT INTO `admin_operation_log` VALUES ('574', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:19:51', '2020-12-03 02:19:51');
INSERT INTO `admin_operation_log` VALUES ('575', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:19:51', '2020-12-03 02:19:51');
INSERT INTO `admin_operation_log` VALUES ('576', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:20:33', '2020-12-03 02:20:33');
INSERT INTO `admin_operation_log` VALUES ('577', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:20:33', '2020-12-03 02:20:33');
INSERT INTO `admin_operation_log` VALUES ('578', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"I3Cs6j0wL3IFFAvRH5DJ0yL39mDrQf9hqlxvpDqE\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-03 02:22:06', '2020-12-03 02:22:06');
INSERT INTO `admin_operation_log` VALUES ('579', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:22:07', '2020-12-03 02:22:07');
INSERT INTO `admin_operation_log` VALUES ('580', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 02:22:43', '2020-12-03 02:22:43');
INSERT INTO `admin_operation_log` VALUES ('581', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-03 05:37:48', '2020-12-03 05:37:48');
INSERT INTO `admin_operation_log` VALUES ('582', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:37:52', '2020-12-03 05:37:52');
INSERT INTO `admin_operation_log` VALUES ('583', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:37:57', '2020-12-03 05:37:57');
INSERT INTO `admin_operation_log` VALUES ('584', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:37:58', '2020-12-03 05:37:58');
INSERT INTO `admin_operation_log` VALUES ('585', '1', 'admin/config/ueditor.php', 'GET', '127.0.0.1', '[]', '2020-12-03 05:39:05', '2020-12-03 05:39:05');
INSERT INTO `admin_operation_log` VALUES ('586', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-03 05:43:12', '2020-12-03 05:43:12');
INSERT INTO `admin_operation_log` VALUES ('587', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:43:15', '2020-12-03 05:43:15');
INSERT INTO `admin_operation_log` VALUES ('588', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:43:16', '2020-12-03 05:43:16');
INSERT INTO `admin_operation_log` VALUES ('589', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:43:19', '2020-12-03 05:43:19');
INSERT INTO `admin_operation_log` VALUES ('590', '1', 'admin/config/8', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 05:43:22', '2020-12-03 05:43:22');
INSERT INTO `admin_operation_log` VALUES ('591', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:43:23', '2020-12-03 05:43:23');
INSERT INTO `admin_operation_log` VALUES ('592', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"uplaod\",\"c_key\":\"uplaod.register_deal\",\"c_name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 05:43:51', '2020-12-03 05:43:51');
INSERT INTO `admin_operation_log` VALUES ('593', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 05:43:51', '2020-12-03 05:43:51');
INSERT INTO `admin_operation_log` VALUES ('594', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:43:53', '2020-12-03 05:43:53');
INSERT INTO `admin_operation_log` VALUES ('595', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:45:21', '2020-12-03 05:45:21');
INSERT INTO `admin_operation_log` VALUES ('596', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:53', '2020-12-03 05:47:53');
INSERT INTO `admin_operation_log` VALUES ('597', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:53', '2020-12-03 05:47:53');
INSERT INTO `admin_operation_log` VALUES ('598', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:53', '2020-12-03 05:47:53');
INSERT INTO `admin_operation_log` VALUES ('599', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:53', '2020-12-03 05:47:53');
INSERT INTO `admin_operation_log` VALUES ('600', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:54', '2020-12-03 05:47:54');
INSERT INTO `admin_operation_log` VALUES ('601', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:54', '2020-12-03 05:47:54');
INSERT INTO `admin_operation_log` VALUES ('602', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:54', '2020-12-03 05:47:54');
INSERT INTO `admin_operation_log` VALUES ('603', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:54', '2020-12-03 05:47:54');
INSERT INTO `admin_operation_log` VALUES ('604', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:55', '2020-12-03 05:47:55');
INSERT INTO `admin_operation_log` VALUES ('605', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:55', '2020-12-03 05:47:55');
INSERT INTO `admin_operation_log` VALUES ('606', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:55', '2020-12-03 05:47:55');
INSERT INTO `admin_operation_log` VALUES ('607', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:55', '2020-12-03 05:47:55');
INSERT INTO `admin_operation_log` VALUES ('608', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:55', '2020-12-03 05:47:55');
INSERT INTO `admin_operation_log` VALUES ('609', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:56', '2020-12-03 05:47:56');
INSERT INTO `admin_operation_log` VALUES ('610', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:57', '2020-12-03 05:47:57');
INSERT INTO `admin_operation_log` VALUES ('611', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:57', '2020-12-03 05:47:57');
INSERT INTO `admin_operation_log` VALUES ('612', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:47:57', '2020-12-03 05:47:57');
INSERT INTO `admin_operation_log` VALUES ('613', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 05:48:01', '2020-12-03 05:48:01');
INSERT INTO `admin_operation_log` VALUES ('614', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:48:06', '2020-12-03 05:48:06');
INSERT INTO `admin_operation_log` VALUES ('615', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:48:10', '2020-12-03 05:48:10');
INSERT INTO `admin_operation_log` VALUES ('616', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:48:11', '2020-12-03 05:48:11');
INSERT INTO `admin_operation_log` VALUES ('617', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:51:52', '2020-12-03 05:51:52');
INSERT INTO `admin_operation_log` VALUES ('618', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 05:51:55', '2020-12-03 05:51:55');
INSERT INTO `admin_operation_log` VALUES ('619', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:04:03', '2020-12-03 06:04:03');
INSERT INTO `admin_operation_log` VALUES ('620', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:04:05', '2020-12-03 06:04:05');
INSERT INTO `admin_operation_log` VALUES ('621', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:04:05', '2020-12-03 06:04:05');
INSERT INTO `admin_operation_log` VALUES ('622', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:04:05', '2020-12-03 06:04:05');
INSERT INTO `admin_operation_log` VALUES ('623', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:04:05', '2020-12-03 06:04:05');
INSERT INTO `admin_operation_log` VALUES ('624', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:14', '2020-12-03 06:06:14');
INSERT INTO `admin_operation_log` VALUES ('625', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:14', '2020-12-03 06:06:14');
INSERT INTO `admin_operation_log` VALUES ('626', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:15', '2020-12-03 06:06:15');
INSERT INTO `admin_operation_log` VALUES ('627', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:15', '2020-12-03 06:06:15');
INSERT INTO `admin_operation_log` VALUES ('628', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:16', '2020-12-03 06:06:16');
INSERT INTO `admin_operation_log` VALUES ('629', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:17', '2020-12-03 06:06:17');
INSERT INTO `admin_operation_log` VALUES ('630', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:17', '2020-12-03 06:06:17');
INSERT INTO `admin_operation_log` VALUES ('631', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:17', '2020-12-03 06:06:17');
INSERT INTO `admin_operation_log` VALUES ('632', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:17', '2020-12-03 06:06:17');
INSERT INTO `admin_operation_log` VALUES ('633', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:17', '2020-12-03 06:06:17');
INSERT INTO `admin_operation_log` VALUES ('634', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:18', '2020-12-03 06:06:18');
INSERT INTO `admin_operation_log` VALUES ('635', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:18', '2020-12-03 06:06:18');
INSERT INTO `admin_operation_log` VALUES ('636', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:18', '2020-12-03 06:06:18');
INSERT INTO `admin_operation_log` VALUES ('637', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:18', '2020-12-03 06:06:18');
INSERT INTO `admin_operation_log` VALUES ('638', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:19', '2020-12-03 06:06:19');
INSERT INTO `admin_operation_log` VALUES ('639', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:19', '2020-12-03 06:06:19');
INSERT INTO `admin_operation_log` VALUES ('640', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:19', '2020-12-03 06:06:19');
INSERT INTO `admin_operation_log` VALUES ('641', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:19', '2020-12-03 06:06:19');
INSERT INTO `admin_operation_log` VALUES ('642', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:19', '2020-12-03 06:06:19');
INSERT INTO `admin_operation_log` VALUES ('643', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:20', '2020-12-03 06:06:20');
INSERT INTO `admin_operation_log` VALUES ('644', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:20', '2020-12-03 06:06:20');
INSERT INTO `admin_operation_log` VALUES ('645', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:20', '2020-12-03 06:06:20');
INSERT INTO `admin_operation_log` VALUES ('646', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:20', '2020-12-03 06:06:20');
INSERT INTO `admin_operation_log` VALUES ('647', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:06:21', '2020-12-03 06:06:21');
INSERT INTO `admin_operation_log` VALUES ('648', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:50', '2020-12-03 06:08:50');
INSERT INTO `admin_operation_log` VALUES ('649', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:51', '2020-12-03 06:08:51');
INSERT INTO `admin_operation_log` VALUES ('650', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:52', '2020-12-03 06:08:52');
INSERT INTO `admin_operation_log` VALUES ('651', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:54', '2020-12-03 06:08:54');
INSERT INTO `admin_operation_log` VALUES ('652', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:55', '2020-12-03 06:08:55');
INSERT INTO `admin_operation_log` VALUES ('653', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:56', '2020-12-03 06:08:56');
INSERT INTO `admin_operation_log` VALUES ('654', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:57', '2020-12-03 06:08:57');
INSERT INTO `admin_operation_log` VALUES ('655', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:08:58', '2020-12-03 06:08:58');
INSERT INTO `admin_operation_log` VALUES ('656', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:09:07', '2020-12-03 06:09:07');
INSERT INTO `admin_operation_log` VALUES ('657', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:09:09', '2020-12-03 06:09:09');
INSERT INTO `admin_operation_log` VALUES ('658', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:09:13', '2020-12-03 06:09:13');
INSERT INTO `admin_operation_log` VALUES ('659', '1', 'admin/configx/saveall/9', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\",\"c_key\":\"uplaod.register_deal\",\"c_name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:09:38', '2020-12-03 06:09:38');
INSERT INTO `admin_operation_log` VALUES ('660', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 06:09:38', '2020-12-03 06:09:38');
INSERT INTO `admin_operation_log` VALUES ('661', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:09:41', '2020-12-03 06:09:41');
INSERT INTO `admin_operation_log` VALUES ('662', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:09:41', '2020-12-03 06:09:41');
INSERT INTO `admin_operation_log` VALUES ('663', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:09:51', '2020-12-03 06:09:51');
INSERT INTO `admin_operation_log` VALUES ('664', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:09:52', '2020-12-03 06:09:52');
INSERT INTO `admin_operation_log` VALUES ('665', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:09:53', '2020-12-03 06:09:53');
INSERT INTO `admin_operation_log` VALUES ('666', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:09:53', '2020-12-03 06:09:53');
INSERT INTO `admin_operation_log` VALUES ('667', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:09:54', '2020-12-03 06:09:54');
INSERT INTO `admin_operation_log` VALUES ('668', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:09:56', '2020-12-03 06:09:56');
INSERT INTO `admin_operation_log` VALUES ('669', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:10:15', '2020-12-03 06:10:15');
INSERT INTO `admin_operation_log` VALUES ('670', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:46', '2020-12-03 06:11:46');
INSERT INTO `admin_operation_log` VALUES ('671', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:48', '2020-12-03 06:11:48');
INSERT INTO `admin_operation_log` VALUES ('672', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:48', '2020-12-03 06:11:48');
INSERT INTO `admin_operation_log` VALUES ('673', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:49', '2020-12-03 06:11:49');
INSERT INTO `admin_operation_log` VALUES ('674', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:49', '2020-12-03 06:11:49');
INSERT INTO `admin_operation_log` VALUES ('675', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:52', '2020-12-03 06:11:52');
INSERT INTO `admin_operation_log` VALUES ('676', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:11:55', '2020-12-03 06:11:55');
INSERT INTO `admin_operation_log` VALUES ('677', '1', 'admin/configx/saveall/9', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\",\"c_key\":\"uplaod.register_deal\",\"c_name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":\"@include(\'vendor.ueditor.assets\')\"},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:12:06', '2020-12-03 06:12:06');
INSERT INTO `admin_operation_log` VALUES ('678', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 06:12:06', '2020-12-03 06:12:06');
INSERT INTO `admin_operation_log` VALUES ('679', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:08', '2020-12-03 06:12:08');
INSERT INTO `admin_operation_log` VALUES ('680', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:09', '2020-12-03 06:12:09');
INSERT INTO `admin_operation_log` VALUES ('681', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:10', '2020-12-03 06:12:10');
INSERT INTO `admin_operation_log` VALUES ('682', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:10', '2020-12-03 06:12:10');
INSERT INTO `admin_operation_log` VALUES ('683', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:10', '2020-12-03 06:12:10');
INSERT INTO `admin_operation_log` VALUES ('684', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:11', '2020-12-03 06:12:11');
INSERT INTO `admin_operation_log` VALUES ('685', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:12:11', '2020-12-03 06:12:11');
INSERT INTO `admin_operation_log` VALUES ('686', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:12:11', '2020-12-03 06:12:11');
INSERT INTO `admin_operation_log` VALUES ('687', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:12:12', '2020-12-03 06:12:12');
INSERT INTO `admin_operation_log` VALUES ('688', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_9_\":\"1\",\"tabindex\":\"1\",\"do\":null,\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:12:14', '2020-12-03 06:12:14');
INSERT INTO `admin_operation_log` VALUES ('689', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 06:12:14', '2020-12-03 06:12:14');
INSERT INTO `admin_operation_log` VALUES ('690', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_9_\":\"1\",\"tabindex\":\"1\",\"do\":null,\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:12:17', '2020-12-03 06:12:17');
INSERT INTO `admin_operation_log` VALUES ('691', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 06:12:17', '2020-12-03 06:12:17');
INSERT INTO `admin_operation_log` VALUES ('692', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:20', '2020-12-03 06:12:20');
INSERT INTO `admin_operation_log` VALUES ('693', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:12:21', '2020-12-03 06:12:21');
INSERT INTO `admin_operation_log` VALUES ('694', '1', 'admin/configx/saveall/9', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"\\u7f51\\u7ad9\\u914d\\u7f6e\",\"c_key\":\"uplaod.register_deal\",\"c_name\":\"\\u6ce8\\u518c\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:12:26', '2020-12-03 06:12:26');
INSERT INTO `admin_operation_log` VALUES ('695', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 06:12:26', '2020-12-03 06:12:26');
INSERT INTO `admin_operation_log` VALUES ('696', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 06:13:12', '2020-12-03 06:13:12');
INSERT INTO `admin_operation_log` VALUES ('697', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:20', '2020-12-03 06:13:20');
INSERT INTO `admin_operation_log` VALUES ('698', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:22', '2020-12-03 06:13:22');
INSERT INTO `admin_operation_log` VALUES ('699', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:23', '2020-12-03 06:13:23');
INSERT INTO `admin_operation_log` VALUES ('700', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:24', '2020-12-03 06:13:24');
INSERT INTO `admin_operation_log` VALUES ('701', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:24', '2020-12-03 06:13:24');
INSERT INTO `admin_operation_log` VALUES ('702', '1', 'admin/orders/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:32', '2020-12-03 06:13:32');
INSERT INTO `admin_operation_log` VALUES ('703', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:34', '2020-12-03 06:13:34');
INSERT INTO `admin_operation_log` VALUES ('704', '1', 'admin/orders/4/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:37', '2020-12-03 06:13:37');
INSERT INTO `admin_operation_log` VALUES ('705', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:13:39', '2020-12-03 06:13:39');
INSERT INTO `admin_operation_log` VALUES ('706', '1', 'admin/orders/4', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:14:10', '2020-12-03 06:14:10');
INSERT INTO `admin_operation_log` VALUES ('707', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:14:13', '2020-12-03 06:14:13');
INSERT INTO `admin_operation_log` VALUES ('708', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:14:14', '2020-12-03 06:14:14');
INSERT INTO `admin_operation_log` VALUES ('709', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:14:15', '2020-12-03 06:14:15');
INSERT INTO `admin_operation_log` VALUES ('710', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:14:22', '2020-12-03 06:14:22');
INSERT INTO `admin_operation_log` VALUES ('711', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:00', '2020-12-03 06:19:00');
INSERT INTO `admin_operation_log` VALUES ('712', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:01', '2020-12-03 06:19:01');
INSERT INTO `admin_operation_log` VALUES ('713', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:01', '2020-12-03 06:19:01');
INSERT INTO `admin_operation_log` VALUES ('714', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:01', '2020-12-03 06:19:01');
INSERT INTO `admin_operation_log` VALUES ('715', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:01', '2020-12-03 06:19:01');
INSERT INTO `admin_operation_log` VALUES ('716', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:01', '2020-12-03 06:19:01');
INSERT INTO `admin_operation_log` VALUES ('717', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:02', '2020-12-03 06:19:02');
INSERT INTO `admin_operation_log` VALUES ('718', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:02', '2020-12-03 06:19:02');
INSERT INTO `admin_operation_log` VALUES ('719', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:02', '2020-12-03 06:19:02');
INSERT INTO `admin_operation_log` VALUES ('720', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:02', '2020-12-03 06:19:02');
INSERT INTO `admin_operation_log` VALUES ('721', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:02', '2020-12-03 06:19:02');
INSERT INTO `admin_operation_log` VALUES ('722', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:03', '2020-12-03 06:19:03');
INSERT INTO `admin_operation_log` VALUES ('723', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:03', '2020-12-03 06:19:03');
INSERT INTO `admin_operation_log` VALUES ('724', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:03', '2020-12-03 06:19:03');
INSERT INTO `admin_operation_log` VALUES ('725', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:19:03', '2020-12-03 06:19:03');
INSERT INTO `admin_operation_log` VALUES ('726', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:19:18', '2020-12-03 06:19:18');
INSERT INTO `admin_operation_log` VALUES ('727', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:19:19', '2020-12-03 06:19:19');
INSERT INTO `admin_operation_log` VALUES ('728', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:16', '2020-12-03 06:23:16');
INSERT INTO `admin_operation_log` VALUES ('729', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:16', '2020-12-03 06:23:16');
INSERT INTO `admin_operation_log` VALUES ('730', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:16', '2020-12-03 06:23:16');
INSERT INTO `admin_operation_log` VALUES ('731', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:16', '2020-12-03 06:23:16');
INSERT INTO `admin_operation_log` VALUES ('732', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:17', '2020-12-03 06:23:17');
INSERT INTO `admin_operation_log` VALUES ('733', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:18', '2020-12-03 06:23:18');
INSERT INTO `admin_operation_log` VALUES ('734', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:18', '2020-12-03 06:23:18');
INSERT INTO `admin_operation_log` VALUES ('735', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:23:18', '2020-12-03 06:23:18');
INSERT INTO `admin_operation_log` VALUES ('736', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:25:57', '2020-12-03 06:25:57');
INSERT INTO `admin_operation_log` VALUES ('737', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:00', '2020-12-03 06:26:00');
INSERT INTO `admin_operation_log` VALUES ('738', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:01', '2020-12-03 06:26:01');
INSERT INTO `admin_operation_log` VALUES ('739', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:01', '2020-12-03 06:26:01');
INSERT INTO `admin_operation_log` VALUES ('740', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:01', '2020-12-03 06:26:01');
INSERT INTO `admin_operation_log` VALUES ('741', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:01', '2020-12-03 06:26:01');
INSERT INTO `admin_operation_log` VALUES ('742', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:05', '2020-12-03 06:26:05');
INSERT INTO `admin_operation_log` VALUES ('743', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:05', '2020-12-03 06:26:05');
INSERT INTO `admin_operation_log` VALUES ('744', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:05', '2020-12-03 06:26:05');
INSERT INTO `admin_operation_log` VALUES ('745', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:05', '2020-12-03 06:26:05');
INSERT INTO `admin_operation_log` VALUES ('746', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:05', '2020-12-03 06:26:05');
INSERT INTO `admin_operation_log` VALUES ('747', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:26:06', '2020-12-03 06:26:06');
INSERT INTO `admin_operation_log` VALUES ('748', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:31', '2020-12-03 06:28:31');
INSERT INTO `admin_operation_log` VALUES ('749', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:31', '2020-12-03 06:28:31');
INSERT INTO `admin_operation_log` VALUES ('750', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:32', '2020-12-03 06:28:32');
INSERT INTO `admin_operation_log` VALUES ('751', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:32', '2020-12-03 06:28:32');
INSERT INTO `admin_operation_log` VALUES ('752', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:33', '2020-12-03 06:28:33');
INSERT INTO `admin_operation_log` VALUES ('753', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:33', '2020-12-03 06:28:33');
INSERT INTO `admin_operation_log` VALUES ('754', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:33', '2020-12-03 06:28:33');
INSERT INTO `admin_operation_log` VALUES ('755', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:33', '2020-12-03 06:28:33');
INSERT INTO `admin_operation_log` VALUES ('756', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:33', '2020-12-03 06:28:33');
INSERT INTO `admin_operation_log` VALUES ('757', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:34', '2020-12-03 06:28:34');
INSERT INTO `admin_operation_log` VALUES ('758', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:34', '2020-12-03 06:28:34');
INSERT INTO `admin_operation_log` VALUES ('759', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:36', '2020-12-03 06:28:36');
INSERT INTO `admin_operation_log` VALUES ('760', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"uplaod\",\"c_key\":\"uplaod.new_key_here\",\"c_name\":\"s\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:28:49', '2020-12-03 06:28:49');
INSERT INTO `admin_operation_log` VALUES ('761', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 06:28:50', '2020-12-03 06:28:50');
INSERT INTO `admin_operation_log` VALUES ('762', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:28:52', '2020-12-03 06:28:52');
INSERT INTO `admin_operation_log` VALUES ('763', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:29:00', '2020-12-03 06:29:00');
INSERT INTO `admin_operation_log` VALUES ('764', '1', 'admin/config/10', 'DELETE', '127.0.0.1', '{\"_method\":\"delete\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 06:29:04', '2020-12-03 06:29:04');
INSERT INTO `admin_operation_log` VALUES ('765', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:29:04', '2020-12-03 06:29:04');
INSERT INTO `admin_operation_log` VALUES ('766', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:29:07', '2020-12-03 06:29:07');
INSERT INTO `admin_operation_log` VALUES ('767', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:36:24', '2020-12-03 06:36:24');
INSERT INTO `admin_operation_log` VALUES ('768', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:37:37', '2020-12-03 06:37:37');
INSERT INTO `admin_operation_log` VALUES ('769', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:37:37', '2020-12-03 06:37:37');
INSERT INTO `admin_operation_log` VALUES ('770', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-03 06:38:11', '2020-12-03 06:38:11');
INSERT INTO `admin_operation_log` VALUES ('771', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:38:13', '2020-12-03 06:38:13');
INSERT INTO `admin_operation_log` VALUES ('772', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:38:14', '2020-12-03 06:38:14');
INSERT INTO `admin_operation_log` VALUES ('773', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:40:48', '2020-12-03 06:40:48');
INSERT INTO `admin_operation_log` VALUES ('774', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:40:49', '2020-12-03 06:40:49');
INSERT INTO `admin_operation_log` VALUES ('775', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:40:49', '2020-12-03 06:40:49');
INSERT INTO `admin_operation_log` VALUES ('776', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:40:50', '2020-12-03 06:40:50');
INSERT INTO `admin_operation_log` VALUES ('777', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:40:50', '2020-12-03 06:40:50');
INSERT INTO `admin_operation_log` VALUES ('778', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:40:50', '2020-12-03 06:40:50');
INSERT INTO `admin_operation_log` VALUES ('779', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:51', '2020-12-03 06:40:51');
INSERT INTO `admin_operation_log` VALUES ('780', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:51', '2020-12-03 06:40:51');
INSERT INTO `admin_operation_log` VALUES ('781', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:52', '2020-12-03 06:40:52');
INSERT INTO `admin_operation_log` VALUES ('782', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:52', '2020-12-03 06:40:52');
INSERT INTO `admin_operation_log` VALUES ('783', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:52', '2020-12-03 06:40:52');
INSERT INTO `admin_operation_log` VALUES ('784', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:53', '2020-12-03 06:40:53');
INSERT INTO `admin_operation_log` VALUES ('785', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:53', '2020-12-03 06:40:53');
INSERT INTO `admin_operation_log` VALUES ('786', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:53', '2020-12-03 06:40:53');
INSERT INTO `admin_operation_log` VALUES ('787', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:40:53', '2020-12-03 06:40:53');
INSERT INTO `admin_operation_log` VALUES ('788', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:41:37', '2020-12-03 06:41:37');
INSERT INTO `admin_operation_log` VALUES ('789', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:41:37', '2020-12-03 06:41:37');
INSERT INTO `admin_operation_log` VALUES ('790', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 06:41:37', '2020-12-03 06:41:37');
INSERT INTO `admin_operation_log` VALUES ('791', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:42:55', '2020-12-03 06:42:55');
INSERT INTO `admin_operation_log` VALUES ('792', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:42:56', '2020-12-03 06:42:56');
INSERT INTO `admin_operation_log` VALUES ('793', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:42:56', '2020-12-03 06:42:56');
INSERT INTO `admin_operation_log` VALUES ('794', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:43:03', '2020-12-03 06:43:03');
INSERT INTO `admin_operation_log` VALUES ('795', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:46:58', '2020-12-03 06:46:58');
INSERT INTO `admin_operation_log` VALUES ('796', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:46:59', '2020-12-03 06:46:59');
INSERT INTO `admin_operation_log` VALUES ('797', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:46:59', '2020-12-03 06:46:59');
INSERT INTO `admin_operation_log` VALUES ('798', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:46:59', '2020-12-03 06:46:59');
INSERT INTO `admin_operation_log` VALUES ('799', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:47:05', '2020-12-03 06:47:05');
INSERT INTO `admin_operation_log` VALUES ('800', '1', 'admin/configx/edit/9', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:47:20', '2020-12-03 06:47:20');
INSERT INTO `admin_operation_log` VALUES ('801', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:48:15', '2020-12-03 06:48:15');
INSERT INTO `admin_operation_log` VALUES ('802', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:08', '2020-12-03 06:53:08');
INSERT INTO `admin_operation_log` VALUES ('803', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:09', '2020-12-03 06:53:09');
INSERT INTO `admin_operation_log` VALUES ('804', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:10', '2020-12-03 06:53:10');
INSERT INTO `admin_operation_log` VALUES ('805', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:10', '2020-12-03 06:53:10');
INSERT INTO `admin_operation_log` VALUES ('806', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:10', '2020-12-03 06:53:10');
INSERT INTO `admin_operation_log` VALUES ('807', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:11', '2020-12-03 06:53:11');
INSERT INTO `admin_operation_log` VALUES ('808', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:11', '2020-12-03 06:53:11');
INSERT INTO `admin_operation_log` VALUES ('809', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:11', '2020-12-03 06:53:11');
INSERT INTO `admin_operation_log` VALUES ('810', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:11', '2020-12-03 06:53:11');
INSERT INTO `admin_operation_log` VALUES ('811', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:11', '2020-12-03 06:53:11');
INSERT INTO `admin_operation_log` VALUES ('812', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:12', '2020-12-03 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('813', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:12', '2020-12-03 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('814', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:12', '2020-12-03 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('815', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:12', '2020-12-03 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('816', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:53:12', '2020-12-03 06:53:12');
INSERT INTO `admin_operation_log` VALUES ('817', '1', 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:55:41', '2020-12-03 06:55:41');
INSERT INTO `admin_operation_log` VALUES ('818', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 06:55:42', '2020-12-03 06:55:42');
INSERT INTO `admin_operation_log` VALUES ('819', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:01:07', '2020-12-03 07:01:07');
INSERT INTO `admin_operation_log` VALUES ('820', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:01:08', '2020-12-03 07:01:08');
INSERT INTO `admin_operation_log` VALUES ('821', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:01:08', '2020-12-03 07:01:08');
INSERT INTO `admin_operation_log` VALUES ('822', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:01:08', '2020-12-03 07:01:08');
INSERT INTO `admin_operation_log` VALUES ('823', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:01:08', '2020-12-03 07:01:08');
INSERT INTO `admin_operation_log` VALUES ('824', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:01:09', '2020-12-03 07:01:09');
INSERT INTO `admin_operation_log` VALUES ('825', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:01:10', '2020-12-03 07:01:10');
INSERT INTO `admin_operation_log` VALUES ('826', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:01:10', '2020-12-03 07:01:10');
INSERT INTO `admin_operation_log` VALUES ('827', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:01:11', '2020-12-03 07:01:11');
INSERT INTO `admin_operation_log` VALUES ('828', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:45:53', '2020-12-03 07:45:53');
INSERT INTO `admin_operation_log` VALUES ('829', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:48:23', '2020-12-03 07:48:23');
INSERT INTO `admin_operation_log` VALUES ('830', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:48:31', '2020-12-03 07:48:31');
INSERT INTO `admin_operation_log` VALUES ('831', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:48:33', '2020-12-03 07:48:33');
INSERT INTO `admin_operation_log` VALUES ('832', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:48:58', '2020-12-03 07:48:58');
INSERT INTO `admin_operation_log` VALUES ('833', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 07:48:59', '2020-12-03 07:48:59');
INSERT INTO `admin_operation_log` VALUES ('834', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:49:13', '2020-12-03 07:49:13');
INSERT INTO `admin_operation_log` VALUES ('835', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:49:16', '2020-12-03 07:49:16');
INSERT INTO `admin_operation_log` VALUES ('836', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:49:17', '2020-12-03 07:49:17');
INSERT INTO `admin_operation_log` VALUES ('837', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:52:48', '2020-12-03 07:52:48');
INSERT INTO `admin_operation_log` VALUES ('838', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:54:16', '2020-12-03 07:54:16');
INSERT INTO `admin_operation_log` VALUES ('839', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:55:27', '2020-12-03 07:55:27');
INSERT INTO `admin_operation_log` VALUES ('840', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 07:57:06', '2020-12-03 07:57:06');
INSERT INTO `admin_operation_log` VALUES ('841', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-03 08:07:08', '2020-12-03 08:07:08');
INSERT INTO `admin_operation_log` VALUES ('842', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:07:10', '2020-12-03 08:07:10');
INSERT INTO `admin_operation_log` VALUES ('843', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:07:13', '2020-12-03 08:07:13');
INSERT INTO `admin_operation_log` VALUES ('844', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:16', '2020-12-03 08:08:16');
INSERT INTO `admin_operation_log` VALUES ('845', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:18', '2020-12-03 08:08:18');
INSERT INTO `admin_operation_log` VALUES ('846', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:18', '2020-12-03 08:08:18');
INSERT INTO `admin_operation_log` VALUES ('847', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:18', '2020-12-03 08:08:18');
INSERT INTO `admin_operation_log` VALUES ('848', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:18', '2020-12-03 08:08:18');
INSERT INTO `admin_operation_log` VALUES ('849', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:19', '2020-12-03 08:08:19');
INSERT INTO `admin_operation_log` VALUES ('850', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:19', '2020-12-03 08:08:19');
INSERT INTO `admin_operation_log` VALUES ('851', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:19', '2020-12-03 08:08:19');
INSERT INTO `admin_operation_log` VALUES ('852', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:19', '2020-12-03 08:08:19');
INSERT INTO `admin_operation_log` VALUES ('853', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:19', '2020-12-03 08:08:19');
INSERT INTO `admin_operation_log` VALUES ('854', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:20', '2020-12-03 08:08:20');
INSERT INTO `admin_operation_log` VALUES ('855', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:20', '2020-12-03 08:08:20');
INSERT INTO `admin_operation_log` VALUES ('856', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:20', '2020-12-03 08:08:20');
INSERT INTO `admin_operation_log` VALUES ('857', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:20', '2020-12-03 08:08:20');
INSERT INTO `admin_operation_log` VALUES ('858', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:21', '2020-12-03 08:08:21');
INSERT INTO `admin_operation_log` VALUES ('859', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:08:22', '2020-12-03 08:08:22');
INSERT INTO `admin_operation_log` VALUES ('860', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:31', '2020-12-03 08:08:31');
INSERT INTO `admin_operation_log` VALUES ('861', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:35', '2020-12-03 08:08:35');
INSERT INTO `admin_operation_log` VALUES ('862', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:36', '2020-12-03 08:08:36');
INSERT INTO `admin_operation_log` VALUES ('863', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:36', '2020-12-03 08:08:36');
INSERT INTO `admin_operation_log` VALUES ('864', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:36', '2020-12-03 08:08:36');
INSERT INTO `admin_operation_log` VALUES ('865', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:37', '2020-12-03 08:08:37');
INSERT INTO `admin_operation_log` VALUES ('866', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:37', '2020-12-03 08:08:37');
INSERT INTO `admin_operation_log` VALUES ('867', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:38', '2020-12-03 08:08:38');
INSERT INTO `admin_operation_log` VALUES ('868', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:38', '2020-12-03 08:08:38');
INSERT INTO `admin_operation_log` VALUES ('869', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:08:41', '2020-12-03 08:08:41');
INSERT INTO `admin_operation_log` VALUES ('870', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:08:41', '2020-12-03 08:08:41');
INSERT INTO `admin_operation_log` VALUES ('871', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:08:41', '2020-12-03 08:08:41');
INSERT INTO `admin_operation_log` VALUES ('872', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:08:41', '2020-12-03 08:08:41');
INSERT INTO `admin_operation_log` VALUES ('873', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:08:50', '2020-12-03 08:08:50');
INSERT INTO `admin_operation_log` VALUES ('874', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:09:32', '2020-12-03 08:09:32');
INSERT INTO `admin_operation_log` VALUES ('875', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:09:32', '2020-12-03 08:09:32');
INSERT INTO `admin_operation_log` VALUES ('876', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:09:32', '2020-12-03 08:09:32');
INSERT INTO `admin_operation_log` VALUES ('877', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:09:35', '2020-12-03 08:09:35');
INSERT INTO `admin_operation_log` VALUES ('878', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:09:35', '2020-12-03 08:09:35');
INSERT INTO `admin_operation_log` VALUES ('879', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:09:59', '2020-12-03 08:09:59');
INSERT INTO `admin_operation_log` VALUES ('880', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:00', '2020-12-03 08:10:00');
INSERT INTO `admin_operation_log` VALUES ('881', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:00', '2020-12-03 08:10:00');
INSERT INTO `admin_operation_log` VALUES ('882', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:01', '2020-12-03 08:10:01');
INSERT INTO `admin_operation_log` VALUES ('883', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:01', '2020-12-03 08:10:01');
INSERT INTO `admin_operation_log` VALUES ('884', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:01', '2020-12-03 08:10:01');
INSERT INTO `admin_operation_log` VALUES ('885', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:01', '2020-12-03 08:10:01');
INSERT INTO `admin_operation_log` VALUES ('886', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:01', '2020-12-03 08:10:01');
INSERT INTO `admin_operation_log` VALUES ('887', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:02', '2020-12-03 08:10:02');
INSERT INTO `admin_operation_log` VALUES ('888', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:02', '2020-12-03 08:10:02');
INSERT INTO `admin_operation_log` VALUES ('889', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:02', '2020-12-03 08:10:02');
INSERT INTO `admin_operation_log` VALUES ('890', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:02', '2020-12-03 08:10:02');
INSERT INTO `admin_operation_log` VALUES ('891', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:02', '2020-12-03 08:10:02');
INSERT INTO `admin_operation_log` VALUES ('892', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:03', '2020-12-03 08:10:03');
INSERT INTO `admin_operation_log` VALUES ('893', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:03', '2020-12-03 08:10:03');
INSERT INTO `admin_operation_log` VALUES ('894', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:03', '2020-12-03 08:10:03');
INSERT INTO `admin_operation_log` VALUES ('895', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:03', '2020-12-03 08:10:03');
INSERT INTO `admin_operation_log` VALUES ('896', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:03', '2020-12-03 08:10:03');
INSERT INTO `admin_operation_log` VALUES ('897', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:21', '2020-12-03 08:10:21');
INSERT INTO `admin_operation_log` VALUES ('898', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:10:21', '2020-12-03 08:10:21');
INSERT INTO `admin_operation_log` VALUES ('899', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:04', '2020-12-03 08:11:04');
INSERT INTO `admin_operation_log` VALUES ('900', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:04', '2020-12-03 08:11:04');
INSERT INTO `admin_operation_log` VALUES ('901', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:05', '2020-12-03 08:11:05');
INSERT INTO `admin_operation_log` VALUES ('902', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:05', '2020-12-03 08:11:05');
INSERT INTO `admin_operation_log` VALUES ('903', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:05', '2020-12-03 08:11:05');
INSERT INTO `admin_operation_log` VALUES ('904', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:51', '2020-12-03 08:11:51');
INSERT INTO `admin_operation_log` VALUES ('905', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:52', '2020-12-03 08:11:52');
INSERT INTO `admin_operation_log` VALUES ('906', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:52', '2020-12-03 08:11:52');
INSERT INTO `admin_operation_log` VALUES ('907', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:52', '2020-12-03 08:11:52');
INSERT INTO `admin_operation_log` VALUES ('908', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:54', '2020-12-03 08:11:54');
INSERT INTO `admin_operation_log` VALUES ('909', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:11:54', '2020-12-03 08:11:54');
INSERT INTO `admin_operation_log` VALUES ('910', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:11:55', '2020-12-03 08:11:55');
INSERT INTO `admin_operation_log` VALUES ('911', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:11:55', '2020-12-03 08:11:55');
INSERT INTO `admin_operation_log` VALUES ('912', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '[]', '2020-12-03 08:13:55', '2020-12-03 08:13:55');
INSERT INTO `admin_operation_log` VALUES ('913', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:16:39', '2020-12-03 08:16:39');
INSERT INTO `admin_operation_log` VALUES ('914', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:16:39', '2020-12-03 08:16:39');
INSERT INTO `admin_operation_log` VALUES ('915', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:30:06', '2020-12-03 08:30:06');
INSERT INTO `admin_operation_log` VALUES ('916', '1', 'admin', 'GET', '127.0.0.1', '[]', '2020-12-03 08:39:27', '2020-12-03 08:39:27');
INSERT INTO `admin_operation_log` VALUES ('917', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 08:39:29', '2020-12-03 08:39:29');
INSERT INTO `admin_operation_log` VALUES ('918', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:06:59', '2020-12-03 09:06:59');
INSERT INTO `admin_operation_log` VALUES ('919', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.kefu_path\",\"c_name\":\"\\u5728\\u7ebf\\u5ba2\\u670d\\u94fe\\u63a5\",\"c_element\":\"normal\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:07:32', '2020-12-03 09:07:32');
INSERT INTO `admin_operation_log` VALUES ('920', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 09:07:32', '2020-12-03 09:07:32');
INSERT INTO `admin_operation_log` VALUES ('921', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:07:33', '2020-12-03 09:07:33');
INSERT INTO `admin_operation_log` VALUES ('922', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:07:41', '2020-12-03 09:07:41');
INSERT INTO `admin_operation_log` VALUES ('923', '1', 'admin/configx/edit/11', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:07:44', '2020-12-03 09:07:44');
INSERT INTO `admin_operation_log` VALUES ('924', '1', 'admin/configx/saveall/11', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"\\u57fa\\u672c\\u8bbe\\u7f6e\",\"c_key\":\"base.kefu_path\",\"c_name\":\"\\u5728\\u7ebf\\u5ba2\\u670d\\u94fe\\u63a5\",\"c_element\":\"textarea\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:07:56', '2020-12-03 09:07:56');
INSERT INTO `admin_operation_log` VALUES ('925', '1', 'admin/configx/edit/11', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 09:07:56', '2020-12-03 09:07:56');
INSERT INTO `admin_operation_log` VALUES ('926', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:07:59', '2020-12-03 09:07:59');
INSERT INTO `admin_operation_log` VALUES ('927', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:08:07', '2020-12-03 09:08:07');
INSERT INTO `admin_operation_log` VALUES ('928', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:08:09', '2020-12-03 09:08:09');
INSERT INTO `admin_operation_log` VALUES ('929', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.kefu_mobile\",\"c_name\":\"\\u5ba2\\u670d\\u7535\\u8bdd\",\"c_element\":\"normal\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:08:55', '2020-12-03 09:08:55');
INSERT INTO `admin_operation_log` VALUES ('930', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 09:08:55', '2020-12-03 09:08:55');
INSERT INTO `admin_operation_log` VALUES ('931', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:08:57', '2020-12-03 09:08:57');
INSERT INTO `admin_operation_log` VALUES ('932', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_11_\":\"http:\\/\\/www.baidu.com\",\"c_12_\":\"18715465555\",\"c_9_\":\"<p>1<\\/p>\",\"tabindex\":\"0\",\"do\":null,\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:09:23', '2020-12-03 09:09:23');
INSERT INTO `admin_operation_log` VALUES ('933', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 09:09:24', '2020-12-03 09:09:24');
INSERT INTO `admin_operation_log` VALUES ('934', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:09:56', '2020-12-03 09:09:56');
INSERT INTO `admin_operation_log` VALUES ('935', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"uplaod\",\"c_key\":\"uplaod.about_us\",\"c_name\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:10:24', '2020-12-03 09:10:24');
INSERT INTO `admin_operation_log` VALUES ('936', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 09:10:24', '2020-12-03 09:10:24');
INSERT INTO `admin_operation_log` VALUES ('937', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:10:26', '2020-12-03 09:10:26');
INSERT INTO `admin_operation_log` VALUES ('938', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_11_\":\"http:\\/\\/www.baidu.com\",\"c_12_\":\"18715465555\",\"c_9_\":\"<p>\\u6ce8\\u518c\\u534f\\u8bae<\\/p>\",\"c_13_\":\"<p>\\u5173\\u4e8e\\u6211\\u4eec<\\/p>\",\"tabindex\":\"1\",\"do\":null,\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:10:36', '2020-12-03 09:10:36');
INSERT INTO `admin_operation_log` VALUES ('939', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 09:10:36', '2020-12-03 09:10:36');
INSERT INTO `admin_operation_log` VALUES ('940', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:10:37', '2020-12-03 09:10:37');
INSERT INTO `admin_operation_log` VALUES ('941', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:10:43', '2020-12-03 09:10:43');
INSERT INTO `admin_operation_log` VALUES ('942', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"uplaod\",\"c_key\":\"uplaod.user_deal\",\"c_name\":\"\\u7528\\u6237\\u534f\\u8bae\",\"c_element\":\"editor\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"1\",\"do\":\"new_config\",\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:11:05', '2020-12-03 09:11:05');
INSERT INTO `admin_operation_log` VALUES ('943', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-03 09:11:05', '2020-12-03 09:11:05');
INSERT INTO `admin_operation_log` VALUES ('944', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:11:07', '2020-12-03 09:11:07');
INSERT INTO `admin_operation_log` VALUES ('945', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_11_\":\"http:\\/\\/www.baidu.com\",\"c_12_\":\"18715465555\",\"c_9_\":\"<p>\\u6ce8\\u518c\\u534f\\u8bae<\\/p>\",\"c_13_\":\"<p>\\u5173\\u4e8e\\u6211\\u4eec<\\/p>\",\"c_14_\":\"<p>\\u7528\\u6237\\u534f\\u8bae<\\/p>\",\"tabindex\":\"1\",\"do\":null,\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:11:14', '2020-12-03 09:11:14');
INSERT INTO `admin_operation_log` VALUES ('946', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 09:11:14', '2020-12-03 09:11:14');
INSERT INTO `admin_operation_log` VALUES ('947', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:25:04', '2020-12-03 09:25:04');
INSERT INTO `admin_operation_log` VALUES ('948', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 09:25:19', '2020-12-03 09:25:19');
INSERT INTO `admin_operation_log` VALUES ('949', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_11_\":\"http:\\/\\/www.baidu.com\",\"c_12_\":\"18715465555\",\"c_9_\":\"<p>\\u6ce8\\u518c\\u534f\\u8bae<\\/p><p><img src=\\\"http:\\/\\/fenxiao.com\\/storage\\/uploads\\/image\\/2020\\/12\\/03\\/img_logo@2x.png\\\" title=\\\"\\/uploads\\/image\\/2020\\/12\\/03\\/img_logo@2x.png\\\" alt=\\\"img_logo@2x.png\\\"\\/><\\/p>\",\"c_13_\":\"<p>\\u5173\\u4e8e\\u6211\\u4eec<\\/p>\",\"c_14_\":\"<p>\\u7528\\u6237\\u534f\\u8bae<\\/p>\",\"tabindex\":\"1\",\"do\":null,\"_token\":\"5KaXrM3EUVDQ86KOTqQxZixdZ7gp3mlIYeIPSZD4\"}', '2020-12-03 09:25:44', '2020-12-03 09:25:44');
INSERT INTO `admin_operation_log` VALUES ('950', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-03 09:25:45', '2020-12-03 09:25:45');
INSERT INTO `admin_operation_log` VALUES ('951', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 10:22:25', '2020-12-03 10:22:25');
INSERT INTO `admin_operation_log` VALUES ('952', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 10:31:39', '2020-12-03 10:31:39');
INSERT INTO `admin_operation_log` VALUES ('953', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-03 10:31:40', '2020-12-03 10:31:40');
INSERT INTO `admin_operation_log` VALUES ('954', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:04:38', '2020-12-04 01:04:38');
INSERT INTO `admin_operation_log` VALUES ('955', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.banner\",\"c_name\":\"\\u9996\\u9875\\u9876\\u7aefbanner\\u56fe\",\"c_element\":\"image\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\"}', '2020-12-04 01:05:12', '2020-12-04 01:05:12');
INSERT INTO `admin_operation_log` VALUES ('956', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-04 01:05:12', '2020-12-04 01:05:12');
INSERT INTO `admin_operation_log` VALUES ('957', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:05:15', '2020-12-04 01:05:15');
INSERT INTO `admin_operation_log` VALUES ('958', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_11_\":\"http:\\/\\/www.baidu.com\",\"c_12_\":\"18715465555\",\"c_9_\":\"<p>\\u6ce8\\u518c\\u534f\\u8bae<\\/p><p><img src=\\\"http:\\/\\/fenxiao.com\\/storage\\/uploads\\/image\\/2020\\/12\\/03\\/img_logo@2x.png\\\" title=\\\"\\/uploads\\/image\\/2020\\/12\\/03\\/img_logo@2x.png\\\" alt=\\\"img_logo@2x.png\\\"\\/><\\/p>\",\"c_13_\":\"<p>\\u5173\\u4e8e\\u6211\\u4eec<\\/p>\",\"c_14_\":\"<p>\\u7528\\u6237\\u534f\\u8bae<\\/p>\",\"tabindex\":\"0\",\"do\":null,\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\"}', '2020-12-04 01:07:15', '2020-12-04 01:07:15');
INSERT INTO `admin_operation_log` VALUES ('959', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-04 01:07:15', '2020-12-04 01:07:15');
INSERT INTO `admin_operation_log` VALUES ('960', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:53:31', '2020-12-04 01:53:31');
INSERT INTO `admin_operation_log` VALUES ('961', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:53:44', '2020-12-04 01:53:44');
INSERT INTO `admin_operation_log` VALUES ('962', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:53:44', '2020-12-04 01:53:44');
INSERT INTO `admin_operation_log` VALUES ('963', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:53:44', '2020-12-04 01:53:44');
INSERT INTO `admin_operation_log` VALUES ('964', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 01:54:02', '2020-12-04 01:54:02');
INSERT INTO `admin_operation_log` VALUES ('965', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 01:54:03', '2020-12-04 01:54:03');
INSERT INTO `admin_operation_log` VALUES ('966', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 01:54:03', '2020-12-04 01:54:03');
INSERT INTO `admin_operation_log` VALUES ('967', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-04 01:54:13', '2020-12-04 01:54:13');
INSERT INTO `admin_operation_log` VALUES ('968', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:54:14', '2020-12-04 01:54:14');
INSERT INTO `admin_operation_log` VALUES ('969', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:55:48', '2020-12-04 01:55:48');
INSERT INTO `admin_operation_log` VALUES ('970', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-04 01:56:08', '2020-12-04 01:56:08');
INSERT INTO `admin_operation_log` VALUES ('971', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:56:08', '2020-12-04 01:56:08');
INSERT INTO `admin_operation_log` VALUES ('972', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-04 01:58:59', '2020-12-04 01:58:59');
INSERT INTO `admin_operation_log` VALUES ('973', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 01:58:59', '2020-12-04 01:58:59');
INSERT INTO `admin_operation_log` VALUES ('974', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-04 02:00:06', '2020-12-04 02:00:06');
INSERT INTO `admin_operation_log` VALUES ('975', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 02:00:07', '2020-12-04 02:00:07');
INSERT INTO `admin_operation_log` VALUES ('976', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 02:00:08', '2020-12-04 02:00:08');
INSERT INTO `admin_operation_log` VALUES ('977', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 02:00:09', '2020-12-04 02:00:09');
INSERT INTO `admin_operation_log` VALUES ('978', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 02:00:09', '2020-12-04 02:00:09');
INSERT INTO `admin_operation_log` VALUES ('979', '1', 'admin/orders', 'GET', '127.0.0.1', '[]', '2020-12-04 02:00:09', '2020-12-04 02:00:09');
INSERT INTO `admin_operation_log` VALUES ('980', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-04 02:00:59', '2020-12-04 02:00:59');
INSERT INTO `admin_operation_log` VALUES ('981', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 02:00:59', '2020-12-04 02:00:59');
INSERT INTO `admin_operation_log` VALUES ('982', '1', 'admin/_handle_action_', 'POST', '127.0.0.1', '{\"_token\":\"mdFuvWjcciiuT8JAKaqu8HwNbjhT5tQJgDiyoAkX\",\"_action\":\"App_Admin_Actions_Test_ImportPost\"}', '2020-12-04 02:15:20', '2020-12-04 02:15:20');
INSERT INTO `admin_operation_log` VALUES ('983', '1', 'admin/orders', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 02:15:20', '2020-12-04 02:15:20');
INSERT INTO `admin_operation_log` VALUES ('984', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 08:58:34', '2020-12-04 08:58:34');
INSERT INTO `admin_operation_log` VALUES ('985', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 08:58:58', '2020-12-04 08:58:58');
INSERT INTO `admin_operation_log` VALUES ('986', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 08:59:00', '2020-12-04 08:59:00');
INSERT INTO `admin_operation_log` VALUES ('987', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.ios_path\",\"c_name\":\"ios\\u4e0b\\u8f7d\\u94fe\\u63a5\",\"c_element\":\"textarea\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"kzBX1uxtVYESGPynbmhz3e3ZkL7qNTYL6CJpjP4Z\"}', '2020-12-04 08:59:30', '2020-12-04 08:59:30');
INSERT INTO `admin_operation_log` VALUES ('988', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-04 08:59:31', '2020-12-04 08:59:31');
INSERT INTO `admin_operation_log` VALUES ('989', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 08:59:32', '2020-12-04 08:59:32');
INSERT INTO `admin_operation_log` VALUES ('990', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 08:59:38', '2020-12-04 08:59:38');
INSERT INTO `admin_operation_log` VALUES ('991', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.andr_path\",\"c_name\":\"\\u5b89\\u5353\\u4e0b\\u8f7d\\u94fe\\u63a5\",\"c_element\":\"textarea\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"kzBX1uxtVYESGPynbmhz3e3ZkL7qNTYL6CJpjP4Z\"}', '2020-12-04 09:00:13', '2020-12-04 09:00:13');
INSERT INTO `admin_operation_log` VALUES ('992', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-04 09:00:13', '2020-12-04 09:00:13');
INSERT INTO `admin_operation_log` VALUES ('993', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:00:17', '2020-12-04 09:00:17');
INSERT INTO `admin_operation_log` VALUES ('994', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:00:19', '2020-12-04 09:00:19');
INSERT INTO `admin_operation_log` VALUES ('995', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"values\":{\"c_type\":\"base\",\"c_key\":\"base.versions_code\",\"c_name\":\"\\u7248\\u672c\\u53f7\",\"c_element\":\"normal\",\"c_help\":null,\"c_options\":null},\"tabindex\":\"0\",\"do\":\"new_config\",\"_token\":\"kzBX1uxtVYESGPynbmhz3e3ZkL7qNTYL6CJpjP4Z\"}', '2020-12-04 09:00:50', '2020-12-04 09:00:50');
INSERT INTO `admin_operation_log` VALUES ('996', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\"}', '2020-12-04 09:00:50', '2020-12-04 09:00:50');
INSERT INTO `admin_operation_log` VALUES ('997', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:00:51', '2020-12-04 09:00:51');
INSERT INTO `admin_operation_log` VALUES ('998', '1', 'admin/configx/saveall/0', 'POST', '127.0.0.1', '{\"c_6_\":\"20\",\"c_7_\":\"10\",\"c_11_\":\"http:\\/\\/www.baidu.com\",\"c_12_\":\"18715465555\",\"c_16_\":\"1\",\"c_17_\":\"1\",\"c_18_\":\"V1.0\",\"c_9_\":\"<p>\\u6ce8\\u518c\\u534f\\u8bae<\\/p><p><img src=\\\"http:\\/\\/fenxiao.com\\/storage\\/uploads\\/image\\/2020\\/12\\/03\\/img_logo@2x.png\\\" title=\\\"\\/uploads\\/image\\/2020\\/12\\/03\\/img_logo@2x.png\\\" alt=\\\"img_logo@2x.png\\\"\\/><\\/p>\",\"c_13_\":\"<p>\\u5173\\u4e8e\\u6211\\u4eec<\\/p>\",\"c_14_\":\"<p>\\u7528\\u6237\\u534f\\u8bae<\\/p>\",\"tabindex\":\"0\",\"do\":null,\"_token\":\"kzBX1uxtVYESGPynbmhz3e3ZkL7qNTYL6CJpjP4Z\"}', '2020-12-04 09:01:03', '2020-12-04 09:01:03');
INSERT INTO `admin_operation_log` VALUES ('999', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '[]', '2020-12-04 09:01:03', '2020-12-04 09:01:03');
INSERT INTO `admin_operation_log` VALUES ('1000', '1', 'admin/configx/edit/0', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:02:30', '2020-12-04 09:02:30');
INSERT INTO `admin_operation_log` VALUES ('1001', '1', 'admin/configx/edit/14', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:02:35', '2020-12-04 09:02:35');
INSERT INTO `admin_operation_log` VALUES ('1002', '1', 'admin/configx/edit/18', 'GET', '127.0.0.1', '{\"do\":\"new_config\",\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:02:40', '2020-12-04 09:02:40');
INSERT INTO `admin_operation_log` VALUES ('1003', '1', 'admin/configx/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2020-12-04 09:02:51', '2020-12-04 09:02:51');

-- ----------------------------
-- Table structure for `admin_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', 'Admin Config', 'ext.config', '', '/config*', '2020-12-01 06:46:29', '2020-12-01 06:46:29');
INSERT INTO `admin_permissions` VALUES ('7', 'Admin Configx', 'ext.configx', '', '/configx/*', '2020-12-01 06:48:44', '2020-12-01 06:48:44');

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2020-12-01 05:59:27', '2020-12-01 05:59:27');

-- ----------------------------
-- Table structure for `admin_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for `admin_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `admin_role_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$2tFR5UnUJf5HPr35pPUyJeby5HinDbihuhEvDvAEjDQGWoJL/jXUe', 'Administrator', null, 'CsoSRsdyxcNgsIZkynccMFJUwO0PYXwGfeD9RcfX9LjnwKDOsmbbmIWiu3n2', '2020-12-01 05:59:27', '2020-12-01 05:59:27');

-- ----------------------------
-- Table structure for `admin_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '1', 'http://www.baidu.com', '0', '0');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `terrace_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平台',
  `status` tinyint(3) DEFAULT '1' COMMENT '1上架  2下架',
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '合肥', '1,2', '1', '0', '0');
INSERT INTO `city` VALUES ('2', '蚌埠', '1,2', '1', '0', '0');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `flow`
-- ----------------------------
DROP TABLE IF EXISTS `flow`;
CREATE TABLE `flow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0' COMMENT '获取佣金或者提现的人',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '获取的佣金数',
  `afford_user_id` int(10) DEFAULT '0' COMMENT '提供佣金的人',
  `type` tinyint(3) DEFAULT '0' COMMENT '类型  1上级佣金    ',
  `level` tinyint(10) DEFAULT '0' COMMENT '1 一级分佣   2二级分佣',
  `terrace_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of flow
-- ----------------------------
INSERT INTO `flow` VALUES ('1', '1', '2.00', '1', '1', '1', '顺丰快递', '1606888132', '0');
INSERT INTO `flow` VALUES ('2', '1', '1.00', '1', '2', '1', '顺丰快递', '1606888132', '0');
INSERT INTO `flow` VALUES ('3', '1', '2.00', '1', '1', '1', '顺丰快递', '1606905712', '0');
INSERT INTO `flow` VALUES ('4', '1', '1.00', '1', '2', '1', '顺丰快递', '1606905712', '0');
INSERT INTO `flow` VALUES ('5', '1', '2.00', '1', '1', '1', '顺丰快递', '1606905786', '0');
INSERT INTO `flow` VALUES ('6', '1', '1.00', '1', '2', '1', '顺丰快递', '1606905786', '0');
INSERT INTO `flow` VALUES ('7', '1', '2.00', '1', '1', '1', '顺丰快递', '1606961436', '0');
INSERT INTO `flow` VALUES ('8', '1', '1.00', '1', '1', '2', '顺丰快递', '1606961436', '0');
INSERT INTO `flow` VALUES ('9', '1', '2.00', '1', '1', '1', '顺丰快递', '1606961577', '0');
INSERT INTO `flow` VALUES ('10', '1', '1.00', '1', '1', '2', '顺丰快递', '1606961577', '0');
INSERT INTO `flow` VALUES ('11', '1', '2.00', '1', '1', '1', '顺丰快递', '1606962033', '0');
INSERT INTO `flow` VALUES ('12', '1', '1.00', '1', '1', '2', '顺丰快递', '1606962033', '0');
INSERT INTO `flow` VALUES ('13', '1', '2.00', '1', '1', '1', '顺丰快递', '1606962126', '0');
INSERT INTO `flow` VALUES ('14', '1', '1.00', '1', '1', '2', '顺丰快递', '1606962126', '0');
INSERT INTO `flow` VALUES ('15', '1', '2.00', '1', '1', '1', '顺丰快递', '1607046854', '0');
INSERT INTO `flow` VALUES ('16', '1', '1.00', '1', '1', '2', '顺丰快递', '1607046854', '0');
INSERT INTO `flow` VALUES ('17', '1', '2.00', '1', '1', '1', '顺丰快递', '1607046968', '0');
INSERT INTO `flow` VALUES ('18', '1', '1.00', '1', '1', '2', '顺丰快递', '1607046968', '0');
INSERT INTO `flow` VALUES ('19', '1', '2.00', '1', '1', '1', '顺丰快递', '1607047139', '0');
INSERT INTO `flow` VALUES ('20', '1', '1.00', '1', '1', '2', '顺丰快递', '1607047139', '0');
INSERT INTO `flow` VALUES ('21', '1', '2.00', '1', '1', '1', '顺丰快递', '1607047206', '0');
INSERT INTO `flow` VALUES ('22', '1', '1.00', '1', '1', '2', '顺丰快递', '1607047206', '0');
INSERT INTO `flow` VALUES ('23', '1', '2.00', '1', '1', '1', '顺丰快递', '1607047259', '0');
INSERT INTO `flow` VALUES ('24', '1', '1.00', '1', '1', '2', '顺丰快递', '1607047259', '0');
INSERT INTO `flow` VALUES ('25', '1', '2.00', '1', '1', '1', '顺丰快递', '1607048120', '0');
INSERT INTO `flow` VALUES ('26', '1', '1.00', '1', '1', '2', '顺丰快递', '1607048120', '0');
INSERT INTO `flow` VALUES ('27', '1', '1.00', '0', '2', '0', null, '0', '0');
INSERT INTO `flow` VALUES ('28', '1', '1.00', '0', '2', '0', null, '0', '0');
INSERT INTO `flow` VALUES ('29', '1', '1.00', '0', '2', '0', null, '0', '0');
INSERT INTO `flow` VALUES ('30', '1', '1.00', '0', '2', '0', null, '0', '0');
INSERT INTO `flow` VALUES ('31', '1', '1.00', '0', '2', '0', null, '0', '0');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_04_173148_create_admin_tables', '1');
INSERT INTO `migrations` VALUES ('4', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('5', '2017_07_17_040159_create_config_table', '2');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci COMMENT '描述',
  `content` text COLLATE utf8_unicode_ci,
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '测试', '测试', '测试', '1671111111', '0');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '姓名',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '时间格式 2020-11-27',
  `format_time` int(10) DEFAULT '0' COMMENT '时间戳',
  `terrace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '平台名称',
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '城市',
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('4', '3', '张三', '10.00', '18715462043', '2020-12-04', '0', '顺丰快递', '合肥', '1606905712', '1606905712');
INSERT INTO `order` VALUES ('5', '3', '张三', '10.00', '18715462043', '2020-12-13', '0', '顺丰快递', '合肥', '1606905786', '1606905786');
INSERT INTO `order` VALUES ('6', '8', '张三', '10.00', '18715462043', '2020-12-11', '0', '顺丰快递', '合肥', '1606961436', '1606961436');
INSERT INTO `order` VALUES ('7', '1', '张三', '10.00', '18715462043', '2020-12-04', '0', '顺丰快递', '合肥', '1606961577', '1606961577');
INSERT INTO `order` VALUES ('8', '1', '张三', '10.00', '18715462043', '2020-12-04', '0', '顺丰快递', '合肥', '1606962033', '1606962033');
INSERT INTO `order` VALUES ('9', '1', '张三', '10.00', '18715462043', '2020-12-04', '0', '顺丰快递', '合肥', '1606962126', '1606962126');
INSERT INTO `order` VALUES ('10', '1', '张三', '10.00', '18715462043', '2020-12-04', '0', '顺丰快递', '合肥', '1607046854', '1607046854');
INSERT INTO `order` VALUES ('11', '1', '张三', '10.00', '18715462043', '2020-12-14', '0', '顺丰快递', '合肥', '1607046968', '1607046968');
INSERT INTO `order` VALUES ('12', '1', '张三', '10.00', '18715462043', '2020-12-14', '0', '顺丰快递', '合肥', '1607047139', '1607047139');
INSERT INTO `order` VALUES ('13', '1', '张三', '10.00', '18715462043', '2020-12-14', '0', '顺丰快递', '合肥', '1607047206', '1607047206');
INSERT INTO `order` VALUES ('14', '1', '张三', '10.00', '18715462043', '2020-12-15', '1607990400', '顺丰快递', '合肥', '1607047259', '1607047259');
INSERT INTO `order` VALUES ('15', '1', '张三', '10.00', '18715462043', '2020-12-04', '1607040000', '顺丰快递', '合肥', '1607048120', '1607048120');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `terrace`
-- ----------------------------
DROP TABLE IF EXISTS `terrace`;
CREATE TABLE `terrace` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '跳转链接',
  `notice_info` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '提示文字',
  `status` tinyint(3) DEFAULT '1' COMMENT '1默认不推荐  2推荐',
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of terrace
-- ----------------------------
INSERT INTO `terrace` VALUES ('1', '11', '顺丰快递', 'http://www.baidu.com', 'cesh', '2', '0', '0');
INSERT INTO `terrace` VALUES ('2', '11', '韵达快递', 'http://www.baidu.com', '测试', '2', '0', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册城市',
  `city_id` int(10) DEFAULT '0',
  `terrace_ids` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册平台  格式：1,2,3,4',
  `terrace_names` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '注册平台名称  多个',
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `front_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证正面照',
  `back_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份证正面照',
  `hand_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手持身份证照片',
  `parent_id` int(10) DEFAULT '0' COMMENT '上级id',
  `parent_two_id` int(10) DEFAULT '0' COMMENT '我的上级id',
  `status` tinyint(3) DEFAULT '1' COMMENT '1正常  2冻结',
  `total_money` decimal(10,2) DEFAULT '0.00',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '佣金',
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '18715462043', 'e10adc3949ba59abbe56e057f20f883e', '合肥', '1', '2', '顺丰快递', '张三', null, null, null, '1', '1', '1', '27.00', '40.00', '0', '1607054525');
INSERT INTO `user` VALUES ('4', '11111111112', '76d80224611fc919a5d54f0ff9fba446', '合肥', '1', '1', '顺丰快递', '张敏', 'font_card2020120210253511111111112.png', 'back_card2020120210253511111111112.png', 'hand_card2020120210253511111111112.png', '1', '1', '1', null, '0.00', '1606904735', '1606904735');
INSERT INTO `user` VALUES ('3', '11111111111', '76d80224611fc919a5d54f0ff9fba446', '合肥', '1', '1', '顺丰快递', '张敏', 'font_card2020120210055511111111111.png', 'back_card2020120210055511111111111.png', 'hand_card2020120210055511111111111.png', '1', '1', '1', null, '0.00', '1606903555', '1606903555');
INSERT INTO `user` VALUES ('5', '11111111113', '76d80224611fc919a5d54f0ff9fba446', '合肥', '1', '1', '顺丰快递', '张敏', 'font_card2020120210290811111111113.png', 'back_card2020120210290811111111113.png', 'hand_card2020120210290811111111113.png', '1', '1', '1', null, '0.00', '0', '0');
INSERT INTO `user` VALUES ('6', '11111111114', '76d80224611fc919a5d54f0ff9fba446', '合肥', '1', '1', '顺丰快递', '张敏', 'font_card2020120210302511111111114.png', 'back_card2020120210302511111111114.png', 'hand_card2020120210302511111111114.png', '1', '1', '1', null, '0.00', '0', '0');
INSERT INTO `user` VALUES ('7', '11111111115', '76d80224611fc919a5d54f0ff9fba446', '合肥', '1', '1', '顺丰快递', '张敏', 'font_card2020120210304711111111115.png', 'back_card2020120210304711111111115.png', 'hand_card2020120210304711111111115.png', '1', '1', '1', null, '0.00', '0', '0');
INSERT INTO `user` VALUES ('8', '11111111116', '76d80224611fc919a5d54f0ff9fba446', '合肥', '1', '1', '顺丰快递', '张敏', 'font_card2020120400562511111111116.png', 'back_card2020120400562511111111116.png', 'hand_card2020120400562511111111116.png', '1', '1', '1', '0.00', '0.00', '0', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for `withdrawal`
-- ----------------------------
DROP TABLE IF EXISTS `withdrawal`;
CREATE TABLE `withdrawal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT '0',
  `money` decimal(10,2) DEFAULT NULL,
  `realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alipaycode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(3) DEFAULT '1' COMMENT '1待审核  2审核通过',
  `created_at` int(10) DEFAULT '0',
  `updated_at` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of withdrawal
-- ----------------------------
INSERT INTO `withdrawal` VALUES ('1', '1', '1.00', '张敏', '18844444444', '1', '1607053438', '1607053438');
INSERT INTO `withdrawal` VALUES ('2', '1', '1.00', '张敏', '15566666666', '1', '1607053713', '1607053713');
INSERT INTO `withdrawal` VALUES ('3', '1', '1.00', '张敏', '15566666666', '1', '1607053732', '1607053732');
INSERT INTO `withdrawal` VALUES ('4', '1', '1.00', '张敏', '15566666666', '1', '1607053760', '1607053760');
INSERT INTO `withdrawal` VALUES ('5', '1', '1.00', '张敏', '15566666666', '1', '1607054525', '1607054525');
