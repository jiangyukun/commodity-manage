/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-09 21:45:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_products_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_products_t`;
CREATE TABLE `iee_products_t` (
  `id` varchar(20) NOT NULL,
  `barcode` varchar(13) NOT NULL COMMENT '条形码, 一般通过扫描上商品一维条形码获取(长度13位)',
  `price` double(8,2) NOT NULL COMMENT '产品价格',
  `name` varchar(50) NOT NULL COMMENT '产品名称',
  `img_id` varchar(100) NOT NULL COMMENT '图片ID,映射云图片表(iee_cloud_img_t)表主键ID',
  `type` smallint(2) NOT NULL default '0' COMMENT '产品分类，0表示默认分类',
  `description` varchar(500) default NULL,
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='平台公共产品库';

-- ----------------------------
-- Records of iee_products_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-25 22:46:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_position_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_position_t`;
CREATE TABLE `iee_position_t` (
  `id` int(8) NOT NULL auto_increment,
  `district_id` int(8) NOT NULL default '-1' COMMENT '服务区域ID,对应iee_serve_district_t表主键ID',
  `addr` varchar(100) default NULL COMMENT '具体位置',
  `state` smallint(1) NOT NULL default '0' COMMENT '状态 默认值为1； 0无效，1有效',
  `service` varchar(500) default NULL COMMENT '服务描述',
  `qrcode` varchar(100) default NULL COMMENT '二维码',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='位置配置表';

-- ----------------------------
-- Records of iee_position_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 21:46:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_position_purchase_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_position_purchase_t`;
CREATE TABLE `iee_position_purchase_t` (
  `id` int(8) NOT NULL COMMENT '主键ID',
  `mid` int(8) NOT NULL COMMENT '商户ID，映射商户表(iee_merchat_t)主键ID',
  `quantity` int(3) NOT NULL default '0' COMMENT '购买数量',
  `state` smallint(1) NOT NULL default '0' COMMENT '状态 0 购买中，1购买成功',
  `description` varchar(500) default NULL COMMENT '购买说明',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='批量购买专属二维码';

-- ----------------------------
-- Records of iee_position_purchase_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 14:29:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_serve_district_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_serve_district_t`;
CREATE TABLE `iee_serve_district_t` (
  `id` int(8) NOT NULL auto_increment,
  `mid` varchar(8) default NULL COMMENT '商户ID,映射商户表(iee_merchat_t)主键ID',
  `pid` smallint(2) default NULL COMMENT '省份ID,映射iee_province_t表主键ID',
  `cid` smallint(4) default NULL COMMENT '城市ID,映射iee_city_t表主键ID',
  `tid` smallint(6) default NULL COMMENT '县、区ID,映射iee_town_t表主键ID',
  `addr` varchar(100) default NULL COMMENT '详细地址',
  `state` smallint(1) default '0' COMMENT '状态 0未使用，1已使用',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `iee_serve_district_pk` (`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_serve_district_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 23:39:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_commodity_temp_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_commodity_temp_t`;
CREATE TABLE `iee_commodity_temp_t` (
  `mid` int(8) NOT NULL COMMENT '商户ID,映射商户表iee_merchant_t表主键ID',
  `cid` int(8) NOT NULL COMMENT '商品ID，映射iee_commondity_t表主键ID',
  `uid` varchar(50) NOT NULL COMMENT '用户ID',
  `amount` int(2) NOT NULL default '0' COMMENT '商品数量总数',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`cid`,`uid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户选择商品临时表';

-- ----------------------------
-- Records of iee_commodity_temp_t
-- ----------------------------
INSERT INTO `iee_commodity_temp_t` VALUES ('0', '70', '123', '1', null, null, null, null);

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-26 12:05:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_commodity_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_commodity_t`;
CREATE TABLE `iee_commodity_t` (
  `id` int(8) NOT NULL auto_increment,
  `tid` int(3) default NULL COMMENT '商品类型ID，映射iee_commondity_type表主键IDl列',
  `barcode` varchar(20) default NULL COMMENT '条形码',
  `price` double(8,2) default NULL COMMENT '价格',
  `name` varchar(50) default NULL COMMENT '商品名',
  `img_id` varchar(50) default NULL COMMENT '图片ID,映射云图片表(iee_cloud_img_t)表主键ID',
  `state` smallint(1) NOT NULL default '1' COMMENT '有效状态 0 无效，已删除 1有效',
  `is_recommend` smallint(1) NOT NULL default '0' COMMENT '是否 0不推荐，1推荐',
  `specification` varchar(50) default NULL COMMENT '商品规格',
  `description` varchar(500) default NULL COMMENT '描述',
  `created_by` int(8) default NULL COMMENT '创建人',
  `created_date` datetime default NULL COMMENT '创建时间',
  `updated_by` int(8) default NULL COMMENT '修改人',
  `updated_date` datetime default NULL COMMENT '最后修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
-- Records of iee_commodity_t
-- ----------------------------
INSERT INTO `iee_commodity_t` VALUES ('41', '25', null, '11.00', '测试测试商品测试商品测试商品品品', null, '1', '0', '250ml/罐', '', null, '2015-07-27 16:34:59', null, '2015-11-16 10:29:59');
INSERT INTO `iee_commodity_t` VALUES ('36', '10', null, '11.00', '测试商品', null, '0', '0', '250ml', '', null, '2015-07-27 15:41:09', null, '2015-09-05 12:21:01');
INSERT INTO `iee_commodity_t` VALUES ('66', '10', null, '23.00', '测试12311', '36b5558d-a6a6-41e8-ba80-37a5dc342add', '0', '0', '250ml/罐', '', null, '2015-08-22 21:45:39', null, '2015-11-09 14:30:17');
INSERT INTO `iee_commodity_t` VALUES ('37', '10', null, '11.00', '测试商品', null, '0', '0', '250ml/罐', '', null, '2015-07-27 15:41:13', null, '2015-07-27 15:41:13');
INSERT INTO `iee_commodity_t` VALUES ('65', '10', null, '123.00', '测试2', null, '1', '0', '250ml/罐', '', null, '2015-07-27 17:25:51', null, '2015-09-06 11:55:00');
INSERT INTO `iee_commodity_t` VALUES ('67', '16', null, '123.00', '123', null, '1', '0', '250ml/罐', '', null, '2015-08-22 21:45:56', null, '2015-09-06 11:52:48');
INSERT INTO `iee_commodity_t` VALUES ('68', '16', null, '2.00', '455rewr', null, '1', '0', '250ml/罐', '', null, '2015-08-22 21:46:06', null, '2015-09-06 10:38:12');
INSERT INTO `iee_commodity_t` VALUES ('69', '16', null, '23.00', '323r', null, '1', '0', '250ml/罐', '', null, '2015-08-22 21:46:18', null, '2015-08-22 21:46:18');
INSERT INTO `iee_commodity_t` VALUES ('70', '16', null, '123.00', 'fre', null, '1', '0', '250ml/罐', '', null, '2015-08-22 21:46:28', null, '2015-08-22 21:46:28');
INSERT INTO `iee_commodity_t` VALUES ('85', '10', null, '123.00', '测试', null, '1', '0', '123', '', null, '2015-09-20 14:48:32', null, '2015-09-20 14:48:32');
INSERT INTO `iee_commodity_t` VALUES ('76', '16', null, '343.00', 'gfgfgf', null, '1', '0', '250ml/罐', '', null, '2015-08-22 21:47:40', null, '2015-08-22 21:47:40');
INSERT INTO `iee_commodity_t` VALUES ('78', '10', null, '34.00', '567', null, '1', '0', '250ml/罐', '', null, '2015-08-22 21:48:04', null, '2015-08-22 21:48:04');
INSERT INTO `iee_commodity_t` VALUES ('80', '10', null, '1223.00', 'aa123', null, '1', '0', '250ml/罐', '', null, '2015-08-27 16:13:32', null, '2015-11-02 11:38:45');
INSERT INTO `iee_commodity_t` VALUES ('82', '10', null, '123.00', 'aa', null, '1', '0', '123', '', null, '2015-09-07 22:41:55', null, '2015-09-07 22:41:55');
INSERT INTO `iee_commodity_t` VALUES ('83', '16', null, '123.00', 'ccdd123', null, '1', '1', 'dd', '', null, '2015-09-07 22:46:47', null, '2015-11-16 10:41:39');
INSERT INTO `iee_commodity_t` VALUES ('84', '16', null, '12.00', '康师傅', null, '1', '0', '200', '', null, '2015-09-20 00:08:30', null, '2015-09-20 00:10:44');
INSERT INTO `iee_commodity_t` VALUES ('87', '31', null, '1.00', '测试', 'e4d4a157-d43b-49b2-8be8-41f04c2e291c', '1', '0', '200/ml', '', null, '2015-11-13 14:25:51', null, '2015-11-13 18:30:27');
INSERT INTO `iee_commodity_t` VALUES ('88', '24', null, '11.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 10:06:08', null, '2015-11-16 10:06:08');
INSERT INTO `iee_commodity_t` VALUES ('89', '32', null, '123.00', 'aa', '', '1', '0', '123', '', null, '2015-11-16 10:15:06', null, '2015-11-16 10:15:06');
INSERT INTO `iee_commodity_t` VALUES ('90', '33', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:00:27', null, '2015-11-16 11:00:27');
INSERT INTO `iee_commodity_t` VALUES ('91', '10', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:01:40', null, '2015-11-16 11:01:40');
INSERT INTO `iee_commodity_t` VALUES ('92', '10', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:08:12', null, '2015-11-16 11:08:12');
INSERT INTO `iee_commodity_t` VALUES ('93', '10', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:10:26', null, '2015-11-16 11:10:26');
INSERT INTO `iee_commodity_t` VALUES ('94', '37', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:12:22', null, '2015-11-16 11:12:22');
INSERT INTO `iee_commodity_t` VALUES ('95', '38', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:26:28', null, '2015-11-16 11:26:28');
INSERT INTO `iee_commodity_t` VALUES ('96', '39', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:27:19', null, '2015-11-16 11:27:19');
INSERT INTO `iee_commodity_t` VALUES ('97', '40', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:30:27', null, '2015-11-16 11:30:27');
INSERT INTO `iee_commodity_t` VALUES ('98', '21', null, '123.00', 'aa', '', '1', '0', 'aa', '', null, '2015-11-16 11:37:38', null, '2015-11-16 15:02:07');
INSERT INTO `iee_commodity_t` VALUES ('99', '44', null, '24.00', '可口可乐', '36d06389-e9e4-415f-8c6d-c88f1e2ac19b', '1', '0', '12罐/装', '', null, '2015-11-25 09:18:17', null, '2015-11-25 09:18:17');
INSERT INTO `iee_commodity_t` VALUES ('100', '44', null, '2.50', '可口可乐', '9bfd3676-aace-431c-97b9-cb3717c33336', '1', '0', '250ml/罐', '', null, '2015-11-25 09:19:03', null, '2015-11-25 09:19:03');
INSERT INTO `iee_commodity_t` VALUES ('101', '44', null, '5.90', '可口可乐(大瓶)', '49da1d20-2072-45a0-a758-dfcac6e58d53', '1', '0', '5L / 罐', '', null, '2015-11-25 09:19:59', null, '2015-11-25 09:19:59');
INSERT INTO `iee_commodity_t` VALUES ('102', '44', null, '50.00', '可口可乐', '34e6405b-e99e-40ec-bc3c-8a65e2569aaa', '1', '0', '24罐', '', null, '2015-11-25 09:20:59', null, '2015-11-25 09:20:59');
INSERT INTO `iee_commodity_t` VALUES ('103', '44', null, '9.90', '果粒橙', '1c1722d4-d2c2-4ae6-95f7-4f113e6b9330', '1', '0', '2.5L/瓶', '', null, '2015-11-25 09:21:34', null, '2015-11-25 09:21:34');
INSERT INTO `iee_commodity_t` VALUES ('104', '44', null, '50.00', '雪碧', '3465b37c-10fb-4280-ad20-50911ece81cf', '1', '0', '24罐/箱', '', null, '2015-11-25 09:22:23', null, '2015-11-25 09:22:23');
INSERT INTO `iee_commodity_t` VALUES ('105', '44', null, '5.90', '雪碧(大瓶)', '3895710e-7b30-4455-b49c-9526e2ebb355', '1', '0', '5L/瓶', '', null, '2015-11-25 09:22:58', null, '2015-11-25 09:22:58');
INSERT INTO `iee_commodity_t` VALUES ('106', '44', null, '2.50', '雪碧(小瓶)', '717ada32-1891-4aa1-ba23-4e6fd59db834', '1', '0', '350ml/瓶子', '', null, '2015-11-25 09:23:42', null, '2015-11-25 09:23:42');
INSERT INTO `iee_commodity_t` VALUES ('107', '44', null, '4.50', '美汁源酷儿QQ', '4ff1247d-8507-4c4c-a1a3-4be52328dbb7', '1', '0', '350ml/瓶', '', null, '2015-11-25 09:24:38', null, '2015-11-25 09:24:38');
INSERT INTO `iee_commodity_t` VALUES ('108', '44', null, '3.50', '零度.可口可乐', '88e9fcec-3b48-4e5f-b589-2569ca592bdd', '1', '0', '350ml/瓶', '', null, '2015-11-25 09:25:58', null, '2015-11-25 09:25:58');
INSERT INTO `iee_commodity_t` VALUES ('109', '44', null, '3.50', '零度.可口可乐(听装)', 'ae6efd4c-da98-486c-a884-f92b2e5edbc3', '1', '0', '350ml/听', '', null, '2015-11-25 09:26:59', null, '2015-11-25 09:26:59');
INSERT INTO `iee_commodity_t` VALUES ('110', '44', null, '3.50', '+C', '347f8bf7-2ba5-4f36-be32-9439535a4512', '1', '0', '350ml/瓶', '', null, '2015-11-25 09:27:47', null, '2015-11-25 09:27:47');
INSERT INTO `iee_commodity_t` VALUES ('111', '44', null, '3.50', '芬达', 'f3225243-8e75-4a72-b788-af3ea90ca10d', '1', '0', '350ml/瓶', '', null, '2015-11-25 09:28:27', null, '2015-11-25 09:28:27');
INSERT INTO `iee_commodity_t` VALUES ('112', '44', null, '2.00', '小瓶.可口可口', '978b3064-bc49-4e14-bfbf-4bdcb7fa9003', '1', '0', '250ml/瓶', '', null, '2015-11-25 09:29:20', null, '2015-11-25 09:29:20');
INSERT INTO `iee_commodity_t` VALUES ('113', '44', null, '2.50', '可口可乐', '282794f5-2ce7-4597-bf9c-dc29f4294a86', '1', '1', '250ml/听', '', null, '2015-11-25 09:30:01', null, '2015-11-25 09:54:25');
INSERT INTO `iee_commodity_t` VALUES ('114', '44', null, '2.00', '雪碧(小瓶装)', '4450c11b-3aeb-4b7e-9766-df5dfbaeadc5', '1', '0', '250ml/瓶', '', null, '2015-11-25 09:31:05', null, '2015-11-25 09:31:05');
INSERT INTO `iee_commodity_t` VALUES ('115', '44', null, '3.50', '酷儿QQ', '522faf6d-0cb6-4645-ade3-6163f21c22e5', '1', '1', '350ml/瓶', '', null, '2015-11-25 09:32:09', null, '2015-11-25 09:54:29');
INSERT INTO `iee_commodity_t` VALUES ('116', '45', null, '3.50', '珠江纯生', 'd6633ed0-b16a-473e-a529-5ad21d0bf28c', '1', '0', '500ml/ 瓶', '', null, '2015-11-25 09:33:14', null, '2015-11-25 09:33:14');
INSERT INTO `iee_commodity_t` VALUES ('117', '45', null, '5.50', '纯生', 'e807953b-3896-4983-8611-698e43057544', '1', '0', '500ml/罐', '', null, '2015-11-25 09:34:20', null, '2015-11-25 09:34:20');
INSERT INTO `iee_commodity_t` VALUES ('118', '45', null, '50.00', '珠江啤酒', '2d0c15e4-b81c-4783-a8b9-097297b11d68', '1', '0', '24罐/箱', '', null, '2015-11-25 09:35:36', null, '2015-11-25 09:35:36');
INSERT INTO `iee_commodity_t` VALUES ('119', '45', null, '55.00', '纯生啤酒', '5e98d213-ccaa-4f98-8eaa-4f53b32368c8', '1', '0', '24罐/箱', '', null, '2015-11-25 09:36:21', null, '2015-11-25 09:36:21');
INSERT INTO `iee_commodity_t` VALUES ('120', '45', null, '4.50', '萝卜味.饮料', 'd828d725-d3da-4c4b-8595-b4d9496de56f', '1', '1', '350ml/瓶', '', null, '2015-11-25 09:37:09', null, '2015-11-25 09:54:18');
INSERT INTO `iee_commodity_t` VALUES ('121', '45', null, '5.50', '珠江啤酒', '6a06da01-fe0f-403e-934e-c443ea2426be', '1', '1', '300ml/瓶', '', null, '2015-11-25 09:37:55', null, '2015-11-25 09:54:14');
INSERT INTO `iee_commodity_t` VALUES ('122', '45', null, '55.00', '纯生啤酒', '78c30d8a-8f32-48bf-8e25-3accf5dab583', '1', '0', '24瓶/罐', '', null, '2015-11-25 09:38:41', null, '2015-11-25 09:38:41');
INSERT INTO `iee_commodity_t` VALUES ('123', '44', null, '4.50', '萝卜味饮料', 'c545f17d-3f12-4e5d-9ff3-e3eeb00bd9b9', '1', '0', '300ml/瓶', '', null, '2015-11-25 09:39:22', null, '2015-11-25 09:39:22');
INSERT INTO `iee_commodity_t` VALUES ('124', '45', null, '100.00', '未知', '2ed5bbdf-f74d-45c9-acf1-d4c36d807b71', '1', '1', '24瓶/箱', '', null, '2015-11-25 09:40:27', null, '2015-11-25 09:54:10');
INSERT INTO `iee_commodity_t` VALUES ('125', '46', null, '5.00', 'MM趣味豆', 'd140ac8e-7455-4255-9ee3-90c47e89a218', '1', '0', '1包', '', null, '2015-11-25 09:41:04', null, '2015-11-25 09:41:04');
INSERT INTO `iee_commodity_t` VALUES ('126', '46', null, '5.00', '德芙.小巧粒', '86a87b25-7292-44f6-a160-0f545087eefb', '1', '0', '1包', '', null, '2015-11-25 09:41:52', null, '2015-11-25 09:41:52');
INSERT INTO `iee_commodity_t` VALUES ('127', '46', null, '5.00', '熊博士', 'e940cabe-6501-4057-9eb3-d0c8615a51ef', '1', '0', '1包', '', null, '2015-11-25 09:42:16', null, '2015-11-25 09:42:16');
INSERT INTO `iee_commodity_t` VALUES ('128', '46', null, '10.00', '磨堡', '0baa2bc9-aa51-45f4-8a2e-3a75e91c23c6', '1', '0', '1包', '', null, '2015-11-25 09:42:53', null, '2015-11-25 09:42:53');
INSERT INTO `iee_commodity_t` VALUES ('129', '46', null, '10.00', '青稞米饼', '44dc1e09-956a-4353-9287-3d8bf65e6f3b', '1', '0', '1包', '', null, '2015-11-25 09:44:50', null, '2015-11-25 09:44:50');
INSERT INTO `iee_commodity_t` VALUES ('130', '46', null, '5.00', '淘豆', '3cabb2a9-fc96-49ac-9230-0e7832e04b81', '1', '0', '1包', '', null, '2015-11-25 09:45:19', null, '2015-11-25 09:45:19');
INSERT INTO `iee_commodity_t` VALUES ('131', '46', null, '1.00', '未知', '44847326-11dc-4e93-9996-135564eefd2e', '1', '0', '1包', '', null, '2015-11-25 09:45:48', null, '2015-11-25 09:45:48');
INSERT INTO `iee_commodity_t` VALUES ('132', '46', null, '5.00', '淮盐花生', 'cafab0fd-2a52-4b59-87a7-496c13b95caa', '1', '0', '1包', '', null, '2015-11-25 09:46:22', null, '2015-11-25 09:46:22');
INSERT INTO `iee_commodity_t` VALUES ('133', '46', null, '10.00', '盐津橄榄', 'be4aea7a-6f1a-41d6-a29c-4d766949abe4', '1', '0', '1包', '', null, '2015-11-25 09:47:27', null, '2015-11-25 09:47:27');
INSERT INTO `iee_commodity_t` VALUES ('134', '46', null, '5.00', '奥利奥', 'ed0f7cd2-55bb-4c2c-bddc-4b53cdbbae65', '1', '0', '1盒', '', null, '2015-11-25 09:47:58', null, '2015-11-25 09:47:58');
INSERT INTO `iee_commodity_t` VALUES ('135', '46', null, '5.00', '微波玉米花', '4731d541-4ec0-473d-99df-4d9d4565cdb3', '1', '0', '1包', '', null, '2015-11-25 09:48:38', null, '2015-11-25 09:48:38');
INSERT INTO `iee_commodity_t` VALUES ('136', '46', null, '5.00', '亲亲.桂圆八宝粥', '0c9f2dd5-5893-4477-9b63-94a0198a16a4', '1', '0', '1罐', '', null, '2015-11-25 09:49:27', null, '2015-11-25 09:49:27');
INSERT INTO `iee_commodity_t` VALUES ('137', '46', null, '5.00', '华夫饼', '5fbeb5fe-1f72-4f5d-95e5-973c589784d6', '1', '0', '1盒', '', null, '2015-11-25 09:49:59', null, '2015-11-25 09:49:59');
INSERT INTO `iee_commodity_t` VALUES ('138', '46', null, '5.00', '妙脆薯', '0da9d6a4-34af-4bc1-a8ab-b49f4de00d86', '1', '1', '1包', '', null, '2015-11-25 09:50:25', null, '2015-11-25 09:54:05');
INSERT INTO `iee_commodity_t` VALUES ('139', '46', null, '5.00', '蓝莓堡', '68b54806-851a-4af7-8b0e-f3262a990a01', '1', '0', '1盒', '', null, '2015-11-25 09:51:01', null, '2015-11-25 09:51:01');
INSERT INTO `iee_commodity_t` VALUES ('140', '46', null, '5.00', '回头客', 'ef759189-42c4-4518-a2df-8d4743948b58', '1', '0', '1包', '', null, '2015-11-25 09:51:27', null, '2015-11-25 09:51:27');
INSERT INTO `iee_commodity_t` VALUES ('141', '46', null, '9.90', '益达', '71924b08-12e7-481b-af37-ec69f8293c98', '1', '1', '1瓶', '', null, '2015-11-25 09:51:55', null, '2015-11-25 09:54:00');
INSERT INTO `iee_commodity_t` VALUES ('142', '46', null, '10.00', '绿箭口香糖', 'dfb7eb59-19ea-4d8a-b5e3-53ac11822cd1', '1', '1', '1包', '', null, '2015-11-25 09:52:25', null, '2015-11-25 09:53:55');
INSERT INTO `iee_commodity_t` VALUES ('143', '46', null, '5.00', '比巴卜泡泡糖', 'f1af1b88-11e4-45e1-9a24-631dccb47970', '1', '1', '1瓶', '', null, '2015-11-25 09:53:01', null, '2015-11-25 09:53:51');
INSERT INTO `iee_commodity_t` VALUES ('144', '46', null, '9.90', '清至.无糖口香糖', 'a1615511-7222-49b1-88a0-59dae4e02a62', '1', '1', '1瓶', '', null, '2015-11-25 09:53:38', null, '2015-11-25 09:53:47');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 17:01:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_commodity_type_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_commodity_type_t`;
CREATE TABLE `iee_commodity_type_t` (
  `id` int(8) NOT NULL auto_increment COMMENT 'ID 商品类型ID',
  `mid` int(8) NOT NULL COMMENT '商户ID,映射表iee_merchant_t表主键ID',
  `pid` int(8) default NULL COMMENT '商品类型父节点ID， 默认为0， 表示商品大类',
  `is_default` int(1) NOT NULL default '1' COMMENT '是否为默认类型，0表示默认类型，1表示其他类型, 默认值为1',
  `state` int(1) NOT NULL default '0' COMMENT '使用状态 0未使用， 1已使用',
  `weight` int(2) NOT NULL default '0' COMMENT '..权重，用数值排序，默认为0优先级最低.',
  `name` varchar(20) default NULL COMMENT '类型名',
  `description` varchar(500) default NULL COMMENT '商品描述',
  `created_by` int(8) default NULL COMMENT '创建人',
  `created_date` datetime default NULL COMMENT '创建时间',
  `updated_by` int(8) default NULL COMMENT '修改人',
  `updated_date` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品类型';

-- ----------------------------
-- Records of iee_commodity_type_t
-- ----------------------------
INSERT INTO `iee_commodity_type_t` VALUES ('16', '0', '0', '0', '0', '0', '日常用品日', null, null, '2015-07-27 19:15:52', null, '2015-07-27 19:15:52');
INSERT INTO `iee_commodity_type_t` VALUES ('10', '0', '0', '0', '0', '0', '保健服务', null, null, '2015-06-30 15:04:55', null, '2015-06-30 15:04:55');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 23:39:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_commodity_recommend_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_commodity_recommend_t`;
CREATE TABLE `iee_commodity_recommend_t` (
  `id` int(8) NOT NULL auto_increment COMMENT '主键ID',
  `mid` int(8) NOT NULL COMMENT '商户ID，映射商户表(iee_merchant_t)主键ID',
  `cid` int(8) default NULL COMMENT '推荐商品,映射商品表(iee_commondity_t)主键',
  `created_by` int(8) default NULL COMMENT '创建人',
  `created_date` datetime default NULL COMMENT '创建时间',
  `updated_by` int(8) default NULL COMMENT '更新人',
  `updated_date` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商户商品推荐表,';

-- ----------------------------
-- Records of iee_commodity_recommend_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:36:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_merchant_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_merchant_t`;
CREATE TABLE `iee_merchant_t` (
  `id` int(8) NOT NULL auto_increment,
  `openid` varchar(50) default NULL COMMENT '微信用户openid',
  `account` varchar(50) default NULL,
  `password` varchar(100) default NULL,
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_merchant_t
-- ----------------------------
INSERT INTO `iee_merchant_t` VALUES ('3', null,'aa', '123', null, '2015-05-09 16:46:49', null, '2015-05-09 16:46:49');
INSERT INTO `iee_merchant_t` VALUES ('4', null,'123', '123', null, '2015-05-18 10:35:16', null, '2015-05-18 10:35:16');
INSERT INTO `iee_merchant_t` VALUES ('5',null, 'dsad', 'sa', null, '2015-06-15 11:12:07', null, '2015-06-15 11:12:07');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 11:30:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_merchant_info_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_merchant_info_t`;
CREATE TABLE `iee_merchant_info_t` (
  `mid` int(8) NOT NULL COMMENT '商户ID，映射商户表（iee_merchat_t）主键ID',
  `appid` varchar(50) NOT NULL COMMENT '公众号ID，默认为平台公众号',
  `phone` char(15) default NULL COMMENT '监督电话',
  `name` varchar(255) default NULL COMMENT '商铺名',
  `address` varchar(100) default NULL COMMENT '商户地址',
  `img_id` varchar(100) default NULL COMMENT '图片ID,映射云图片表主键ID(iee_cloud_img_t)',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_merchant_info_t
-- ----------------------------
INSERT INTO `iee_merchant_info_t` VALUES ('0', 'wxcbcbb3dcae9f2ba2', '0755-12345678', '测试', '123', 'http://localhost:80/Img_Upload/image/2015-08-16/originalImg/af4c9d41804e0e8c75ecd666ead16410.jpg', null, '2015-08-16 00:49:10', null, '2015-08-27 22:53:43');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:35:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_merchant_struct_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_merchant_struct_t`;
CREATE TABLE `iee_merchant_struct_t` (
  `id` int(8) NOT NULL auto_increment,
  `mid` int(8) NOT NULL COMMENT '商户ID，映射商户表（iee_merchat_t）主键ID',
  `parent_id` int(8) default NULL COMMENT '父节点ID, 默认为0,表示根节点',
  `name` varchar(50) default NULL,
  `descrition` varchar(100) default NULL,
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_merchant_struct_t
-- ----------------------------
INSERT INTO `iee_merchant_struct_t` VALUES ('1', '3', '0', '智引擎公司', null, null, '2015-05-09 16:46:49', null, '2015-05-09 16:46:49');
INSERT INTO `iee_merchant_struct_t` VALUES ('2', '3', '1', 'IT部门', null, null, '2015-05-09 21:43:58', null, '2015-05-09 21:43:58');
INSERT INTO `iee_merchant_struct_t` VALUES ('3', '4', '0', '123', null, null, '2015-05-18 10:35:16', null, '2015-05-18 10:35:16');
INSERT INTO `iee_merchant_struct_t` VALUES ('4', '5', '0', 'dsad', null, null, '2015-06-15 11:12:07', null, '2015-06-15 11:12:07');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:32:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_material_commodity_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_material_commodity_t`;
CREATE TABLE `iee_material_commodity_t` (
  `id` int(8) NOT NULL auto_increment COMMENT '主键ID',
  `mid` int(8) NOT NULL COMMENT '商户ID,映射商户表(iee_merchat_t)主键ID',
  `keyword` varchar(100) default NULL COMMENT '关键字',
  `key_desc` varchar(500) default NULL COMMENT '关键字描述',
  `type` int(1) default NULL COMMENT '类型； 0 单商品图文 1 多商品图文',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='商品图文';

-- ----------------------------
-- Records of iee_material_commodity_t
-- ----------------------------
INSERT INTO `iee_material_commodity_t` VALUES ('14', '0', 'ddsa', 'dsad', '1', null, '2015-06-03 10:57:42', null, '2015-09-19 14:47:25');
INSERT INTO `iee_material_commodity_t` VALUES ('15', '0', 'ddsa', 'dsad', null, null, '2015-06-03 11:12:46', null, '2015-06-03 11:12:46');
INSERT INTO `iee_material_commodity_t` VALUES ('16', '0', 'ddsa', 'dsad', '0', null, '2015-06-03 11:15:18', null, '2015-09-19 14:46:49');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:33:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_material_img_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_material_img_t`;
CREATE TABLE `iee_material_img_t` (
  `id` int(8) NOT NULL auto_increment,
  `pv` int(8) NOT NULL default '0' COMMENT '访问量',
  `appreciate` int(8) default '0' COMMENT '点赞数',
  `type` int(1) default NULL COMMENT '图片类型 0 : 单图文图片; 1:多图文图片；2：单商品图文图片； 3：多商品图文图片',
  `link_url` varchar(100) default NULL COMMENT '图片跳转路径',
  `holder` int(8) default NULL COMMENT '所属,  对应iee_meterial_img_text_t表ID列',
  `title` varchar(50) default NULL COMMENT '图片标题',
  `url` varchar(500) default NULL COMMENT '图片路径',
  `summary` varchar(500) default NULL COMMENT '图片概要',
  `content` longtext COMMENT '图片内容',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='图文-->图片映射';

-- ----------------------------
-- Records of iee_material_img_t
-- ----------------------------
INSERT INTO `iee_material_img_t` VALUES ('1', '0', null, null, null, '6', 'dsad', null, null, null);
INSERT INTO `iee_material_img_t` VALUES ('2', '0', null, null, null, '6', null, null, 'dsad', null);
INSERT INTO `iee_material_img_t` VALUES ('3', '0', null, null, null, '6', null, null, null, 'sdsadas');
INSERT INTO `iee_material_img_t` VALUES ('4', '0', null, null, null, '7', 'dsa', null, null, null);
INSERT INTO `iee_material_img_t` VALUES ('5', '0', null, null, null, '7', null, null, 'dsad', null);
INSERT INTO `iee_material_img_t` VALUES ('6', '0', null, null, null, '7', null, null, null, 'sdasa');
INSERT INTO `iee_material_img_t` VALUES ('7', '0', null, null, null, '8', 'dsads', null, 'dsadsa', 'dsadsadsa');
INSERT INTO `iee_material_img_t` VALUES ('8', '0', null, null, null, '9', 'dsadsa', null, null, 'dsadsa');
INSERT INTO `iee_material_img_t` VALUES ('9', '0', null, null, null, '9', 'dsad', null, null, 'dsadsa');
INSERT INTO `iee_material_img_t` VALUES ('10', '0', null, null, null, '1', '', null, null, '');
INSERT INTO `iee_material_img_t` VALUES ('11', '0', null, null, null, '2', '', null, null, '');
INSERT INTO `iee_material_img_t` VALUES ('12', '0', null, '3', null, '3', '', null, null, '');
INSERT INTO `iee_material_img_t` VALUES ('13', '0', null, '3', null, '4', '', null, null, '');
INSERT INTO `iee_material_img_t` VALUES ('14', '0', null, '3', null, '5', '', null, null, '');
INSERT INTO `iee_material_img_t` VALUES ('15', '0', null, '3', null, '6', 'dsd', null, null, 'sdssdsd');
INSERT INTO `iee_material_img_t` VALUES ('16', '0', null, '3', null, '7', 'dsdsa', '', null, null);
INSERT INTO `iee_material_img_t` VALUES ('17', '0', null, '3', null, '7', '', '', null, null);
INSERT INTO `iee_material_img_t` VALUES ('176', '0', null, '1', '', '23', '测试', 'http://localhost/image/2015-06-05/originalImg/4504dd4a0eb08da746c14b7b95546e9f.jpg', null, '');
INSERT INTO `iee_material_img_t` VALUES ('127', '0', null, '1', '', '15', '发的发的', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('28', '0', null, '3', null, '9', 'aaa', 'http://localhost/image/2015-06-01/originalImg/cfa21fdea28a2979aa3d2c999f8f7f7c.jpg', null, '的所得税');
INSERT INTO `iee_material_img_t` VALUES ('29', '0', null, '3', null, '10', '啊啊', '', '啊的', null);
INSERT INTO `iee_material_img_t` VALUES ('30', '0', null, '3', null, '11', '的撒旦', '', '的撒旦', null);
INSERT INTO `iee_material_img_t` VALUES ('34', '0', null, null, null, null, '测试', 'http://localhost/image/2015-06-02/originalImg/476b2d060fdb8209782ec28948e11357.jpg', 'dsdsds', 'dsdsds');
INSERT INTO `iee_material_img_t` VALUES ('35', '0', null, null, null, null, '', 'http://localhost/image/2015-06-02/originalImg/231ee5f5eea71f1f7b9e02d924a50068.jpg', '', '');
INSERT INTO `iee_material_img_t` VALUES ('36', '0', null, null, null, null, '', 'http://localhost/image/2015-06-02/originalImg/2dbfbb3ae7d992b2e11572e17e30cd51.jpg', '', '');
INSERT INTO `iee_material_img_t` VALUES ('37', '0', null, null, null, null, '', 'http://localhost/image/2015-06-02/originalImg/b15a1e4bf82b0fff1b9a72f2044d4afb.jpg', '', '');
INSERT INTO `iee_material_img_t` VALUES ('38', '0', null, null, null, null, '', 'http://localhost/image/2015-06-02/originalImg/f8d69534618c4d1e27acd684a9e6fff1.jpg', '', '');
INSERT INTO `iee_material_img_t` VALUES ('126', '0', null, '1', null, '14', '', '', null, null);
INSERT INTO `iee_material_img_t` VALUES ('44', '0', null, '1', null, '20', 'aa', null, null, 'ccc');
INSERT INTO `iee_material_img_t` VALUES ('45', '0', null, '1', null, '20', 'ddd', null, null, 'ddd');
INSERT INTO `iee_material_img_t` VALUES ('95', '0', null, '1', '', '23', '啊啊啊', 'http://localhost/image/2015-06-03/originalImg/d713b38438eb47e1806b0cdbc07c1087.jpg', null, '测试');
INSERT INTO `iee_material_img_t` VALUES ('178', '0', null, '1', '', '23', '', 'http://localhost/image/2015-06-05/originalImg/5b579f0a06867d15007261707fda4143.jpg', null, '');
INSERT INTO `iee_material_img_t` VALUES ('128', '0', null, '1', '', '15', '订单', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('129', '0', null, '1', '', '15', '反对法', '', '', 'dsadsa');
INSERT INTO `iee_material_img_t` VALUES ('175', '0', null, '2', '', '16', '', 'http://localhost/image/2015-09-19/original/c6d82bf062e3f8eb5bb7ad95f9baf504.jpg', '测试', null);
INSERT INTO `iee_material_img_t` VALUES ('125', '0', null, '1', null, '14', '123', '', null, null);
INSERT INTO `iee_material_img_t` VALUES ('160', '0', null, '0', null, '19', '123', 'http://localhost/image/2015-06-03/originalImg/db3effd67eb36977b605d3673e7d2071.jpg', 'dddd', '');
INSERT INTO `iee_material_img_t` VALUES ('130', '0', null, '1', '', '15', '', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('131', '0', null, '1', '', '15', '123', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('132', '0', null, '1', '', '15', '', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('133', '0', null, '3', '', '16', '', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('134', '0', null, '3', '', '16', '订单', '', '', '');
INSERT INTO `iee_material_img_t` VALUES ('135', '0', null, '3', '', '16', 'dsadsa', '', '', 'dsadsa');
INSERT INTO `iee_material_img_t` VALUES ('147', '0', null, '3', '646464', '14', '订单', 'http://localhost/image/2015-09-19/original/d424e2bea62f3e0df0d52f44cc88ee76.jpg', '', '');
INSERT INTO `iee_material_img_t` VALUES ('148', '0', null, '3', '3455546', '14', '啊啊', 'http://localhost/image/2015-09-19/original/59e242023d975db4d9156df014c7eae6.jpg', '', '');
INSERT INTO `iee_material_img_t` VALUES ('179', '0', null, '1', '', '2', '测试图片', 'http://localhost/image/2015-07-13/originalImg/9418813de3bf8ffd946332e9f1ce51c3.jpg', null, '');
INSERT INTO `iee_material_img_t` VALUES ('180', '0', null, '1', '', '2', '测试图片', 'http://localhost/image/2015-07-13/originalImg/db9898710252023e716266b5c07963f9.jpg', null, '');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:33:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_material_img_text_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_material_img_text_t`;
CREATE TABLE `iee_material_img_text_t` (
  `id` int(8) NOT NULL auto_increment,
  `mid` int(8) NOT NULL COMMENT '商户ID,映射商户表(iee_merchat_t)主键ID',
  `type` int(1) NOT NULL default '0' COMMENT '图文类型, 0单图文 1多图文',
  `keyword` varchar(100) default NULL,
  `key_desc` varchar(500) default NULL,
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_material_img_text_t
-- ----------------------------
INSERT INTO `iee_material_img_text_t` VALUES ('2', '0', '1', 'dsd', 'dsd', null, '2015-05-12 23:51:09', null, '2015-07-15 16:15:08');
INSERT INTO `iee_material_img_text_t` VALUES ('19', '0', '0', 'dsd', 'dsd', null, '2015-06-02 09:54:13', null, '2015-06-04 16:27:53');
INSERT INTO `iee_material_img_text_t` VALUES ('23', '0', '1', '测试', '测试', null, '2015-06-02 16:21:16', null, '2015-06-05 13:11:56');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:33:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_material_text_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_material_text_t`;
CREATE TABLE `iee_material_text_t` (
  `id` int(8) NOT NULL auto_increment,
  `mid` int(8) default NULL COMMENT '商户ID,映射商户表(iee_merchat_t)主键ID',
  `keyword` varchar(100) default NULL COMMENT '关键字',
  `key_desc` varchar(500) default NULL COMMENT '关键字简介',
  `content` varchar(500) default NULL COMMENT '描述',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_material_text_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:40:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_wechat_menu_link_message_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_wechat_menu_link_message_t`;
CREATE TABLE `iee_wechat_menu_link_message_t` (
  `menu_id` int(8) NOT NULL COMMENT '微信菜单ID,映射（iee_wechat_menu_t）主键ID',
  `message_id` int(8) NOT NULL COMMENT '素材ID 根据material_typel类型，关联到对应表ID',
  `message_type` int(1) NOT NULL COMMENT '消息类型 0 文字(iee_meterial_text_t表) 1 图文(iee_meterial_img_text_t) 2 商品图文(iee_meterial_commodity_t)',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`menu_id`,`message_id`,`message_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单-素材映射关系表';

-- ----------------------------
-- Records of iee_wechat_menu_link_message_t
-- ----------------------------
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('186', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('188', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('202', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('204', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('206', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('209', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('225', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('227', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('229', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('231', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('233', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('235', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('237', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('239', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('241', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('243', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('245', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('247', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('249', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('251', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('253', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('255', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('257', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('258', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('261', '8', '2', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('262', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('269', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('271', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('273', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('275', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('277', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('278', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('280', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('281', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('283', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('284', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('286', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('287', '3', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('289', '2', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('291', '2', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('293', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('295', '1', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('297', '2', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('299', '2', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('301', '2', '0', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('302', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('358', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('359', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('360', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('361', '2', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('362', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('363', '2', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('364', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('365', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('366', '2', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('367', '2', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('368', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('369', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('370', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('371', '1', '1', null, null, null, null);
INSERT INTO `iee_wechat_menu_link_message_t` VALUES ('409', '1', '1', null, null, null, null);

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:40:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_wechat_menu_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_wechat_menu_t`;
CREATE TABLE `iee_wechat_menu_t` (
  `id` int(8) NOT NULL,
  `mid` int(8) NOT NULL COMMENT '商户ID,映射商户表（iee_merchat_t）表主键ID',
  `parent_id` int(8) default NULL,
  `keyword` varchar(128) default NULL COMMENT '菜单KEY值，用于消息接口推送，不超过128字节',
  `name` varchar(40) default NULL COMMENT '菜单名',
  `url` varchar(256) default NULL COMMENT '网页链接，用户点击菜单可打开链接',
  `type` varchar(20) default NULL COMMENT '菜单的响应动作类型 参考微信菜单接口',
  `idx` int(1) default NULL COMMENT '菜单显示位置',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='微信菜单表';

-- ----------------------------
-- Records of iee_wechat_menu_t
-- ----------------------------
INSERT INTO `iee_wechat_menu_t` VALUES ('536', '0', '535', '1438242995574', 'aa', '', 'view', '0', '3', '2015-07-30 15:56:44', null, '2015-07-30 15:56:44');
INSERT INTO `iee_wechat_menu_t` VALUES ('535', '0', '0', '1438242988826', 'ce2', null, null, '2', '3', '2015-07-30 15:56:44', null, '2015-07-30 15:56:44');
INSERT INTO `iee_wechat_menu_t` VALUES ('534', '0', '531', '1438241693695', 'a3', '', 'view', '2', '3', '2015-07-30 15:34:56', null, '2015-07-30 15:34:56');
INSERT INTO `iee_wechat_menu_t` VALUES ('533', '0', '531', '1438241686776', 'a2', '', 'view', '1', '3', '2015-07-30 15:34:56', null, '2015-07-30 15:34:56');
INSERT INTO `iee_wechat_menu_t` VALUES ('532', '0', '531', '1438241682013', 'a1', '', 'view', '0', '3', '2015-07-30 15:34:56', null, '2015-07-30 15:34:56');
INSERT INTO `iee_wechat_menu_t` VALUES ('520', '0', '514', '1438238891775', 'a2', null, null, '3', '123', '2015-07-30 15:21:00', null, '2015-07-30 15:21:00');
INSERT INTO `iee_wechat_menu_t` VALUES ('521', '0', '514', '1438239126469', 'a3', null, null, '4', '123', '2015-07-30 15:21:00', null, '2015-07-30 15:21:00');
INSERT INTO `iee_wechat_menu_t` VALUES ('515', '0', '514', '1438238826856', 'a1', null, null, '0', '123', '2015-07-30 15:21:00', null, '2015-07-30 15:21:00');
INSERT INTO `iee_wechat_menu_t` VALUES ('531', '0', '0', '1438241671475', 'aa', null, null, '0', '3', '2015-07-30 15:34:56', null, '2015-07-30 15:34:56');
INSERT INTO `iee_wechat_menu_t` VALUES ('519', '0', '514', '1438238855821', 'a5', null, null, '2', '123', '2015-07-30 15:21:00', null, '2015-07-30 15:21:00');
INSERT INTO `iee_wechat_menu_t` VALUES ('514', '0', '0', '1438238820235', 'aa', null, null, '0', '123', '2015-07-30 15:21:00', null, '2015-07-30 15:21:00');
INSERT INTO `iee_wechat_menu_t` VALUES ('537', '0', '535', '1438243001944', 'a2', '', 'view', '1', '3', '2015-07-30 15:56:44', null, '2015-07-30 15:56:44');
INSERT INTO `iee_wechat_menu_t` VALUES ('538', '0', '0', '1438243031945', 'a', null, null, '2', '3', '2015-07-30 15:57:30', null, '2015-07-30 15:57:30');
INSERT INTO `iee_wechat_menu_t` VALUES ('539', '0', '538', '1438243039930', 'a2', '', 'view', '0', '3', '2015-07-30 15:57:30', null, '2015-07-30 15:57:30');
INSERT INTO `iee_wechat_menu_t` VALUES ('540', '0', '538', '1438243047476', 'a2', '', 'view', '1', '3', '2015-07-30 15:57:30', null, '2015-07-30 15:57:30');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:40:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_wechat_menu_sequnce_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_wechat_menu_sequnce_t`;
CREATE TABLE `iee_wechat_menu_sequnce_t` (
  `current` int(8) NOT NULL default '0',
  `increment` tinyint(1) NOT NULL COMMENT '1',
  PRIMARY KEY  (`current`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信菜单表序列';

-- ----------------------------
-- Records of iee_wechat_menu_sequnce_t
-- ----------------------------
INSERT INTO `iee_wechat_menu_sequnce_t` VALUES ('0', '1');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-25 18:54:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_wechat_subscribe_response_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_wechat_subscribe_response_t`;
CREATE TABLE `iee_wechat_subscribe_response_t` (
  `mid` int(8) NOT NULL default '-1' COMMENT '商户ID，映射商户表(iee_merchat_t)主键ID',
  `appid` varchar(50) NOT NULL COMMENT '公众号ID',
  `type` int(1) unsigned zerofill NOT NULL COMMENT '回复类型 0 首次关注 1 关注VIP名片 2关注员工名片',
  `message_id` int(8) NOT NULL COMMENT '素材消息ID 根据material_typel类型，关联到对应表ID',
  `message_type` int(1) NOT NULL COMMENT '消息类型 0 文字(iee_meterial_text_t表) 1 图文(iee_meterial_img_text_t) 2 商品图文(iee_meterial_commodity_t)',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(8) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`appid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='首次关注回复';

-- ----------------------------
-- Records of iee_wechat_subscribe_response_t
-- ----------------------------
INSERT INTO `iee_wechat_subscribe_response_t` VALUES ('0', 'wxcbcbb3dcae9f2ba2', '0', '2', '1', null, null, null, null);
INSERT INTO `iee_wechat_subscribe_response_t` VALUES ('0', 'wx7d64d430513cf0af', '0', '5', '0', null, null, null, null);
INSERT INTO `iee_wechat_subscribe_response_t` VALUES ('0', 'wx7d64d430513cf0af', '1', '24', '1', null, null, null, null);
INSERT INTO `iee_wechat_subscribe_response_t` VALUES ('0', 'wx7d64d430513cf0af', '2', '23', '1', null, null, null, null);
INSERT INTO `iee_wechat_subscribe_response_t` VALUES ('0', '1273250201', '0', '2', '1', null, null, null, null);

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:39:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_user_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_user_t`;
CREATE TABLE `iee_user_t` (
  `id` int(8) NOT NULL auto_increment COMMENT '主键ID',
  `openid` varchar(50) default NULL COMMENT '微信用户openid',
  `unionid` varchar(50) default NULL COMMENT '微信用户unionid',
  `sex` int(1) default NULL COMMENT '性别 0 男 1 女',
  `city` varchar(20) default NULL,
  `phone` varchar(11) default NULL,
  `province` varchar(20) default NULL COMMENT '省',
  `nickname` varchar(50) default NULL COMMENT '昵称',
  `headimgurl` varchar(500) default NULL COMMENT '用户头像地址',
  `created_date` datetime default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='微信授权登陆用户表';

-- ----------------------------
-- Records of iee_user_t
-- ----------------------------
INSERT INTO `iee_user_t` VALUES ('205', '123', null, '1', '深圳', '18676398164', '广东', 'Andres Messi', 'http://wx.qlogo.cn/mmopen/1VicGGiam6mxQt6VMvfGicibJ2HcEeBpDMFUp0t62wOVNyvrNkIMFR9nVcsicF2ANNYB1yoiaGfGVA4Vu9fuATCpaTRiaMDh6xZygNu/0', '2015-07-14 16:07:43', '2015-10-04 18:24:17');
INSERT INTO `iee_user_t` VALUES ('206', 'oNvHgspWRJWOEi7cQl-GCf4CCrJk', null, '1', '温州', '', '浙江', '光头尤', 'http://wx.qlogo.cn/mmopen/ODWyxVl9RsDSBHEKCiaYr1vZicJlzlDoRxwePJ3X1h5nts6xNWZf6CuegwWGPM6fM3jAkbOMJsfshnMA8COhQFNmtUsDs1WzUr/0', '2015-06-30 12:15:17', '2015-07-02 15:46:17');
INSERT INTO `iee_user_t` VALUES ('207', 'oNvHgsnSM27ZbXFOgJeU4vqZuP9A', null, '2', '深圳', null, '广东', 'Effy', 'http://wx.qlogo.cn/mmopen/KaeEGVbGjnVR2N878BeJoO2kPsNELyib2WlicUgaM3fhDBgvOCDBH8fBfHttpKWibmcvAfdLWIEMXkhIF6lShCsG1n0EWDcE12j/0', '2015-06-30 15:25:34', '2015-06-30 15:25:45');
INSERT INTO `iee_user_t` VALUES ('208', 'ovaYcuL-aN0YRyYws0NYniaGLIck', null, '1', '温州', '18899770277', '浙江', '光头尤', 'http://wx.qlogo.cn/mmopen/1VicGGiam6mxR5748Sr9ibP8AVwNsoDbRJm2WdltAAsibQqLSFBNeCErccILgMu0j3E5aON4CcLkjwUWicKjnZdoV7EdsRXdZQFsE/0', '2015-07-07 22:18:45', '2015-07-20 16:21:27');
INSERT INTO `iee_user_t` VALUES ('209', 'ovaYcuFJPcx7Mvey4lC-cpigaE4M', null, '2', '深圳', '13480877029', '广东', '从子', 'http://wx.qlogo.cn/mmopen/3hkFmB0GyvyqNET258EicIKolN6iahXj3URr8exkyUJ2TCNic1KdeRHK8Kwga7nibOGqbs7djfhC1kYvib50y8KyDIzNia7qzaubpR/0', '2015-07-14 20:31:13', '2015-07-14 20:33:26');
INSERT INTO `iee_user_t` VALUES ('210', 'ovaYcuNwZTRn_AGHJAqGl64Ggtmk', null, '2', '深圳', null, '广东', '唐如意', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6oicxwc5xEJ8ibEPbzRVoEv1NYVib75VXu83zxWauaL4vBBgoXOtgehMZic3nUAyJBHJYiadZeDcGdL70picayPfU8vWotgDd4XzFz8/0', '2015-07-14 16:12:02', '2015-07-20 15:47:44');
INSERT INTO `iee_user_t` VALUES ('211', 'ovaYcuF4lduSihuZWQP5gQCUwq0w', null, '1', '温州', '13480877029', '浙江', '光头尤', 'http://wx.qlogo.cn/mmopen/1VicGGiam6mxT0ohWdCvq9dv85ZFxGjWibOqicwVWW7QzFPgST6XyAeuKUbWQe2hLTUISHk7QTicVT230glBUic0RSvFeks62NVuCy/0', '2015-07-13 15:55:11', '2015-07-13 19:07:13');
INSERT INTO `iee_user_t` VALUES ('212', 'ovaYcuDaxbB2xxOkxhbojUEf7kcU', null, '1', '深圳', '18666825218', '广东', '刘爽', 'http://wx.qlogo.cn/mmopen/3hkFmB0GyvxMuKolJo2ngARZCrNlTZNTiag6IplsbibMXLWgEiaTeZF7zho5dKtJ1Tk9s7xaXMAx92I8L7h9CkFbia05tOzNh26M/0', '2015-07-13 17:04:26', '2015-07-13 17:05:11');
INSERT INTO `iee_user_t` VALUES ('213', 'ovaYcuPUmxyD2OK6eUxfrtJd2gB8', null, '1', '深圳', null, '广东', '陈剑斌Silence', 'http://wx.qlogo.cn/mmopen/1VicGGiam6mxT0ohWdCvq9dhgBiaW9lKETK2YPGLbCuybOkgh5MmbLM3DLDr14uwuu7dDq01U6a8ouXtJtcrdhOhswqUznlqy5M/0', '2015-07-13 17:29:23', '2015-07-19 16:26:53');
INSERT INTO `iee_user_t` VALUES ('214', 'ovaYcuG1rujMgEnZ7qCYlSNyYPso', null, '1', '温州', null, '浙江', '郑巧', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM75iaMSibeYuYRfUIHyic1zwtPtB0MUzARU9THich3Zvich7bIdPDN5uqWCpibgphmBsAjeY2SWibs9PiaYgw/0', '2015-07-13 19:22:12', '2015-07-14 12:34:27');
INSERT INTO `iee_user_t` VALUES ('215', 'ovaYcuBiB2v4OgE2WzgojFW1VUsw', null, '1', '温州', '13868878884', '浙江', '帅哥变大叔', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBhvCLU6s4yZyoWzMiag6P13SDqckYHYwde7ZMh0icWDz2FDpZRNuOZQnRXssWatWNOY3alpdxd7yibQ/0', '2015-07-13 19:27:52', '2015-07-13 19:41:36');
INSERT INTO `iee_user_t` VALUES ('216', 'ovaYcuMoh_YJEO1mO9YcZohA45ZY', null, '1', '温州', null, '浙江', '朱长伟', 'http://wx.qlogo.cn/mmopen/ibkKkoaQFco6LSHHSXoBCQYPvs055WMIpjRkkSibBcehwvwLbqHktFFtU8asVElpU9mKc0USg6vh1aQktibf7VVIQX5yiafJ0JrJ/0', '2015-07-13 19:31:29', '2015-07-14 12:20:10');
INSERT INTO `iee_user_t` VALUES ('217', 'ovaYcuNKok4EQ3hS73ccq-ErfRco', null, '1', '温州', null, '浙江', '潘德炎', 'http://wx.qlogo.cn/mmopen/PUJ4Bq5nhsIeauRzeVod6Iahv7CdLpkzJlhJxEOMEO2s6ph5KlICLb2XCJRS4icjzqZA1qsaAldHajVxqA4uUeh1ZC8qTTysR/0', '2015-07-13 19:35:09', '2015-07-13 19:35:32');
INSERT INTO `iee_user_t` VALUES ('218', 'ovaYcuFmuFx8MPhCNloGFVrCqT-Y', null, '1', '温州', null, '浙江', '叶剑km', 'http://wx.qlogo.cn/mmopen/1VicGGiam6mxT0ohWdCvq9dvRJcyfS3X0FicKduchDMy7iahWpoIQYcyWwFicjy3ZQ0c4rAgvS3iauGWIgWiahEIFU1tVxD2qQEf99H/0', '2015-07-13 21:54:53', '2015-07-13 21:55:02');
INSERT INTO `iee_user_t` VALUES ('219', 'ovaYcuCzN1lD_mf35UTK_5HuvEq8', null, '1', '温州', null, '浙江', 'sunbin', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELKrN88Mw3Fp9olQTrSa2yFpI48LhgyEBdTpS3vAhew2x3GxdKoapvyffnRmn7FsXzO7mquOD0C1A/0', '2015-07-14 12:15:33', '2015-07-14 12:42:49');
INSERT INTO `iee_user_t` VALUES ('220', 'ovaYcuBasFI-mu07UfXdcOnAd5F4', null, '1', '温州', '15267769297', '浙江', 'Mei', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJBq1ndPoJqglg7Cg92iaAutib3o7BAqlxsxZSGLyODraiaDJXibiaVOYv7C2NrFOpG47TCxrfCibxxLXzQ/0', '2015-07-14 20:45:47', '2015-07-14 21:06:20');
INSERT INTO `iee_user_t` VALUES ('221', 'ovaYcuFO9znW6KANQEDY9SigubyA', null, '2', '深圳', '13922869018', '广东', 'Effy', 'http://wx.qlogo.cn/mmopen/d8QqAnW8jCQyJgiaXicnACyt4E16XkW5pArdvcVGJfOWCuIRRdcugJoc1eGDwzrQDpBcQoFEAFblV4hPjdk1SW0JOcmSxGd7AC/0', '2015-07-15 10:36:47', '2015-07-15 10:41:14');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:38:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_user_addrs_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_user_addrs_t`;
CREATE TABLE `iee_user_addrs_t` (
  `id` bigint(12) NOT NULL auto_increment COMMENT '主键ID',
  `uid` int(8) NOT NULL default '0' COMMENT '用户ID,映射用户表(iee_user_t)主键',
  `pid` int(8) NOT NULL default '0' COMMENT '位置ID,映射位置表(iee_position_t)主键ID',
  `created_by` int(8) default NULL COMMENT '创建人',
  `created_date` datetime default NULL COMMENT '创建时间',
  `updated_by` int(8) default NULL COMMENT '修改人',
  `updated_date` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`,`uid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户-具体服务位置映射关系表';

-- ----------------------------
-- Records of iee_user_addrs_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:39:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_user_favorite_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_user_favorite_t`;
CREATE TABLE `iee_user_favorite_t` (
  `mid` int(8) NOT NULL COMMENT '商户ID,映射商户表iee_merchant_t主键ID',
  `cid` int(8) NOT NULL COMMENT '商品ID,映射商品表(iee_commondity_t)主键',
  `uid` int(8) NOT NULL COMMENT '用户ID,映射用户表（iee_user_t）主键',
  `quantity` int(2) default '0' COMMENT '收藏商品购买次数',
  `updated_date` datetime default NULL,
  `created_date` datetime default NULL,
  `created_by` int(8) default NULL,
  `updated_by` int(8) default NULL,
  PRIMARY KEY  (`cid`,`uid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='用户商品收藏表';

-- ----------------------------
-- Records of iee_user_favorite_t
-- ----------------------------
INSERT INTO `iee_user_favorite_t` VALUES ('0', '70', '123', '0', null, null, null, null);
INSERT INTO `iee_user_favorite_t` VALUES ('0', '80', '123', '2', null, null, null, null);
INSERT INTO `iee_user_favorite_t` VALUES ('0', '82', '123', '0', null, null, null, null);
INSERT INTO `iee_user_favorite_t` VALUES ('0', '83', '123', '0', null, null, null, null);

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-05 21:21:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_town_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_town_t`;
CREATE TABLE `iee_town_t` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `cityId` int(11) default '0',
  `provinceId` int(11) default NULL,
  `sortId` int(11) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2801 DEFAULT CHARSET=utf8 COMMENT='县区 城镇 商业区等';

-- ----------------------------
-- Records of iee_town_t
-- ----------------------------
INSERT INTO `iee_town_t` VALUES ('1', '东城区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('2', '西城区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('3', '崇文区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('4', '宣武区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('5', '朝阳区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('6', '丰台区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('7', '石景山区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('8', '海淀区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('9', '门头沟区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('10', '房山区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('11', '通州区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('12', '顺义区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('13', '昌平区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('14', '大兴区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('15', '怀柔区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('16', '平谷区', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('17', '密云县', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('18', '延庆县', '1', null, '0');
INSERT INTO `iee_town_t` VALUES ('19', '和平区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('20', '河东区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('21', '河西区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('22', '南开区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('23', '河北区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('24', '红桥区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('25', '塘沽区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('26', '汉沽区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('27', '大港区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('28', '东丽区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('29', '西青区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('30', '津南区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('31', '北辰区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('32', '武清区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('33', '宝坻区', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('34', '宁河县', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('35', '静海县', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('36', '蓟县', '6', null, '0');
INSERT INTO `iee_town_t` VALUES ('37', '黄浦区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('38', '卢湾区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('39', '徐汇区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('40', '长宁区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('41', '静安区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('42', '普陀区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('43', '闸北区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('44', '虹口区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('45', '杨浦区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('46', '闵行区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('47', '宝山区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('48', '嘉定区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('49', '浦东新区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('50', '金山区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('51', '松江区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('52', '青浦区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('53', '南汇区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('54', '奉贤区', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('55', '崇明县', '5', null, '0');
INSERT INTO `iee_town_t` VALUES ('56', '万州区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('57', '涪陵区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('58', '渝中区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('59', '大渡口区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('60', '江北区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('61', '沙坪坝区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('62', '九龙坡区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('63', '南岸区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('64', '北碚区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('65', '万盛区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('66', '双桥区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('67', '渝北区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('68', '巴南区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('69', '黔江区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('70', '长寿区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('71', '江津区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('72', '合川区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('73', '永川区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('74', '南川区', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('75', '綦江县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('76', '潼南县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('77', '铜梁县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('78', '大足县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('79', '荣昌县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('80', '璧山县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('81', '梁平县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('82', '城口县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('83', '丰都县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('84', '垫江县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('85', '武隆县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('86', '忠县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('87', '开县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('88', '云阳县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('89', '奉节县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('90', '巫山县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('91', '巫溪县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('92', '石柱自治县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('93', '秀山自治县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('94', '酉阳自治县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('95', '彭水自治县', '4', null, '0');
INSERT INTO `iee_town_t` VALUES ('96', '邯山区', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('97', '丛台区', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('98', '复兴区', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('99', '峰峰矿区', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('100', '邯郸县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('101', '临漳县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('102', '成安县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('103', '大名县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('104', '涉县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('105', '磁县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('106', '肥乡县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('107', '永年县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('108', '邱县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('109', '鸡泽县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('110', '广平县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('111', '馆陶县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('112', '魏县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('113', '曲周县', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('114', '武安市', '105', null, '0');
INSERT INTO `iee_town_t` VALUES ('115', '长安区', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('116', '桥东区', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('117', '桥西区', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('118', '新华区', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('119', '井陉矿区', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('120', '裕华区', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('121', '井陉县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('122', '正定县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('123', '栾城县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('124', '行唐县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('125', '灵寿县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('126', '高邑县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('127', '深泽县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('128', '赞皇县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('129', '无极县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('130', '平山县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('131', '元氏县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('132', '赵县', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('133', '辛集市', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('134', '藁城市', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('135', '晋州市', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('136', '新乐市', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('137', '鹿泉市', '100', null, '0');
INSERT INTO `iee_town_t` VALUES ('138', '新市区', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('139', '北市区', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('140', '南市区', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('141', '满城县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('142', '清苑县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('143', '涞水县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('144', '阜平县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('145', '徐水县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('146', '定兴县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('147', '唐县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('148', '高阳县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('149', '容城县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('150', '涞源县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('151', '望都县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('152', '安新县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('153', '易县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('154', '曲阳县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('155', '蠡县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('156', '顺平县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('157', '博野县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('158', '雄县', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('159', '涿州市', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('160', '定州市', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('161', '安国市', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('162', '高碑店市', '101', null, '0');
INSERT INTO `iee_town_t` VALUES ('163', '桥东区', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('164', '桥西区', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('165', '宣化区', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('166', '下花园区', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('167', '宣化县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('168', '张北县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('169', '康保县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('170', '沽源县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('171', '尚义县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('172', '蔚县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('173', '阳原县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('174', '怀安县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('175', '万全县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('176', '怀来县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('177', '涿鹿县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('178', '赤城县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('179', '崇礼县', '113', null, '0');
INSERT INTO `iee_town_t` VALUES ('180', '双桥区', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('181', '双滦区', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('182', '鹰手营子矿区', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('183', '承德县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('184', '兴隆县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('185', '平泉县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('186', '滦平县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('187', '隆化县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('188', '丰宁自治县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('189', '宽城自治县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('190', '围场自治县', '104', null, '0');
INSERT INTO `iee_town_t` VALUES ('191', '路南区', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('192', '路北区', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('193', '古冶区', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('194', '开平区', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('195', '丰南区', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('196', '丰润区', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('197', '滦县', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('198', '滦南县', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('199', '乐亭县', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('200', '迁西县', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('201', '玉田县', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('202', '唐海县', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('203', '遵化市', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('204', '迁安市', '111', null, '0');
INSERT INTO `iee_town_t` VALUES ('205', '安次区', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('206', '广阳区', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('207', '固安县', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('208', '永清县', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('209', '香河县', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('210', '大城县', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('211', '文安县', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('212', '大厂自治县', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('213', '霸州市', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('214', '三河市', '108', null, '0');
INSERT INTO `iee_town_t` VALUES ('215', '新华区', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('216', '运河区', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('217', '沧县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('218', '青县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('219', '东光县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('220', '海兴县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('221', '盐山县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('222', '肃宁县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('223', '南皮县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('224', '吴桥县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('225', '献县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('226', '孟村自治县', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('227', '泊头市', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('228', '任丘市', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('229', '黄骅市', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('230', '河间市', '103', null, '0');
INSERT INTO `iee_town_t` VALUES ('231', '桃城区', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('232', '枣强县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('233', '武邑县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('234', '武强县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('235', '饶阳县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('236', '安平县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('237', '故城县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('238', '景县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('239', '阜城县', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('240', '冀州市', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('241', '深州市', '107', null, '0');
INSERT INTO `iee_town_t` VALUES ('242', '桥东区', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('243', '桥西区', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('244', '邢台县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('245', '临城县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('246', '内丘县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('247', '柏乡县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('248', '隆尧县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('249', '任县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('250', '南和县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('251', '宁晋县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('252', '巨鹿县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('253', '新河县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('254', '广宗县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('255', '平乡县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('256', '威县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('257', '清河县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('258', '临西县', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('259', '南宫市', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('260', '沙河市', '112', null, '0');
INSERT INTO `iee_town_t` VALUES ('261', '海港区', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('262', '山海关区', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('263', '北戴河区', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('264', '青龙自治县', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('265', '昌黎县', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('266', '抚宁县', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('267', '卢龙县', '109', null, '0');
INSERT INTO `iee_town_t` VALUES ('268', '朔城区', '329', null, '0');
INSERT INTO `iee_town_t` VALUES ('269', '平鲁区', '329', null, '0');
INSERT INTO `iee_town_t` VALUES ('270', '山阴县', '329', null, '0');
INSERT INTO `iee_town_t` VALUES ('271', '应县', '329', null, '0');
INSERT INTO `iee_town_t` VALUES ('272', '右玉县', '329', null, '0');
INSERT INTO `iee_town_t` VALUES ('273', '怀仁县', '329', null, '0');
INSERT INTO `iee_town_t` VALUES ('274', '忻府区', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('275', '定襄县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('276', '五台县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('277', '代县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('278', '繁峙县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('279', '宁武县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('280', '静乐县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('281', '神池县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('282', '五寨县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('283', '岢岚县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('284', '河曲县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('285', '保德县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('286', '偏关县', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('287', '原平市', '330', null, '0');
INSERT INTO `iee_town_t` VALUES ('288', '小店区', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('289', '迎泽区', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('290', '杏花岭区', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('291', '尖草坪区', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('292', '万柏林区', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('293', '晋源区', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('294', '清徐县', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('295', '阳曲县', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('296', '娄烦县', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('297', '古交市', '322', null, '0');
INSERT INTO `iee_town_t` VALUES ('298', '矿区', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('299', '南郊区', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('300', '新荣区', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('301', '阳高县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('302', '天镇县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('303', '广灵县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('304', '灵丘县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('305', '浑源县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('306', '左云县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('307', '大同县', '324', null, '0');
INSERT INTO `iee_town_t` VALUES ('308', '矿区', '331', null, '0');
INSERT INTO `iee_town_t` VALUES ('309', '平定县', '331', null, '0');
INSERT INTO `iee_town_t` VALUES ('310', '盂县', '331', null, '0');
INSERT INTO `iee_town_t` VALUES ('311', '榆次区', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('312', '榆社县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('313', '左权县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('314', '和顺县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('315', '昔阳县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('316', '寿阳县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('317', '太谷县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('318', '祁县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('319', '平遥县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('320', '灵石县', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('321', '介休市', '326', null, '0');
INSERT INTO `iee_town_t` VALUES ('322', '长治县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('323', '襄垣县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('324', '屯留县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('325', '平顺县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('326', '黎城县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('327', '壶关县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('328', '长子县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('329', '武乡县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('330', '沁县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('331', '沁源县', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('332', '潞城市', '323', null, '0');
INSERT INTO `iee_town_t` VALUES ('333', '沁水县', '325', null, '0');
INSERT INTO `iee_town_t` VALUES ('334', '阳城县', '325', null, '0');
INSERT INTO `iee_town_t` VALUES ('335', '陵川县', '325', null, '0');
INSERT INTO `iee_town_t` VALUES ('336', '泽州县', '325', null, '0');
INSERT INTO `iee_town_t` VALUES ('337', '高平市', '325', null, '0');
INSERT INTO `iee_town_t` VALUES ('338', '尧都区', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('339', '曲沃县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('340', '翼城县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('341', '襄汾县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('342', '洪洞县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('343', '古县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('344', '安泽县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('345', '浮山县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('346', '吉县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('347', '乡宁县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('348', '大宁县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('349', '隰县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('350', '永和县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('351', '蒲县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('352', '汾西县', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('353', '侯马市', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('354', '霍州市', '327', null, '0');
INSERT INTO `iee_town_t` VALUES ('355', '离石区', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('356', '文水县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('357', '交城县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('358', '兴县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('359', '临县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('360', '柳林县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('361', '石楼县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('362', '岚县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('363', '方山县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('364', '中阳县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('365', '交口县', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('366', '孝义市', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('367', '汾阳市', '328', null, '0');
INSERT INTO `iee_town_t` VALUES ('368', '盐湖区', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('369', '临猗县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('370', '万荣县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('371', '闻喜县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('372', '稷山县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('373', '新绛县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('374', '绛县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('375', '垣曲县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('376', '夏县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('377', '平陆县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('378', '芮城县', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('379', '永济市', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('380', '河津市', '332', null, '0');
INSERT INTO `iee_town_t` VALUES ('381', '和平区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('382', '沈河区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('383', '大东区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('384', '皇姑区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('385', '铁西区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('386', '苏家屯区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('387', '东陵区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('388', '沈北新区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('389', '于洪区', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('390', '辽中县', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('391', '康平县', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('392', '法库县', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('393', '新民市', '222', null, '0');
INSERT INTO `iee_town_t` VALUES ('394', '银州区', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('395', '清河区', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('396', '铁岭县', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('397', '西丰县', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('398', '昌图县', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('399', '调兵山市', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('400', '开原市', '234', null, '0');
INSERT INTO `iee_town_t` VALUES ('401', '长海县', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('402', '旅顺口区', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('403', '中山区', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('404', '西岗区', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('405', '沙河口区', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('406', '甘井子区', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('407', '金州区', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('408', '普兰店市', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('409', '瓦房店市', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('410', '庄河市', '226', null, '0');
INSERT INTO `iee_town_t` VALUES ('411', '铁东区', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('412', '铁西区', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('413', '立山区', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('414', '千山区', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('415', '台安县', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('416', '岫岩满族自治县', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('417', '海城市', '223', null, '0');
INSERT INTO `iee_town_t` VALUES ('418', '新抚区', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('419', '东洲区', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('420', '望花区', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('421', '顺城区', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('422', '抚顺县', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('423', '新宾自治县', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('424', '清原自治县', '228', null, '0');
INSERT INTO `iee_town_t` VALUES ('425', '平山区', '224', null, '0');
INSERT INTO `iee_town_t` VALUES ('426', '溪湖区', '224', null, '0');
INSERT INTO `iee_town_t` VALUES ('427', '明山区', '224', null, '0');
INSERT INTO `iee_town_t` VALUES ('428', '南芬区', '224', null, '0');
INSERT INTO `iee_town_t` VALUES ('429', '本溪自治县', '224', null, '0');
INSERT INTO `iee_town_t` VALUES ('430', '桓仁自治县', '224', null, '0');
INSERT INTO `iee_town_t` VALUES ('431', '元宝区', '227', null, '0');
INSERT INTO `iee_town_t` VALUES ('432', '振兴区', '227', null, '0');
INSERT INTO `iee_town_t` VALUES ('433', '振安区', '227', null, '0');
INSERT INTO `iee_town_t` VALUES ('434', '宽甸自治县', '227', null, '0');
INSERT INTO `iee_town_t` VALUES ('435', '东港市', '227', null, '0');
INSERT INTO `iee_town_t` VALUES ('436', '凤城市', '227', null, '0');
INSERT INTO `iee_town_t` VALUES ('437', '古塔区', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('438', '凌河区', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('439', '太和区', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('440', '黑山县', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('441', '义县', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('442', '凌海市', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('443', '北镇市', '231', null, '0');
INSERT INTO `iee_town_t` VALUES ('444', '站前区', '235', null, '0');
INSERT INTO `iee_town_t` VALUES ('445', '西市区', '235', null, '0');
INSERT INTO `iee_town_t` VALUES ('446', '鮁鱼圈区', '235', null, '0');
INSERT INTO `iee_town_t` VALUES ('447', '老边区', '235', null, '0');
INSERT INTO `iee_town_t` VALUES ('448', '盖州市', '235', null, '0');
INSERT INTO `iee_town_t` VALUES ('449', '大石桥市', '235', null, '0');
INSERT INTO `iee_town_t` VALUES ('450', '海州区', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('451', '新邱区', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('452', '太平区', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('453', '清河门区', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('454', '细河区', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('455', '阜新自治县', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('456', '彰武县', '229', null, '0');
INSERT INTO `iee_town_t` VALUES ('457', '白塔区', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('458', '文圣区', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('459', '宏伟区', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('460', '弓长岭区', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('461', '太子河区', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('462', '辽阳县', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('463', '灯塔市', '232', null, '0');
INSERT INTO `iee_town_t` VALUES ('464', '双塔区', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('465', '龙城区', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('466', '朝阳县', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('467', '建平县', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('468', '喀喇沁自治县', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('469', '北票市', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('470', '凌源市', '225', null, '0');
INSERT INTO `iee_town_t` VALUES ('471', '双台子区', '233', null, '0');
INSERT INTO `iee_town_t` VALUES ('472', '兴隆台区', '233', null, '0');
INSERT INTO `iee_town_t` VALUES ('473', '大洼县', '233', null, '0');
INSERT INTO `iee_town_t` VALUES ('474', '盘山县', '233', null, '0');
INSERT INTO `iee_town_t` VALUES ('475', '连山区', '230', null, '0');
INSERT INTO `iee_town_t` VALUES ('476', '龙港区', '230', null, '0');
INSERT INTO `iee_town_t` VALUES ('477', '南票区', '230', null, '0');
INSERT INTO `iee_town_t` VALUES ('478', '绥中县', '230', null, '0');
INSERT INTO `iee_town_t` VALUES ('479', '建昌县', '230', null, '0');
INSERT INTO `iee_town_t` VALUES ('480', '兴城市', '230', null, '0');
INSERT INTO `iee_town_t` VALUES ('481', '南关区', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('482', '宽城区', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('483', '朝阳区', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('484', '二道区', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('485', '绿园区', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('486', '双阳区', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('487', '农安县', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('488', '九台市', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('489', '榆树市', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('490', '德惠市', '183', null, '0');
INSERT INTO `iee_town_t` VALUES ('491', '昌邑区', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('492', '龙潭区', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('493', '船营区', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('494', '丰满区', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('495', '永吉县', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('496', '蛟河市', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('497', '桦甸市', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('498', '舒兰市', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('499', '磐石市', '187', null, '0');
INSERT INTO `iee_town_t` VALUES ('500', '延吉市', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('501', '图们市', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('502', '敦化市', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('503', '珲春市', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('504', '龙井市', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('505', '和龙市', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('506', '汪清县', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('507', '安图县', '194', null, '0');
INSERT INTO `iee_town_t` VALUES ('508', '铁西区', '191', null, '0');
INSERT INTO `iee_town_t` VALUES ('509', '铁东区', '191', null, '0');
INSERT INTO `iee_town_t` VALUES ('510', '梨树县', '191', null, '0');
INSERT INTO `iee_town_t` VALUES ('511', '伊通自治县', '191', null, '0');
INSERT INTO `iee_town_t` VALUES ('512', '公主岭市', '191', null, '0');
INSERT INTO `iee_town_t` VALUES ('513', '双辽市', '191', null, '0');
INSERT INTO `iee_town_t` VALUES ('514', '东昌区', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('515', '二道江区', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('516', '通化县', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('517', '辉南县', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('518', '柳河县', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('519', '梅河口市', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('520', '集安市', '193', null, '0');
INSERT INTO `iee_town_t` VALUES ('521', '洮北区', '184', null, '0');
INSERT INTO `iee_town_t` VALUES ('522', '镇赉县', '184', null, '0');
INSERT INTO `iee_town_t` VALUES ('523', '通榆县', '184', null, '0');
INSERT INTO `iee_town_t` VALUES ('524', '洮南市', '184', null, '0');
INSERT INTO `iee_town_t` VALUES ('525', '大安市', '184', null, '0');
INSERT INTO `iee_town_t` VALUES ('526', '龙山区', '188', null, '0');
INSERT INTO `iee_town_t` VALUES ('527', '西安区', '188', null, '0');
INSERT INTO `iee_town_t` VALUES ('528', '东丰县', '188', null, '0');
INSERT INTO `iee_town_t` VALUES ('529', '东辽县', '188', null, '0');
INSERT INTO `iee_town_t` VALUES ('530', '宁江区', '192', null, '0');
INSERT INTO `iee_town_t` VALUES ('531', '前郭尔罗斯自治县', '192', null, '0');
INSERT INTO `iee_town_t` VALUES ('532', '长岭县', '192', null, '0');
INSERT INTO `iee_town_t` VALUES ('533', '乾安县', '192', null, '0');
INSERT INTO `iee_town_t` VALUES ('534', '扶余县', '192', null, '0');
INSERT INTO `iee_town_t` VALUES ('535', '八道江区', '185', null, '0');
INSERT INTO `iee_town_t` VALUES ('536', '江源区', '185', null, '0');
INSERT INTO `iee_town_t` VALUES ('537', '抚松县', '185', null, '0');
INSERT INTO `iee_town_t` VALUES ('538', '靖宇县', '185', null, '0');
INSERT INTO `iee_town_t` VALUES ('539', '长白自治县', '185', null, '0');
INSERT INTO `iee_town_t` VALUES ('540', '临江市', '185', null, '0');
INSERT INTO `iee_town_t` VALUES ('541', '道里区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('542', '南岗区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('543', '道外区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('544', '平房区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('545', '松北区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('546', '香坊区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('547', '呼兰区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('548', '阿城区', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('549', '依兰县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('550', '方正县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('551', '宾县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('552', '巴彦县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('553', '木兰县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('554', '通河县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('555', '延寿县', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('556', '双城市', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('557', '尚志市', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('558', '五常市', '132', null, '0');
INSERT INTO `iee_town_t` VALUES ('559', '龙沙区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('560', '建华区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('561', '铁锋区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('562', '昂昂溪区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('563', '富拉尔基区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('564', '碾子山区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('565', '梅里斯达翰尔族区', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('566', '龙江县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('567', '依安县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('568', '泰来县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('569', '甘南县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('570', '富裕县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('571', '克山县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('572', '克东县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('573', '拜泉县', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('574', '讷河市', '144', null, '0');
INSERT INTO `iee_town_t` VALUES ('575', '鸡冠区', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('576', '恒山区', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('577', '滴道区', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('578', '梨树区', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('579', '城子河区', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('580', '麻山区', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('581', '鸡东县', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('582', '虎林市', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('583', '密山市', '138', null, '0');
INSERT INTO `iee_town_t` VALUES ('584', '东安区', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('585', '阳明区', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('586', '爱民区', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('587', '西安区', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('588', '东宁县', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('589', '林口县', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('590', '绥芬河市', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('591', '海林市', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('592', '宁安市', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('593', '穆棱市', '141', null, '0');
INSERT INTO `iee_town_t` VALUES ('594', '新兴区', '143', null, '0');
INSERT INTO `iee_town_t` VALUES ('595', '桃山区', '143', null, '0');
INSERT INTO `iee_town_t` VALUES ('596', '茄子河区', '143', null, '0');
INSERT INTO `iee_town_t` VALUES ('597', '勃利县', '143', null, '0');
INSERT INTO `iee_town_t` VALUES ('598', '向阳区', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('599', '前进区', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('600', '东风区', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('601', '桦南县', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('602', '桦川县', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('603', '汤原县', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('604', '抚远县', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('605', '同江市', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('606', '富锦市', '139', null, '0');
INSERT INTO `iee_town_t` VALUES ('607', '向阳区', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('608', '工农区', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('609', '南山区', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('610', '兴安区', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('611', '东山区', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('612', '兴山区', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('613', '萝北县', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('614', '绥滨县', '135', null, '0');
INSERT INTO `iee_town_t` VALUES ('615', '尖山区', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('616', '岭东区', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('617', '四方台区', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('618', '宝山区', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('619', '集贤县', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('620', '友谊县', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('621', '宝清县', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('622', '饶河县', '145', null, '0');
INSERT INTO `iee_town_t` VALUES ('623', '北林区', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('624', '望奎县', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('625', '兰西县', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('626', '青冈县', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('627', '庆安县', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('628', '明水县', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('629', '绥棱县', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('630', '安达市', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('631', '肇东市', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('632', '海伦市', '146', null, '0');
INSERT INTO `iee_town_t` VALUES ('633', '爱辉区', '136', null, '0');
INSERT INTO `iee_town_t` VALUES ('634', '嫩江县', '136', null, '0');
INSERT INTO `iee_town_t` VALUES ('635', '逊克县', '136', null, '0');
INSERT INTO `iee_town_t` VALUES ('636', '孙吴县', '136', null, '0');
INSERT INTO `iee_town_t` VALUES ('637', '北安市', '136', null, '0');
INSERT INTO `iee_town_t` VALUES ('638', '五大连池市', '136', null, '0');
INSERT INTO `iee_town_t` VALUES ('639', '呼玛县', '134', null, '0');
INSERT INTO `iee_town_t` VALUES ('640', '塔河县', '134', null, '0');
INSERT INTO `iee_town_t` VALUES ('641', '漠河县', '134', null, '0');
INSERT INTO `iee_town_t` VALUES ('642', '伊春区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('643', '南岔区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('644', '友好区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('645', '西林区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('646', '翠峦区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('647', '新青区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('648', '美溪区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('649', '金山屯区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('650', '五营区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('651', '乌马河区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('652', '汤旺河区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('653', '带岭区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('654', '乌伊岭区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('655', '红星区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('656', '上甘岭区', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('657', '嘉荫县', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('658', '铁力市', '148', null, '0');
INSERT INTO `iee_town_t` VALUES ('659', '萨尔图区', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('660', '龙凤区', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('661', '让胡路区', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('662', '红岗区', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('663', '大同区', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('664', '肇州县', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('665', '肇源县', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('666', '林甸县', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('667', '杜尔伯特自治县', '133', null, '0');
INSERT INTO `iee_town_t` VALUES ('668', '江宁区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('669', '浦口区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('670', '玄武区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('671', '白下区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('672', '秦淮区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('673', '建邺区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('674', '鼓楼区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('675', '下关区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('676', '栖霞区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('677', '雨花台区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('678', '六合区', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('679', '溧水县', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('680', '高淳县', '195', null, '0');
INSERT INTO `iee_town_t` VALUES ('681', '崇安区', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('682', '南长区', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('683', '北塘区', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('684', '锡山区', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('685', '惠山区', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('686', '滨湖区', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('687', '江阴市', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('688', '宜兴市', '205', null, '0');
INSERT INTO `iee_town_t` VALUES ('689', '京口区', '210', null, '0');
INSERT INTO `iee_town_t` VALUES ('690', '润州区', '210', null, '0');
INSERT INTO `iee_town_t` VALUES ('691', '丹徒区', '210', null, '0');
INSERT INTO `iee_town_t` VALUES ('692', '丹阳市', '210', null, '0');
INSERT INTO `iee_town_t` VALUES ('693', '扬中市', '210', null, '0');
INSERT INTO `iee_town_t` VALUES ('694', '句容市', '210', null, '0');
INSERT INTO `iee_town_t` VALUES ('695', '沧浪区', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('696', '常熟市', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('697', '平江区', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('698', '金阊区', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('699', '虎丘区', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('700', '昆山市', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('701', '太仓市', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('702', '吴江市', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('703', '吴中区', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('704', '相城区', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('705', '张家港市', '201', null, '0');
INSERT INTO `iee_town_t` VALUES ('706', '崇川区', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('707', '港闸区', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('708', '海安县', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('709', '如东县', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('710', '启东市', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('711', '如皋市', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('712', '通州市', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('713', '海门市', '200', null, '0');
INSERT INTO `iee_town_t` VALUES ('714', '高邮市', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('715', '广陵区', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('716', '邗江区', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('717', '维扬区', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('718', '宝应县', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('719', '江都市', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('720', '仪征市', '209', null, '0');
INSERT INTO `iee_town_t` VALUES ('721', '亭湖区', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('722', '盐都区', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('723', '响水县', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('724', '滨海县', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('725', '阜宁县', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('726', '射阳县', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('727', '建湖县', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('728', '东台市', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('729', '大丰市', '208', null, '0');
INSERT INTO `iee_town_t` VALUES ('730', '鼓楼区', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('731', '云龙区', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('732', '九里区', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('733', '贾汪区', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('734', '泉山区', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('735', '丰县', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('736', '沛县', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('737', '铜山县', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('738', '睢宁县', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('739', '新沂市', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('740', '邳州市', '207', null, '0');
INSERT INTO `iee_town_t` VALUES ('741', '清河区', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('742', '楚州区', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('743', '淮阴区', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('744', '清浦区', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('745', '涟水县', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('746', '洪泽县', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('747', '盱眙县', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('748', '金湖县', '198', null, '0');
INSERT INTO `iee_town_t` VALUES ('749', '连云区', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('750', '新浦区', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('751', '海州区', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('752', '赣榆县', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('753', '东海县', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('754', '灌云县', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('755', '灌南县', '199', null, '0');
INSERT INTO `iee_town_t` VALUES ('756', '天宁区', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('757', '钟楼区', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('758', '戚墅堰区', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('759', '新北区', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('760', '武进区', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('761', '溧阳市', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('762', '金坛市', '196', null, '0');
INSERT INTO `iee_town_t` VALUES ('763', '海陵区', '204', null, '0');
INSERT INTO `iee_town_t` VALUES ('764', '高港区', '204', null, '0');
INSERT INTO `iee_town_t` VALUES ('765', '兴化市', '204', null, '0');
INSERT INTO `iee_town_t` VALUES ('766', '靖江市', '204', null, '0');
INSERT INTO `iee_town_t` VALUES ('767', '泰兴市', '204', null, '0');
INSERT INTO `iee_town_t` VALUES ('768', '姜堰市', '204', null, '0');
INSERT INTO `iee_town_t` VALUES ('769', '宿城区', '202', null, '0');
INSERT INTO `iee_town_t` VALUES ('770', '宿豫区', '202', null, '0');
INSERT INTO `iee_town_t` VALUES ('771', '沭阳县', '202', null, '0');
INSERT INTO `iee_town_t` VALUES ('772', '泗阳县', '202', null, '0');
INSERT INTO `iee_town_t` VALUES ('773', '泗洪县', '202', null, '0');
INSERT INTO `iee_town_t` VALUES ('774', '定海区', '394', null, '0');
INSERT INTO `iee_town_t` VALUES ('775', '普陀区', '394', null, '0');
INSERT INTO `iee_town_t` VALUES ('776', '岱山县', '394', null, '0');
INSERT INTO `iee_town_t` VALUES ('777', '嵊泗县', '394', null, '0');
INSERT INTO `iee_town_t` VALUES ('778', '衢江区', '383', null, '0');
INSERT INTO `iee_town_t` VALUES ('779', '常山县', '383', null, '0');
INSERT INTO `iee_town_t` VALUES ('780', '开化县', '383', null, '0');
INSERT INTO `iee_town_t` VALUES ('781', '龙游县', '383', null, '0');
INSERT INTO `iee_town_t` VALUES ('782', '江山市', '383', null, '0');
INSERT INTO `iee_town_t` VALUES ('783', '下城区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('784', '江干区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('785', '拱墅区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('786', '西湖区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('787', '滨江区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('788', '余杭区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('789', '桐庐县', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('790', '淳安县', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('791', '建德市', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('792', '富阳市', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('793', '临安市', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('794', '萧山区', '372', null, '0');
INSERT INTO `iee_town_t` VALUES ('795', '南浔区', '376', null, '0');
INSERT INTO `iee_town_t` VALUES ('796', '德清县', '376', null, '0');
INSERT INTO `iee_town_t` VALUES ('797', '长兴县', '376', null, '0');
INSERT INTO `iee_town_t` VALUES ('798', '安吉县', '376', null, '0');
INSERT INTO `iee_town_t` VALUES ('799', ' 秀洲区', '377', null, '0');
INSERT INTO `iee_town_t` VALUES ('800', ' 嘉善县', '377', null, '0');
INSERT INTO `iee_town_t` VALUES ('801', ' 海盐县', '377', null, '0');
INSERT INTO `iee_town_t` VALUES ('802', ' 海宁市', '377', null, '0');
INSERT INTO `iee_town_t` VALUES ('803', ' 平湖市', '377', null, '0');
INSERT INTO `iee_town_t` VALUES ('804', ' 桐乡市 ', '377', null, '0');
INSERT INTO `iee_town_t` VALUES ('805', '江东区', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('806', '江北区', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('807', '北仑区', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('808', '镇海区', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('809', '鄞州区', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('810', '象山县', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('811', '宁海县', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('812', '余姚市', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('813', '慈溪市', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('814', '奉化市', '381', null, '0');
INSERT INTO `iee_town_t` VALUES ('815', '绍兴县', '385', null, '0');
INSERT INTO `iee_town_t` VALUES ('816', '新昌县', '385', null, '0');
INSERT INTO `iee_town_t` VALUES ('817', '诸暨市', '385', null, '0');
INSERT INTO `iee_town_t` VALUES ('818', '上虞市', '385', null, '0');
INSERT INTO `iee_town_t` VALUES ('819', '嵊州市', '385', null, '0');
INSERT INTO `iee_town_t` VALUES ('820', '龙湾区', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('821', '瓯海区', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('822', '洞头县', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('823', '永嘉县', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('824', '平阳县', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('825', '苍南县', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('826', '文成县', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('827', '泰顺县', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('828', '瑞安市', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('829', '乐清市', '389', null, '0');
INSERT INTO `iee_town_t` VALUES ('830', '青田县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('831', '缙云县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('832', '遂昌县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('833', '松阳县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('834', '云和县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('835', '庆元县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('836', '景宁畲族自治县', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('837', '龙泉市', '379', null, '0');
INSERT INTO `iee_town_t` VALUES ('838', '金东区', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('839', '武义县', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('840', '浦江县', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('841', '磐安县', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('842', '兰溪市', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('843', '义乌市', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('844', '东阳市', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('845', '永康市', '378', null, '0');
INSERT INTO `iee_town_t` VALUES ('846', '黄岩区', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('847', '路桥区', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('848', '玉环县', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('849', '三门县', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('850', '天台县', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('851', '仙居县', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('852', '温岭市', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('853', '临海市', '386', null, '0');
INSERT INTO `iee_town_t` VALUES ('854', '瑶海区', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('855', '庐阳区', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('856', '蜀山区', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('857', '包河区', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('858', '长丰县', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('859', '肥东县', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('860', '肥西县', '7', null, '0');
INSERT INTO `iee_town_t` VALUES ('861', '镜湖区', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('862', '弋江区', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('863', '鸠江区', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('864', '三山区', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('865', '芜湖县', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('866', '繁昌县', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('867', '南陵县', '25', null, '0');
INSERT INTO `iee_town_t` VALUES ('868', '龙子湖区', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('869', '蚌山区', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('870', '禹会区', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('871', '淮上区', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('872', '怀远县', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('873', '五河县', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('874', '固镇县', '9', null, '0');
INSERT INTO `iee_town_t` VALUES ('875', '大通区', '16', null, '0');
INSERT INTO `iee_town_t` VALUES ('876', '田家庵区', '16', null, '0');
INSERT INTO `iee_town_t` VALUES ('877', '谢家集区', '16', null, '0');
INSERT INTO `iee_town_t` VALUES ('878', '八公山区', '16', null, '0');
INSERT INTO `iee_town_t` VALUES ('879', '潘集区', '16', null, '0');
INSERT INTO `iee_town_t` VALUES ('880', '凤台县', '16', null, '0');
INSERT INTO `iee_town_t` VALUES ('881', '金家庄区', '21', null, '0');
INSERT INTO `iee_town_t` VALUES ('882', '花山区', '21', null, '0');
INSERT INTO `iee_town_t` VALUES ('883', '雨山区', '21', null, '0');
INSERT INTO `iee_town_t` VALUES ('884', '当涂县', '21', null, '0');
INSERT INTO `iee_town_t` VALUES ('885', '杜集区', '15', null, '0');
INSERT INTO `iee_town_t` VALUES ('886', '相山区', '15', null, '0');
INSERT INTO `iee_town_t` VALUES ('887', '烈山区', '15', null, '0');
INSERT INTO `iee_town_t` VALUES ('888', '濉溪县 ', '15', null, '0');
INSERT INTO `iee_town_t` VALUES ('889', '铜官山区', '24', null, '0');
INSERT INTO `iee_town_t` VALUES ('890', '狮子山区', '24', null, '0');
INSERT INTO `iee_town_t` VALUES ('891', '铜陵县', '24', null, '0');
INSERT INTO `iee_town_t` VALUES ('892', '迎江区', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('893', '大观区', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('894', '宜秀区', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('895', '怀宁县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('896', '枞阳县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('897', '潜山县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('898', '太湖县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('899', '宿松县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('900', '望江县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('901', '岳西县', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('902', '桐城市', '8', null, '0');
INSERT INTO `iee_town_t` VALUES ('903', '屯溪区', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('904', '黄山区', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('905', '徽州区', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('906', '歙县', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('907', '休宁县', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('908', '黟县', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('909', '祁门县', '17', null, '0');
INSERT INTO `iee_town_t` VALUES ('910', '琅琊区', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('911', '南谯区', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('912', '来安县', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('913', '全椒县', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('914', '定远县', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('915', '凤阳县', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('916', '天长市', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('917', '明光市', '13', null, '0');
INSERT INTO `iee_town_t` VALUES ('918', '颍州区', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('919', '颍东区', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('920', '颍泉区', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('921', '临泉县', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('922', '太和县', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('923', '阜南县', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('924', '颍上县', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('925', '界首市', '14', null, '0');
INSERT INTO `iee_town_t` VALUES ('926', '埇桥区', '23', null, '0');
INSERT INTO `iee_town_t` VALUES ('927', '砀山县', '23', null, '0');
INSERT INTO `iee_town_t` VALUES ('928', '萧县', '23', null, '0');
INSERT INTO `iee_town_t` VALUES ('929', '灵璧县', '23', null, '0');
INSERT INTO `iee_town_t` VALUES ('930', '泗县 ', '23', null, '0');
INSERT INTO `iee_town_t` VALUES ('931', '居巢区', '11', null, '0');
INSERT INTO `iee_town_t` VALUES ('932', '庐江县', '11', null, '0');
INSERT INTO `iee_town_t` VALUES ('933', '无为县', '11', null, '0');
INSERT INTO `iee_town_t` VALUES ('934', '含山县', '11', null, '0');
INSERT INTO `iee_town_t` VALUES ('935', '和县 ', '11', null, '0');
INSERT INTO `iee_town_t` VALUES ('936', '金安区', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('937', '裕安区', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('938', '寿县', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('939', '霍邱县', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('940', '舒城县', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('941', '金寨县', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('942', '霍山县', '20', null, '0');
INSERT INTO `iee_town_t` VALUES ('943', '谯城区', '10', null, '0');
INSERT INTO `iee_town_t` VALUES ('944', '涡阳县', '10', null, '0');
INSERT INTO `iee_town_t` VALUES ('945', '蒙城县', '10', null, '0');
INSERT INTO `iee_town_t` VALUES ('946', '利辛县', '10', null, '0');
INSERT INTO `iee_town_t` VALUES ('947', '贵池区', '12', null, '0');
INSERT INTO `iee_town_t` VALUES ('948', '东至县', '12', null, '0');
INSERT INTO `iee_town_t` VALUES ('949', '石台县', '12', null, '0');
INSERT INTO `iee_town_t` VALUES ('950', '青阳县', '12', null, '0');
INSERT INTO `iee_town_t` VALUES ('951', '宣州区', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('952', '郎溪县', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('953', '广德县', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('954', '泾县', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('955', '绩溪县', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('956', '旌德县', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('957', '宁国市', '26', null, '0');
INSERT INTO `iee_town_t` VALUES ('958', '鼓楼区', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('959', '台江区', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('960', '仓山区', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('961', '马尾区', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('962', '晋安区', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('963', '闽侯县', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('964', '连江县', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('965', '罗源县', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('966', '闽清县', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('967', '永泰县', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('968', '平潭县', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('969', '福清市', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('970', '长乐市', '27', null, '0');
INSERT INTO `iee_town_t` VALUES ('971', '思明区', '34', null, '0');
INSERT INTO `iee_town_t` VALUES ('972', '海沧区', '34', null, '0');
INSERT INTO `iee_town_t` VALUES ('973', '湖里区', '34', null, '0');
INSERT INTO `iee_town_t` VALUES ('974', '集美区', '34', null, '0');
INSERT INTO `iee_town_t` VALUES ('975', '同安区', '34', null, '0');
INSERT INTO `iee_town_t` VALUES ('976', '翔安区', '34', null, '0');
INSERT INTO `iee_town_t` VALUES ('977', '蕉城区', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('978', '霞浦县', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('979', '古田县', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('980', '屏南县', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('981', '寿宁县', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('982', '周宁县', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('983', '柘荣县', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('984', '福安市', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('985', '福鼎市', '30', null, '0');
INSERT INTO `iee_town_t` VALUES ('986', '城厢区', '31', null, '0');
INSERT INTO `iee_town_t` VALUES ('987', '涵江区', '31', null, '0');
INSERT INTO `iee_town_t` VALUES ('988', '荔城区', '31', null, '0');
INSERT INTO `iee_town_t` VALUES ('989', '秀屿区', '31', null, '0');
INSERT INTO `iee_town_t` VALUES ('990', '仙游县', '31', null, '0');
INSERT INTO `iee_town_t` VALUES ('991', '鲤城区', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('992', '丰泽区', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('993', '洛江区', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('994', '泉港区', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('995', '惠安县', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('996', '安溪县', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('997', '永春县', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('998', '德化县', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('999', '石狮市', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('1000', '晋江市', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('1001', '南安市', '32', null, '0');
INSERT INTO `iee_town_t` VALUES ('1002', '芗城区', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1003', '龙文区', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1004', '云霄县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1005', '漳浦县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1006', '诏安县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1007', '长泰县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1008', '东山县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1009', '南靖县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1010', '平和县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1011', '华安县', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1012', '龙海市', '36', null, '0');
INSERT INTO `iee_town_t` VALUES ('1013', '新罗区', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1014', '长汀县', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1015', '永定县', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1016', '上杭县', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1017', '武平县', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1018', '连城县', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1019', '漳平市', '28', null, '0');
INSERT INTO `iee_town_t` VALUES ('1020', '梅列区', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1021', '三元区', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1022', '明溪县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1023', '清流县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1024', '宁化县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1025', '大田县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1026', '尤溪县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1027', '沙县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1028', '将乐县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1029', '泰宁县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1030', '建宁县', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1031', '永安市', '33', null, '0');
INSERT INTO `iee_town_t` VALUES ('1032', '延平区', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1033', '顺昌县', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1034', '浦城县', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1035', '光泽县', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1036', '松溪县', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1037', '政和县', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1038', '邵武市', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1039', '武夷山市', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1040', '建瓯市', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1041', '建阳市', '29', null, '0');
INSERT INTO `iee_town_t` VALUES ('1042', '月湖区', '221', null, '0');
INSERT INTO `iee_town_t` VALUES ('1043', '余江县', '221', null, '0');
INSERT INTO `iee_town_t` VALUES ('1044', '贵溪市', '221', null, '0');
INSERT INTO `iee_town_t` VALUES ('1045', '渝水区', '219', null, '0');
INSERT INTO `iee_town_t` VALUES ('1046', '分宜县', '219', null, '0');
INSERT INTO `iee_town_t` VALUES ('1047', '东湖区', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1048', '西湖区', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1049', '青云谱区', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1050', '湾里区', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1051', '青山湖区', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1052', '南昌县', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1053', '新建县', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1054', '安义县', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1055', '进贤县', '211', null, '0');
INSERT INTO `iee_town_t` VALUES ('1056', '庐山区', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1057', '浔阳区', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1058', '九江县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1059', '武宁县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1060', '修水县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1061', '永修县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1062', '德安县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1063', '星子县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1064', '都昌县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1065', '湖口县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1066', '彭泽县', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1067', '瑞昌市', '216', null, '0');
INSERT INTO `iee_town_t` VALUES ('1068', '信州区', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1069', '上饶县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1070', '广丰县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1071', '玉山县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1072', '铅山县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1073', '横峰县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1074', '弋阳县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1075', '余干县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1076', '鄱阳县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1077', '万年县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1078', '婺源县', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1079', '德兴市', '218', null, '0');
INSERT INTO `iee_town_t` VALUES ('1080', '临川区', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1081', '南城县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1082', '黎川县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1083', '南丰县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1084', '崇仁县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1085', '乐安县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1086', '宜黄县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1087', '金溪县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1088', '资溪县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1089', '东乡县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1090', '广昌县', '212', null, '0');
INSERT INTO `iee_town_t` VALUES ('1091', '袁州区', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1092', '奉新县', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1093', '万载县', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1094', '上高县', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1095', '宜丰县', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1096', '靖安县', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1097', '铜鼓县', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1098', '丰城市', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1099', '樟树市', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1100', '高安市', '220', null, '0');
INSERT INTO `iee_town_t` VALUES ('1101', '吉州区', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1102', '青原区', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1103', '吉安县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1104', '吉水县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1105', '峡江县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1106', '新干县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1107', '永丰县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1108', '泰和县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1109', '遂川县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1110', '万安县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1111', '安福县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1112', '永新县', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1113', '井冈山市', '214', null, '0');
INSERT INTO `iee_town_t` VALUES ('1114', '章贡区', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1115', '赣县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1116', '信丰县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1117', '大余县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1118', '上犹县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1119', '崇义县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1120', '安远县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1121', '龙南县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1122', '定南县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1123', '全南县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1124', '宁都县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1125', '于都县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1126', '兴国县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1127', '会昌县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1128', '寻乌县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1129', '石城县', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1130', '瑞金市', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1131', '南康市', '213', null, '0');
INSERT INTO `iee_town_t` VALUES ('1132', '昌江区', '215', null, '0');
INSERT INTO `iee_town_t` VALUES ('1133', '珠山区', '215', null, '0');
INSERT INTO `iee_town_t` VALUES ('1134', '浮梁县', '215', null, '0');
INSERT INTO `iee_town_t` VALUES ('1135', '乐平市', '215', null, '0');
INSERT INTO `iee_town_t` VALUES ('1136', '安源区', '217', null, '0');
INSERT INTO `iee_town_t` VALUES ('1137', '湘东区', '217', null, '0');
INSERT INTO `iee_town_t` VALUES ('1138', '莲花县', '217', null, '0');
INSERT INTO `iee_town_t` VALUES ('1139', '上栗县', '217', null, '0');
INSERT INTO `iee_town_t` VALUES ('1140', '芦溪县', '217', null, '0');
INSERT INTO `iee_town_t` VALUES ('1141', '牡丹区', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1142', '曹县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1143', '单县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1144', '成武县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1145', '巨野县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1146', '郓城县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1147', '鄄城县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1148', '定陶县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1149', '东明县', '294', null, '0');
INSERT INTO `iee_town_t` VALUES ('1150', '历下区', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1151', '市中区', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1152', '槐荫区', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1153', '天桥区', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1154', '历城区', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1155', '长清区', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1156', '平阴县', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1157', '济阳县', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1158', '商河县', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1159', '章丘市', '288', null, '0');
INSERT INTO `iee_town_t` VALUES ('1160', '市南区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1161', '市北区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1162', '四方区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1163', '黄岛区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1164', '崂山区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1165', '李沧区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1166', '城阳区', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1167', '胶州市', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1168', '即墨市', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1169', '平度市', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1170', '胶南市', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1171', '莱西市', '301', null, '0');
INSERT INTO `iee_town_t` VALUES ('1172', '淄川区', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1173', '张店区', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1174', '博山区', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1175', '临淄区', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1176', '周村区', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1177', '桓台县', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1178', '高青县', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1179', '沂源县', '310', null, '0');
INSERT INTO `iee_town_t` VALUES ('1180', '德城区', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1181', '陵县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1182', '宁津县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1183', '庆云县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1184', '临邑县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1185', '齐河县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1186', '平原县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1187', '夏津县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1188', '武城县', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1189', '乐陵市', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1190', '禹城市', '290', null, '0');
INSERT INTO `iee_town_t` VALUES ('1191', '芝罘区', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1192', '福山区', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1193', '牟平区', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1194', '莱山区', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1195', '长岛县', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1196', '龙口市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1197', '莱阳市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1198', '莱州市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1199', '蓬莱市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1200', '招远市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1201', '栖霞市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1202', '海阳市', '307', null, '0');
INSERT INTO `iee_town_t` VALUES ('1203', '潍城区', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1204', '寒亭区', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1205', '坊子区', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1206', '奎文区', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1207', '临朐县', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1208', '昌乐县', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1209', '青州市', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1210', '诸城市', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1211', '寿光市', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1212', '安丘市', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1213', '高密市', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1214', '昌邑市', '306', null, '0');
INSERT INTO `iee_town_t` VALUES ('1215', '市中区', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1216', '任城区', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1217', '微山县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1218', '鱼台县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1219', '金乡县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1220', '嘉祥县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1221', '汶上县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1222', '泗水县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1223', '梁山县', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1224', '曲阜市', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1225', '兖州市', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1226', '邹城市', '295', null, '0');
INSERT INTO `iee_town_t` VALUES ('1227', '泰山区', '304', null, '0');
INSERT INTO `iee_town_t` VALUES ('1228', '岱岳区', '304', null, '0');
INSERT INTO `iee_town_t` VALUES ('1229', '宁阳县', '304', null, '0');
INSERT INTO `iee_town_t` VALUES ('1230', '东平县', '304', null, '0');
INSERT INTO `iee_town_t` VALUES ('1231', '新泰市', '304', null, '0');
INSERT INTO `iee_town_t` VALUES ('1232', '肥城市', '304', null, '0');
INSERT INTO `iee_town_t` VALUES ('1233', '兰山区', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1234', '罗庄区', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1235', '河东区', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1236', '沂南县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1237', '郯城县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1238', '沂水县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1239', '苍山县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1240', '费县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1241', '平邑县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1242', '莒南县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1243', '蒙阴县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1244', '临沭县', '299', null, '0');
INSERT INTO `iee_town_t` VALUES ('1245', '滨城区', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1246', '惠民县', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1247', '阳信县', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1248', '无棣县', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1249', '沾化县', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1250', '博兴县', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1251', '邹平县', '289', null, '0');
INSERT INTO `iee_town_t` VALUES ('1252', '东营区', '291', null, '0');
INSERT INTO `iee_town_t` VALUES ('1253', '河口区', '291', null, '0');
INSERT INTO `iee_town_t` VALUES ('1254', '垦利县', '291', null, '0');
INSERT INTO `iee_town_t` VALUES ('1255', '利津县', '291', null, '0');
INSERT INTO `iee_town_t` VALUES ('1256', '广饶县', '291', null, '0');
INSERT INTO `iee_town_t` VALUES ('1257', '环翠区', '305', null, '0');
INSERT INTO `iee_town_t` VALUES ('1258', '文登市', '305', null, '0');
INSERT INTO `iee_town_t` VALUES ('1259', '荣成市', '305', null, '0');
INSERT INTO `iee_town_t` VALUES ('1260', '乳山市', '305', null, '0');
INSERT INTO `iee_town_t` VALUES ('1261', '市中区', '308', null, '0');
INSERT INTO `iee_town_t` VALUES ('1262', '薛城区', '308', null, '0');
INSERT INTO `iee_town_t` VALUES ('1263', '峄城区', '308', null, '0');
INSERT INTO `iee_town_t` VALUES ('1264', '台儿庄区', '308', null, '0');
INSERT INTO `iee_town_t` VALUES ('1265', '山亭区', '308', null, '0');
INSERT INTO `iee_town_t` VALUES ('1266', '滕州市', '308', null, '0');
INSERT INTO `iee_town_t` VALUES ('1267', '东港区', '303', null, '0');
INSERT INTO `iee_town_t` VALUES ('1268', '岚山区', '303', null, '0');
INSERT INTO `iee_town_t` VALUES ('1269', '五莲县', '303', null, '0');
INSERT INTO `iee_town_t` VALUES ('1270', '莒县', '303', null, '0');
INSERT INTO `iee_town_t` VALUES ('1271', '莱城区', '296', null, '0');
INSERT INTO `iee_town_t` VALUES ('1272', '钢城区', '296', null, '0');
INSERT INTO `iee_town_t` VALUES ('1273', '东昌府区', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1274', '阳谷县', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1275', '莘县', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1276', '茌平县', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1277', '东阿县', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1278', '冠县', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1279', '高唐县', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1280', '临清市', '298', null, '0');
INSERT INTO `iee_town_t` VALUES ('1281', '梁园区', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1282', '睢阳区', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1283', '民权县', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1284', '睢县', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1285', '宁陵县', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1286', '柘城县', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1287', '虞城县', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1288', '夏邑县', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1289', '永城市', '126', null, '0');
INSERT INTO `iee_town_t` VALUES ('1290', '中原区', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1291', '二七区', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1292', '管城回族区', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1293', '金水区', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1294', '上街区', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1295', '惠济区', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1296', '中牟县', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1297', '巩义市', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1298', '荥阳市', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1299', '新密市', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1300', '新郑市', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1301', '登封市', '114', null, '0');
INSERT INTO `iee_town_t` VALUES ('1302', '文峰区', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1303', '北关区', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1304', '殷都区', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1305', '龙安区', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1306', '安阳县', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1307', '汤阴县', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1308', '滑县', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1309', '内黄县', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1310', '林州市', '115', null, '0');
INSERT INTO `iee_town_t` VALUES ('1311', '红旗区', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1312', '卫滨区', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1313', '凤泉区', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1314', '牧野区', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1315', '新乡县', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1316', '获嘉县', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1317', '原阳县', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1318', '延津县', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1319', '封丘县', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1320', '长垣县', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1321', '卫辉市', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1322', '辉县市', '127', null, '0');
INSERT INTO `iee_town_t` VALUES ('1323', '魏都区', '129', null, '0');
INSERT INTO `iee_town_t` VALUES ('1324', '许昌县', '129', null, '0');
INSERT INTO `iee_town_t` VALUES ('1325', '鄢陵县', '129', null, '0');
INSERT INTO `iee_town_t` VALUES ('1326', '襄城县', '129', null, '0');
INSERT INTO `iee_town_t` VALUES ('1327', '禹州市', '129', null, '0');
INSERT INTO `iee_town_t` VALUES ('1328', '长葛市', '129', null, '0');
INSERT INTO `iee_town_t` VALUES ('1329', '新华区', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1330', '卫东区', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1331', '石龙区', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1332', '湛河区', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1333', '宝丰县', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1334', '叶县', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1335', '鲁山县', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1336', '郏县', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1337', '舞钢市', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1338', '汝州市', '123', null, '0');
INSERT INTO `iee_town_t` VALUES ('1339', '浉河区', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1340', '平桥区', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1341', '罗山县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1342', '光山县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1343', '新县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1344', '商城县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1345', '固始县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1346', '潢川县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1347', '淮滨县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1348', '息县', '128', null, '0');
INSERT INTO `iee_town_t` VALUES ('1349', '宛城区', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1350', '卧龙区', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1351', '南召县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1352', '方城县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1353', '西峡县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1354', '镇平县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1355', '内乡县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1356', '淅川县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1357', '社旗县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1358', '唐河县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1359', '新野县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1360', '桐柏县', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1361', '邓州市', '122', null, '0');
INSERT INTO `iee_town_t` VALUES ('1362', '龙亭区', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1363', '顺河回族区', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1364', '鼓楼区', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1365', '禹王台区', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1366', '金明区', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1367', '杞县', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1368', '通许县', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1369', '尉氏县', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1370', '开封县', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1371', '兰考县', '119', null, '0');
INSERT INTO `iee_town_t` VALUES ('1372', '老城区', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1373', '西工区', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1374', '瀍河回族区', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1375', '涧西区', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1376', '吉利区', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1377', '洛龙区', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1378', '孟津县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1379', '新安县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1380', '栾川县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1381', '嵩县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1382', '汝阳县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1383', '宜阳县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1384', '洛宁县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1385', '伊川县', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1386', '偃师市', '120', null, '0');
INSERT INTO `iee_town_t` VALUES ('1387', '解放区', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1388', '中站区', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1389', '马村区', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1390', '山阳区', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1391', '修武县', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1392', '博爱县', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1393', '武陟县', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1394', '温县', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1395', '沁阳市', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1396', '孟州市', '118', null, '0');
INSERT INTO `iee_town_t` VALUES ('1397', '鹤山区', '116', null, '0');
INSERT INTO `iee_town_t` VALUES ('1398', '山城区', '116', null, '0');
INSERT INTO `iee_town_t` VALUES ('1399', '淇滨区', '116', null, '0');
INSERT INTO `iee_town_t` VALUES ('1400', '浚县', '116', null, '0');
INSERT INTO `iee_town_t` VALUES ('1401', '淇县', '116', null, '0');
INSERT INTO `iee_town_t` VALUES ('1402', '华龙区', '124', null, '0');
INSERT INTO `iee_town_t` VALUES ('1403', '清丰县', '124', null, '0');
INSERT INTO `iee_town_t` VALUES ('1404', '南乐县', '124', null, '0');
INSERT INTO `iee_town_t` VALUES ('1405', '范县', '124', null, '0');
INSERT INTO `iee_town_t` VALUES ('1406', '台前县', '124', null, '0');
INSERT INTO `iee_town_t` VALUES ('1407', '濮阳县', '124', null, '0');
INSERT INTO `iee_town_t` VALUES ('1408', '川汇区', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1409', '扶沟县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1410', '西华县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1411', '商水县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1412', '沈丘县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1413', '郸城县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1414', '淮阳县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1415', '太康县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1416', '鹿邑县', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1417', '项城市', '130', null, '0');
INSERT INTO `iee_town_t` VALUES ('1418', '源汇区', '121', null, '0');
INSERT INTO `iee_town_t` VALUES ('1419', '郾城区', '121', null, '0');
INSERT INTO `iee_town_t` VALUES ('1420', '召陵区', '121', null, '0');
INSERT INTO `iee_town_t` VALUES ('1421', '舞阳县', '121', null, '0');
INSERT INTO `iee_town_t` VALUES ('1422', '临颍县', '121', null, '0');
INSERT INTO `iee_town_t` VALUES ('1423', '驿城区', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1424', '西平县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1425', '上蔡县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1426', '平舆县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1427', '正阳县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1428', '确山县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1429', '泌阳县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1430', '汝南县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1431', '遂平县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1432', '新蔡县', '131', null, '0');
INSERT INTO `iee_town_t` VALUES ('1433', '湖滨区', '125', null, '0');
INSERT INTO `iee_town_t` VALUES ('1434', '渑池县', '125', null, '0');
INSERT INTO `iee_town_t` VALUES ('1435', '陕县', '125', null, '0');
INSERT INTO `iee_town_t` VALUES ('1436', '卢氏县', '125', null, '0');
INSERT INTO `iee_town_t` VALUES ('1437', '义马市', '125', null, '0');
INSERT INTO `iee_town_t` VALUES ('1438', '灵宝市', '125', null, '0');
INSERT INTO `iee_town_t` VALUES ('1439', '江岸区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1440', '江汉区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1441', '硚口区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1442', '汉阳区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1443', '武昌区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1444', '青山区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1445', '洪山区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1446', '东西湖区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1447', '汉南区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1448', '蔡甸区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1449', '江夏区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1450', '黄陂区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1451', '新洲区', '149', null, '0');
INSERT INTO `iee_town_t` VALUES ('1452', '襄城区', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1453', '樊城区', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1454', '襄阳区', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1455', '南漳县', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1456', '谷城县', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1457', '保康县', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1458', '老河口市', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1459', '枣阳市', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1460', '宜城市', '162', null, '0');
INSERT INTO `iee_town_t` VALUES ('1461', '梁子湖区', '150', null, '0');
INSERT INTO `iee_town_t` VALUES ('1462', '华容区', '150', null, '0');
INSERT INTO `iee_town_t` VALUES ('1463', '鄂城区', '150', null, '0');
INSERT INTO `iee_town_t` VALUES ('1464', '孝南区', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1465', '孝昌县', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1466', '大悟县', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1467', '云梦县', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1468', '应城市', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1469', '安陆市', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1470', '汉川市', '163', null, '0');
INSERT INTO `iee_town_t` VALUES ('1471', '黄州区', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1472', '团风县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1473', '红安县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1474', '罗田县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1475', '英山县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1476', '浠水县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1477', '蕲春县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1478', '黄梅县', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1479', '麻城市', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1480', '武穴市', '152', null, '0');
INSERT INTO `iee_town_t` VALUES ('1481', '黄石港区', '153', null, '0');
INSERT INTO `iee_town_t` VALUES ('1482', '西塞山区', '153', null, '0');
INSERT INTO `iee_town_t` VALUES ('1483', '下陆区', '153', null, '0');
INSERT INTO `iee_town_t` VALUES ('1484', '铁山区', '153', null, '0');
INSERT INTO `iee_town_t` VALUES ('1485', '阳新县', '153', null, '0');
INSERT INTO `iee_town_t` VALUES ('1486', '大冶市', '153', null, '0');
INSERT INTO `iee_town_t` VALUES ('1487', '咸安区', '161', null, '0');
INSERT INTO `iee_town_t` VALUES ('1488', '嘉鱼县', '161', null, '0');
INSERT INTO `iee_town_t` VALUES ('1489', '通城县', '161', null, '0');
INSERT INTO `iee_town_t` VALUES ('1490', '崇阳县', '161', null, '0');
INSERT INTO `iee_town_t` VALUES ('1491', '通山县', '161', null, '0');
INSERT INTO `iee_town_t` VALUES ('1492', '赤壁市', '161', null, '0');
INSERT INTO `iee_town_t` VALUES ('1493', '沙市区', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1494', '荆州区', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1495', '公安县', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1496', '监利县', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1497', '江陵县', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1498', '石首市', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1499', '洪湖市', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1500', '松滋市', '155', null, '0');
INSERT INTO `iee_town_t` VALUES ('1501', '西陵区', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1502', '伍家岗区', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1503', '点军区', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1504', '猇亭区', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1505', '夷陵区', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1506', '远安县', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1507', '兴山县', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1508', '秭归县', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1509', '长阳自治县', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1510', '五峰自治县', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1511', '宜都市', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1512', '当阳市', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1513', '枝江市', '164', null, '0');
INSERT INTO `iee_town_t` VALUES ('1514', '恩施市', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1515', '利川市', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1516', '建始县', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1517', '巴东县', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1518', '宣恩县', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1519', '咸丰县', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1520', '来凤县', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1521', '鹤峰县', '151', null, '0');
INSERT INTO `iee_town_t` VALUES ('1522', '茅箭区', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1523', '张湾区', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1524', '郧县', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1525', '郧西县', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1526', '竹山县', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1527', '竹溪县', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1528', '房县', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1529', '丹江口市', '157', null, '0');
INSERT INTO `iee_town_t` VALUES ('1530', '曾都区', '158', null, '0');
INSERT INTO `iee_town_t` VALUES ('1531', '广水市', '158', null, '0');
INSERT INTO `iee_town_t` VALUES ('1532', '东宝区', '154', null, '0');
INSERT INTO `iee_town_t` VALUES ('1533', '掇刀区', '154', null, '0');
INSERT INTO `iee_town_t` VALUES ('1534', '京山县', '154', null, '0');
INSERT INTO `iee_town_t` VALUES ('1535', '沙洋县', '154', null, '0');
INSERT INTO `iee_town_t` VALUES ('1536', '钟祥市', '154', null, '0');
INSERT INTO `iee_town_t` VALUES ('1537', '岳阳楼区', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1538', '云溪区', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1539', '君山区', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1540', '岳阳县', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1541', '华容县', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1542', '湘阴县', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1543', '平江县', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1544', '汨罗市', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1545', '临湘市', '180', null, '0');
INSERT INTO `iee_town_t` VALUES ('1546', '芙蓉区', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1547', '天心区', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1548', '岳麓区', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1549', '开福区', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1550', '雨花区', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1551', '长沙县', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1552', '望城县', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1553', '宁乡县', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1554', '浏阳市', '165', null, '0');
INSERT INTO `iee_town_t` VALUES ('1555', '雨湖区', '176', null, '0');
INSERT INTO `iee_town_t` VALUES ('1556', '岳塘区', '176', null, '0');
INSERT INTO `iee_town_t` VALUES ('1557', '湘潭县', '176', null, '0');
INSERT INTO `iee_town_t` VALUES ('1558', '湘乡市', '176', null, '0');
INSERT INTO `iee_town_t` VALUES ('1559', '韶山市', '176', null, '0');
INSERT INTO `iee_town_t` VALUES ('1560', '荷塘区', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1561', '芦淞区', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1562', '石峰区', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1563', '天元区', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1564', '株洲县', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1565', '攸县', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1566', '茶陵县', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1567', '炎陵县', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1568', '醴陵市', '182', null, '0');
INSERT INTO `iee_town_t` VALUES ('1569', '珠晖区', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1570', '雁峰区', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1571', '石鼓区', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1572', '蒸湘区', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1573', '南岳区', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1574', '衡阳县', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1575', '衡南县', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1576', '衡山县', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1577', '衡东县', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1578', '祁东县', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1579', '耒阳市', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1580', '常宁市', '168', null, '0');
INSERT INTO `iee_town_t` VALUES ('1581', '北湖区', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1582', '苏仙区', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1583', '桂阳县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1584', '宜章县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1585', '永兴县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1586', '嘉禾县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1587', '临武县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1588', '汝城县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1589', '桂东县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1590', '安仁县', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1591', '资兴市', '167', null, '0');
INSERT INTO `iee_town_t` VALUES ('1592', '武陵区', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1593', '鼎城区', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1594', '安乡县', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1595', '汉寿县', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1596', '澧县', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1597', '临澧县', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1598', '桃源县', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1599', '石门县', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1600', '津市市', '166', null, '0');
INSERT INTO `iee_town_t` VALUES ('1601', '资阳区', '178', null, '0');
INSERT INTO `iee_town_t` VALUES ('1602', '赫山区', '178', null, '0');
INSERT INTO `iee_town_t` VALUES ('1603', '南县', '178', null, '0');
INSERT INTO `iee_town_t` VALUES ('1604', '桃江县', '178', null, '0');
INSERT INTO `iee_town_t` VALUES ('1605', '安化县', '178', null, '0');
INSERT INTO `iee_town_t` VALUES ('1606', '沅江市', '178', null, '0');
INSERT INTO `iee_town_t` VALUES ('1607', '娄星区', '173', null, '0');
INSERT INTO `iee_town_t` VALUES ('1608', '双峰县', '173', null, '0');
INSERT INTO `iee_town_t` VALUES ('1609', '新化县', '173', null, '0');
INSERT INTO `iee_town_t` VALUES ('1610', '冷水江市', '173', null, '0');
INSERT INTO `iee_town_t` VALUES ('1611', '涟源市', '173', null, '0');
INSERT INTO `iee_town_t` VALUES ('1612', '双清区', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1613', '大祥区', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1614', '北塔区', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1615', '邵东县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1616', '新邵县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1617', '邵阳县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1618', '隆回县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1619', '洞口县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1620', '绥宁县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1621', '新宁县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1622', '城步自治县', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1623', '武冈市', '175', null, '0');
INSERT INTO `iee_town_t` VALUES ('1624', '吉首市', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1625', '泸溪县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1626', '凤凰县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1627', '花垣县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1628', '保靖县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1629', '古丈县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1630', '永顺县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1631', '龙山县', '170', null, '0');
INSERT INTO `iee_town_t` VALUES ('1632', '永定区', '181', null, '0');
INSERT INTO `iee_town_t` VALUES ('1633', '武陵源区', '181', null, '0');
INSERT INTO `iee_town_t` VALUES ('1634', '慈利县', '181', null, '0');
INSERT INTO `iee_town_t` VALUES ('1635', '桑植县', '181', null, '0');
INSERT INTO `iee_town_t` VALUES ('1636', '鹤城区', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1637', '中方县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1638', '沅陵县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1639', '辰溪县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1640', '溆浦县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1641', '会同县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1642', '麻阳自治县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1643', '新晃自治县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1644', '芷江自治县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1645', '靖州自治县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1646', '通道自治县', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1647', '洪江市', '169', null, '0');
INSERT INTO `iee_town_t` VALUES ('1648', '零陵区', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1649', '冷水滩区', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1650', '祁阳县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1651', '东安县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1652', '双牌县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1653', '道县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1654', '江永县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1655', '宁远县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1656', '蓝山县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1657', '新田县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1658', '江华自治县', '179', null, '0');
INSERT INTO `iee_town_t` VALUES ('1659', '从化市', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1660', '荔湾区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1661', '越秀区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1662', '海珠区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1663', '天河区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1664', '白云区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1665', '花都区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1666', '黄埔区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1667', '萝岗区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1668', '南沙区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1669', '番禺区', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1670', '增城市', '37', null, '0');
INSERT INTO `iee_town_t` VALUES ('1671', '海丰县', '52', null, '0');
INSERT INTO `iee_town_t` VALUES ('1672', '陆河县', '52', null, '0');
INSERT INTO `iee_town_t` VALUES ('1673', '陆丰市', '52', null, '0');
INSERT INTO `iee_town_t` VALUES ('1674', '江城区', '55', null, '0');
INSERT INTO `iee_town_t` VALUES ('1675', '阳西县', '55', null, '0');
INSERT INTO `iee_town_t` VALUES ('1676', '阳东县', '55', null, '0');
INSERT INTO `iee_town_t` VALUES ('1677', '阳春市', '55', null, '0');
INSERT INTO `iee_town_t` VALUES ('1678', '榕城区', '47', null, '0');
INSERT INTO `iee_town_t` VALUES ('1679', '揭东县', '47', null, '0');
INSERT INTO `iee_town_t` VALUES ('1680', '揭西县', '47', null, '0');
INSERT INTO `iee_town_t` VALUES ('1681', '惠来县', '47', null, '0');
INSERT INTO `iee_town_t` VALUES ('1682', '普宁市', '47', null, '0');
INSERT INTO `iee_town_t` VALUES ('1683', '茂南区', '48', null, '0');
INSERT INTO `iee_town_t` VALUES ('1684', '茂港区', '48', null, '0');
INSERT INTO `iee_town_t` VALUES ('1685', '电白县', '48', null, '0');
INSERT INTO `iee_town_t` VALUES ('1686', '高州市', '48', null, '0');
INSERT INTO `iee_town_t` VALUES ('1687', '化州市', '48', null, '0');
INSERT INTO `iee_town_t` VALUES ('1688', '信宜市', '48', null, '0');
INSERT INTO `iee_town_t` VALUES ('1689', '惠城区', '45', null, '0');
INSERT INTO `iee_town_t` VALUES ('1690', '惠阳区', '45', null, '0');
INSERT INTO `iee_town_t` VALUES ('1691', '博罗县', '45', null, '0');
INSERT INTO `iee_town_t` VALUES ('1692', '惠东县', '45', null, '0');
INSERT INTO `iee_town_t` VALUES ('1693', '龙门县', '45', null, '0');
INSERT INTO `iee_town_t` VALUES ('1694', '蓬江区', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1695', '江海区', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1696', '新会区', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1697', '台山市', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1698', '开平市', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1699', '鹤山市', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1700', '恩平市', '46', null, '0');
INSERT INTO `iee_town_t` VALUES ('1701', '武江区', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1702', '浈江区', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1703', '曲江区', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1704', '始兴县', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1705', '仁化县', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1706', '翁源县', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1707', '乳源自治县', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1708', '新丰县', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1709', '乐昌市', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1710', '南雄市', '53', null, '0');
INSERT INTO `iee_town_t` VALUES ('1711', '梅江区', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1712', '梅县', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1713', '大埔县', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1714', '丰顺县', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1715', '五华县', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1716', '平远县', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1717', '蕉岭县', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1718', '兴宁市', '49', null, '0');
INSERT INTO `iee_town_t` VALUES ('1719', '龙湖区', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1720', '金平区', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1721', '濠江区', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1722', '潮阳区', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1723', '潮南区', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1724', '澄海区', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1725', '南澳县', '51', null, '0');
INSERT INTO `iee_town_t` VALUES ('1726', '罗湖区', '54', null, '0');
INSERT INTO `iee_town_t` VALUES ('1727', '福田区', '54', null, '0');
INSERT INTO `iee_town_t` VALUES ('1728', '南山区', '54', null, '0');
INSERT INTO `iee_town_t` VALUES ('1729', '宝安区', '54', null, '0');
INSERT INTO `iee_town_t` VALUES ('1730', '龙岗区', '54', null, '0');
INSERT INTO `iee_town_t` VALUES ('1731', '盐田区', '54', null, '0');
INSERT INTO `iee_town_t` VALUES ('1732', '香洲区', '60', null, '0');
INSERT INTO `iee_town_t` VALUES ('1733', '斗门区', '60', null, '0');
INSERT INTO `iee_town_t` VALUES ('1734', '金湾区', '60', null, '0');
INSERT INTO `iee_town_t` VALUES ('1735', '禅城区', '41', null, '0');
INSERT INTO `iee_town_t` VALUES ('1736', '南海区', '41', null, '0');
INSERT INTO `iee_town_t` VALUES ('1737', '顺德区', '41', null, '0');
INSERT INTO `iee_town_t` VALUES ('1738', '三水区', '41', null, '0');
INSERT INTO `iee_town_t` VALUES ('1739', '高明区', '41', null, '0');
INSERT INTO `iee_town_t` VALUES ('1740', '端州区', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1741', '鼎湖区', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1742', '广宁县', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1743', '怀集县', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1744', '封开县', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1745', '德庆县', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1746', '高要市', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1747', '四会市', '58', null, '0');
INSERT INTO `iee_town_t` VALUES ('1748', '赤坎区', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1749', '霞山区', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1750', '坡头区', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1751', '麻章区', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1752', '遂溪县', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1753', '徐闻县', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1754', '廉江市', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1755', '雷州市', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1756', '吴川市', '57', null, '0');
INSERT INTO `iee_town_t` VALUES ('1757', '源城区', '42', null, '0');
INSERT INTO `iee_town_t` VALUES ('1758', '紫金县', '42', null, '0');
INSERT INTO `iee_town_t` VALUES ('1759', '龙川县', '42', null, '0');
INSERT INTO `iee_town_t` VALUES ('1760', '连平县', '42', null, '0');
INSERT INTO `iee_town_t` VALUES ('1761', '和平县', '42', null, '0');
INSERT INTO `iee_town_t` VALUES ('1762', '东源县', '42', null, '0');
INSERT INTO `iee_town_t` VALUES ('1763', '清城区', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1764', '佛冈县', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1765', '阳山县', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1766', '连山自治县', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1767', '连南自治县', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1768', '清新县', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1769', '英德市', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1770', '连州市', '50', null, '0');
INSERT INTO `iee_town_t` VALUES ('1771', '云城区', '56', null, '0');
INSERT INTO `iee_town_t` VALUES ('1772', '新兴县', '56', null, '0');
INSERT INTO `iee_town_t` VALUES ('1773', '郁南县', '56', null, '0');
INSERT INTO `iee_town_t` VALUES ('1774', '云安县', '56', null, '0');
INSERT INTO `iee_town_t` VALUES ('1775', '罗定市', '56', null, '0');
INSERT INTO `iee_town_t` VALUES ('1776', '湘桥区', '38', null, '0');
INSERT INTO `iee_town_t` VALUES ('1777', '潮安县', '38', null, '0');
INSERT INTO `iee_town_t` VALUES ('1778', '饶平县', '38', null, '0');
INSERT INTO `iee_town_t` VALUES ('1779', '城关区', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1780', '七里河区', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1781', '西固区', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1782', '安宁区', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1783', '红古区', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1784', '永登县', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1785', '皋兰县', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1786', '榆中县', '61', null, '0');
INSERT INTO `iee_town_t` VALUES ('1787', '金川区', '410', null, '0');
INSERT INTO `iee_town_t` VALUES ('1788', '永昌县', '410', null, '0');
INSERT INTO `iee_town_t` VALUES ('1789', '白银区', '62', null, '0');
INSERT INTO `iee_town_t` VALUES ('1790', '平川区', '62', null, '0');
INSERT INTO `iee_town_t` VALUES ('1791', '靖远县', '62', null, '0');
INSERT INTO `iee_town_t` VALUES ('1792', '会宁县', '62', null, '0');
INSERT INTO `iee_town_t` VALUES ('1793', '景泰县', '62', null, '0');
INSERT INTO `iee_town_t` VALUES ('1794', '秦州区', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1795', '麦积区', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1796', '清水县', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1797', '秦安县', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1798', '甘谷县', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1799', '武山县', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1800', '张家川自治县', '71', null, '0');
INSERT INTO `iee_town_t` VALUES ('1801', '凉州区', '72', null, '0');
INSERT INTO `iee_town_t` VALUES ('1802', '民勤县', '72', null, '0');
INSERT INTO `iee_town_t` VALUES ('1803', '古浪县', '72', null, '0');
INSERT INTO `iee_town_t` VALUES ('1804', '天祝自治县', '72', null, '0');
INSERT INTO `iee_town_t` VALUES ('1805', '甘州区', '73', null, '0');
INSERT INTO `iee_town_t` VALUES ('1806', '肃南自治县', '73', null, '0');
INSERT INTO `iee_town_t` VALUES ('1807', '民乐县', '73', null, '0');
INSERT INTO `iee_town_t` VALUES ('1808', '临泽县', '73', null, '0');
INSERT INTO `iee_town_t` VALUES ('1809', '高台县', '73', null, '0');
INSERT INTO `iee_town_t` VALUES ('1810', '山丹县', '73', null, '0');
INSERT INTO `iee_town_t` VALUES ('1811', '崆峒区', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1812', '泾川县', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1813', '灵台县', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1814', '崇信县', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1815', '华亭县', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1816', '庄浪县', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1817', '静宁县', '69', null, '0');
INSERT INTO `iee_town_t` VALUES ('1818', '肃州区', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1819', '金塔县', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1820', '瓜州县', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1821', '肃北自治县', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1822', '阿克塞哈萨克族', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1823', '玉门市', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1824', '敦煌市', '66', null, '0');
INSERT INTO `iee_town_t` VALUES ('1825', '西峰区', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1826', '庆城县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1827', '环县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1828', '华池县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1829', '合水县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1830', '正宁县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1831', '宁县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1832', '镇原县', '70', null, '0');
INSERT INTO `iee_town_t` VALUES ('1833', '安定区', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1834', '通渭县', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1835', '陇西县', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1836', '渭源县', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1837', '临洮县', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1838', '漳县', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1839', '岷县', '63', null, '0');
INSERT INTO `iee_town_t` VALUES ('1840', '武都区', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1841', '成县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1842', '文县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1843', '宕昌县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1844', '康县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1845', '西和县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1846', '礼县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1847', '徽县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1848', '两当县', '68', null, '0');
INSERT INTO `iee_town_t` VALUES ('1849', '临夏市', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1850', '临夏县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1851', '康乐县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1852', '永靖县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1853', '广河县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1854', '和政县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1855', '东乡族自治县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1856', '积石山自治县', '67', null, '0');
INSERT INTO `iee_town_t` VALUES ('1857', '合作市', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1858', '临潭县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1859', '卓尼县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1860', '舟曲县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1861', '迭部县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1862', '玛曲县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1863', '碌曲县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1864', '夏河县', '64', null, '0');
INSERT INTO `iee_town_t` VALUES ('1865', '锦江区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1866', '青羊区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1867', '金牛区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1868', '武侯区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1869', '成华区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1870', '龙泉驿区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1871', '青白江区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1872', '新都区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1873', '温江区', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1874', '金堂县', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1875', '双流县', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1876', '郫县', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1877', '大邑县', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1878', '蒲江县', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1879', '新津县', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1880', '都江堰市', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1881', '彭州市', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1882', '邛崃市', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1883', '崇州市', '411', null, '0');
INSERT INTO `iee_town_t` VALUES ('1884', '东区', '281', null, '0');
INSERT INTO `iee_town_t` VALUES ('1885', '西区', '281', null, '0');
INSERT INTO `iee_town_t` VALUES ('1886', '仁和区', '281', null, '0');
INSERT INTO `iee_town_t` VALUES ('1887', '米易县', '281', null, '0');
INSERT INTO `iee_town_t` VALUES ('1888', '盐边县', '281', null, '0');
INSERT INTO `iee_town_t` VALUES ('1889', '自流井区', '287', null, '0');
INSERT INTO `iee_town_t` VALUES ('1890', '贡井区', '287', null, '0');
INSERT INTO `iee_town_t` VALUES ('1891', '大安区', '287', null, '0');
INSERT INTO `iee_town_t` VALUES ('1892', '沿滩区', '287', null, '0');
INSERT INTO `iee_town_t` VALUES ('1893', '荣县', '287', null, '0');
INSERT INTO `iee_town_t` VALUES ('1894', '富顺县', '287', null, '0');
INSERT INTO `iee_town_t` VALUES ('1895', '涪城区', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1896', '游仙区', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1897', '三台县', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1898', '盐亭县', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1899', '安县', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1900', '梓潼县', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1901', '北川羌族自治县', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1902', '平武县', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1903', '江油市', '278', null, '0');
INSERT INTO `iee_town_t` VALUES ('1904', '顺庆区', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1905', '高坪区', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1906', '嘉陵区', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1907', '南部县', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1908', '营山县', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1909', '蓬安县', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1910', '仪陇县', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1911', '西充县', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1912', '阆中市', '280', null, '0');
INSERT INTO `iee_town_t` VALUES ('1913', '通川区', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1914', '达县', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1915', '宣汉县', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1916', '开江县', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1917', '大竹县', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1918', '渠县', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1919', '万源市', '265', null, '0');
INSERT INTO `iee_town_t` VALUES ('1920', '船山区', '282', null, '0');
INSERT INTO `iee_town_t` VALUES ('1921', '安居区', '282', null, '0');
INSERT INTO `iee_town_t` VALUES ('1922', '蓬溪县', '282', null, '0');
INSERT INTO `iee_town_t` VALUES ('1923', '射洪县', '282', null, '0');
INSERT INTO `iee_town_t` VALUES ('1924', '大英县', '282', null, '0');
INSERT INTO `iee_town_t` VALUES ('1925', '广安区', '271', null, '0');
INSERT INTO `iee_town_t` VALUES ('1926', '岳池县', '271', null, '0');
INSERT INTO `iee_town_t` VALUES ('1927', '武胜县', '271', null, '0');
INSERT INTO `iee_town_t` VALUES ('1928', '邻水县', '271', null, '0');
INSERT INTO `iee_town_t` VALUES ('1929', '华蓥市', '271', null, '0');
INSERT INTO `iee_town_t` VALUES ('1930', '巴州区', '263', null, '0');
INSERT INTO `iee_town_t` VALUES ('1931', '通江县', '263', null, '0');
INSERT INTO `iee_town_t` VALUES ('1932', '南江县', '263', null, '0');
INSERT INTO `iee_town_t` VALUES ('1933', '平昌县', '263', null, '0');
INSERT INTO `iee_town_t` VALUES ('1934', '江阳区', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1935', '纳溪区', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1936', '龙马潭区', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1937', '泸县', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1938', '合江县', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1939', '叙永县', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1940', '古蔺县', '276', null, '0');
INSERT INTO `iee_town_t` VALUES ('1941', '翠屏区', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1942', '宜宾县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1943', '南溪县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1944', '江安县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1945', '长宁县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1946', '高县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1947', '珙县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1948', '筠连县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1949', '兴文县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1950', '屏山县', '285', null, '0');
INSERT INTO `iee_town_t` VALUES ('1951', '雁江区', '286', null, '0');
INSERT INTO `iee_town_t` VALUES ('1952', '安岳县', '286', null, '0');
INSERT INTO `iee_town_t` VALUES ('1953', '乐至县', '286', null, '0');
INSERT INTO `iee_town_t` VALUES ('1954', '简阳市', '286', null, '0');
INSERT INTO `iee_town_t` VALUES ('1955', '市中区', '279', null, '0');
INSERT INTO `iee_town_t` VALUES ('1956', '东兴区', '279', null, '0');
INSERT INTO `iee_town_t` VALUES ('1957', '威远县', '279', null, '0');
INSERT INTO `iee_town_t` VALUES ('1958', '资中县', '279', null, '0');
INSERT INTO `iee_town_t` VALUES ('1959', '隆昌县', '279', null, '0');
INSERT INTO `iee_town_t` VALUES ('1960', '市中区', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1961', '沙湾区', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1962', '五通桥区', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1963', '金口河区', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1964', '犍为县', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1965', '井研县', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1966', '夹江县', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1967', '沐川县', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1968', '峨边彝族自治县', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1969', '马边彝族自治县', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1970', '峨眉山市', '275', null, '0');
INSERT INTO `iee_town_t` VALUES ('1971', '东坡区', '277', null, '0');
INSERT INTO `iee_town_t` VALUES ('1972', '仁寿县', '277', null, '0');
INSERT INTO `iee_town_t` VALUES ('1973', '彭山县', '277', null, '0');
INSERT INTO `iee_town_t` VALUES ('1974', '洪雅县', '277', null, '0');
INSERT INTO `iee_town_t` VALUES ('1975', '丹棱县', '277', null, '0');
INSERT INTO `iee_town_t` VALUES ('1976', '青神县', '277', null, '0');
INSERT INTO `iee_town_t` VALUES ('1977', '西昌市', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1978', '木里藏族自治县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1979', '盐源县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1980', '德昌县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1981', '会理县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1982', '会东县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1983', '宁南县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1984', '普格县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1985', '布拖县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1986', '金阳县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1987', '昭觉县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1988', '喜德县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1989', '冕宁县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1990', '越西县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1991', '甘洛县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1992', '美姑县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1993', '雷波县', '283', null, '0');
INSERT INTO `iee_town_t` VALUES ('1994', '雨城区', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('1995', '名山县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('1996', '荥经县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('1997', '汉源县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('1998', '石棉县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('1999', '天全县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('2000', '芦山县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('2001', '宝兴县', '284', null, '0');
INSERT INTO `iee_town_t` VALUES ('2002', '康定县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2003', '泸定县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2004', '丹巴县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2005', '九龙县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2006', '雅江县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2007', '道孚县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2008', '炉霍县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2009', '甘孜县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2010', '新龙县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2011', '德格县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2012', '白玉县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2013', '石渠县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2014', '色达县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2015', '理塘县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2016', '巴塘县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2017', '乡城县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2018', '稻城县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2019', '得荣县', '270', null, '0');
INSERT INTO `iee_town_t` VALUES ('2020', '汶川县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2021', '理县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2022', '茂县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2023', '松潘县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2024', '九寨沟县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2025', '金川县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2026', '小金县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2027', '黑水县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2028', '马尔康县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2029', '壤塘县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2030', '阿坝县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2031', '若尔盖县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2032', '红原县', '262', null, '0');
INSERT INTO `iee_town_t` VALUES ('2033', '旌阳区', '267', null, '0');
INSERT INTO `iee_town_t` VALUES ('2034', '中江县', '267', null, '0');
INSERT INTO `iee_town_t` VALUES ('2035', '罗江县', '267', null, '0');
INSERT INTO `iee_town_t` VALUES ('2036', '广汉市', '267', null, '0');
INSERT INTO `iee_town_t` VALUES ('2037', '什邡市', '267', null, '0');
INSERT INTO `iee_town_t` VALUES ('2038', '绵竹市', '267', null, '0');
INSERT INTO `iee_town_t` VALUES ('2039', '市中区', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2040', '元坝区', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2041', '朝天区', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2042', '旺苍县', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2043', '青川县', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2044', '剑阁县', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2045', '苍溪县', '272', null, '0');
INSERT INTO `iee_town_t` VALUES ('2046', '南明区', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2047', '云岩区', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2048', '花溪区', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2049', '乌当区', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2050', '白云区', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2051', '小河区', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2052', '开阳县', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2053', '息烽县', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2054', '修文县', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2055', '清镇市', '91', null, '0');
INSERT INTO `iee_town_t` VALUES ('2056', '红花岗区', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2057', '汇川区', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2058', '遵义县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2059', '桐梓县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2060', '绥阳县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2061', '正安县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2062', '道真仡佬族苗族自治县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2063', '务川仡佬族苗族自治县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2064', '凤冈县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2065', '湄潭县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2066', '余庆县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2067', '习水县', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2068', '赤水市', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2069', '仁怀市', '99', null, '0');
INSERT INTO `iee_town_t` VALUES ('2070', '西秀区', '92', null, '0');
INSERT INTO `iee_town_t` VALUES ('2071', '平坝县', '92', null, '0');
INSERT INTO `iee_town_t` VALUES ('2072', '普定县', '92', null, '0');
INSERT INTO `iee_town_t` VALUES ('2073', '镇宁布依族苗族自治县', '92', null, '0');
INSERT INTO `iee_town_t` VALUES ('2074', '关岭布依族苗族自治县', '92', null, '0');
INSERT INTO `iee_town_t` VALUES ('2075', '紫云苗族布依族自治县', '92', null, '0');
INSERT INTO `iee_town_t` VALUES ('2076', '都匀市', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2077', '福泉市', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2078', '荔波县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2079', '贵定县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2080', '瓮安县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2081', '独山县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2082', '平塘县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2083', '罗甸县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2084', '长顺县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2085', '龙里县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2086', '惠水县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2087', '三都水族自治县', '94', null, '0');
INSERT INTO `iee_town_t` VALUES ('2088', '凯里市', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2089', '黄平县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2090', '施秉县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2091', '三穗县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2092', '镇远县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2093', '岑巩县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2094', '天柱县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2095', '锦屏县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2096', '剑河县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2097', '台江县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2098', '黎平县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2099', '榕江县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2100', '从江县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2101', '雷山县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2102', '麻江县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2103', '丹寨县', '95', null, '0');
INSERT INTO `iee_town_t` VALUES ('2104', '铜仁市', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2105', '江口县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2106', '玉屏侗族自治县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2107', '石阡县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2108', '思南县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2109', '印江土家族苗族自治县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2110', '德江县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2111', '沿河土家族自治县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2112', '松桃苗族自治县', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2113', '万山特区', '97', null, '0');
INSERT INTO `iee_town_t` VALUES ('2114', '毕节市', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2115', '大方县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2116', '黔西县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2117', '金沙县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2118', '织金县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2119', '纳雍县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2120', '威宁彝族回族苗族自治县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2121', '赫章县', '93', null, '0');
INSERT INTO `iee_town_t` VALUES ('2122', '钟山区', '96', null, '0');
INSERT INTO `iee_town_t` VALUES ('2123', '六枝特区', '96', null, '0');
INSERT INTO `iee_town_t` VALUES ('2124', '水城县', '96', null, '0');
INSERT INTO `iee_town_t` VALUES ('2125', '盘县', '96', null, '0');
INSERT INTO `iee_town_t` VALUES ('2126', '兴义市', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2127', '兴仁县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2128', '普安县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2129', '晴隆县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2130', '贞丰县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2131', '望谟县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2132', '册亨县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2133', '安龙县', '98', null, '0');
INSERT INTO `iee_town_t` VALUES ('2134', '秀英区', '401', null, '0');
INSERT INTO `iee_town_t` VALUES ('2135', '龙华区', '401', null, '0');
INSERT INTO `iee_town_t` VALUES ('2136', '琼山区', '401', null, '0');
INSERT INTO `iee_town_t` VALUES ('2137', '美兰区', '401', null, '0');
INSERT INTO `iee_town_t` VALUES ('2138', '景洪市', '369', null, '0');
INSERT INTO `iee_town_t` VALUES ('2139', '勐海县', '369', null, '0');
INSERT INTO `iee_town_t` VALUES ('2140', '勐腊县', '369', null, '0');
INSERT INTO `iee_town_t` VALUES ('2141', '瑞丽市', '360', null, '0');
INSERT INTO `iee_town_t` VALUES ('2142', '潞西市', '360', null, '0');
INSERT INTO `iee_town_t` VALUES ('2143', '梁河县', '360', null, '0');
INSERT INTO `iee_town_t` VALUES ('2144', '盈江县', '360', null, '0');
INSERT INTO `iee_town_t` VALUES ('2145', '陇川县', '360', null, '0');
INSERT INTO `iee_town_t` VALUES ('2146', '昭阳区', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2147', '鲁甸县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2148', '巧家县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2149', '盐津县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2150', '大关县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2151', '永善县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2152', '绥江县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2153', '镇雄县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2154', '彝良县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2155', '威信县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2156', '水富县', '371', null, '0');
INSERT INTO `iee_town_t` VALUES ('2157', '五华区', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2158', '盘龙区', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2159', '官渡区', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2160', '西山区', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2161', '东川区', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2162', '呈贡县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2163', '晋宁县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2164', '富民县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2165', '宜良县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2166', '石林彝族自治县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2167', '嵩明县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2168', '禄劝彝族苗族自治县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2169', '寻甸回族彝族自治县', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2170', '安宁市', '356', null, '0');
INSERT INTO `iee_town_t` VALUES ('2171', '大理市', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2172', '漾濞彝族自治县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2173', '祥云县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2174', '宾川县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2175', '弥渡县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2176', '南涧彝族自治县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2177', '巍山彝族回族自治县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2178', '永平县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2179', '云龙县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2180', '洱源县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2181', '剑川县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2182', '鹤庆县', '359', null, '0');
INSERT INTO `iee_town_t` VALUES ('2183', '个旧市', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2184', '开远市', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2185', '蒙自县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2186', '屏边苗族自治县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2187', '建水县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2188', '石屏县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2189', '弥勒县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2190', '泸西县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2191', '元阳县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2192', '红河县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2193', '金平苗族瑶族傣族自治县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2194', '绿春县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2195', '河口瑶族自治县', '362', null, '0');
INSERT INTO `iee_town_t` VALUES ('2196', '麒麟区', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2197', '马龙县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2198', '陆良县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2199', '师宗县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2200', '罗平县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2201', '富源县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2202', '会泽县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2203', '沾益县', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2204', '宣威市', '366', null, '0');
INSERT INTO `iee_town_t` VALUES ('2205', '隆阳区', '357', null, '0');
INSERT INTO `iee_town_t` VALUES ('2206', '施甸县', '357', null, '0');
INSERT INTO `iee_town_t` VALUES ('2207', '腾冲县', '357', null, '0');
INSERT INTO `iee_town_t` VALUES ('2208', '龙陵县', '357', null, '0');
INSERT INTO `iee_town_t` VALUES ('2209', '昌宁县', '357', null, '0');
INSERT INTO `iee_town_t` VALUES ('2210', '文山县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2211', '砚山县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2212', '西畴县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2213', '麻栗坡县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2214', '马关县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2215', '丘北县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2216', '广南县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2217', '富宁县', '368', null, '0');
INSERT INTO `iee_town_t` VALUES ('2218', '红塔区', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2219', '江川县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2220', '澄江县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2221', '通海县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2222', '华宁县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2223', '易门县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2224', '峨山彝族自治县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2225', '新平彝族傣族自治县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2226', '元江哈尼族彝族傣族自治县', '370', null, '0');
INSERT INTO `iee_town_t` VALUES ('2227', '楚雄市', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2228', '双柏县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2229', '牟定县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2230', '南华县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2231', '姚安县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2232', '大姚县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2233', '永仁县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2234', '元谋县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2235', '武定县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2236', '禄丰县', '358', null, '0');
INSERT INTO `iee_town_t` VALUES ('2237', '思茅区', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2238', '宁洱哈尼族彝族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2239', '墨江哈尼族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2240', '景东彝族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2241', '景谷傣族彝族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2242', '镇沅彝族哈尼族拉祜族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2243', '江城哈尼族彝族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2244', '孟连傣族拉祜族佤族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2245', '澜沧拉祜族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2246', '西盟佤族自治县', '409', null, '0');
INSERT INTO `iee_town_t` VALUES ('2247', '临翔区', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2248', '凤庆县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2249', '云县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2250', '永德县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2251', '镇康县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2252', '双江拉祜族佤族布朗族傣族自治县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2253', '耿马傣族佤族自治县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2254', '沧源佤族自治县', '364', null, '0');
INSERT INTO `iee_town_t` VALUES ('2255', '泸水县', '365', null, '0');
INSERT INTO `iee_town_t` VALUES ('2256', '福贡县', '365', null, '0');
INSERT INTO `iee_town_t` VALUES ('2257', '贡山独龙族怒族自治县', '365', null, '0');
INSERT INTO `iee_town_t` VALUES ('2258', '兰坪白族普米族自治县', '365', null, '0');
INSERT INTO `iee_town_t` VALUES ('2259', '香格里拉县', '361', null, '0');
INSERT INTO `iee_town_t` VALUES ('2260', '德钦县', '361', null, '0');
INSERT INTO `iee_town_t` VALUES ('2261', '维西傈僳族自治县', '361', null, '0');
INSERT INTO `iee_town_t` VALUES ('2262', '古城区', '363', null, '0');
INSERT INTO `iee_town_t` VALUES ('2263', '玉龙纳西族自治县', '363', null, '0');
INSERT INTO `iee_town_t` VALUES ('2264', '永胜县', '363', null, '0');
INSERT INTO `iee_town_t` VALUES ('2265', '华坪县', '363', null, '0');
INSERT INTO `iee_town_t` VALUES ('2266', '宁蒗彝族自治县', '363', null, '0');
INSERT INTO `iee_town_t` VALUES ('2267', '门源回族自治县', '255', null, '0');
INSERT INTO `iee_town_t` VALUES ('2268', '祁连县', '255', null, '0');
INSERT INTO `iee_town_t` VALUES ('2269', '海晏县', '255', null, '0');
INSERT INTO `iee_town_t` VALUES ('2270', '刚察县', '255', null, '0');
INSERT INTO `iee_town_t` VALUES ('2271', '城东区', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2272', '城中区', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2273', '城西区', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2274', '城北区', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2275', '大通回族土族自治县', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2276', '湟中县', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2277', '湟源县', '253', null, '0');
INSERT INTO `iee_town_t` VALUES ('2278', '平安县', '256', null, '0');
INSERT INTO `iee_town_t` VALUES ('2279', '民和回族土族自治县', '256', null, '0');
INSERT INTO `iee_town_t` VALUES ('2280', '乐都县', '256', null, '0');
INSERT INTO `iee_town_t` VALUES ('2281', '互助土族自治县', '256', null, '0');
INSERT INTO `iee_town_t` VALUES ('2282', '化隆回族自治县', '256', null, '0');
INSERT INTO `iee_town_t` VALUES ('2283', '循化撒拉族自治县', '256', null, '0');
INSERT INTO `iee_town_t` VALUES ('2284', '同仁县', '259', null, '0');
INSERT INTO `iee_town_t` VALUES ('2285', '尖扎县', '259', null, '0');
INSERT INTO `iee_town_t` VALUES ('2286', '泽库县', '259', null, '0');
INSERT INTO `iee_town_t` VALUES ('2287', '河南蒙古族自治县', '259', null, '0');
INSERT INTO `iee_town_t` VALUES ('2288', '共和县', '257', null, '0');
INSERT INTO `iee_town_t` VALUES ('2289', '同德县', '257', null, '0');
INSERT INTO `iee_town_t` VALUES ('2290', '贵德县', '257', null, '0');
INSERT INTO `iee_town_t` VALUES ('2291', '兴海县', '257', null, '0');
INSERT INTO `iee_town_t` VALUES ('2292', '贵南县', '257', null, '0');
INSERT INTO `iee_town_t` VALUES ('2293', '玛沁县', '254', null, '0');
INSERT INTO `iee_town_t` VALUES ('2294', '班玛县', '254', null, '0');
INSERT INTO `iee_town_t` VALUES ('2295', '甘德县', '254', null, '0');
INSERT INTO `iee_town_t` VALUES ('2296', '达日县', '254', null, '0');
INSERT INTO `iee_town_t` VALUES ('2297', '久治县', '254', null, '0');
INSERT INTO `iee_town_t` VALUES ('2298', '玛多县', '254', null, '0');
INSERT INTO `iee_town_t` VALUES ('2299', '玉树县', '260', null, '0');
INSERT INTO `iee_town_t` VALUES ('2300', '杂多县', '260', null, '0');
INSERT INTO `iee_town_t` VALUES ('2301', '称多县', '260', null, '0');
INSERT INTO `iee_town_t` VALUES ('2302', '治多县', '260', null, '0');
INSERT INTO `iee_town_t` VALUES ('2303', '囊谦县', '260', null, '0');
INSERT INTO `iee_town_t` VALUES ('2304', '曲麻莱县', '260', null, '0');
INSERT INTO `iee_town_t` VALUES ('2305', '格尔木市', '258', null, '0');
INSERT INTO `iee_town_t` VALUES ('2306', '德令哈市', '258', null, '0');
INSERT INTO `iee_town_t` VALUES ('2307', '乌兰县', '258', null, '0');
INSERT INTO `iee_town_t` VALUES ('2308', '都兰县', '258', null, '0');
INSERT INTO `iee_town_t` VALUES ('2309', '天峻县', '258', null, '0');
INSERT INTO `iee_town_t` VALUES ('2310', '新城区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2311', '碑林区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2312', '莲湖区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2313', '灞桥区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2314', '未央区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2315', '雁塔区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2316', '阎良区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2317', '临潼区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2318', '长安区', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2319', '蓝田县', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2320', '周至县', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2321', '户县', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2322', '高陵县', '311', null, '0');
INSERT INTO `iee_town_t` VALUES ('2323', '秦都区', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2324', '杨陵区', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2325', '渭城区', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2326', '三原县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2327', '泾阳县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2328', '乾县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2329', '礼泉县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2330', '永寿县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2331', '彬县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2332', '长武县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2333', '旬邑县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2334', '淳化县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2335', '武功县', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2336', '兴平市', '318', null, '0');
INSERT INTO `iee_town_t` VALUES ('2337', '宝塔区', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2338', '延长县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2339', '延川县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2340', '子长县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2341', '安塞县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2342', '志丹县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2343', '吴起县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2344', '甘泉县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2345', '富县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2346', '洛川县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2347', '宜川县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2348', '黄龙县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2349', '黄陵县', '320', null, '0');
INSERT INTO `iee_town_t` VALUES ('2350', '榆阳区', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2351', '神木县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2352', '府谷县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2353', '横山县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2354', '靖边县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2355', '定边县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2356', '绥德县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2357', '米脂县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2358', '佳县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2359', '吴堡县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2360', '清涧县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2361', '子洲县', '321', null, '0');
INSERT INTO `iee_town_t` VALUES ('2362', '临渭区', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2363', '华县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2364', '潼关县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2365', '大荔县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2366', '合阳县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2367', '澄城县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2368', '蒲城县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2369', '白水县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2370', '富平县', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2371', '韩城市', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2372', '华阴市', '317', null, '0');
INSERT INTO `iee_town_t` VALUES ('2373', '商州区', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2374', '洛南县', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2375', '丹凤县', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2376', '商南县', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2377', '山阳县', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2378', '镇安县', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2379', '柞水县', '315', null, '0');
INSERT INTO `iee_town_t` VALUES ('2380', '汉滨区', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2381', '汉阴县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2382', '石泉县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2383', '宁陕县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2384', '紫阳县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2385', '岚皋县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2386', '平利县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2387', '镇坪县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2388', '旬阳县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2389', '白河县', '312', null, '0');
INSERT INTO `iee_town_t` VALUES ('2390', '汉台区', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2391', '南郑县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2392', '城固县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2393', '洋县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2394', '西乡县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2395', '勉县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2396', '宁强县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2397', '略阳县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2398', '镇巴县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2399', '留坝县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2400', '佛坪县', '314', null, '0');
INSERT INTO `iee_town_t` VALUES ('2401', '渭滨区', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2402', '金台区', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2403', '陈仓区', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2404', '凤翔县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2405', '岐山县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2406', '扶风县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2407', '眉县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2408', '陇县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2409', '千阳县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2410', '麟游县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2411', '凤县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2412', '太白县', '313', null, '0');
INSERT INTO `iee_town_t` VALUES ('2413', '王益区', '316', null, '0');
INSERT INTO `iee_town_t` VALUES ('2414', '印台区', '316', null, '0');
INSERT INTO `iee_town_t` VALUES ('2415', '耀州区', '316', null, '0');
INSERT INTO `iee_town_t` VALUES ('2416', '宜君县', '316', null, '0');
INSERT INTO `iee_town_t` VALUES ('2417', '港口区', '79', null, '0');
INSERT INTO `iee_town_t` VALUES ('2418', '防城区', '79', null, '0');
INSERT INTO `iee_town_t` VALUES ('2419', '上思县', '79', null, '0');
INSERT INTO `iee_town_t` VALUES ('2420', '东兴市', '79', null, '0');
INSERT INTO `iee_town_t` VALUES ('2421', '兴宁区', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2422', '青秀区', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2423', '江南区', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2424', '西乡塘区', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2425', '良庆区', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2426', '邕宁区', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2427', '武鸣县', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2428', '隆安县', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2429', '马山县', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2430', '上林县', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2431', '宾阳县', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2432', '横县', '74', null, '0');
INSERT INTO `iee_town_t` VALUES ('2433', '江洲区', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2434', '扶绥县', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2435', '宁明县', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2436', '龙州县', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2437', '大新县', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2438', '天等县', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2439', '凭祥市', '78', null, '0');
INSERT INTO `iee_town_t` VALUES ('2440', '兴宾区', '85', null, '0');
INSERT INTO `iee_town_t` VALUES ('2441', '忻城县', '85', null, '0');
INSERT INTO `iee_town_t` VALUES ('2442', '象州县', '85', null, '0');
INSERT INTO `iee_town_t` VALUES ('2443', '武宣县', '85', null, '0');
INSERT INTO `iee_town_t` VALUES ('2444', '金秀瑶族自治县', '85', null, '0');
INSERT INTO `iee_town_t` VALUES ('2445', '合山市', '85', null, '0');
INSERT INTO `iee_town_t` VALUES ('2446', '城中区', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2447', '鱼峰区', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2448', '柳南区', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2449', '柳北区', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2450', '柳江县', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2451', '柳城县', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2452', '鹿寨县', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2453', '融安县', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2454', '融水苗族自治县', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2455', '三江侗族自治县', '86', null, '0');
INSERT INTO `iee_town_t` VALUES ('2456', '秀峰区', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2457', '叠彩区', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2458', '象山区', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2459', '七星区', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2460', '雁山区', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2461', '阳朔县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2462', '临桂县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2463', '灵川县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2464', '全州县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2465', '兴安县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2466', '永福县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2467', '灌阳县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2468', '龙胜各族自治县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2469', '资源县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2470', '平乐县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2471', '荔浦县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2472', '恭城瑶族自治县', '81', null, '0');
INSERT INTO `iee_town_t` VALUES ('2473', '万秀区', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2474', '碟山区', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2475', '长洲区', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2476', '苍梧县', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2477', '藤县', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2478', '蒙山县', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2479', '岑溪市', '88', null, '0');
INSERT INTO `iee_town_t` VALUES ('2480', '八步区', '84', null, '0');
INSERT INTO `iee_town_t` VALUES ('2481', '昭平县', '84', null, '0');
INSERT INTO `iee_town_t` VALUES ('2482', '钟山县', '84', null, '0');
INSERT INTO `iee_town_t` VALUES ('2483', '富川瑶族自治县', '84', null, '0');
INSERT INTO `iee_town_t` VALUES ('2484', '港北区', '80', null, '0');
INSERT INTO `iee_town_t` VALUES ('2485', '港南区', '80', null, '0');
INSERT INTO `iee_town_t` VALUES ('2486', '覃塘区', '80', null, '0');
INSERT INTO `iee_town_t` VALUES ('2487', '平南县', '80', null, '0');
INSERT INTO `iee_town_t` VALUES ('2488', '桂平市', '80', null, '0');
INSERT INTO `iee_town_t` VALUES ('2489', '玉州区', '90', null, '0');
INSERT INTO `iee_town_t` VALUES ('2490', '容县', '90', null, '0');
INSERT INTO `iee_town_t` VALUES ('2491', '陆川县', '90', null, '0');
INSERT INTO `iee_town_t` VALUES ('2492', '博白县', '90', null, '0');
INSERT INTO `iee_town_t` VALUES ('2493', '兴业县', '90', null, '0');
INSERT INTO `iee_town_t` VALUES ('2494', '北流市', '90', null, '0');
INSERT INTO `iee_town_t` VALUES ('2495', '右江区', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2496', '田阳县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2497', '田东县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2498', '平果县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2499', '德保县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2500', '靖西县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2501', '那坡县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2502', '凌云县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2503', '乐业县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2504', '田林县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2505', '西林县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2506', '隆林各族自治县', '75', null, '0');
INSERT INTO `iee_town_t` VALUES ('2507', '钦南区', '87', null, '0');
INSERT INTO `iee_town_t` VALUES ('2508', '钦北区', '87', null, '0');
INSERT INTO `iee_town_t` VALUES ('2509', '灵山县', '87', null, '0');
INSERT INTO `iee_town_t` VALUES ('2510', '浦北县', '87', null, '0');
INSERT INTO `iee_town_t` VALUES ('2511', '金城江区', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2512', '南丹县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2513', '天峨县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2514', '凤山县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2515', '东兰县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2516', '罗城仫佬族自治县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2517', '环江毛南族自治县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2518', '巴马瑶族自治县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2519', '都安瑶族自治县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2520', '大化瑶族自治县', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2521', '宜州市', '83', null, '0');
INSERT INTO `iee_town_t` VALUES ('2522', '海城区', '76', null, '0');
INSERT INTO `iee_town_t` VALUES ('2523', '银海区', '76', null, '0');
INSERT INTO `iee_town_t` VALUES ('2524', '铁山港区', '76', null, '0');
INSERT INTO `iee_town_t` VALUES ('2525', '合浦县', '76', null, '0');
INSERT INTO `iee_town_t` VALUES ('2526', '城关区', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2527', '林周县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2528', '当雄县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2529', '尼木县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2530', '曲水县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2531', '堆龙德庆县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2532', '达孜县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2533', '墨竹工卡县', '349', null, '0');
INSERT INTO `iee_town_t` VALUES ('2534', '日喀则市', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2535', '南木林县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2536', '江孜县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2537', '定日县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2538', '萨迦县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2539', '拉孜县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2540', '昂仁县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2541', '谢通门县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2542', '白朗县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2543', '仁布县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2544', '康马县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2545', '定结县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2546', '仲巴县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2547', '亚东县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2548', '吉隆县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2549', '聂拉木县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2550', '萨嘎县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2551', '岗巴县', '354', null, '0');
INSERT INTO `iee_town_t` VALUES ('2552', '乃东县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2553', '扎囊县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2554', '贡嘎县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2555', '桑日县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2556', '琼结县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2557', '曲松县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2558', '措美县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2559', '洛扎县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2560', '加查县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2561', '隆子县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2562', '错那县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2563', '浪卡子县', '355', null, '0');
INSERT INTO `iee_town_t` VALUES ('2564', '林芝县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2565', '工布江达县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2566', '米林县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2567', '墨脱县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2568', '波密县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2569', '察隅县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2570', '朗县', '352', null, '0');
INSERT INTO `iee_town_t` VALUES ('2571', '昌都县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2572', '江达县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2573', '贡觉县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2574', '类乌齐县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2575', '丁青县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2576', '察雅县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2577', '八宿县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2578', '左贡县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2579', '芒康县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2580', '洛隆县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2581', '边坝县', '351', null, '0');
INSERT INTO `iee_town_t` VALUES ('2582', '那曲县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2583', '嘉黎县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2584', '比如县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2585', '聂荣县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2586', '安多县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2587', '申扎县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2588', '索县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2589', '班戈县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2590', '巴青县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2591', '尼玛县', '353', null, '0');
INSERT INTO `iee_town_t` VALUES ('2592', '普兰县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2593', '札达县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2594', '噶尔县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2595', '日土县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2596', '革吉县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2597', '改则县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2598', '措勤县', '350', null, '0');
INSERT INTO `iee_town_t` VALUES ('2599', '兴庆区', '248', null, '0');
INSERT INTO `iee_town_t` VALUES ('2600', '西夏区', '248', null, '0');
INSERT INTO `iee_town_t` VALUES ('2601', '金凤区', '248', null, '0');
INSERT INTO `iee_town_t` VALUES ('2602', '永宁县', '248', null, '0');
INSERT INTO `iee_town_t` VALUES ('2603', '贺兰县', '248', null, '0');
INSERT INTO `iee_town_t` VALUES ('2604', '灵武市', '248', null, '0');
INSERT INTO `iee_town_t` VALUES ('2605', '大武口区', '250', null, '0');
INSERT INTO `iee_town_t` VALUES ('2606', '惠农区', '250', null, '0');
INSERT INTO `iee_town_t` VALUES ('2607', '平罗县', '250', null, '0');
INSERT INTO `iee_town_t` VALUES ('2608', '利通区', '251', null, '0');
INSERT INTO `iee_town_t` VALUES ('2609', '盐池县', '251', null, '0');
INSERT INTO `iee_town_t` VALUES ('2610', '同心县', '251', null, '0');
INSERT INTO `iee_town_t` VALUES ('2611', '青铜峡市', '251', null, '0');
INSERT INTO `iee_town_t` VALUES ('2612', '原州区', '249', null, '0');
INSERT INTO `iee_town_t` VALUES ('2613', '西吉县', '249', null, '0');
INSERT INTO `iee_town_t` VALUES ('2614', '隆德县', '249', null, '0');
INSERT INTO `iee_town_t` VALUES ('2615', '泾源县', '249', null, '0');
INSERT INTO `iee_town_t` VALUES ('2616', '彭阳县', '249', null, '0');
INSERT INTO `iee_town_t` VALUES ('2617', '沙坡头区', '252', null, '0');
INSERT INTO `iee_town_t` VALUES ('2618', '中宁县', '252', null, '0');
INSERT INTO `iee_town_t` VALUES ('2619', '海原县', '252', null, '0');
INSERT INTO `iee_town_t` VALUES ('2620', '哈密市', '339', null, '0');
INSERT INTO `iee_town_t` VALUES ('2621', '巴里坤哈萨克自治县', '339', null, '0');
INSERT INTO `iee_town_t` VALUES ('2622', '伊吾县', '339', null, '0');
INSERT INTO `iee_town_t` VALUES ('2623', '和田市', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2624', '和田县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2625', '墨玉县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2626', '皮山县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2627', '洛浦县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2628', '策勒县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2629', '于田县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2630', '民丰县', '340', null, '0');
INSERT INTO `iee_town_t` VALUES ('2631', '阿图什市', '336', null, '0');
INSERT INTO `iee_town_t` VALUES ('2632', '阿克陶县', '336', null, '0');
INSERT INTO `iee_town_t` VALUES ('2633', '阿合奇县', '336', null, '0');
INSERT INTO `iee_town_t` VALUES ('2634', '乌恰县', '336', null, '0');
INSERT INTO `iee_town_t` VALUES ('2635', '博乐市', '337', null, '0');
INSERT INTO `iee_town_t` VALUES ('2636', '精河县', '337', null, '0');
INSERT INTO `iee_town_t` VALUES ('2637', '温泉县', '337', null, '0');
INSERT INTO `iee_town_t` VALUES ('2638', '独山子区', '342', null, '0');
INSERT INTO `iee_town_t` VALUES ('2639', '克拉玛依区', '342', null, '0');
INSERT INTO `iee_town_t` VALUES ('2640', '白碱滩区', '342', null, '0');
INSERT INTO `iee_town_t` VALUES ('2641', '乌尔禾区', '342', null, '0');
INSERT INTO `iee_town_t` VALUES ('2642', '天山区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2643', '沙依巴克区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2644', '新市区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2645', '水磨沟区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2646', '头屯河区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2647', '达坂城区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2648', '米东区', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2649', '乌鲁木齐县', '333', null, '0');
INSERT INTO `iee_town_t` VALUES ('2650', '昌吉市', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2651', '阜康市', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2652', '呼图壁县', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2653', '玛纳斯县', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2654', '奇台县', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2655', '吉木萨尔县', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2656', '木垒哈萨克自治县', '338', null, '0');
INSERT INTO `iee_town_t` VALUES ('2657', '吐鲁番市', '346', null, '0');
INSERT INTO `iee_town_t` VALUES ('2658', '鄯善县', '346', null, '0');
INSERT INTO `iee_town_t` VALUES ('2659', '托克逊县', '346', null, '0');
INSERT INTO `iee_town_t` VALUES ('2660', '库尔勒市', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2661', '轮台县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2662', '尉犁县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2663', '若羌县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2664', '且末县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2665', '焉耆回族自治县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2666', '和静县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2667', '和硕县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2668', '博湖县', '343', null, '0');
INSERT INTO `iee_town_t` VALUES ('2669', '阿克苏市', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2670', '温宿县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2671', '库车县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2672', '沙雅县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2673', '新和县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2674', '拜城县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2675', '乌什县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2676', '阿瓦提县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2677', '柯坪县', '334', null, '0');
INSERT INTO `iee_town_t` VALUES ('2678', '喀什市', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2679', '疏附县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2680', '疏勒县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2681', '英吉沙县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2682', '泽普县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2683', '莎车县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2684', '叶城县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2685', '麦盖提县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2686', '岳普湖县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2687', '伽师县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2688', '巴楚县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2689', '塔什库尔干塔吉克自治县', '341', null, '0');
INSERT INTO `iee_town_t` VALUES ('2690', '伊宁市', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2691', '奎屯市', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2692', '伊宁县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2693', '察布查尔锡伯自治县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2694', '霍城县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2695', '巩留县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2696', '新源县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2697', '昭苏县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2698', '特克斯县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2699', '尼勒克县', '348', null, '0');
INSERT INTO `iee_town_t` VALUES ('2700', '海拉尔区', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2701', '阿荣旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2702', '莫力达瓦达斡尔族自治旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2703', '鄂伦春自治旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2704', '鄂温克族自治旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2705', '陈巴尔虎旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2706', '新巴尔虎左旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2707', '新巴尔虎右旗', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2708', '满洲里市', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2709', '牙克石市', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2710', '扎兰屯市', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2711', '额尔古纳市', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2712', '根河市', '242', null, '0');
INSERT INTO `iee_town_t` VALUES ('2713', '新城区', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2714', '回民区', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2715', '玉泉区', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2716', '赛罕区', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2717', '土默特左旗', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2718', '托克托县', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2719', '和林格尔县', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2720', '清水河县', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2721', '武川县', '236', null, '0');
INSERT INTO `iee_town_t` VALUES ('2722', '东河区', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2723', '昆都仑区', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2724', '青山区', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2725', '石拐区', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2726', '白云鄂博矿区', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2727', '九原区', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2728', '土默特右旗', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2729', '固阳县', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2730', '达尔罕茂明安联合旗', '239', null, '0');
INSERT INTO `iee_town_t` VALUES ('2731', '海勃湾区', '244', null, '0');
INSERT INTO `iee_town_t` VALUES ('2732', '海南区', '244', null, '0');
INSERT INTO `iee_town_t` VALUES ('2733', '乌达区', '244', null, '0');
INSERT INTO `iee_town_t` VALUES ('2734', '集宁区', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2735', '卓资县', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2736', '化德县', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2737', '商都县', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2738', '兴和县', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2739', '凉城县', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2740', '察哈尔右翼前旗', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2741', '察哈尔右翼中旗', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2742', '察哈尔右翼后旗', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2743', '四子王旗', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2744', '丰镇市', '245', null, '0');
INSERT INTO `iee_town_t` VALUES ('2745', '科尔沁区', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2746', '科尔沁左翼中旗', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2747', '科尔沁左翼后旗', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2748', '开鲁县', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2749', '库伦旗', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2750', '奈曼旗', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2751', '扎鲁特旗', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2752', '霍林郭勒市', '243', null, '0');
INSERT INTO `iee_town_t` VALUES ('2753', '红山区', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2754', '元宝山区', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2755', '松山区', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2756', '阿鲁科尔沁旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2757', '巴林左旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2758', '巴林右旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2759', '林西县', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2760', '克什克腾旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2761', '翁牛特旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2762', '喀喇沁旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2763', '宁城县', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2764', '敖汉旗', '240', null, '0');
INSERT INTO `iee_town_t` VALUES ('2765', '东胜区', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2766', '达拉特旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2767', '准格尔旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2768', '鄂托克前旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2769', '鄂托克旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2770', '杭锦旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2771', '乌审旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2772', '伊金霍洛旗', '241', null, '0');
INSERT INTO `iee_town_t` VALUES ('2773', '临河区', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2774', '五原县', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2775', '磴口县', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2776', '乌拉特前旗', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2777', '乌拉特中旗', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2778', '乌拉特后旗', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2779', '杭锦后旗', '238', null, '0');
INSERT INTO `iee_town_t` VALUES ('2780', '二连浩特市', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2781', '锡林浩特市', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2782', '阿巴嘎旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2783', '苏尼特左旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2784', '苏尼特右旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2785', '东乌珠穆沁旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2786', '西乌珠穆沁旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2787', '太仆寺旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2788', '镶黄旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2789', '正镶白旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2790', '正蓝旗', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2791', '多伦县', '246', null, '0');
INSERT INTO `iee_town_t` VALUES ('2792', '乌兰浩特市', '247', null, '0');
INSERT INTO `iee_town_t` VALUES ('2793', '阿尔山市', '247', null, '0');
INSERT INTO `iee_town_t` VALUES ('2794', '科尔沁右翼前旗', '247', null, '0');
INSERT INTO `iee_town_t` VALUES ('2795', '科尔沁右翼中旗', '247', null, '0');
INSERT INTO `iee_town_t` VALUES ('2796', '扎赉特旗', '247', null, '0');
INSERT INTO `iee_town_t` VALUES ('2797', '突泉县', '247', null, '0');
INSERT INTO `iee_town_t` VALUES ('2798', '阿拉善左旗', '237', null, '0');
INSERT INTO `iee_town_t` VALUES ('2799', '阿拉善右旗', '237', null, '0');
INSERT INTO `iee_town_t` VALUES ('2800', '额济纳旗', '237', null, '0');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-05 21:16:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_city_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_city_t`;
CREATE TABLE `iee_city_t` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(255) default NULL,
  `PROVINCE_ID` varchar(255) default NULL,
  `SN` varchar(255) default NULL,
  `AGENCY_FEES` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 COMMENT='市';

-- ----------------------------
-- Records of iee_city_t
-- ----------------------------
INSERT INTO `iee_city_t` VALUES ('1', '北京市', '35', 'bj', '220');
INSERT INTO `iee_city_t` VALUES ('4', '重庆市', '36', 'cq', '111');
INSERT INTO `iee_city_t` VALUES ('5', '上海市', '37', 'sh', '276');
INSERT INTO `iee_city_t` VALUES ('6', '天津市', '38', 'tj', '139');
INSERT INTO `iee_city_t` VALUES ('7', '合肥市', '39', 'ah', '50');
INSERT INTO `iee_city_t` VALUES ('8', '安庆市', '39', 'ah', '20');
INSERT INTO `iee_city_t` VALUES ('9', '蚌埠市', '39', 'ah', '13');
INSERT INTO `iee_city_t` VALUES ('10', '亳州市', '39', 'ah', '11');
INSERT INTO `iee_city_t` VALUES ('11', '巢湖市', '39', 'ah', '13');
INSERT INTO `iee_city_t` VALUES ('12', '池州市', '39', 'ah', '6');
INSERT INTO `iee_city_t` VALUES ('13', '滁州市', '39', 'ah', '13');
INSERT INTO `iee_city_t` VALUES ('14', '阜阳市', '39', 'ah', '13');
INSERT INTO `iee_city_t` VALUES ('15', '淮北市', '39', 'ah', '11');
INSERT INTO `iee_city_t` VALUES ('16', '淮南市', '39', 'ah', '11');
INSERT INTO `iee_city_t` VALUES ('17', '黄山市', '39', 'ah', '6');
INSERT INTO `iee_city_t` VALUES ('18', '黄山景区市', '39', 'ah', '4');
INSERT INTO `iee_city_t` VALUES ('19', '九华山景区市', '39', 'ah', '4');
INSERT INTO `iee_city_t` VALUES ('20', '六安市', '39', 'ah', '13');
INSERT INTO `iee_city_t` VALUES ('21', '马鞍山市', '39', 'ah', '18');
INSERT INTO `iee_city_t` VALUES ('22', '青阳市', '39', 'ah', '4');
INSERT INTO `iee_city_t` VALUES ('23', '宿州市', '39', 'ah', '13');
INSERT INTO `iee_city_t` VALUES ('24', '铜陵市', '39', 'ah', '11');
INSERT INTO `iee_city_t` VALUES ('25', '芜湖市', '39', 'ah', '20');
INSERT INTO `iee_city_t` VALUES ('26', '宣城市', '39', 'ah', '11');
INSERT INTO `iee_city_t` VALUES ('27', '福州市', '40', 'fj', '56');
INSERT INTO `iee_city_t` VALUES ('28', '龙岩市', '40', 'fj', '20');
INSERT INTO `iee_city_t` VALUES ('29', '南平市', '40', 'fj', '13');
INSERT INTO `iee_city_t` VALUES ('30', '宁德市', '40', 'fj', '13');
INSERT INTO `iee_city_t` VALUES ('31', '莆田市', '40', 'fj', '18');
INSERT INTO `iee_city_t` VALUES ('32', '泉州市', '40', 'fj', '68');
INSERT INTO `iee_city_t` VALUES ('33', '三明市', '40', 'fj', '18');
INSERT INTO `iee_city_t` VALUES ('34', '厦门市', '40', 'fj', '39');
INSERT INTO `iee_city_t` VALUES ('35', '永安市', '40', 'fj', '4');
INSERT INTO `iee_city_t` VALUES ('36', '漳州市', '40', 'fj', '26');
INSERT INTO `iee_city_t` VALUES ('37', '广州市', '41', 'gd', '196');
INSERT INTO `iee_city_t` VALUES ('38', '潮州市', '41', 'gd', '11');
INSERT INTO `iee_city_t` VALUES ('39', '从化市', '41', 'gd', '4');
INSERT INTO `iee_city_t` VALUES ('40', '东莞市', '41', 'gd', '80');
INSERT INTO `iee_city_t` VALUES ('41', '佛山市', '41', 'gd', '106');
INSERT INTO `iee_city_t` VALUES ('42', '河源市', '41', 'gd', '11');
INSERT INTO `iee_city_t` VALUES ('43', '鹤山市', '41', 'gd', '4');
INSERT INTO `iee_city_t` VALUES ('44', '化州市', '41', 'gd', '4');
INSERT INTO `iee_city_t` VALUES ('45', '惠州市', '41', 'gd', '32');
INSERT INTO `iee_city_t` VALUES ('46', '江门市', '41', 'gd', '30');
INSERT INTO `iee_city_t` VALUES ('47', '揭阳市', '41', 'gd', '20');
INSERT INTO `iee_city_t` VALUES ('48', '茂名市', '41', 'gd', '26');
INSERT INTO `iee_city_t` VALUES ('49', '梅州市', '41', 'gd', '11');
INSERT INTO `iee_city_t` VALUES ('50', '清远市', '41', 'gd', '20');
INSERT INTO `iee_city_t` VALUES ('51', '汕头市', '41', 'gd', '24');
INSERT INTO `iee_city_t` VALUES ('52', '汕尾市', '41', 'gd', '11');
INSERT INTO `iee_city_t` VALUES ('53', '韶关市', '41', 'gd', '13');
INSERT INTO `iee_city_t` VALUES ('54', '深圳市', '41', 'gd', '176');
INSERT INTO `iee_city_t` VALUES ('55', '阳江市', '41', 'gd', '13');
INSERT INTO `iee_city_t` VALUES ('56', '云浮市', '41', 'gd', '6');
INSERT INTO `iee_city_t` VALUES ('57', '湛江市', '41', 'gd', '26');
INSERT INTO `iee_city_t` VALUES ('58', '肇庆市', '41', 'gd', '20');
INSERT INTO `iee_city_t` VALUES ('59', '中山市', '41', 'gd', '32');
INSERT INTO `iee_city_t` VALUES ('60', '珠海市', '41', 'gd', '24');
INSERT INTO `iee_city_t` VALUES ('61', '兰州市', '42', 'gs', '20');
INSERT INTO `iee_city_t` VALUES ('62', '白银市', '42', 'gs', '6');
INSERT INTO `iee_city_t` VALUES ('63', '定西市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('64', '甘南市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('65', '嘉峪关市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('66', '酒泉市', '42', 'gs', '6');
INSERT INTO `iee_city_t` VALUES ('67', '临夏市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('68', '陇南市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('69', '平凉市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('70', '庆阳市', '42', 'gs', '6');
INSERT INTO `iee_city_t` VALUES ('71', '天水市', '42', 'gs', '6');
INSERT INTO `iee_city_t` VALUES ('72', '武威市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('73', '张掖市', '42', 'gs', '4');
INSERT INTO `iee_city_t` VALUES ('74', '南宁市', '43', 'gx', '32');
INSERT INTO `iee_city_t` VALUES ('75', '百色市', '43', 'gx', '11');
INSERT INTO `iee_city_t` VALUES ('76', '北海市', '43', 'gx', '6');
INSERT INTO `iee_city_t` VALUES ('77', '北流市', '43', 'gx', '4');
INSERT INTO `iee_city_t` VALUES ('78', '崇左市', '43', 'gx', '6');
INSERT INTO `iee_city_t` VALUES ('79', '防城港市', '43', 'gx', '6');
INSERT INTO `iee_city_t` VALUES ('80', '贵港市', '43', 'gx', '11');
INSERT INTO `iee_city_t` VALUES ('81', '桂林市', '43', 'gx', '20');
INSERT INTO `iee_city_t` VALUES ('82', '桂平市', '43', 'gx', '4');
INSERT INTO `iee_city_t` VALUES ('83', '河池市', '43', 'gx', '11');
INSERT INTO `iee_city_t` VALUES ('84', '贺州市', '43', 'gx', '6');
INSERT INTO `iee_city_t` VALUES ('85', '来宾市', '43', 'gx', '6');
INSERT INTO `iee_city_t` VALUES ('86', '柳州市', '43', 'gx', '24');
INSERT INTO `iee_city_t` VALUES ('87', '钦州市', '43', 'gx', '11');
INSERT INTO `iee_city_t` VALUES ('88', '梧州市', '43', 'gx', '11');
INSERT INTO `iee_city_t` VALUES ('89', '宜州市', '43', 'gx', '4');
INSERT INTO `iee_city_t` VALUES ('90', '玉林市', '43', 'gx', '18');
INSERT INTO `iee_city_t` VALUES ('91', '贵阳市', '44', 'gz', '20');
INSERT INTO `iee_city_t` VALUES ('92', '安顺市', '44', 'gz', '4');
INSERT INTO `iee_city_t` VALUES ('93', '毕节市', '44', 'gz', '4');
INSERT INTO `iee_city_t` VALUES ('94', '都匀市', '44', 'gz', '4');
INSERT INTO `iee_city_t` VALUES ('95', '凯里市', '44', 'gz', '4');
INSERT INTO `iee_city_t` VALUES ('96', '六盘水市', '44', 'gz', '11');
INSERT INTO `iee_city_t` VALUES ('97', '铜仁市', '44', 'gz', '4');
INSERT INTO `iee_city_t` VALUES ('98', '兴义市', '44', 'gz', '4');
INSERT INTO `iee_city_t` VALUES ('99', '遵义市', '44', 'gz', '18');
INSERT INTO `iee_city_t` VALUES ('100', '石家庄市', '45', 'hb', '63');
INSERT INTO `iee_city_t` VALUES ('101', '保定市', '45', 'hb', '37');
INSERT INTO `iee_city_t` VALUES ('102', '泊头市', '45', 'hb', '4');
INSERT INTO `iee_city_t` VALUES ('103', '沧州市', '45', 'hb', '39');
INSERT INTO `iee_city_t` VALUES ('104', '承德市', '45', 'hb', '18');
INSERT INTO `iee_city_t` VALUES ('105', '邯郸市', '45', 'hb', '44');
INSERT INTO `iee_city_t` VALUES ('106', '河间市', '45', 'hb', '4');
INSERT INTO `iee_city_t` VALUES ('107', '衡水市', '45', 'hb', '13');
INSERT INTO `iee_city_t` VALUES ('108', '廊坊市', '45', 'hb', '24');
INSERT INTO `iee_city_t` VALUES ('109', '秦皇岛市', '45', 'hb', '18');
INSERT INTO `iee_city_t` VALUES ('110', '任丘市', '45', 'hb', '4');
INSERT INTO `iee_city_t` VALUES ('111', '唐山市', '45', 'hb', '82');
INSERT INTO `iee_city_t` VALUES ('112', '邢台市', '45', 'hb', '24');
INSERT INTO `iee_city_t` VALUES ('113', '张家口市', '45', 'hb', '18');
INSERT INTO `iee_city_t` VALUES ('114', '郑州市', '46', 'hen', '74');
INSERT INTO `iee_city_t` VALUES ('115', '安阳市', '46', 'hen', '24');
INSERT INTO `iee_city_t` VALUES ('116', '鹤壁市', '46', 'hen', '6');
INSERT INTO `iee_city_t` VALUES ('117', '济源市', '46', 'hen', '4');
INSERT INTO `iee_city_t` VALUES ('118', '焦作市', '46', 'hen', '24');
INSERT INTO `iee_city_t` VALUES ('119', '开封市', '46', 'hen', '18');
INSERT INTO `iee_city_t` VALUES ('120', '洛阳市', '46', 'hen', '44');
INSERT INTO `iee_city_t` VALUES ('121', '漯河市', '46', 'hen', '13');
INSERT INTO `iee_city_t` VALUES ('122', '南阳市', '46', 'hen', '37');
INSERT INTO `iee_city_t` VALUES ('123', '平顶山市', '46', 'hen', '24');
INSERT INTO `iee_city_t` VALUES ('124', '濮阳市', '46', 'hen', '13');
INSERT INTO `iee_city_t` VALUES ('125', '三门峡市', '46', 'hen', '18');
INSERT INTO `iee_city_t` VALUES ('126', '商丘市', '46', 'hen', '20');
INSERT INTO `iee_city_t` VALUES ('127', '新乡市', '46', 'hen', '24');
INSERT INTO `iee_city_t` VALUES ('128', '信阳市', '46', 'hen', '20');
INSERT INTO `iee_city_t` VALUES ('129', '许昌市', '46', 'hen', '24');
INSERT INTO `iee_city_t` VALUES ('130', '周口市', '46', 'hen', '24');
INSERT INTO `iee_city_t` VALUES ('131', '驻马店市', '46', 'hen', '20');
INSERT INTO `iee_city_t` VALUES ('132', '哈尔滨市', '47', 'hlj', '70');
INSERT INTO `iee_city_t` VALUES ('133', '大庆市', '47', 'hlj', '54');
INSERT INTO `iee_city_t` VALUES ('134', '大兴安岭市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('135', '鹤岗市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('136', '黑河市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('137', '虎林市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('138', '鸡西市', '47', 'hlj', '6');
INSERT INTO `iee_city_t` VALUES ('139', '佳木斯市', '47', 'hlj', '11');
INSERT INTO `iee_city_t` VALUES ('140', '密山市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('141', '牡丹江市', '47', 'hlj', '13');
INSERT INTO `iee_city_t` VALUES ('142', '宁安市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('143', '七台河市', '47', 'hlj', '6');
INSERT INTO `iee_city_t` VALUES ('144', '齐齐哈尔市', '47', 'hlj', '18');
INSERT INTO `iee_city_t` VALUES ('145', '双鸭山市', '47', 'hlj', '6');
INSERT INTO `iee_city_t` VALUES ('146', '绥化市', '47', 'hlj', '13');
INSERT INTO `iee_city_t` VALUES ('147', '五常市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('148', '伊春市', '47', 'hlj', '4');
INSERT INTO `iee_city_t` VALUES ('149', '武汉市', '48', 'hub', '104');
INSERT INTO `iee_city_t` VALUES ('150', '鄂州市', '48', 'hub', '6');
INSERT INTO `iee_city_t` VALUES ('151', '恩施市', '48', 'hub', '4');
INSERT INTO `iee_city_t` VALUES ('152', '黄冈市', '48', 'hub', '18');
INSERT INTO `iee_city_t` VALUES ('153', '黄石市', '48', 'hub', '13');
INSERT INTO `iee_city_t` VALUES ('154', '荆门市', '48', 'hub', '13');
INSERT INTO `iee_city_t` VALUES ('155', '荆州市', '48', 'hub', '18');
INSERT INTO `iee_city_t` VALUES ('156', '潜江市', '48', 'hub', '4');
INSERT INTO `iee_city_t` VALUES ('157', '十堰市', '48', 'hub', '13');
INSERT INTO `iee_city_t` VALUES ('158', '随州市', '48', 'hub', '6');
INSERT INTO `iee_city_t` VALUES ('159', '天门市', '48', 'hub', '4');
INSERT INTO `iee_city_t` VALUES ('160', '仙桃市', '48', 'hub', '4');
INSERT INTO `iee_city_t` VALUES ('161', '咸宁市', '48', 'hub', '11');
INSERT INTO `iee_city_t` VALUES ('162', '襄樊市', '48', 'hub', '30');
INSERT INTO `iee_city_t` VALUES ('163', '孝感市', '48', 'hub', '13');
INSERT INTO `iee_city_t` VALUES ('164', '宜昌市', '48', 'hub', '30');
INSERT INTO `iee_city_t` VALUES ('165', '长沙市', '49', 'hun', '82');
INSERT INTO `iee_city_t` VALUES ('166', '常德市', '49', 'hun', '26');
INSERT INTO `iee_city_t` VALUES ('167', '郴州市', '49', 'hun', '20');
INSERT INTO `iee_city_t` VALUES ('168', '衡阳市', '49', 'hun', '26');
INSERT INTO `iee_city_t` VALUES ('169', '怀化市', '49', 'hun', '13');
INSERT INTO `iee_city_t` VALUES ('170', '吉首市', '49', 'hun', '4');
INSERT INTO `iee_city_t` VALUES ('171', '耒阳市', '49', 'hun', '4');
INSERT INTO `iee_city_t` VALUES ('172', '冷水江市', '49', 'hun', '4');
INSERT INTO `iee_city_t` VALUES ('173', '娄底市', '49', 'hun', '13');
INSERT INTO `iee_city_t` VALUES ('174', '韶山市', '49', 'hun', '4');
INSERT INTO `iee_city_t` VALUES ('175', '邵阳市', '49', 'hun', '13');
INSERT INTO `iee_city_t` VALUES ('176', '湘潭市', '49', 'hun', '18');
INSERT INTO `iee_city_t` VALUES ('177', '湘乡市', '49', 'hun', '4');
INSERT INTO `iee_city_t` VALUES ('178', '益阳市', '49', 'hun', '13');
INSERT INTO `iee_city_t` VALUES ('179', '永州市', '49', 'hun', '13');
INSERT INTO `iee_city_t` VALUES ('180', '岳阳市', '49', 'hun', '30');
INSERT INTO `iee_city_t` VALUES ('181', '张家界市', '49', 'hun', '4');
INSERT INTO `iee_city_t` VALUES ('182', '株州市', '49', 'hun', '24');
INSERT INTO `iee_city_t` VALUES ('183', '长春市', '50', 'jl', '63');
INSERT INTO `iee_city_t` VALUES ('184', '白城市', '50', 'jl', '6');
INSERT INTO `iee_city_t` VALUES ('185', '白山市', '50', 'jl', '6');
INSERT INTO `iee_city_t` VALUES ('186', '珲春市', '50', 'jl', '4');
INSERT INTO `iee_city_t` VALUES ('187', '吉林市', '50', 'jl', '32');
INSERT INTO `iee_city_t` VALUES ('188', '辽源市', '50', 'jl', '6');
INSERT INTO `iee_city_t` VALUES ('189', '龙井市', '50', 'jl', '4');
INSERT INTO `iee_city_t` VALUES ('190', '舒兰市', '50', 'jl', '4');
INSERT INTO `iee_city_t` VALUES ('191', '四平市', '50', 'jl', '13');
INSERT INTO `iee_city_t` VALUES ('192', '松原市', '50', 'jl', '20');
INSERT INTO `iee_city_t` VALUES ('193', '通化市', '50', 'jl', '13');
INSERT INTO `iee_city_t` VALUES ('194', '延边市', '50', 'jl', '4');
INSERT INTO `iee_city_t` VALUES ('195', '南京市', '51', 'js', '94');
INSERT INTO `iee_city_t` VALUES ('196', '常州市', '51', 'js', '56');
INSERT INTO `iee_city_t` VALUES ('197', '高邮市', '51', 'js', '4');
INSERT INTO `iee_city_t` VALUES ('198', '淮安市', '51', 'js', '26');
INSERT INTO `iee_city_t` VALUES ('199', '连云港市', '51', 'js', '20');
INSERT INTO `iee_city_t` VALUES ('200', '南通市', '51', 'js', '63');
INSERT INTO `iee_city_t` VALUES ('201', '苏州市', '51', 'js', '170');
INSERT INTO `iee_city_t` VALUES ('202', '宿迁市', '51', 'js', '20');
INSERT INTO `iee_city_t` VALUES ('203', '太仓市', '51', 'js', '4');
INSERT INTO `iee_city_t` VALUES ('204', '泰州市', '51', 'js', '37');
INSERT INTO `iee_city_t` VALUES ('205', '无锡市', '51', 'js', '106');
INSERT INTO `iee_city_t` VALUES ('206', '新沂市', '51', 'js', '4');
INSERT INTO `iee_city_t` VALUES ('207', '徐州市', '51', 'js', '54');
INSERT INTO `iee_city_t` VALUES ('208', '盐城市', '51', 'js', '44');
INSERT INTO `iee_city_t` VALUES ('209', '扬州市', '51', 'js', '39');
INSERT INTO `iee_city_t` VALUES ('210', '镇江市', '51', 'js', '37');
INSERT INTO `iee_city_t` VALUES ('211', '南昌市', '52', 'jx', '39');
INSERT INTO `iee_city_t` VALUES ('212', '抚州市', '52', 'jx', '13');
INSERT INTO `iee_city_t` VALUES ('213', '赣州市', '52', 'jx', '20');
INSERT INTO `iee_city_t` VALUES ('214', '吉安市', '52', 'jx', '13');
INSERT INTO `iee_city_t` VALUES ('215', '景德镇市', '52', 'jx', '11');
INSERT INTO `iee_city_t` VALUES ('216', '九江市', '52', 'jx', '20');
INSERT INTO `iee_city_t` VALUES ('217', '萍乡市', '52', 'jx', '11');
INSERT INTO `iee_city_t` VALUES ('218', '上饶市', '52', 'jx', '18');
INSERT INTO `iee_city_t` VALUES ('219', '新余市', '52', 'jx', '13');
INSERT INTO `iee_city_t` VALUES ('220', '宜春市', '52', 'jx', '18');
INSERT INTO `iee_city_t` VALUES ('221', '鹰潭市', '52', 'jx', '6');
INSERT INTO `iee_city_t` VALUES ('222', '沈阳市', '53', 'ln', '94');
INSERT INTO `iee_city_t` VALUES ('223', '鞍山市', '53', 'ln', '39');
INSERT INTO `iee_city_t` VALUES ('224', '本溪市', '53', 'ln', '18');
INSERT INTO `iee_city_t` VALUES ('225', '朝阳市', '53', 'ln', '13');
INSERT INTO `iee_city_t` VALUES ('226', '大连市', '53', 'ln', '96');
INSERT INTO `iee_city_t` VALUES ('227', '丹东市', '53', 'ln', '13');
INSERT INTO `iee_city_t` VALUES ('228', '抚顺市', '53', 'ln', '18');
INSERT INTO `iee_city_t` VALUES ('229', '阜新市', '53', 'ln', '6');
INSERT INTO `iee_city_t` VALUES ('230', '葫芦岛市', '53', 'ln', '11');
INSERT INTO `iee_city_t` VALUES ('231', '锦州市', '53', 'ln', '18');
INSERT INTO `iee_city_t` VALUES ('232', '辽阳市', '53', 'ln', '13');
INSERT INTO `iee_city_t` VALUES ('233', '盘锦市', '53', 'ln', '18');
INSERT INTO `iee_city_t` VALUES ('234', '铁岭市', '53', 'ln', '13');
INSERT INTO `iee_city_t` VALUES ('235', '营口市', '53', 'ln', '20');
INSERT INTO `iee_city_t` VALUES ('236', '呼和浩特市', '54', 'nmg', '32');
INSERT INTO `iee_city_t` VALUES ('237', '阿拉善盟市', '54', 'nmg', '4');
INSERT INTO `iee_city_t` VALUES ('238', '巴彦淖尔盟市', '54', 'nmg', '11');
INSERT INTO `iee_city_t` VALUES ('239', '包头市', '54', 'nmg', '46');
INSERT INTO `iee_city_t` VALUES ('240', '赤峰市', '54', 'nmg', '20');
INSERT INTO `iee_city_t` VALUES ('241', '鄂尔多斯市', '54', 'nmg', '50');
INSERT INTO `iee_city_t` VALUES ('242', '呼伦贝尔市', '54', 'nmg', '18');
INSERT INTO `iee_city_t` VALUES ('243', '通辽市', '54', 'nmg', '24');
INSERT INTO `iee_city_t` VALUES ('244', '乌海市', '54', 'nmg', '6');
INSERT INTO `iee_city_t` VALUES ('245', '乌兰察布盟市', '54', 'nmg', '11');
INSERT INTO `iee_city_t` VALUES ('246', '锡林郭勒盟市', '54', 'nmg', '4');
INSERT INTO `iee_city_t` VALUES ('247', '兴安盟市', '54', 'nmg', '4');
INSERT INTO `iee_city_t` VALUES ('248', '银川市', '55', 'nx', '13');
INSERT INTO `iee_city_t` VALUES ('249', '固原市', '55', 'nx', '4');
INSERT INTO `iee_city_t` VALUES ('250', '石嘴山市', '55', 'nx', '6');
INSERT INTO `iee_city_t` VALUES ('251', '吴忠市', '55', 'nx', '4');
INSERT INTO `iee_city_t` VALUES ('252', '中卫市', '55', 'nx', '4');
INSERT INTO `iee_city_t` VALUES ('253', '西宁市', '56', 'qh', '13');
INSERT INTO `iee_city_t` VALUES ('254', '果洛市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('255', '海北市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('256', '海东市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('257', '海南市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('258', '海西市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('259', '黄南市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('260', '玉树市', '56', 'qh', '4');
INSERT INTO `iee_city_t` VALUES ('262', '阿坝市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('263', '巴中市', '57', 'sc', '6');
INSERT INTO `iee_city_t` VALUES ('264', '崇州市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('265', '达州市', '57', 'sc', '18');
INSERT INTO `iee_city_t` VALUES ('266', '大邑市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('267', '德阳市', '57', 'sc', '18');
INSERT INTO `iee_city_t` VALUES ('268', '都江堰市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('269', '峨眉山市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('270', '甘孜市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('271', '广安市', '57', 'sc', '11');
INSERT INTO `iee_city_t` VALUES ('272', '广元市', '57', 'sc', '6');
INSERT INTO `iee_city_t` VALUES ('273', '江油市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('274', '金堂市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('275', '乐山市', '57', 'sc', '13');
INSERT INTO `iee_city_t` VALUES ('276', '泸州市', '57', 'sc', '13');
INSERT INTO `iee_city_t` VALUES ('277', '眉山市', '57', 'sc', '11');
INSERT INTO `iee_city_t` VALUES ('278', '绵阳市', '57', 'sc', '18');
INSERT INTO `iee_city_t` VALUES ('279', '内江市', '57', 'sc', '13');
INSERT INTO `iee_city_t` VALUES ('280', '南充市', '57', 'sc', '18');
INSERT INTO `iee_city_t` VALUES ('281', '攀枝花市', '57', 'sc', '11');
INSERT INTO `iee_city_t` VALUES ('282', '遂宁市', '57', 'sc', '11');
INSERT INTO `iee_city_t` VALUES ('283', '西昌市', '57', 'sc', '4');
INSERT INTO `iee_city_t` VALUES ('284', '雅安市', '57', 'sc', '6');
INSERT INTO `iee_city_t` VALUES ('285', '宜宾市', '57', 'sc', '18');
INSERT INTO `iee_city_t` VALUES ('286', '资阳市', '57', 'sc', '13');
INSERT INTO `iee_city_t` VALUES ('287', '自贡市', '57', 'sc', '13');
INSERT INTO `iee_city_t` VALUES ('288', '济南市', '58', 'sd', '74');
INSERT INTO `iee_city_t` VALUES ('289', '滨州市', '58', 'sd', '30');
INSERT INTO `iee_city_t` VALUES ('290', '德州市', '58', 'sd', '30');
INSERT INTO `iee_city_t` VALUES ('291', '东营市', '58', 'sd', '44');
INSERT INTO `iee_city_t` VALUES ('292', '肥城市', '58', 'sd', '4');
INSERT INTO `iee_city_t` VALUES ('293', '海阳市', '58', 'sd', '4');
INSERT INTO `iee_city_t` VALUES ('294', '菏泽市', '58', 'sd', '20');
INSERT INTO `iee_city_t` VALUES ('295', '济宁市', '58', 'sd', '46');
INSERT INTO `iee_city_t` VALUES ('296', '莱芜市', '58', 'sd', '11');
INSERT INTO `iee_city_t` VALUES ('297', '莱阳市', '58', 'sd', '4');
INSERT INTO `iee_city_t` VALUES ('298', '聊城市', '58', 'sd', '30');
INSERT INTO `iee_city_t` VALUES ('299', '临沂市', '58', 'sd', '44');
INSERT INTO `iee_city_t` VALUES ('300', '平度市', '58', 'sd', '4');
INSERT INTO `iee_city_t` VALUES ('301', '青岛市', '58', 'sd', '106');
INSERT INTO `iee_city_t` VALUES ('302', '青州市', '58', 'sd', '4');
INSERT INTO `iee_city_t` VALUES ('303', '日照市', '58', 'sd', '20');
INSERT INTO `iee_city_t` VALUES ('304', '泰安市', '58', 'sd', '37');
INSERT INTO `iee_city_t` VALUES ('305', '威海市', '58', 'sd', '37');
INSERT INTO `iee_city_t` VALUES ('306', '潍坊市', '58', 'sd', '56');
INSERT INTO `iee_city_t` VALUES ('307', '烟台市', '58', 'sd', '80');
INSERT INTO `iee_city_t` VALUES ('308', '枣庄市', '58', 'sd', '26');
INSERT INTO `iee_city_t` VALUES ('309', '章丘市', '58', 'sd', '4');
INSERT INTO `iee_city_t` VALUES ('310', '淄博市', '58', 'sd', '54');
INSERT INTO `iee_city_t` VALUES ('311', '西安市', '59', 'shanx', '61');
INSERT INTO `iee_city_t` VALUES ('312', '安康市', '59', 'shanx', '6');
INSERT INTO `iee_city_t` VALUES ('313', '宝鸡市', '59', 'shanx', '18');
INSERT INTO `iee_city_t` VALUES ('314', '汉中市', '59', 'shanx', '11');
INSERT INTO `iee_city_t` VALUES ('315', '商洛市', '59', 'shanx', '6');
INSERT INTO `iee_city_t` VALUES ('316', '铜川市', '59', 'shanx', '4');
INSERT INTO `iee_city_t` VALUES ('317', '渭南市', '59', 'shanx', '13');
INSERT INTO `iee_city_t` VALUES ('318', '咸阳市', '59', 'shanx', '20');
INSERT INTO `iee_city_t` VALUES ('319', '兴平市', '59', 'shanx', '4');
INSERT INTO `iee_city_t` VALUES ('320', '延安市', '59', 'shanx', '18');
INSERT INTO `iee_city_t` VALUES ('321', '榆林市', '59', 'shanx', '32');
INSERT INTO `iee_city_t` VALUES ('322', '太原市', '60', 'sx', '32');
INSERT INTO `iee_city_t` VALUES ('323', '长治市', '60', 'sx', '18');
INSERT INTO `iee_city_t` VALUES ('324', '大同市', '60', 'sx', '13');
INSERT INTO `iee_city_t` VALUES ('325', '晋城市', '60', 'sx', '13');
INSERT INTO `iee_city_t` VALUES ('326', '晋中市', '60', 'sx', '13');
INSERT INTO `iee_city_t` VALUES ('327', '临汾市', '60', 'sx', '18');
INSERT INTO `iee_city_t` VALUES ('328', '吕梁市', '60', 'sx', '18');
INSERT INTO `iee_city_t` VALUES ('329', '朔州市', '60', 'sx', '13');
INSERT INTO `iee_city_t` VALUES ('330', '忻州市', '60', 'sx', '6');
INSERT INTO `iee_city_t` VALUES ('331', '阳泉市', '60', 'sx', '6');
INSERT INTO `iee_city_t` VALUES ('332', '运城市', '60', 'sx', '18');
INSERT INTO `iee_city_t` VALUES ('333', '乌鲁木齐市', '61', 'xj', '24');
INSERT INTO `iee_city_t` VALUES ('334', '阿克苏市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('335', '阿拉尔市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('336', '阿图什市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('337', '博乐市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('338', '昌吉市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('339', '哈密市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('340', '和田市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('341', '喀什市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('342', '克拉玛依市', '61', 'xj', '13');
INSERT INTO `iee_city_t` VALUES ('343', '库尔勒市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('344', '石河子市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('345', '图木舒克市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('346', '吐鲁番市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('347', '五家渠市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('348', '伊宁市', '61', 'xj', '4');
INSERT INTO `iee_city_t` VALUES ('349', '拉萨市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('350', '阿里市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('351', '昌都市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('352', '林芝市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('353', '那曲市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('354', '日喀则市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('355', '山南市', '62', 'xz', '4');
INSERT INTO `iee_city_t` VALUES ('356', '昆明市', '63', 'yn', '39');
INSERT INTO `iee_city_t` VALUES ('357', '保山市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('358', '楚雄市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('359', '大理市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('360', '德宏市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('361', '迪庆市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('362', '个旧市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('363', '丽江市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('364', '临沧市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('365', '怒江市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('366', '曲靖市', '63', 'yn', '20');
INSERT INTO `iee_city_t` VALUES ('367', '思茅市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('368', '文山市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('369', '西双版纳市', '63', 'yn', '4');
INSERT INTO `iee_city_t` VALUES ('370', '玉溪市', '63', 'yn', '13');
INSERT INTO `iee_city_t` VALUES ('371', '昭通市', '63', 'yn', '6');
INSERT INTO `iee_city_t` VALUES ('372', '杭州市', '64', 'zj', '111');
INSERT INTO `iee_city_t` VALUES ('373', '北仑市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('374', '慈溪市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('375', '奉化市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('376', '湖州市', '64', 'zj', '24');
INSERT INTO `iee_city_t` VALUES ('377', '嘉兴市', '64', 'zj', '44');
INSERT INTO `iee_city_t` VALUES ('378', '金华市', '64', 'zj', '39');
INSERT INTO `iee_city_t` VALUES ('379', '丽水市', '64', 'zj', '13');
INSERT INTO `iee_city_t` VALUES ('380', '临海市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('381', '宁波市', '64', 'zj', '96');
INSERT INTO `iee_city_t` VALUES ('382', '宁海市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('383', '衢州市', '64', 'zj', '13');
INSERT INTO `iee_city_t` VALUES ('384', '三门市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('385', '绍兴市', '64', 'zj', '54');
INSERT INTO `iee_city_t` VALUES ('386', '台州市', '64', 'zj', '46');
INSERT INTO `iee_city_t` VALUES ('387', '天台市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('388', '温岭市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('389', '温州市', '64', 'zj', '54');
INSERT INTO `iee_city_t` VALUES ('390', '仙居市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('391', '象山市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('392', '义乌市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('393', '余姚市', '64', 'zj', '4');
INSERT INTO `iee_city_t` VALUES ('394', '舟山市', '64', 'zj', '13');
INSERT INTO `iee_city_t` VALUES ('395', '澳门市', '65', 'am', '4');
INSERT INTO `iee_city_t` VALUES ('396', '台北市', '66', 'tw', '4');
INSERT INTO `iee_city_t` VALUES ('397', '高雄市', '66', 'tw', '4');
INSERT INTO `iee_city_t` VALUES ('398', '台南市', '66', 'tw', '4');
INSERT INTO `iee_city_t` VALUES ('399', '台中市', '66', 'tw', '4');
INSERT INTO `iee_city_t` VALUES ('400', '香港市', '67', 'xg', '4');
INSERT INTO `iee_city_t` VALUES ('401', '海口市', '68', 'hn', '11');
INSERT INTO `iee_city_t` VALUES ('402', '儋州市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('403', '东方市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('404', '琼海市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('405', '三亚市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('406', '万宁市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('407', '文昌市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('408', '五指山市', '68', 'hn', '4');
INSERT INTO `iee_city_t` VALUES ('409', '普洱市', '63', 'pe', '4');
INSERT INTO `iee_city_t` VALUES ('410', '金昌市', '42', 'jc', '4');
INSERT INTO `iee_city_t` VALUES ('411', '成都市', '57', 'sc', '104');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-05 21:21:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_province_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_province_t`;
CREATE TABLE `iee_province_t` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(255) default NULL,
  `SN` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='省';

-- ----------------------------
-- Records of iee_province_t
-- ----------------------------
INSERT INTO `iee_province_t` VALUES ('35', '北京', 'bj');
INSERT INTO `iee_province_t` VALUES ('36', '重庆', 'cq');
INSERT INTO `iee_province_t` VALUES ('37', '上海', 'sh');
INSERT INTO `iee_province_t` VALUES ('38', '天津', 'tj');
INSERT INTO `iee_province_t` VALUES ('39', '安徽', 'ah');
INSERT INTO `iee_province_t` VALUES ('40', '福建', 'fj');
INSERT INTO `iee_province_t` VALUES ('41', '广东', 'gd');
INSERT INTO `iee_province_t` VALUES ('42', '甘肃', 'gs');
INSERT INTO `iee_province_t` VALUES ('43', '广西', 'gx');
INSERT INTO `iee_province_t` VALUES ('44', '贵州', 'gz');
INSERT INTO `iee_province_t` VALUES ('45', '河北', 'hb');
INSERT INTO `iee_province_t` VALUES ('46', '河南', 'hen');
INSERT INTO `iee_province_t` VALUES ('47', '黑龙江', 'hlj');
INSERT INTO `iee_province_t` VALUES ('48', '湖北', 'hub');
INSERT INTO `iee_province_t` VALUES ('49', '湖南', 'hun');
INSERT INTO `iee_province_t` VALUES ('50', '吉林', 'jl');
INSERT INTO `iee_province_t` VALUES ('51', '江苏', 'js');
INSERT INTO `iee_province_t` VALUES ('52', '江西', 'jx');
INSERT INTO `iee_province_t` VALUES ('53', '辽宁', 'ln');
INSERT INTO `iee_province_t` VALUES ('54', '内蒙古', 'nmg');
INSERT INTO `iee_province_t` VALUES ('55', '宁夏', 'nx');
INSERT INTO `iee_province_t` VALUES ('56', '青海', 'qh');
INSERT INTO `iee_province_t` VALUES ('57', '四川', 'sc');
INSERT INTO `iee_province_t` VALUES ('58', '山东', 'sd');
INSERT INTO `iee_province_t` VALUES ('59', '陕西', 'shanx');
INSERT INTO `iee_province_t` VALUES ('60', '山西', 'sx');
INSERT INTO `iee_province_t` VALUES ('61', '新疆', 'xj');
INSERT INTO `iee_province_t` VALUES ('62', '西藏', 'xz');
INSERT INTO `iee_province_t` VALUES ('63', '云南', 'yn');
INSERT INTO `iee_province_t` VALUES ('64', '浙江', 'zj');
INSERT INTO `iee_province_t` VALUES ('65', '澳门', 'am');
INSERT INTO `iee_province_t` VALUES ('66', '台湾', 'tw');
INSERT INTO `iee_province_t` VALUES ('67', '香港', 'xg');
INSERT INTO `iee_province_t` VALUES ('68', '海南', 'hn');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:41:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_printer_config_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_printer_config_t`;
CREATE TABLE `iee_printer_config_t` (
  `id` int(2) NOT NULL auto_increment,
  `mid` int(8) default NULL COMMENT '商户ID,映射商户表(iee_merchat_t)主键ID',
  `number` varchar(30) NOT NULL COMMENT '编号',
  `state` smallint(1) NOT NULL default '1' COMMENT '状态 0 无效 1 有效',
  `position` varchar(100) default NULL COMMENT '位置信息',
  `description` varchar(500) default NULL COMMENT '描述',
  `updated_by` int(8) default NULL COMMENT '更新人',
  `updated_date` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='打印机配置表';

-- ----------------------------
-- Records of iee_printer_config_t
-- ----------------------------
INSERT INTO `iee_printer_config_t` VALUES ('1', null, '4600042606700663', '1', '厨房', '厨房打印机', null, '2015-10-27 15:41:12');
INSERT INTO `iee_printer_config_t` VALUES ('2', null, '4600042606700648', '1', '前台', '前台打印机', null, '2015-10-27 15:41:07');
INSERT INTO `iee_printer_config_t` VALUES ('3', null, '4600042606700652', '1', '大厅1', '大厅打印机', null, '2015-10-27 15:41:47');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:41:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_system_notice_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_system_notice_t`;
CREATE TABLE `iee_system_notice_t` (
  `id` int(8) NOT NULL auto_increment,
  `message` varchar(100) default NULL,
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `last_updated_by` int(8) default NULL,
  `last_updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_system_notice_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-10 11:34:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_cloud_img_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_cloud_img_t`;
CREATE TABLE `iee_cloud_img_t` (
  `id` varchar(50) NOT NULL COMMENT '服务器id',
  `original` varchar(500) NOT NULL COMMENT '原图地址',
  `thumbnail` varchar(500) NOT NULL COMMENT '缩略图地址',
  `created_by` int(8) default NULL,
  `created_date` datetime default NULL,
  `updated_by` int(11) default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='腾讯云图片信息';

-- ----------------------------
-- Records of iee_cloud_img_t
-- ----------------------------
INSERT INTO `iee_cloud_img_t` VALUES ('da064218-19c5-4a02-9eb6-d04f7e4b46ae', 'http://projectx-10000296.image.myqcloud.com/da064218-19c5-4a02-9eb6-d04f7e4b46ae', 'http://projectx-10000296.image.myqcloud.com/da064218-19c5-4a02-9eb6-d04f7e4b46ae?imageView2/1/w/200/h/200', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('29c21d1c-701a-4547-8048-222131614c40', 'http://projectx-10000296.image.myqcloud.com/29c21d1c-701a-4547-8048-222131614c40', 'http://projectx-10000296.image.myqcloud.com/29c21d1c-701a-4547-8048-222131614c40?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('a1675b41-e62c-4469-8c28-1973a8c646dc', 'http://projectx-10000296.image.myqcloud.com/a1675b41-e62c-4469-8c28-1973a8c646dc', 'http://projectx-10000296.image.myqcloud.com/a1675b41-e62c-4469-8c28-1973a8c646dc?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('65b6112b-2dbc-4c8f-8e97-9297883cb7a4', 'http://projectx-10000296.image.myqcloud.com/65b6112b-2dbc-4c8f-8e97-9297883cb7a4', 'http://projectx-10000296.image.myqcloud.com/65b6112b-2dbc-4c8f-8e97-9297883cb7a4?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('5e346b25-e222-4ead-a838-fcaa10f5638b', 'http://projectx-10000296.image.myqcloud.com/5e346b25-e222-4ead-a838-fcaa10f5638b', 'http://projectx-10000296.image.myqcloud.com/5e346b25-e222-4ead-a838-fcaa10f5638b?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('cedaf8ec-9825-4d25-a65b-a4e1f4b1b889', 'http://projectx-10000296.image.myqcloud.com/cedaf8ec-9825-4d25-a65b-a4e1f4b1b889', 'http://projectx-10000296.image.myqcloud.com/cedaf8ec-9825-4d25-a65b-a4e1f4b1b889?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('8afe1569-befb-48c3-a66f-678d9f586f95', 'http://projectx-10000296.image.myqcloud.com/8afe1569-befb-48c3-a66f-678d9f586f95', 'http://projectx-10000296.image.myqcloud.com/8afe1569-befb-48c3-a66f-678d9f586f95?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('44c1a86f-b0c0-497a-a54c-25f00230037d', 'http://projectx-10000296.image.myqcloud.com/44c1a86f-b0c0-497a-a54c-25f00230037d', 'http://projectx-10000296.image.myqcloud.com/44c1a86f-b0c0-497a-a54c-25f00230037d?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('6eaeeabb-cbbf-444c-848f-5b2fe8d9dc74', 'http://projectx-10000296.image.myqcloud.com/6eaeeabb-cbbf-444c-848f-5b2fe8d9dc74', 'http://projectx-10000296.image.myqcloud.com/6eaeeabb-cbbf-444c-848f-5b2fe8d9dc74?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('7bf4e5cc-bb60-4faf-ba58-15e6b16b0df5', 'http://projectx-10000296.image.myqcloud.com/7bf4e5cc-bb60-4faf-ba58-15e6b16b0df5', 'http://projectx-10000296.image.myqcloud.com/7bf4e5cc-bb60-4faf-ba58-15e6b16b0df5?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('d7c397c3-1e0a-4ff9-9dec-d03de36d252b', 'http://projectx-10000296.image.myqcloud.com/d7c397c3-1e0a-4ff9-9dec-d03de36d252b', 'http://projectx-10000296.image.myqcloud.com/d7c397c3-1e0a-4ff9-9dec-d03de36d252b?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('c1582362-ccfa-44f2-a0a9-d2c32d2ca248', 'http://projectx-10000296.image.myqcloud.com/c1582362-ccfa-44f2-a0a9-d2c32d2ca248', 'http://projectx-10000296.image.myqcloud.com/c1582362-ccfa-44f2-a0a9-d2c32d2ca248?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('36b5558d-a6a6-41e8-ba80-37a5dc342add', 'http://projectx-10000296.image.myqcloud.com/36b5558d-a6a6-41e8-ba80-37a5dc342add', 'http://projectx-10000296.image.myqcloud.com/36b5558d-a6a6-41e8-ba80-37a5dc342add?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('1aa47c57-1b3e-4a30-a430-d55b9e81230d', 'http://projectx-10000296.image.myqcloud.com/1aa47c57-1b3e-4a30-a430-d55b9e81230d?imageView2/1/w/400/h/400', 'http://projectx-10000296.image.myqcloud.com/1aa47c57-1b3e-4a30-a430-d55b9e81230d?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('b08d3195-1258-4450-95cc-92c11e5329d5', 'http://projectx-10000296.image.myqcloud.com/b08d3195-1258-4450-95cc-92c11e5329d5?imageView2/1/w/400/h/400', 'http://projectx-10000296.image.myqcloud.com/b08d3195-1258-4450-95cc-92c11e5329d5?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('78875ae6-e9d0-459e-b87b-8805eaf6ce49', 'http://projectx-10000296.image.myqcloud.com/78875ae6-e9d0-459e-b87b-8805eaf6ce49?imageView2/1/w/400/h/400', 'http://projectx-10000296.image.myqcloud.com/78875ae6-e9d0-459e-b87b-8805eaf6ce49?imageView2/1/w/100/h/100', null, null, null, null);
INSERT INTO `iee_cloud_img_t` VALUES ('218ba46f-9c0c-4106-9a0e-fdeaeb8fc9c8', 'http://projectx-10000296.image.myqcloud.com/218ba46f-9c0c-4106-9a0e-fdeaeb8fc9c8?imageView2/1/w/400/h/400', 'http://projectx-10000296.image.myqcloud.com/218ba46f-9c0c-4106-9a0e-fdeaeb8fc9c8?imageView2/1/w/100/h/100', null, null, null, null);

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:36:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_order_link_commondity_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_order_link_commondity_t`;
CREATE TABLE `iee_order_link_commondity_t` (
  `oid` varchar(20) NOT NULL default '' COMMENT '订单ID',
  `cid` int(8) NOT NULL default '-1' COMMENT '商品ID',
  `amount` int(3) NOT NULL default '1',
  `created_date` datetime default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`oid`,`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单-商品映射关系表';

-- ----------------------------
-- Records of iee_order_link_commondity_t
-- ----------------------------
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020004', '80', '2', '2015-10-02 16:40:34', '2015-10-02 16:40:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('6', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('6', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('7', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('7', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('8', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('8', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('9', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('9', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('10', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('10', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('11', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('11', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('12', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('12', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('13', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('13', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('14', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('14', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('15', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('15', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('16', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('16', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('17', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('17', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('18', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('18', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('19', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('19', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('20', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('20', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('21', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('21', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('22', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('22', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('23', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('23', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('24', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('24', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('25', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('25', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('26', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('26', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('27', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('27', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('28', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('28', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('29', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('29', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('30', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('30', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('31', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('31', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('32', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('32', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('33', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('33', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('34', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('34', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('35', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('35', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020005', '80', '2', '2015-10-02 16:49:35', '2015-10-02 16:49:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020005', '82', '2', '2015-10-02 16:49:35', '2015-10-02 16:49:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('38', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('38', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('39', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('39', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('40', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('40', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('41', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('41', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('42', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('42', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('43', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('43', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('44', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('44', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('45', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('45', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('46', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('46', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('47', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('47', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('48', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('48', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('49', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('49', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('49', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('50', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('50', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('50', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('50', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('51', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('51', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('51', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('51', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('52', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('53', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('53', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('53', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('53', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('54', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('55', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('56', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('57', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('57', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('58', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('58', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('59', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('59', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('63', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('63', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('63', '35', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('63', '36', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('65', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('65', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('67', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('67', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('68', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('68', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('69', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('69', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('70', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('70', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('71', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('71', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('72', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('72', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('73', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('73', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('74', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('74', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('75', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('75', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('76', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('76', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('77', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('77', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('78', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('78', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('79', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('79', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('80', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('80', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('81', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('81', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('82', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('82', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('83', '37', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('83', '38', '0', null, null);
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020001', '68', '2', '2015-10-02 16:29:44', '2015-10-02 16:29:44');
INSERT INTO `iee_order_link_commondity_t` VALUES ('0', '37', '0', null, '2015-06-24 23:38:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('0', '38', '0', null, '2015-06-24 23:38:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020001', '80', '1', '2015-10-02 16:29:44', '2015-10-02 16:29:44');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020002', '80', '1', '2015-10-02 16:36:21', '2015-10-02 16:36:21');
INSERT INTO `iee_order_link_commondity_t` VALUES ('92', '37', '0', '2015-06-24 22:54:40', '2015-06-24 22:54:40');
INSERT INTO `iee_order_link_commondity_t` VALUES ('92', '38', '0', '2015-06-24 22:54:40', '2015-06-24 22:54:40');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020002', '82', '1', '2015-10-02 16:36:21', '2015-10-02 16:36:21');
INSERT INTO `iee_order_link_commondity_t` VALUES ('94', '37', '2', '2015-06-24 23:00:02', '2015-06-24 23:00:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('94', '38', '1', '2015-06-24 23:00:02', '2015-06-24 23:00:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020003', '80', '2', '2015-10-02 16:38:18', '2015-10-02 16:38:18');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020004', '82', '2', '2015-10-02 16:40:34', '2015-10-02 16:40:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('97', '37', '0', '2015-06-24 23:03:00', '2015-06-24 23:03:00');
INSERT INTO `iee_order_link_commondity_t` VALUES ('97', '38', '0', '2015-06-24 23:03:00', '2015-06-24 23:03:00');
INSERT INTO `iee_order_link_commondity_t` VALUES ('98', '37', '0', '2015-06-24 23:08:02', '2015-06-24 23:08:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('98', '38', '0', '2015-06-24 23:08:02', '2015-06-24 23:08:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('99', '37', '0', '2015-06-24 23:37:16', '2015-06-24 23:38:06');
INSERT INTO `iee_order_link_commondity_t` VALUES ('99', '38', '0', '2015-06-24 23:37:16', '2015-06-24 23:38:06');
INSERT INTO `iee_order_link_commondity_t` VALUES ('100', '36', '0', '2015-06-24 23:41:26', '2015-06-24 23:41:26');
INSERT INTO `iee_order_link_commondity_t` VALUES ('101', '37', '0', '2015-06-28 10:44:34', '2015-06-30 12:30:43');
INSERT INTO `iee_order_link_commondity_t` VALUES ('101', '38', '0', '2015-06-28 10:44:34', '2015-06-30 12:30:43');
INSERT INTO `iee_order_link_commondity_t` VALUES ('101', '36', '0', '2015-06-28 10:44:34', '2015-06-28 10:44:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('103', '38', '0', '2015-06-28 20:51:00', '2015-06-30 13:06:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('104', '37', '0', '2015-06-28 21:21:36', '2015-06-28 21:21:36');
INSERT INTO `iee_order_link_commondity_t` VALUES ('105', '38', '0', '2015-06-28 23:28:52', '2015-06-28 23:28:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('106', '38', '0', '2015-06-29 00:00:28', '2015-06-29 00:00:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('106', '35', '0', '2015-06-29 00:00:28', '2015-06-29 00:00:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('106', '36', '0', '2015-06-29 00:00:28', '2015-06-29 00:00:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('107', '37', '0', '2015-06-29 00:03:43', '2015-06-29 00:03:43');
INSERT INTO `iee_order_link_commondity_t` VALUES ('107', '38', '0', '2015-06-29 00:03:43', '2015-06-29 00:03:43');
INSERT INTO `iee_order_link_commondity_t` VALUES ('108', '37', '0', '2015-06-29 15:45:49', '2015-06-29 15:45:49');
INSERT INTO `iee_order_link_commondity_t` VALUES ('108', '38', '0', '2015-06-29 15:45:49', '2015-06-29 15:45:49');
INSERT INTO `iee_order_link_commondity_t` VALUES ('102', '35', '0', '2015-06-30 12:58:01', '2015-06-30 12:58:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('104', '38', '0', '2015-06-30 13:14:41', '2015-06-30 13:14:41');
INSERT INTO `iee_order_link_commondity_t` VALUES ('105', '39', '0', '2015-06-30 13:14:56', '2015-06-30 13:14:56');
INSERT INTO `iee_order_link_commondity_t` VALUES ('106', '43', '0', '2015-06-30 15:20:30', '2015-06-30 15:20:30');
INSERT INTO `iee_order_link_commondity_t` VALUES ('107', '52', '0', '2015-07-02 15:46:48', '2015-07-02 15:46:48');
INSERT INTO `iee_order_link_commondity_t` VALUES ('108', '43', '0', '2015-07-05 15:16:41', '2015-07-05 15:16:41');
INSERT INTO `iee_order_link_commondity_t` VALUES ('109', '43', '0', '2015-07-05 15:20:22', '2015-07-05 15:20:22');
INSERT INTO `iee_order_link_commondity_t` VALUES ('110', '43', '0', '2015-07-05 15:33:01', '2015-07-05 15:33:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('113', '43', '0', '2015-07-05 18:10:08', '2015-07-05 18:10:08');
INSERT INTO `iee_order_link_commondity_t` VALUES ('114', '43', '0', '2015-07-05 18:11:29', '2015-07-05 18:11:29');
INSERT INTO `iee_order_link_commondity_t` VALUES ('119', '43', '0', '2015-07-05 18:49:19', '2015-07-05 18:49:19');
INSERT INTO `iee_order_link_commondity_t` VALUES ('120', '43', '0', '2015-07-05 18:50:53', '2015-07-05 18:50:53');
INSERT INTO `iee_order_link_commondity_t` VALUES ('121', '43', '0', '2015-07-05 18:52:35', '2015-07-05 18:52:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('122', '43', '0', '2015-07-05 18:54:15', '2015-07-05 18:54:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('123', '43', '0', '2015-07-05 18:55:06', '2015-07-05 18:55:06');
INSERT INTO `iee_order_link_commondity_t` VALUES ('124', '43', '0', '2015-07-05 18:56:11', '2015-07-05 18:56:11');
INSERT INTO `iee_order_link_commondity_t` VALUES ('125', '43', '0', '2015-07-05 18:56:44', '2015-07-05 18:56:44');
INSERT INTO `iee_order_link_commondity_t` VALUES ('126', '43', '0', '2015-07-05 18:57:31', '2015-07-05 18:57:31');
INSERT INTO `iee_order_link_commondity_t` VALUES ('127', '43', '0', '2015-07-05 18:58:05', '2015-07-05 18:58:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('128', '43', '0', '2015-07-05 18:59:55', '2015-07-05 18:59:55');
INSERT INTO `iee_order_link_commondity_t` VALUES ('129', '43', '0', '2015-07-05 19:01:39', '2015-07-05 19:01:39');
INSERT INTO `iee_order_link_commondity_t` VALUES ('130', '43', '0', '2015-07-05 19:03:36', '2015-07-05 19:03:36');
INSERT INTO `iee_order_link_commondity_t` VALUES ('131', '43', '0', '2015-07-05 19:05:05', '2015-07-05 19:05:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('132', '43', '0', '2015-07-05 19:07:56', '2015-07-05 19:07:56');
INSERT INTO `iee_order_link_commondity_t` VALUES ('133', '43', '0', '2015-07-05 19:08:35', '2015-07-05 19:08:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('134', '43', '0', '2015-07-05 21:04:05', '2015-07-05 21:04:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('136', '43', '0', '2015-07-05 21:06:36', '2015-07-05 21:06:36');
INSERT INTO `iee_order_link_commondity_t` VALUES ('137', '43', '0', '2015-07-05 21:07:53', '2015-07-05 21:07:53');
INSERT INTO `iee_order_link_commondity_t` VALUES ('138', '43', '0', '2015-07-05 21:09:06', '2015-07-05 21:09:06');
INSERT INTO `iee_order_link_commondity_t` VALUES ('139', '43', '0', '2015-07-05 21:09:56', '2015-07-05 21:09:56');
INSERT INTO `iee_order_link_commondity_t` VALUES ('140', '43', '0', '2015-07-05 21:10:27', '2015-07-05 21:10:27');
INSERT INTO `iee_order_link_commondity_t` VALUES ('141', '43', '0', '2015-07-05 21:10:53', '2015-07-05 21:10:53');
INSERT INTO `iee_order_link_commondity_t` VALUES ('142', '43', '0', '2015-07-05 21:11:41', '2015-07-05 21:11:41');
INSERT INTO `iee_order_link_commondity_t` VALUES ('143', '43', '0', '2015-07-05 21:13:39', '2015-07-05 21:13:39');
INSERT INTO `iee_order_link_commondity_t` VALUES ('144', '47', '0', '2015-07-06 15:15:16', '2015-07-06 15:15:16');
INSERT INTO `iee_order_link_commondity_t` VALUES ('145', '47', '0', '2015-07-07 22:16:28', '2015-07-07 22:16:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('146', '47', '0', '2015-07-07 22:20:14', '2015-07-07 22:20:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('147', '52', '0', '2015-07-07 22:26:01', '2015-07-07 22:26:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('148', '47', '0', '2015-07-07 22:32:24', '2015-07-07 22:32:24');
INSERT INTO `iee_order_link_commondity_t` VALUES ('149', '47', '0', '2015-07-08 00:45:55', '2015-07-08 00:45:55');
INSERT INTO `iee_order_link_commondity_t` VALUES ('150', '52', '0', '2015-07-08 10:36:33', '2015-07-08 10:36:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('151', '52', '0', '2015-07-08 17:52:17', '2015-07-08 17:52:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('152', '51', '0', '2015-07-08 17:58:24', '2015-07-08 17:58:24');
INSERT INTO `iee_order_link_commondity_t` VALUES ('152', '52', '0', '2015-07-08 17:58:24', '2015-07-08 17:58:24');
INSERT INTO `iee_order_link_commondity_t` VALUES ('153', '51', '0', '2015-07-08 20:23:04', '2015-07-08 20:23:04');
INSERT INTO `iee_order_link_commondity_t` VALUES ('154', '47', '0', '2015-07-08 22:13:38', '2015-07-08 22:13:38');
INSERT INTO `iee_order_link_commondity_t` VALUES ('156', '47', '0', '2015-07-08 22:15:16', '2015-07-08 22:15:16');
INSERT INTO `iee_order_link_commondity_t` VALUES ('157', '57', '0', '2015-07-09 16:03:17', '2015-07-09 16:03:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('158', '57', '0', '2015-07-09 16:19:14', '2015-07-09 16:19:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('159', '57', '0', '2015-07-09 16:29:47', '2015-07-09 16:29:47');
INSERT INTO `iee_order_link_commondity_t` VALUES ('160', '57', '0', '2015-07-09 16:34:45', '2015-07-09 16:34:45');
INSERT INTO `iee_order_link_commondity_t` VALUES ('161', '57', '0', '2015-07-09 16:56:01', '2015-07-09 16:56:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('162', '57', '0', '2015-07-09 16:56:38', '2015-07-09 16:56:38');
INSERT INTO `iee_order_link_commondity_t` VALUES ('163', '57', '0', '2015-07-09 16:58:33', '2015-07-09 16:58:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('164', '57', '0', '2015-07-09 16:59:50', '2015-07-09 16:59:50');
INSERT INTO `iee_order_link_commondity_t` VALUES ('165', '57', '0', '2015-07-09 17:14:33', '2015-07-09 17:14:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('166', '57', '0', '2015-07-09 17:17:01', '2015-07-09 17:17:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('167', '57', '0', '2015-07-09 17:39:22', '2015-07-09 17:39:22');
INSERT INTO `iee_order_link_commondity_t` VALUES ('168', '57', '0', '2015-07-09 18:18:17', '2015-07-09 18:18:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('169', '57', '0', '2015-07-09 18:21:44', '2015-07-09 18:21:44');
INSERT INTO `iee_order_link_commondity_t` VALUES ('170', '57', '0', '2015-07-09 18:24:07', '2015-07-09 18:24:07');
INSERT INTO `iee_order_link_commondity_t` VALUES ('171', '57', '0', '2015-07-09 18:27:52', '2015-07-09 18:27:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('172', '57', '0', '2015-07-09 18:30:17', '2015-07-09 18:30:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('173', '57', '0', '2015-07-09 18:38:28', '2015-07-09 18:38:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('174', '57', '0', '2015-07-09 18:46:35', '2015-07-09 18:46:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('175', '57', '0', '2015-07-09 18:52:27', '2015-07-09 18:52:27');
INSERT INTO `iee_order_link_commondity_t` VALUES ('176', '57', '0', '2015-07-09 19:23:05', '2015-07-09 19:23:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('177', '57', '0', '2015-07-09 19:25:15', '2015-07-09 19:25:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('178', '50', '0', '2015-07-09 19:27:52', '2015-07-09 19:27:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('178', '51', '0', '2015-07-09 19:27:52', '2015-07-09 19:27:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('178', '55', '0', '2015-07-09 19:27:52', '2015-07-09 19:27:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('178', '56', '0', '2015-07-09 19:27:52', '2015-07-09 19:27:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('178', '57', '0', '2015-07-09 19:27:52', '2015-07-09 19:27:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('179', '57', '0', '2015-07-09 19:28:40', '2015-07-09 19:28:40');
INSERT INTO `iee_order_link_commondity_t` VALUES ('180', '57', '0', '2015-07-10 19:36:37', '2015-07-10 19:36:37');
INSERT INTO `iee_order_link_commondity_t` VALUES ('181', '57', '0', '2015-07-10 19:39:57', '2015-07-10 19:39:57');
INSERT INTO `iee_order_link_commondity_t` VALUES ('182', '57', '1', '2015-07-11 22:27:44', '2015-07-11 22:27:44');
INSERT INTO `iee_order_link_commondity_t` VALUES ('184', '57', '1', '2015-07-11 22:29:25', '2015-07-11 22:29:25');
INSERT INTO `iee_order_link_commondity_t` VALUES ('185', '57', '3', '2015-07-11 22:58:16', '2015-07-11 22:58:16');
INSERT INTO `iee_order_link_commondity_t` VALUES ('186', '57', '3', '2015-07-11 22:58:22', '2015-07-11 22:58:22');
INSERT INTO `iee_order_link_commondity_t` VALUES ('187', '57', '3', '2015-07-11 22:59:02', '2015-07-11 22:59:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('188', '57', '3', '2015-07-11 23:36:45', '2015-07-11 23:36:45');
INSERT INTO `iee_order_link_commondity_t` VALUES ('189', '57', '3', '2015-07-11 23:39:58', '2015-07-11 23:39:58');
INSERT INTO `iee_order_link_commondity_t` VALUES ('190', '57', '3', '2015-07-11 23:44:05', '2015-07-11 23:44:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('191', '57', '3', '2015-07-11 23:50:18', '2015-07-11 23:50:18');
INSERT INTO `iee_order_link_commondity_t` VALUES ('192', '57', '3', '2015-07-11 23:56:03', '2015-07-11 23:56:03');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '47', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '49', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '48', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '46', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '50', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '51', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '53', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '54', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '55', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '56', '1', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('193', '57', '3', '2015-07-11 23:57:35', '2015-07-11 23:57:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('194', '56', '1', '2015-07-12 18:02:01', '2015-07-12 18:02:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('194', '57', '1', '2015-07-12 18:02:01', '2015-07-12 18:02:01');
INSERT INTO `iee_order_link_commondity_t` VALUES ('195', '45', '1', '2015-07-12 21:56:07', '2015-07-12 21:56:07');
INSERT INTO `iee_order_link_commondity_t` VALUES ('195', '56', '5', '2015-07-12 21:56:07', '2015-07-12 21:56:07');
INSERT INTO `iee_order_link_commondity_t` VALUES ('196', '57', '1', '2015-07-13 00:01:27', '2015-07-13 00:01:27');
INSERT INTO `iee_order_link_commondity_t` VALUES ('197', '56', '1', '2015-07-13 10:22:29', '2015-07-13 10:22:29');
INSERT INTO `iee_order_link_commondity_t` VALUES ('197', '57', '1', '2015-07-13 10:22:29', '2015-07-13 10:22:29');
INSERT INTO `iee_order_link_commondity_t` VALUES ('198', '56', '1', '2015-07-13 12:40:46', '2015-07-13 12:40:46');
INSERT INTO `iee_order_link_commondity_t` VALUES ('198', '57', '2', '2015-07-13 12:40:46', '2015-07-13 12:40:46');
INSERT INTO `iee_order_link_commondity_t` VALUES ('199', '55', '1', '2015-07-13 16:11:32', '2015-07-13 16:11:32');
INSERT INTO `iee_order_link_commondity_t` VALUES ('199', '56', '1', '2015-07-13 16:11:32', '2015-07-13 16:11:32');
INSERT INTO `iee_order_link_commondity_t` VALUES ('199', '57', '1', '2015-07-13 16:11:32', '2015-07-13 16:11:32');
INSERT INTO `iee_order_link_commondity_t` VALUES ('200', '55', '1', '2015-07-13 16:12:32', '2015-07-13 16:12:32');
INSERT INTO `iee_order_link_commondity_t` VALUES ('200', '56', '1', '2015-07-13 16:12:32', '2015-07-13 16:12:32');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201', '57', '1', '2015-07-13 16:13:00', '2015-07-13 16:13:00');
INSERT INTO `iee_order_link_commondity_t` VALUES ('202', '57', '1', '2015-07-13 16:13:18', '2015-07-13 16:13:18');
INSERT INTO `iee_order_link_commondity_t` VALUES ('203', '56', '1', '2015-07-13 16:23:07', '2015-07-13 16:23:07');
INSERT INTO `iee_order_link_commondity_t` VALUES ('203', '57', '1', '2015-07-13 16:23:07', '2015-07-13 16:23:07');
INSERT INTO `iee_order_link_commondity_t` VALUES ('204', '55', '1', '2015-07-13 16:27:36', '2015-07-13 16:27:36');
INSERT INTO `iee_order_link_commondity_t` VALUES ('204', '56', '1', '2015-07-13 16:27:36', '2015-07-13 16:27:36');
INSERT INTO `iee_order_link_commondity_t` VALUES ('204', '57', '1', '2015-07-13 16:27:36', '2015-07-13 16:27:36');
INSERT INTO `iee_order_link_commondity_t` VALUES ('205', '55', '1', '2015-07-13 16:59:50', '2015-07-13 16:59:50');
INSERT INTO `iee_order_link_commondity_t` VALUES ('205', '56', '1', '2015-07-13 16:59:50', '2015-07-13 16:59:50');
INSERT INTO `iee_order_link_commondity_t` VALUES ('205', '57', '1', '2015-07-13 16:59:50', '2015-07-13 16:59:50');
INSERT INTO `iee_order_link_commondity_t` VALUES ('206', '48', '1', '2015-07-13 17:05:15', '2015-07-13 17:05:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('206', '46', '1', '2015-07-13 17:05:15', '2015-07-13 17:05:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('207', '54', '1', '2015-07-13 17:07:12', '2015-07-13 17:07:12');
INSERT INTO `iee_order_link_commondity_t` VALUES ('207', '55', '1', '2015-07-13 17:07:12', '2015-07-13 17:07:12');
INSERT INTO `iee_order_link_commondity_t` VALUES ('207', '56', '1', '2015-07-13 17:07:12', '2015-07-13 17:07:12');
INSERT INTO `iee_order_link_commondity_t` VALUES ('207', '57', '1', '2015-07-13 17:07:12', '2015-07-13 17:07:12');
INSERT INTO `iee_order_link_commondity_t` VALUES ('208', '55', '1', '2015-07-13 17:29:38', '2015-07-13 17:29:38');
INSERT INTO `iee_order_link_commondity_t` VALUES ('208', '56', '1', '2015-07-13 17:29:38', '2015-07-13 17:29:38');
INSERT INTO `iee_order_link_commondity_t` VALUES ('208', '57', '1', '2015-07-13 17:29:38', '2015-07-13 17:29:38');
INSERT INTO `iee_order_link_commondity_t` VALUES ('209', '54', '1', '2015-07-13 17:43:40', '2015-07-13 17:43:40');
INSERT INTO `iee_order_link_commondity_t` VALUES ('210', '51', '2', '2015-07-13 19:07:27', '2015-07-13 19:07:27');
INSERT INTO `iee_order_link_commondity_t` VALUES ('210', '53', '3', '2015-07-13 19:07:27', '2015-07-13 19:07:27');
INSERT INTO `iee_order_link_commondity_t` VALUES ('211', '54', '1', '2015-07-13 19:09:17', '2015-07-13 19:09:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('212', '47', '2', '2015-07-13 19:42:02', '2015-07-13 19:42:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('213', '57', '1', '2015-07-14 00:11:19', '2015-07-14 00:11:19');
INSERT INTO `iee_order_link_commondity_t` VALUES ('214', '55', '1', '2015-07-14 00:27:40', '2015-07-14 00:27:40');
INSERT INTO `iee_order_link_commondity_t` VALUES ('215', '57', '1', '2015-07-14 07:50:25', '2015-07-14 07:50:25');
INSERT INTO `iee_order_link_commondity_t` VALUES ('216', '55', '2', '2015-07-14 11:57:17', '2015-07-14 11:57:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('217', '57', '1', '2015-07-14 14:09:31', '2015-07-14 14:09:31');
INSERT INTO `iee_order_link_commondity_t` VALUES ('217', '58', '1', '2015-07-14 14:09:31', '2015-07-14 14:09:31');
INSERT INTO `iee_order_link_commondity_t` VALUES ('218', '55', '2', '2015-07-14 14:46:59', '2015-07-14 14:46:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('219', '54', '2', '2015-07-14 15:56:26', '2015-07-14 15:56:26');
INSERT INTO `iee_order_link_commondity_t` VALUES ('220', '53', '1', '2015-07-14 15:56:55', '2015-07-14 15:56:55');
INSERT INTO `iee_order_link_commondity_t` VALUES ('221', '58', '1', '2015-07-14 17:02:31', '2015-07-14 17:02:31');
INSERT INTO `iee_order_link_commondity_t` VALUES ('222', '55', '1', '2015-07-14 17:38:30', '2015-07-14 17:38:30');
INSERT INTO `iee_order_link_commondity_t` VALUES ('223', '57', '2', '2015-07-14 17:40:27', '2015-07-14 17:40:27');
INSERT INTO `iee_order_link_commondity_t` VALUES ('226', '56', '2', '2015-07-14 17:42:24', '2015-07-14 17:42:24');
INSERT INTO `iee_order_link_commondity_t` VALUES ('227', '56', '2', '2015-07-14 17:47:49', '2015-07-14 17:47:49');
INSERT INTO `iee_order_link_commondity_t` VALUES ('228', '56', '2', '2015-07-14 17:56:49', '2015-07-14 17:56:49');
INSERT INTO `iee_order_link_commondity_t` VALUES ('229', '58', '1', '2015-07-14 20:29:38', '2015-07-14 20:29:38');
INSERT INTO `iee_order_link_commondity_t` VALUES ('230', '57', '1', '2015-07-14 20:31:47', '2015-07-14 20:31:47');
INSERT INTO `iee_order_link_commondity_t` VALUES ('230', '58', '1', '2015-07-14 20:31:47', '2015-07-14 20:31:47');
INSERT INTO `iee_order_link_commondity_t` VALUES ('231', '57', '1', '2015-07-14 20:33:46', '2015-07-14 20:33:46');
INSERT INTO `iee_order_link_commondity_t` VALUES ('232', '57', '1', '2015-07-14 20:47:34', '2015-07-14 20:47:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('233', '55', '1', '2015-07-14 21:06:17', '2015-07-14 21:06:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('233', '56', '1', '2015-07-14 21:06:17', '2015-07-14 21:06:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('234', '55', '3', '2015-07-14 21:07:02', '2015-07-14 21:07:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('234', '56', '1', '2015-07-14 21:07:02', '2015-07-14 21:07:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('234', '57', '1', '2015-07-14 21:07:02', '2015-07-14 21:07:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507140', '57', '1', '2015-07-14 22:32:09', '2015-07-14 22:32:09');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507141', '57', '2', '2015-07-14 22:40:16', '2015-07-14 22:40:16');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507142', '56', '2', '2015-07-14 22:45:25', '2015-07-14 22:45:25');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507143', '57', '2', '2015-07-14 22:47:13', '2015-07-14 22:47:13');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507144', '57', '2', '2015-07-14 22:48:04', '2015-07-14 22:48:04');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507145', '56', '2', '2015-07-14 22:48:57', '2015-07-14 22:48:57');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507146', '56', '2', '2015-07-14 22:52:10', '2015-07-14 22:52:10');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507147', '56', '2', '2015-07-14 22:52:59', '2015-07-14 22:52:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507148', '56', '2', '2015-07-14 22:53:51', '2015-07-14 22:53:51');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507149', '56', '2', '2015-07-14 22:57:30', '2015-07-14 22:57:30');
INSERT INTO `iee_order_link_commondity_t` VALUES ('2015071411', '56', '1', '2015-07-14 22:59:33', '2015-07-14 22:59:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('2015071411', '57', '2', '2015-07-14 22:59:33', '2015-07-14 22:59:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('2015071412', '56', '2', '2015-07-14 23:04:03', '2015-07-14 23:04:03');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507140019', '56', '2', '2015-07-14 23:18:08', '2015-07-14 23:18:08');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507140020', '56', '2', '2015-07-14 23:25:29', '2015-07-14 23:25:29');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150021', '59', '1', '2015-07-15 10:36:05', '2015-07-15 10:36:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150021', '57', '1', '2015-07-15 10:36:05', '2015-07-15 10:36:05');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150022', '59', '1', '2015-07-15 10:43:37', '2015-07-15 10:43:37');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150023', '59', '1', '2015-07-15 10:44:23', '2015-07-15 10:44:23');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150024', '59', '1', '2015-07-15 10:46:04', '2015-07-15 10:46:04');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150025', '59', '2', '2015-07-15 15:31:34', '2015-07-15 15:31:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150026', '57', '1', '2015-07-15 15:40:33', '2015-07-15 15:40:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150027', '59', '1', '2015-07-15 15:48:39', '2015-07-15 15:48:39');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150028', '57', '1', '2015-07-15 19:19:49', '2015-07-15 19:19:49');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150029', '57', '1', '2015-07-15 21:32:55', '2015-07-15 21:32:55');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507150030', '59', '1', '2015-07-15 23:03:26', '2015-07-15 23:03:26');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507160031', '59', '1', '2015-07-16 14:38:32', '2015-07-16 14:38:32');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507160032', '59', '3', '2015-07-16 16:10:43', '2015-07-16 16:10:43');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507160033', '59', '1', '2015-07-16 16:15:15', '2015-07-16 16:15:15');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507160034', '57', '1', '2015-07-16 16:19:23', '2015-07-16 16:19:23');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507170035', '59', '1', '2015-07-17 01:36:00', '2015-07-17 01:36:00');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507170036', '59', '1', '2015-07-17 16:08:54', '2015-07-17 16:08:54');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507170037', '59', '1', '2015-07-17 16:09:25', '2015-07-17 16:09:25');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507190038', '57', '1', '2015-07-19 23:56:24', '2015-07-19 23:56:24');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507190039', '57', '1', '2015-07-19 23:58:33', '2015-07-19 23:58:33');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200001', '43', '2', '2015-07-20 00:20:48', '2015-07-20 00:20:48');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200001', '57', '1', '2015-07-20 00:20:48', '2015-07-20 00:20:48');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200002', '59', '1', '2015-07-20 00:23:14', '2015-07-20 00:23:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200002', '57', '1', '2015-07-20 00:23:14', '2015-07-20 00:23:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200003', '59', '1', '2015-07-20 00:26:48', '2015-07-20 00:26:48');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200004', '57', '1', '2015-07-20 15:48:22', '2015-07-20 15:48:22');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200005', '59', '1', '2015-07-20 15:48:42', '2015-07-20 15:48:42');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200005', '57', '1', '2015-07-20 15:48:42', '2015-07-20 15:48:42');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200006', '43', '1', '2015-07-20 15:57:28', '2015-07-20 15:57:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200006', '57', '1', '2015-07-20 15:57:28', '2015-07-20 15:57:28');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200007', '59', '1', '2015-07-20 16:20:35', '2015-07-20 16:20:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200008', '57', '1', '2015-07-20 16:43:16', '2015-07-20 16:43:16');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200009', '57', '1', '2015-07-20 16:44:13', '2015-07-20 16:44:13');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200010', '43', '2', '2015-07-20 16:46:58', '2015-07-20 16:46:58');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200010', '57', '1', '2015-07-20 16:46:58', '2015-07-20 16:46:58');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507200011', '43', '2', '2015-07-20 21:28:16', '2015-07-20 21:28:16');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210012', '43', '5', '2015-07-21 10:16:26', '2015-07-21 10:16:26');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210012', '57', '2', '2015-07-21 10:16:26', '2015-07-21 10:16:26');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210013', '43', '1', '2015-07-21 10:48:45', '2015-07-21 10:48:45');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210014', '43', '1', '2015-07-21 10:50:54', '2015-07-21 10:50:54');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210015', '57', '2', '2015-07-21 10:52:53', '2015-07-21 10:52:53');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210016', '43', '2', '2015-07-21 10:53:21', '2015-07-21 10:53:21');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210017', '43', '2', '2015-07-21 10:54:22', '2015-07-21 10:54:22');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201507210018', '57', '2', '2015-07-21 10:56:02', '2015-07-21 10:56:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190046', '41', '2', '2015-08-19 13:06:48', '2015-08-19 13:06:48');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190046', '65', '2', '2015-08-19 13:06:48', '2015-08-19 13:06:48');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190048', '65', '1', '2015-08-19 13:10:02', '2015-08-19 13:10:02');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190049', '41', '1', '2015-08-19 13:12:14', '2015-08-19 13:12:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190049', '65', '1', '2015-08-19 13:12:14', '2015-08-19 13:12:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190050', '65', '2', '2015-08-19 13:16:59', '2015-08-19 13:16:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190051', '41', '2', '2015-08-19 13:17:26', '2015-08-19 13:17:26');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190052', '65', '1', '2015-08-19 13:19:10', '2015-08-19 13:19:10');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190054', '41', '1', '2015-08-19 13:26:03', '2015-08-19 13:26:03');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190054', '65', '1', '2015-08-19 13:26:03', '2015-08-19 13:26:03');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190055', '65', '1', '2015-08-19 13:26:52', '2015-08-19 13:26:52');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190056', '41', '1', '2015-08-19 13:27:39', '2015-08-19 13:27:39');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190057', '65', '1', '2015-08-19 13:32:35', '2015-08-19 13:32:35');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201508190058', '41', '2', '2015-08-19 13:41:39', '2015-08-19 13:41:39');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020003', '82', '2', '2015-10-02 16:38:18', '2015-10-02 16:38:18');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020006', '82', '4', '2015-10-02 16:50:14', '2015-10-02 16:50:14');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020007', '80', '1', '2015-10-02 16:52:06', '2015-10-02 16:52:06');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020007', '82', '1', '2015-10-02 16:52:06', '2015-10-02 16:52:06');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020008', '82', '5', '2015-10-02 16:52:31', '2015-10-02 16:52:31');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020009', '80', '2', '2015-10-02 16:53:21', '2015-10-02 16:53:21');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510020009', '82', '2', '2015-10-02 16:53:21', '2015-10-02 16:53:21');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510030010', '66', '3', '2015-10-03 16:31:34', '2015-10-03 16:31:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510030010', '84', '2', '2015-10-03 16:31:34', '2015-10-03 16:31:34');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040011', '84', '3', '2015-10-04 17:02:22', '2015-10-04 17:02:22');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040012', '66', '2', '2015-10-04 17:06:29', '2015-10-04 17:06:29');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040013', '84', '3', '2015-10-04 17:07:44', '2015-10-04 17:07:44');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040014', '70', '1', '2015-10-04 17:10:39', '2015-10-04 17:10:39');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040015', '68', '1', '2015-10-04 17:13:17', '2015-10-04 17:13:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040015', '70', '1', '2015-10-04 17:13:17', '2015-10-04 17:13:17');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040016', '66', '2', '2015-10-04 17:19:55', '2015-10-04 17:19:55');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040017', '83', '1', '2015-10-04 17:20:51', '2015-10-04 17:20:51');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040018', '66', '1', '2015-10-04 17:35:59', '2015-10-04 17:35:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040018', '65', '1', '2015-10-04 17:35:59', '2015-10-04 17:35:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040018', '68', '1', '2015-10-04 17:35:59', '2015-10-04 17:35:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040018', '70', '1', '2015-10-04 17:35:59', '2015-10-04 17:35:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040018', '82', '1', '2015-10-04 17:35:59', '2015-10-04 17:35:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040018', '83', '1', '2015-10-04 17:35:59', '2015-10-04 17:35:59');
INSERT INTO `iee_order_link_commondity_t` VALUES ('201510040019', '80', '2', '2015-10-04 18:24:24', '2015-10-04 18:24:24');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:37:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_order_sequnce_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_order_sequnce_t`;
CREATE TABLE `iee_order_sequnce_t` (
  `id` int(8) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_order_sequnce_t
-- ----------------------------
INSERT INTO `iee_order_sequnce_t` VALUES ('19');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:37:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_order_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_order_t`;
CREATE TABLE `iee_order_t` (
  `id` varchar(20) NOT NULL COMMENT '订单ID',
  `uid` int(8) NOT NULL COMMENT '用户ID,映射用户表iee_use_t表主键ID',
  `mid` int(8) NOT NULL COMMENT '商户ID,映射iee_merchant_t表主键ID',
  `tprice` double(8,2) default NULL COMMENT '总价',
  `addr` varchar(100) default NULL COMMENT '地址',
  `pay_qrcode` varchar(100) default NULL COMMENT '支付二维码',
  `new_addr` varchar(100) default NULL COMMENT '新地址',
  `contact_phone` varchar(50) default NULL COMMENT '联系电话',
  `pay_type` int(1) NOT NULL default '1' COMMENT '支付类型 0 微信支付 1 现金支付',
  `state` int(1) NOT NULL default '0' COMMENT '订单状态 0 待处理 1 派送中 2 已完成',
  `description` varchar(100) default NULL COMMENT '订单描述',
  `created_by` int(8) default NULL COMMENT '创建人',
  `created_date` datetime default NULL COMMENT '创建时间',
  `updated_by` int(8) default NULL COMMENT '修改人',
  `updated_date` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COMMENT='订单';

-- ----------------------------
-- Records of iee_order_t
-- ----------------------------
INSERT INTO `iee_order_t` VALUES ('201510040018', '123', '0', '517.00', '', null, 'ccc', '18676398164', '1', '0', null, null, '2015-11-02 22:47:41', null, '2015-10-04 17:35:59');
INSERT INTO `iee_order_t` VALUES ('201510040019', '123', '0', '2446.00', '', null, 'aa', '18676398164', '1', '0', null, null, '2015-11-02 22:47:41', null, '2015-10-04 18:24:24');
INSERT INTO `iee_order_t` VALUES ('201507140019', '0', '0', '0.02', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-14 23:18:08');
INSERT INTO `iee_order_t` VALUES ('201507140020', '0', '0', '0.02', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-14 23:25:29');
INSERT INTO `iee_order_t` VALUES ('201507150021', '0', '0', '0.02', '深圳福田', null, null, '18899770277', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-15 10:36:05');
INSERT INTO `iee_order_t` VALUES ('201507150022', '0', '0', '0.01', '深圳福田', null, '星巴克', '13922869018', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-15 10:43:37');
INSERT INTO `iee_order_t` VALUES ('201507150023', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-15 10:44:23');
INSERT INTO `iee_order_t` VALUES ('201507150024', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-15 10:46:04');
INSERT INTO `iee_order_t` VALUES ('201507150025', '0', '0', '0.02', '深圳福田', null, null, '', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-15 16:05:51');
INSERT INTO `iee_order_t` VALUES ('201507150026', '0', '0', '0.01', '深圳福田', null, null, '', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-15 15:46:03');
INSERT INTO `iee_order_t` VALUES ('201507150027', '0', '0', '0.01', '深圳福田', null, null, '', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-15 15:48:49');
INSERT INTO `iee_order_t` VALUES ('201507150028', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-15 19:19:49');
INSERT INTO `iee_order_t` VALUES ('201507150029', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-15 21:33:11');
INSERT INTO `iee_order_t` VALUES ('201507150030', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-15 23:03:36');
INSERT INTO `iee_order_t` VALUES ('201507160031', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-16 14:38:44');
INSERT INTO `iee_order_t` VALUES ('201507160032', '0', '0', '0.03', '123', null, null, '', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-16 16:11:04');
INSERT INTO `iee_order_t` VALUES ('201507160033', '0', '0', '0.01', '123', null, null, '', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-16 16:15:23');
INSERT INTO `iee_order_t` VALUES ('201507160034', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-16 16:19:23');
INSERT INTO `iee_order_t` VALUES ('201507170035', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '0', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-17 01:36:09');
INSERT INTO `iee_order_t` VALUES ('201507170036', '0', '0', '0.01', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-17 16:08:54');
INSERT INTO `iee_order_t` VALUES ('201507170037', '0', '0', '0.01', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-17 16:09:25');
INSERT INTO `iee_order_t` VALUES ('201507190038', '0', '0', '0.01', '123', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-19 23:56:24');
INSERT INTO `iee_order_t` VALUES ('201507190039', '0', '0', '0.01', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-19 23:58:33');
INSERT INTO `iee_order_t` VALUES ('201507200001', '0', '0', '196.01', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 00:20:48');
INSERT INTO `iee_order_t` VALUES ('201507200002', '0', '0', '0.02', '深圳福田', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 00:23:14');
INSERT INTO `iee_order_t` VALUES ('201507200003', '0', '0', '0.01', '深圳福田', null, null, '18899770277', '0', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 00:27:01');
INSERT INTO `iee_order_t` VALUES ('201507200004', '0', '0', '0.01', '测试服务123', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 15:48:22');
INSERT INTO `iee_order_t` VALUES ('201507200005', '0', '0', '0.02', '测试服务123', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 15:48:42');
INSERT INTO `iee_order_t` VALUES ('201507200006', '0', '0', '98.00', '测试服务123', null, null, '', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 15:57:28');
INSERT INTO `iee_order_t` VALUES ('201507200007', '0', '0', '0.01', '', null, null, '18899770277', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 16:20:35');
INSERT INTO `iee_order_t` VALUES ('201507200008', '0', '0', '0.01', '测试服务123', null, null, '18676398164', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 16:43:16');
INSERT INTO `iee_order_t` VALUES ('201507200009', '0', '0', '0.01', '测试服务123', null, null, '18676398164', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 16:44:13');
INSERT INTO `iee_order_t` VALUES ('201507200010', '0', '0', '196.01', '测试服务123', null, null, '18676398164', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 16:46:58');
INSERT INTO `iee_order_t` VALUES ('201507200011', '0', '0', '196.00', '测试服务123', null, null, '18676398164', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-20 21:28:16');
INSERT INTO `iee_order_t` VALUES ('201507210012', '0', '0', '490.02', '测试服务123', null, null, '18676398164', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-21 10:16:26');
INSERT INTO `iee_order_t` VALUES ('201507210013', '0', '0', '98.00', '测试服务123', null, null, '18676398164', '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-07-21 10:48:45');
INSERT INTO `iee_order_t` VALUES ('201507210014', '0', '0', '98.00', '测试服务123', null, null, '18676398164', '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-08-27 13:21:47');
INSERT INTO `iee_order_t` VALUES ('201507210015', '0', '0', '0.02', '测试服务123', null, null, '18676398164', '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-07-22 10:37:57');
INSERT INTO `iee_order_t` VALUES ('201507210016', '0', '0', '196.00', '测试服务123', null, null, '18676398164', '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-08-27 15:32:39');
INSERT INTO `iee_order_t` VALUES ('201508190046', '123', '0', '268.00', '', null, null, null, '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-10-26 14:57:03');
INSERT INTO `iee_order_t` VALUES ('201508190048', '123', '0', '123.00', '', null, null, null, '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-11-02 12:06:37');
INSERT INTO `iee_order_t` VALUES ('201508190049', '123', '0', '134.00', '', null, null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:05:58');
INSERT INTO `iee_order_t` VALUES ('201508190050', '123', '0', '246.00', '', null, null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:05:48');
INSERT INTO `iee_order_t` VALUES ('201508190051', '123', '0', '22.00', '', null, null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:05:20');
INSERT INTO `iee_order_t` VALUES ('201508190052', '123', '0', '123.00', '', null, null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:05:00');
INSERT INTO `iee_order_t` VALUES ('201508190053', '123', '0', '123.00', '', null, null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:04:19');
INSERT INTO `iee_order_t` VALUES ('201508190054', '123', '0', '134.00', '', '{}', null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:03:41');
INSERT INTO `iee_order_t` VALUES ('201508190055', '123', '0', '123.00', '', '{}', null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:02:35');
INSERT INTO `iee_order_t` VALUES ('201508190056', '123', '0', '11.00', '', 'uploadFile/QRCode/QRCode1439962049033.gif', null, null, '1', '1', null, null, '2015-11-02 22:47:41', null, '2015-08-29 00:02:08');
INSERT INTO `iee_order_t` VALUES ('201508190057', '123', '0', '123.00', '', 'uploadFile/QRCode/QRCode1439962354587.gif', null, null, '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-08-28 11:29:05');
INSERT INTO `iee_order_t` VALUES ('201508190058', '123', '0', '22.00', '', 'uploadFile/QRCode/QRCode1439962894654.gif', null, null, '1', '2', null, null, '2015-11-02 22:47:41', null, '2015-08-27 13:21:27');
INSERT INTO `iee_order_t` VALUES ('201510040014', '123', '0', '123.00', '', null, 'aa', '18676398164', '1', '0', null, null, '2015-11-02 22:47:41', null, '2015-10-04 17:10:39');
INSERT INTO `iee_order_t` VALUES ('201510040015', '123', '0', '125.00', '', null, 'ccc', '18676398164', '1', '0', null, null, '2015-11-02 22:47:41', null, '2015-10-04 17:13:17');
INSERT INTO `iee_order_t` VALUES ('201510040016', '123', '0', '46.00', '', null, 'aa', '18676398164', '1', '0', null, null, '2015-11-02 22:47:41', null, '2015-10-04 17:19:55');
INSERT INTO `iee_order_t` VALUES ('201510040017', '123', '0', '123.00', '', null, 'aa', '18676398164', '1', '0', null, null, '2015-11-02 22:47:41', null, '2015-10-04 17:20:51');

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:41:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_notify_template_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_notify_template_t`;
CREATE TABLE `iee_notify_template_t` (
  `nid` varchar(50) NOT NULL COMMENT '公众号配置的模板消息ID',
  `tid` int(4) NOT NULL COMMENT '通知模板类型',
  `appid` varchar(50) default NULL COMMENT '公众号ID',
  `created_date` datetime default NULL,
  `updated_date` datetime default NULL,
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='维系消息通知模板配置';

-- ----------------------------
-- Records of iee_notify_template_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-06 20:41:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_notify_template_type_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_notify_template_type_t`;
CREATE TABLE `iee_notify_template_type_t` (
  `id` int(4) NOT NULL COMMENT '类型ID',
  `name` varchar(50) default NULL COMMENT '类型名',
  `created_date` datetime default NULL,
  `updated_date` datetime default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信消息模板通知';

-- ----------------------------
-- Records of iee_notify_template_type_t
-- ----------------------------

/*
Navicat MySQL Data Transfer

Source Server         : location
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : projectx

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2015-11-07 12:19:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `iee_invitation_code_t`
-- ----------------------------
DROP TABLE IF EXISTS `iee_invitation_code_t`;
CREATE TABLE `iee_invitation_code_t` (
  `code` varchar(6) NOT NULL COMMENT '邀请码,六位随机数',
  `state` smallint(1) default '0' COMMENT '邀请码状态, 0表示未使用，1表示使用',
  `created_date` datetime default NULL,
  `updated_date` datetime default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of iee_invitation_code_t
-- ----------------------------
