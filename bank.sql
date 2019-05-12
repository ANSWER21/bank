/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : bank

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-05-12 22:06:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` varchar(255) DEFAULT NULL COMMENT '客户编号',
  `c_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `c_sex` varchar(255) DEFAULT NULL COMMENT '客户性别',
  `c_age` varchar(255) DEFAULT NULL COMMENT '客户年龄',
  `c_IDcard` varchar(255) DEFAULT NULL COMMENT '客户身份证号',
  `c_phone` varchar(255) DEFAULT NULL COMMENT '客户联系方式',
  `c_occupation` varchar(255) DEFAULT NULL COMMENT '职业',
  `c_risk` varchar(255) DEFAULT NULL COMMENT '风险承受能力',
  `c_IDnumber` varchar(255) DEFAULT NULL COMMENT '开户账号',
  `m_id` varchar(255) DEFAULT NULL COMMENT '客户经理编号',
  `l_cause` varchar(255) DEFAULT '未知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('1', '101', '小红', '女', '27', '452722197507190776', '45622456785', '运动员', '2', '134534245', '10002', '未知');
INSERT INTO `client` VALUES ('3', '103', '小王', '男', '24', '533527198909210238', '48588564875', '网管', '2', '453436434', '10002', '未知');
INSERT INTO `client` VALUES ('4', '104', '小李', '男', '23', '533527198909210238', '15255547865', '理发师', '1', '213456354', '10002', '未知');
INSERT INTO `client` VALUES ('5', '106', '兰兰', '女', '22', '1354567452315674', '1564452413', '学生', '0', '13654654', '10003', '未知');

-- ----------------------------
-- Table structure for `datelist`
-- ----------------------------
DROP TABLE IF EXISTS `datelist`;
CREATE TABLE `datelist` (
  `m_id` varchar(255) DEFAULT NULL COMMENT '产品经理编号',
  `c_id` varchar(255) DEFAULT NULL COMMENT '客户编号',
  `d_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pd_id` varchar(255) DEFAULT NULL COMMENT '产品编号',
  `d_deadline` varchar(255) DEFAULT NULL COMMENT '期限',
  `d_endtime` date DEFAULT NULL,
  `d_time` date DEFAULT NULL COMMENT '到期日',
  `d_current` int(11) unsigned DEFAULT '0' COMMENT '活期',
  `d_terminal` int(11) DEFAULT '0' COMMENT '定期',
  `d_financing` int(11) DEFAULT '0' COMMENT '理财',
  `d_fund` int(11) DEFAULT '0' COMMENT '基金',
  `d_insurance` int(11) DEFAULT '0' COMMENT '保险',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datelist
-- ----------------------------
INSERT INTO `datelist` VALUES ('10002', '103', '1', '1', '', '2019-05-21', '2019-04-16', '0', '1000', '0', '0', '0');
INSERT INTO `datelist` VALUES ('10002', '104', '2', '3', '', '2019-05-16', '2019-04-10', '300000', '0', '0', '0', '0');
INSERT INTO `datelist` VALUES ('10003', '101', '3', '1', '', '2019-05-20', '2019-04-10', '20', '0', '0', '0', '0');
INSERT INTO `datelist` VALUES ('10002', '101', '8', '1', null, '2019-05-24', '2019-05-04', '300000', '0', '0', '0', '0');
INSERT INTO `datelist` VALUES ('10003', '106', '9', '4', null, '2019-05-16', '2019-05-04', '1000000', '0', '0', '0', '0');
INSERT INTO `datelist` VALUES ('10003', '106', '10', '5', null, '2019-05-14', '2019-05-04', '0', '5000', '0', '0', '0');

-- ----------------------------
-- Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `n_id` varchar(255) DEFAULT NULL,
  `f_time` datetime DEFAULT NULL,
  `f_way` varchar(255) DEFAULT NULL,
  `f_result` varchar(255) DEFAULT NULL,
  `m_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES ('1', '1', '2019-04-10 09:19:39', '电话', '良好', '10002');
INSERT INTO `follow` VALUES ('3', '2', '2019-05-15 00:00:00', '电话', '良好', '10002');

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(255) DEFAULT NULL,
  `login_password` varchar(255) DEFAULT NULL,
  `login_role` varchar(255) DEFAULT NULL COMMENT '0为高管 1为客户经理',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', '10001', '10001', '0');
INSERT INTO `login` VALUES ('2', '10002', '10002', '1');
INSERT INTO `login` VALUES ('3', '10003', '10003', '1');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` varchar(255) DEFAULT NULL,
  `m_name` varchar(255) DEFAULT NULL,
  `m_age` varchar(255) DEFAULT NULL,
  `m_phone` varchar(255) DEFAULT NULL,
  `m_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '10001', '张主管', '38', '15526457896', '23545456633@qq.com');
INSERT INTO `manager` VALUES ('2', '10002', '李经理', '22', '15564578543', '23456564112@qq.com');
INSERT INTO `manager` VALUES ('3', '10003', '王经理', '28', '15564456789', '24563544562@qq.com');
INSERT INTO `manager` VALUES ('4', '10004', '谷经理', '28', '15124537482', '2753754986@qq.com');

-- ----------------------------
-- Table structure for `new`
-- ----------------------------
DROP TABLE IF EXISTS `new`;
CREATE TABLE `new` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(255) DEFAULT NULL,
  `n_phone` varchar(255) DEFAULT NULL,
  `n_content` varchar(255) DEFAULT NULL,
  `n_success` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of new
-- ----------------------------
INSERT INTO `new` VALUES ('1', '小江', '18855647853', '活期套餐一如何办理？', '56%');
INSERT INTO `new` VALUES ('2', '小兰', '1555234668', '定期存款具体未来形势', '86%');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(255) DEFAULT NULL,
  `p_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '001', '活期存款');
INSERT INTO `product` VALUES ('2', '002', '定期存款');
INSERT INTO `product` VALUES ('3', '003', '理财');
INSERT INTO `product` VALUES ('4', '004', '基金');
INSERT INTO `product` VALUES ('5', '005', '保险');

-- ----------------------------
-- Table structure for `product-datelist`
-- ----------------------------
DROP TABLE IF EXISTS `product-datelist`;
CREATE TABLE `product-datelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(255) DEFAULT NULL,
  `p_name` varchar(255) DEFAULT NULL,
  `p_time` varchar(255) DEFAULT NULL,
  `p_risk` varchar(255) DEFAULT NULL,
  `p_money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product-datelist
-- ----------------------------
INSERT INTO `product-datelist` VALUES ('1', '001', '套餐一', '不固定', '0', '0');
INSERT INTO `product-datelist` VALUES ('2', '002', '套餐一', '不固定', '4', '0');
INSERT INTO `product-datelist` VALUES ('3', '003', '套餐五', '有限', '3', '3000');
INSERT INTO `product-datelist` VALUES ('4', '004', '套餐三', '有限', '2', '4000');
INSERT INTO `product-datelist` VALUES ('5', '002', '套餐二', '不固定', '0', '0');
INSERT INTO `product-datelist` VALUES ('7', '005', '套餐四', '无限期', '4', '5500');
INSERT INTO `product-datelist` VALUES ('8', '001', '套餐六', '无限期', '1', '0');
