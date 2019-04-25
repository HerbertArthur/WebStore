-------------------------------
--2019年4月25日
--重新设计item表结构，插入数据
-------------------------------
-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_id` int(255) NOT NULL AUTO_INCREMENT,
  `item_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品大的分类',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品名称',
  `price` int(255) DEFAULT NULL COMMENT '价格',
  `icon_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '商品图标存放地址',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
SET FOREIGN_KEY_CHECKS = 1;
--------------
--插入数据
--------------
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (1, '牛肉', '上等肩胛肉', 100, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (2, '牛肉', '中等肩胛肉', 60, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (3, '牛肉', '下等肩胛肉', 40, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (4, '牛肉', '上等前胸肉', 120, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (5, '牛肉', '中等前胸肉', 80, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (6, '牛肉', '下等前胸肉', 60, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (7, '牛肉', '上等牛小排', 150, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (8, '牛肉', '中等牛小排', 120, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (9, '牛肉', '下等牛小排', 90, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (10, '牛肉', '上等牛腩', 100, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (11, '牛肉', '中等牛腩', 70, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (12, '牛肉', '下等牛腩', 50, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (13, '牛肉', '上等牛腱子肉', 140, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (14, '牛肉', '中等牛腱子肉', 120, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (15, '牛肉', '下等牛腱子肉', 100, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (16, '牛排', '上等菲力牛排', 180, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (17, '牛排', '中等菲力牛排', 160, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (18, '牛排', '下等菲力牛排', 140, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (19, '牛排', '上等肉眼牛排', 150, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (20, '牛排', '中等肉眼牛排', 130, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (21, '牛排', '下等肉眼牛排', 110, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (22, '牛排', '上等西冷牛排', 160, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (23, '牛排', '中等西冷牛排', 140, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (24, '牛排', '下等西冷牛排', 120, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (25, '牛排', '上等T骨牛排', 130, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (26, '牛排', '中等T骨牛排', 115, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (28, '牛排', '下等T骨牛排', 95, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (29, '澳洲进口', '精品牛腩块', 60, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (30, '澳洲进口', '牛腱子饲养牛肉', 70, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (31, '澳洲进口', '膳之牛牛排', 109, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (32, '澳洲进口', '原肉整切牛排套餐', 169, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (33, '澳洲进口', '澳洲羊排', 68, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (34, '澳洲进口', '去骨羊后腿肉', 62, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (35, '澳洲进口', '原切眼肉厚牛排', 255, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (36, '澳洲进口', '牛肉家庭牛排套餐', 148, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (37, '澳洲进口', '原肉整切微腌牛排套餐', 258, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (38, '澳洲进口', '农夫好牛原切西冷牛排', 99, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (39, '澳洲进口', '带骨羊前腿肉', 68, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (41, '澳洲进口', '澳洲M3牛腱肉', 74, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (42, '羊肉', '上等羊羔肉', 120, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (43, '羊肉', '中等羊羔肉', 100, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (44, '羊肉', '下等羊羔肉', 80, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (45, '羊肉', '上等去骨羊后腿', 100, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (46, '羊肉', '中等去骨羊后腿', 90, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (47, '羊肉', '下等去骨羊后腿', 80, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (48, '羊肉', '上等羊后腿', 80, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (49, '羊肉', '中等羊后腿', 70, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (50, '羊肉', '下等羊后腿', 65, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (51, '羊肉', '上等法式羔羊排', 130, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (52, '羊肉', '中等法式羔羊排', 110, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (53, '羊肉', '下等法式羔羊排', 90, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (54, '羊肉', '呼伦贝尔羊蝎子', 78, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (55, '羊肉', '精选羊肉卷', 50, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (56, '羊肉', '精品羔羊肋排', 99, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (57, '羊肉', '羔羊肋排', 69, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (58, '羊肉', '上品羔羊上脑羊肉片', 130, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (59, '羊肉', '中品羔羊上脑羊肉片', 110, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (60, '羊肉', '下品羔羊上脑羊肉片', 90, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (61, '猪肉', '上等猪肋排条', 80, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (62, '猪肉', '中等猪肋排条', 70, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (63, '猪肉', '下等猪肋排条', 60, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (64, '猪肉', '上等去皮五花肉', 40, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (65, '猪肉', '中等去皮五花肉', 35, NULL);
INSERT INTO `item`(`item_id`, `item_category`, `item_name`, `price`, `icon_path`) VALUES (66, '猪肉', '下等去皮五花肉', 30, NULL);

---------------------
--2019年4月18日
--建立数据库
---------------------
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` int(255) DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_num` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `item_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item`  (
  `item_id` int(255) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` int(255) DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(255) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(255) DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` int(255) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for watched
-- ----------------------------
DROP TABLE IF EXISTS `watched`;
CREATE TABLE `watched`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `item_id` int(255) DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `user`(`user_id`, `user_name`, `password`, `sex`, `mail`, `phone`, `address`) VALUES (1000, 'admin', 'admin', NULL, NULL, 123456, 'aaaaa');
INSERT INTO `user`(`user_id`, `user_name`, `password`, `sex`, `mail`, `phone`, `address`) VALUES (1001, 'liming', '123456', 1, NULL, 1300000000, '北京');
INSERT INTO `user`(`user_id`, `user_name`, `password`, `sex`, `mail`, `phone`, `address`) VALUES (1002, 'lihua', '123456', 0, NULL, 1300000000, '上海');
