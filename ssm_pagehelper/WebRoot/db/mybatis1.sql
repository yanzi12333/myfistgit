/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : mybatis

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2015-11-18 15:54:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `a` char(1) DEFAULT NULL
)DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

-- ----------------------------
-- Table structure for t_person
-- ----------------------------
DROP TABLE IF EXISTS `t_person`;
CREATE TABLE `t_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_person
-- ----------------------------
INSERT INTO `t_person` VALUES ('1', '宋瑞冬', '24', '1991-10-17 06:00:00');
INSERT INTO `t_person` VALUES ('2', 'songruidong', '23', '2015-11-18 00:00:00');
INSERT INTO `t_person` VALUES ('3', 's.radon', '22', '2015-11-18 00:00:00');
INSERT INTO `t_person` VALUES ('4', '赵', '23', '2015-11-12 00:00:00');
INSERT INTO `t_person` VALUES ('5', '钱', '21', '2015-11-11 00:00:00');
INSERT INTO `t_person` VALUES ('6', '孙', '22', '2015-11-13 00:00:00');
INSERT INTO `t_person` VALUES ('7', '李', '25', '2015-11-15 00:00:00');
INSERT INTO `t_person` VALUES ('8', '周', '27', '2015-11-17 16:21:33');
INSERT INTO `t_person` VALUES ('9', '吴', '24', '2015-11-12 00:00:00');
INSERT INTO `t_person` VALUES ('10', '郑', '26', '2015-11-18 15:51:47');
INSERT INTO `t_person` VALUES ('11', '王', '23', '2015-11-18 15:51:53');
