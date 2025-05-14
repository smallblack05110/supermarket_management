/*
 Navicat Premium Data Transfer

 Source Server         : black_cat
 Source Server Type    : MySQL
 Source Server Version : 80040 (8.0.40)
 Source Host           : localhost:3306
 Source Schema         : supermarket_management

 Target Server Type    : MySQL
 Target Server Version : 80040 (8.0.40)
 File Encoding         : 65001

 Date: 14/05/2025 21:02:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 供应商供货
-- ----------------------------
DROP TABLE IF EXISTS `供应商供货`;
CREATE TABLE `供应商供货`  (
  `供应商编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `入库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`供应商编号`, `入库编号`) USING BTREE,
  INDEX `FK_供应商供货2`(`入库编号` ASC) USING BTREE,
  CONSTRAINT `FK_供应商供货` FOREIGN KEY (`供应商编号`) REFERENCES `供应商信息` (`供应商编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_供应商供货2` FOREIGN KEY (`入库编号`) REFERENCES `入库信息` (`入库编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 供应商供货
-- ----------------------------
INSERT INTO `供应商供货` VALUES ('1', '1');
INSERT INTO `供应商供货` VALUES ('1', '2');
INSERT INTO `供应商供货` VALUES ('1', '3');
INSERT INTO `供应商供货` VALUES ('6', '4');
INSERT INTO `供应商供货` VALUES ('6', '5');
INSERT INTO `供应商供货` VALUES ('6', '6');

-- ----------------------------
-- Table structure for 供应商信息
-- ----------------------------
DROP TABLE IF EXISTS `供应商信息`;
CREATE TABLE `供应商信息`  (
  `供应商编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `名字` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `地址` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `联系方式` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`供应商编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 供应商信息
-- ----------------------------
INSERT INTO `供应商信息` VALUES ('1', '水果鑫诚水果供应', '北京市朝阳区', '022-3131432');
INSERT INTO `供应商信息` VALUES ('2', '朱朱日用品供应', '广州市天河区', '021-3123124');
INSERT INTO `供应商信息` VALUES ('3', '优选果蔬供应', '上海市浦东新区', '021-12345678');
INSERT INTO `供应商信息` VALUES ('4', '老王粮油行', '北京市朝阳区', '010-87654321');
INSERT INTO `供应商信息` VALUES ('5', '绿叶菜场', '广州市天河区', '020-55551234');
INSERT INTO `供应商信息` VALUES ('6', '开心零食批发', '河南省郑州市', '18823132130');

-- ----------------------------
-- Table structure for 供应商信息日志
-- ----------------------------
DROP TABLE IF EXISTS `供应商信息日志`;
CREATE TABLE `供应商信息日志`  (
  `日志ID` int NOT NULL AUTO_INCREMENT,
  `供应商编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `操作时间` datetime NOT NULL,
  `操作用户` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `原名字` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `原地址` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `原联系方式` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `新名字` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `新地址` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `新联系方式` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`日志ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 供应商信息日志
-- ----------------------------

-- ----------------------------
-- Table structure for 供应商品
-- ----------------------------
DROP TABLE IF EXISTS `供应商品`;
CREATE TABLE `供应商品`  (
  `供应商编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `商品编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`供应商编号`, `商品编号`) USING BTREE,
  INDEX `FK_供应`(`商品编号` ASC) USING BTREE,
  CONSTRAINT `FK_供应` FOREIGN KEY (`商品编号`) REFERENCES `商品` (`商品编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_供应2` FOREIGN KEY (`供应商编号`) REFERENCES `供应商信息` (`供应商编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 供应商品
-- ----------------------------
INSERT INTO `供应商品` VALUES ('1', '1');
INSERT INTO `供应商品` VALUES ('6', '2');
INSERT INTO `供应商品` VALUES ('6', '3');

-- ----------------------------
-- Table structure for 入库信息
-- ----------------------------
DROP TABLE IF EXISTS `入库信息`;
CREATE TABLE `入库信息`  (
  `入库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `入库时间` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `数量` int NULL DEFAULT NULL,
  PRIMARY KEY (`入库编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 入库信息
-- ----------------------------
INSERT INTO `入库信息` VALUES ('1', '2024-02-01', 35);
INSERT INTO `入库信息` VALUES ('2', '2014-12-03', 12);
INSERT INTO `入库信息` VALUES ('3', '2024-04-03', 23);
INSERT INTO `入库信息` VALUES ('4', '2025-05-14', 50);
INSERT INTO `入库信息` VALUES ('5', '2025-05-14', 30);
INSERT INTO `入库信息` VALUES ('6', '2025-05-14', 30);

-- ----------------------------
-- Table structure for 出库信息
-- ----------------------------
DROP TABLE IF EXISTS `出库信息`;
CREATE TABLE `出库信息`  (
  `出库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `数量` int NULL DEFAULT NULL,
  `时间` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`出库编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 出库信息
-- ----------------------------

-- ----------------------------
-- Table structure for 商品
-- ----------------------------
DROP TABLE IF EXISTS `商品`;
CREATE TABLE `商品`  (
  `商品编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `名称` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `分类` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `售价` decimal(8, 2) NULL DEFAULT NULL,
  `进价` decimal(8, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`商品编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 商品
-- ----------------------------
INSERT INTO `商品` VALUES ('1', '香蕉', '水果', 3.00, 1.50);
INSERT INTO `商品` VALUES ('2', '辣条', '食品', 1.50, 0.80);
INSERT INTO `商品` VALUES ('3', '方便面', '食品', 3.50, 2.80);
INSERT INTO `商品` VALUES ('4', '肥皂', '日用品', 2.50, 1.30);

-- ----------------------------
-- Table structure for 商品入库
-- ----------------------------
DROP TABLE IF EXISTS `商品入库`;
CREATE TABLE `商品入库`  (
  `商品编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `入库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`商品编号`, `入库编号`) USING BTREE,
  INDEX `FK_商品入库2`(`入库编号` ASC) USING BTREE,
  CONSTRAINT `FK_商品入库` FOREIGN KEY (`商品编号`) REFERENCES `商品` (`商品编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_商品入库2` FOREIGN KEY (`入库编号`) REFERENCES `入库信息` (`入库编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 商品入库
-- ----------------------------
INSERT INTO `商品入库` VALUES ('1', '1');
INSERT INTO `商品入库` VALUES ('1', '2');
INSERT INTO `商品入库` VALUES ('1', '3');
INSERT INTO `商品入库` VALUES ('2', '4');
INSERT INTO `商品入库` VALUES ('3', '5');
INSERT INTO `商品入库` VALUES ('3', '6');

-- ----------------------------
-- Table structure for 商品出库
-- ----------------------------
DROP TABLE IF EXISTS `商品出库`;
CREATE TABLE `商品出库`  (
  `出库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `商品编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`出库编号`, `商品编号`) USING BTREE,
  INDEX `FK_商品出库2`(`商品编号` ASC) USING BTREE,
  CONSTRAINT `FK_商品出库` FOREIGN KEY (`出库编号`) REFERENCES `出库信息` (`出库编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_商品出库2` FOREIGN KEY (`商品编号`) REFERENCES `商品` (`商品编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 商品出库
-- ----------------------------

-- ----------------------------
-- Table structure for 商品售价日志
-- ----------------------------
DROP TABLE IF EXISTS `商品售价日志`;
CREATE TABLE `商品售价日志`  (
  `日志ID` int NOT NULL AUTO_INCREMENT,
  `商品编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `原售价` decimal(8, 2) NULL DEFAULT NULL,
  `新售价` decimal(8, 2) NULL DEFAULT NULL,
  `修改时间` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`日志ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 商品售价日志
-- ----------------------------
INSERT INTO `商品售价日志` VALUES (1, '1', 2.50, 3.00, '2025-05-13 18:56:39');

-- ----------------------------
-- Table structure for 商品进价日志
-- ----------------------------
DROP TABLE IF EXISTS `商品进价日志`;
CREATE TABLE `商品进价日志`  (
  `日志ID` int NOT NULL AUTO_INCREMENT,
  `商品编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `原进价` decimal(8, 2) NULL DEFAULT NULL,
  `新进价` decimal(8, 2) NULL DEFAULT NULL,
  `修改时间` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`日志ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 商品进价日志
-- ----------------------------
INSERT INTO `商品进价日志` VALUES (1, '1', 1.30, 1.50, '2025-05-13 19:03:26');

-- ----------------------------
-- Table structure for 库存
-- ----------------------------
DROP TABLE IF EXISTS `库存`;
CREATE TABLE `库存`  (
  `库存编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `数量` int NULL DEFAULT NULL,
  `数量上限` int NULL DEFAULT NULL,
  `数量下限` int NULL DEFAULT NULL,
  PRIMARY KEY (`库存编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 库存
-- ----------------------------
INSERT INTO `库存` VALUES ('1', 70, 100, 10);
INSERT INTO `库存` VALUES ('2', 50, 500, 0);
INSERT INTO `库存` VALUES ('3', 60, 500, 0);
INSERT INTO `库存` VALUES ('4', 0, 500, 0);

-- ----------------------------
-- Table structure for 库存入库
-- ----------------------------
DROP TABLE IF EXISTS `库存入库`;
CREATE TABLE `库存入库`  (
  `入库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `库存编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`入库编号`, `库存编号`) USING BTREE,
  INDEX `FK_库存入库2`(`库存编号` ASC) USING BTREE,
  CONSTRAINT `FK_库存入库` FOREIGN KEY (`入库编号`) REFERENCES `入库信息` (`入库编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_库存入库2` FOREIGN KEY (`库存编号`) REFERENCES `库存` (`库存编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 库存入库
-- ----------------------------
INSERT INTO `库存入库` VALUES ('1', '1');
INSERT INTO `库存入库` VALUES ('2', '1');
INSERT INTO `库存入库` VALUES ('3', '1');
INSERT INTO `库存入库` VALUES ('4', '2');
INSERT INTO `库存入库` VALUES ('5', '3');
INSERT INTO `库存入库` VALUES ('6', '3');

-- ----------------------------
-- Table structure for 库存出库
-- ----------------------------
DROP TABLE IF EXISTS `库存出库`;
CREATE TABLE `库存出库`  (
  `出库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `库存编号` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`出库编号`, `库存编号`) USING BTREE,
  INDEX `FK_库存出库2`(`库存编号` ASC) USING BTREE,
  CONSTRAINT `FK_库存出库` FOREIGN KEY (`出库编号`) REFERENCES `出库信息` (`出库编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_库存出库2` FOREIGN KEY (`库存编号`) REFERENCES `库存` (`库存编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 库存出库
-- ----------------------------

-- ----------------------------
-- Table structure for 职员
-- ----------------------------
DROP TABLE IF EXISTS `职员`;
CREATE TABLE `职员`  (
  `员工编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `姓名` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `联系方式` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `职位` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`员工编号`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 职员
-- ----------------------------
INSERT INTO `职员` VALUES ('1', '小杨', '18823132130', '总经理');
INSERT INTO `职员` VALUES ('2', '小林', '1234525125', '收银员');

-- ----------------------------
-- Table structure for 职员出货
-- ----------------------------
DROP TABLE IF EXISTS `职员出货`;
CREATE TABLE `职员出货`  (
  `员工编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `出库编号` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`员工编号`, `出库编号`) USING BTREE,
  INDEX `FK_职员出货2`(`出库编号` ASC) USING BTREE,
  CONSTRAINT `FK_职员出货` FOREIGN KEY (`员工编号`) REFERENCES `职员` (`员工编号`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_职员出货2` FOREIGN KEY (`出库编号`) REFERENCES `出库信息` (`出库编号`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of 职员出货
-- ----------------------------

-- ----------------------------
-- View structure for 入库综合信息
-- ----------------------------
DROP VIEW IF EXISTS `入库综合信息`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `入库综合信息` AS select `i`.`入库编号` AS `入库编号`,`i`.`入库时间` AS `入库时间`,`i`.`数量` AS `入库总量`,`sp`.`供应商编号` AS `供应商编号`,`s`.`名字` AS `供应商名称`,`pi`.`商品编号` AS `商品编号`,`p`.`名称` AS `商品名称`,`kb`.`库存编号` AS `库存编号` from (((((`入库信息` `i` join `供应商供货` `sp` on((`i`.`入库编号` = `sp`.`入库编号`))) join `供应商信息` `s` on((`sp`.`供应商编号` = `s`.`供应商编号`))) join `商品入库` `pi` on((`i`.`入库编号` = `pi`.`入库编号`))) join `商品` `p` on((`pi`.`商品编号` = `p`.`商品编号`))) join `库存入库` `kb` on((`i`.`入库编号` = `kb`.`入库编号`)));

-- ----------------------------
-- View structure for 出库综合信息
-- ----------------------------
DROP VIEW IF EXISTS `出库综合信息`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `出库综合信息` AS select `o`.`出库编号` AS `出库编号`,`o`.`时间` AS `出库时间`,`o`.`数量` AS `出库总量`,`eo`.`员工编号` AS `员工编号`,`e`.`姓名` AS `职员姓名`,`po`.`商品编号` AS `商品编号`,`p`.`名称` AS `商品名称`,`kb`.`库存编号` AS `库存编号` from (((((`出库信息` `o` join `职员出货` `eo` on((`o`.`出库编号` = `eo`.`出库编号`))) join `职员` `e` on((`eo`.`员工编号` = `e`.`员工编号`))) join `商品出库` `po` on((`o`.`出库编号` = `po`.`出库编号`))) join `商品` `p` on((`po`.`商品编号` = `p`.`商品编号`))) join `库存出库` `kb` on((`o`.`出库编号` = `kb`.`出库编号`)));

-- ----------------------------
-- View structure for 商品供应信息
-- ----------------------------
DROP VIEW IF EXISTS `商品供应信息`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `商品供应信息` AS select `sp`.`商品编号` AS `商品编号`,`p`.`名称` AS `商品名称`,`p`.`分类` AS `商品分类`,`p`.`售价` AS `售价`,`p`.`进价` AS `进价`,`sp`.`供应商编号` AS `供应商编号`,`s`.`名字` AS `供应商名称`,`s`.`地址` AS `供应商地址`,`s`.`联系方式` AS `供应商联系方式` from ((`供应商品` `sp` join `商品` `p` on((`sp`.`商品编号` = `p`.`商品编号`))) join `供应商信息` `s` on((`sp`.`供应商编号` = `s`.`供应商编号`)));

-- ----------------------------
-- View structure for 商品信息
-- ----------------------------
DROP VIEW IF EXISTS `商品信息`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `商品信息` AS select `p`.`商品编号` AS `商品编号`,`p`.`名称` AS `商品名称`,`p`.`分类` AS `商品分类`,`p`.`售价` AS `售价`,`p`.`进价` AS `进价`,`sp`.`供应商编号` AS `供应商编号` from (`商品` `p` join `供应商品` `sp` on((`p`.`商品编号` = `sp`.`商品编号`)));

-- ----------------------------
-- View structure for 库存详情
-- ----------------------------
DROP VIEW IF EXISTS `库存详情`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `库存详情` AS select `k`.`库存编号` AS `库存编号`,`sub`.`商品编号` AS `商品编号`,`p`.`名称` AS `商品名称`,`k`.`数量` AS `数量`,`k`.`数量上限` AS `数量上限`,`k`.`数量下限` AS `数量下限` from ((`库存` `k` left join (select `kir`.`库存编号` AS `库存编号`,max(`pir`.`商品编号`) AS `商品编号` from (`库存入库` `kir` join `商品入库` `pir` on((`kir`.`入库编号` = `pir`.`入库编号`))) group by `kir`.`库存编号`) `sub` on((`k`.`库存编号` = `sub`.`库存编号`))) left join `商品` `p` on((`sub`.`商品编号` = `p`.`商品编号`)));

-- ----------------------------
-- Function structure for fn_get_inventory_qty
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_inventory_qty`;
delimiter ;;
CREATE FUNCTION `fn_get_inventory_qty`(p_inventory_id CHAR(255))
 RETURNS int
  DETERMINISTIC
BEGIN
  DECLARE v_qty INT;
  SELECT 数量 INTO v_qty
    FROM 库存
   WHERE 库存编号 = p_inventory_id;
  RETURN v_qty;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for fn_needs_reorder
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_needs_reorder`;
delimiter ;;
CREATE FUNCTION `fn_needs_reorder`(p_inventory_id CHAR(255))
 RETURNS tinyint
  DETERMINISTIC
BEGIN
  DECLARE v_qty   INT;
  DECLARE v_min   INT;
  SELECT 数量, 数量下限 INTO v_qty, v_min
    FROM 库存
   WHERE 库存编号 = p_inventory_id;

  IF v_qty < v_min THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_employee
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_employee`;
delimiter ;;
CREATE PROCEDURE `sp_add_employee`(IN p_employee_id   CHAR(10),
  IN p_name          CHAR(10),
  IN p_contact       CHAR(255),
  IN p_position      CHAR(10))
BEGIN
  INSERT INTO 职员(员工编号, 姓名, 联系方式, 职位)
  VALUES(p_employee_id, p_name, p_contact, p_position);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_product`;
delimiter ;;
CREATE PROCEDURE `sp_add_product`(IN p_product_id    CHAR(255),
  IN p_name          CHAR(255),
  IN p_category      CHAR(255),
  IN p_price         DECIMAL(8,2),
  IN p_cost          DECIMAL(8,2))
BEGIN
  INSERT INTO 商品(商品编号, 名称, 分类, 售价, 进价)
  VALUES(p_product_id, p_name, p_category, p_price, p_cost);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_add_supplier
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_add_supplier`;
delimiter ;;
CREATE PROCEDURE `sp_add_supplier`(IN p_supplier_id   CHAR(255),
  IN p_name          CHAR(255),
  IN p_address       CHAR(255),
  IN p_contact       CHAR(255))
BEGIN
  INSERT INTO 供应商信息(供应商编号, 名字, 地址, 联系方式)
  VALUES(p_supplier_id, p_name, p_address, p_contact);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_create_inbound
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_create_inbound`;
delimiter ;;
CREATE PROCEDURE `sp_create_inbound`(IN p_entry_id      CHAR(10),
  IN p_entry_date    CHAR(10),
  IN p_supplier_id   CHAR(255),
  IN p_product_id    CHAR(255),
  IN p_qty           INT,
  IN p_inventory_id  CHAR(255))
BEGIN
  -- 1. 入库主表
  INSERT INTO 入库信息(入库编号, 入库时间, 数量)
    VALUES(p_entry_id, p_entry_date, p_qty);

  -- 2. 商品入库明细
  INSERT INTO 商品入库(商品编号, 入库编号)
    VALUES(p_product_id, p_entry_id);

  -- 3. 供应商供货关系
  INSERT INTO 供应商供货(供应商编号, 入库编号)
    VALUES(p_supplier_id, p_entry_id);

  -- 4. **新加：记录 供应商–商品 关系到 供应商品 表（忽略已存在）**
  INSERT IGNORE INTO 供应商品 (供应商编号, 商品编号)
    VALUES (p_supplier_id, p_product_id);

  -- 5. 库存入库明细
  INSERT INTO 库存入库(入库编号, 库存编号)
    VALUES(p_entry_id, p_inventory_id);

  -- 6. 更新库存数量
  UPDATE 库存
     SET 数量 = 数量 + p_qty
   WHERE 库存编号 = p_inventory_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_create_outbound
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_create_outbound`;
delimiter ;;
CREATE PROCEDURE `sp_create_outbound`(IN p_exit_id      CHAR(10),
  IN p_exit_date    DATE,
  IN p_employee_id  CHAR(10),
  IN p_product_id   CHAR(255),
  IN p_qty          INT,
  IN p_inventory_id CHAR(255))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;
  START TRANSACTION;
    INSERT INTO 出库信息(出库编号, 数量, 时间)
      VALUES(p_exit_id, p_qty, p_exit_date);
    INSERT INTO 商品出库(出库编号, 商品编号)
      VALUES(p_exit_id, p_product_id);
    INSERT INTO 职员出货(员工编号, 出库编号)
      VALUES(p_employee_id, p_exit_id);
    INSERT INTO 库存出库(出库编号, 库存编号)
      VALUES(p_exit_id, p_inventory_id);
    UPDATE 库存
      SET 数量 = 数量 - p_qty
    WHERE 库存编号 = p_inventory_id;
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_delete_employee
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_delete_employee`;
delimiter ;;
CREATE PROCEDURE `sp_delete_employee`(IN p_employee_id CHAR(10))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;
    -- 职员出货记录
    DELETE FROM 职员出货
      WHERE 员工编号 = p_employee_id;
    -- 删除职员主表
    DELETE FROM 职员
      WHERE 员工编号 = p_employee_id;
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_delete_inventory
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_delete_inventory`;
delimiter ;;
CREATE PROCEDURE `sp_delete_inventory`(IN p_inventory_id CHAR(255))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;
    -- 库存入库明细
    DELETE FROM 库存入库
      WHERE 库存编号 = p_inventory_id;
    -- 库存出库明细
    DELETE FROM 库存出库
      WHERE 库存编号 = p_inventory_id;
    -- 删除库存主表
    DELETE FROM 库存
      WHERE 库存编号 = p_inventory_id;
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_delete_product
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_delete_product`;
delimiter ;;
CREATE PROCEDURE `sp_delete_product`(IN p_product_id CHAR(255))
BEGIN
  -- 捕获异常并回滚
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;
  START TRANSACTION;

  -- ── 删除“入库”相关依赖 ──
  DELETE sl
    FROM `库存入库` AS sl
    JOIN `商品入库` AS si
      ON sl.`入库编号` = si.`入库编号`
     AND si.`商品编号` = p_product_id;

  DELETE ss
    FROM `供应商供货` AS ss
    JOIN `商品入库` AS si
      ON ss.`入库编号` = si.`入库编号`
     AND si.`商品编号` = p_product_id;

  DELETE FROM `商品入库`
   WHERE `商品编号` = p_product_id;

  DELETE ii
    FROM `入库信息` AS ii
    WHERE ii.`入库编号` NOT IN (
      SELECT DISTINCT `入库编号` FROM `商品入库`
    );

  -- ── 删除“出库”相关依赖 ──
  DELETE se
    FROM `职员出货` AS se
    JOIN `商品出库` AS so
      ON se.`出库编号` = so.`出库编号`
     AND so.`商品编号` = p_product_id;

  DELETE sk
    FROM `库存出库` AS sk
    JOIN `商品出库` AS so
      ON sk.`出库编号` = so.`出库编号`
     AND so.`商品编号` = p_product_id;

  DELETE FROM `商品出库`
   WHERE `商品编号` = p_product_id;

  DELETE oi
    FROM `出库信息` AS oi
    WHERE oi.`出库编号` NOT IN (
      SELECT DISTINCT `出库编号` FROM `商品出库`
    );

  -- ── 清理供应–商品关联 ──
  DELETE FROM `供应商品`
   WHERE `商品编号` = p_product_id;

  -- ── 删除库存中主键等于商品编号的记录 ──
  DELETE FROM `库存`
   WHERE `库存编号` = p_product_id;

  -- ── 删除商品主表 ──
  DELETE FROM `商品`
   WHERE `商品编号` = p_product_id;

  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_delete_supplier
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_delete_supplier`;
delimiter ;;
CREATE PROCEDURE `sp_delete_supplier`(IN p_supplier_id CHAR(255))
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
  END;

  START TRANSACTION;
    -- 删除“供应商→入库单”映射
    DELETE FROM 供应商供货
      WHERE 供应商编号 = p_supplier_id;
    -- 删除“供应商→商品”映射
    DELETE FROM 供应商品
      WHERE 供应商编号 = p_supplier_id;
    -- 删除供应商主表
    DELETE FROM 供应商信息
      WHERE 供应商编号 = p_supplier_id;
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_cost
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_cost`;
delimiter ;;
CREATE PROCEDURE `sp_update_cost`(IN p_prod_id   CHAR(255),
  IN p_new_cost  DECIMAL(8,2))
BEGIN
  DECLARE old_cost DECIMAL(8,2);

  START TRANSACTION;
    -- 锁表并读取原进价
    SELECT 进价 INTO old_cost
      FROM 商品
     WHERE 商品编号 = p_prod_id
     FOR UPDATE;

    -- 更新进价
    UPDATE 商品
       SET 进价 = p_new_cost
     WHERE 商品编号 = p_prod_id;

    -- 写日志
    INSERT INTO 商品进价日志(商品编号, 原进价, 新进价, 修改时间)
    VALUES(p_prod_id, old_cost, p_new_cost, NOW());
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_price
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_price`;
delimiter ;;
CREATE PROCEDURE `sp_update_price`(IN p_prod_id    CHAR(255),
  IN p_new_price  DECIMAL(8,2))
BEGIN
  DECLARE old_price DECIMAL(8,2);

  START TRANSACTION;
    -- 锁行并读取原售价
    SELECT 售价 INTO old_price
      FROM 商品
     WHERE 商品编号 = p_prod_id
     FOR UPDATE;
    
    -- 更新商品表
    UPDATE 商品
       SET 售价 = p_new_price
     WHERE 商品编号 = p_prod_id;

    -- 写日志
    INSERT INTO 商品售价日志(商品编号, 原售价, 新售价, 修改时间)
    VALUES(p_prod_id, old_price, p_new_price, NOW());
  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_update_supplier
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_update_supplier`;
delimiter ;;
CREATE PROCEDURE `sp_update_supplier`(IN p_sup_id    CHAR(255),
  IN p_name      CHAR(255),
  IN p_address   CHAR(255),
  IN p_contact   CHAR(255),
  IN p_op_user   VARCHAR(64))
BEGIN
  DECLARE old_name    CHAR(255);
  DECLARE old_address CHAR(255);
  DECLARE old_contact CHAR(255);

  START TRANSACTION;
    -- 1. 读取原有数据
    SELECT 名字, 地址, 联系方式
      INTO old_name, old_address, old_contact
      FROM 供应商信息
     WHERE 供应商编号 = p_sup_id
     FOR UPDATE;

    -- 2. 更新主表
    UPDATE 供应商信息
       SET 名字   = p_name,
           地址   = p_address,
           联系方式 = p_contact
     WHERE 供应商编号 = p_sup_id;

    -- 3. 写日志
    INSERT INTO 供应商信息日志
      (供应商编号, 操作时间, 操作用户,
       原名字, 原地址, 原联系方式,
       新名字, 新地址, 新联系方式)
    VALUES
      (p_sup_id, NOW(), p_op_user,
       old_name, old_address, old_contact,
       p_name,  p_address,  p_contact);

  COMMIT;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 商品
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_before_insert_product`;
delimiter ;;
CREATE TRIGGER `trg_before_insert_product` BEFORE INSERT ON `商品` FOR EACH ROW BEGIN
  -- 非空检查
  IF NEW.商品编号 IS NULL OR NEW.商品编号 = '' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '商品编号不能为空';
  END IF;
  IF NEW.名称 IS NULL OR NEW.名称 = '' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '商品名称不能为空';
  END IF;
  IF NEW.分类 IS NULL OR NEW.分类 = '' THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '商品分类不能为空';
  END IF;
  -- 数值范围检查
  IF NEW.售价 <= 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '售价必须大于 0';
  END IF;
  IF NEW.进价 < 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = '进价不能为空为负';
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 商品
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_after_insert_product`;
delimiter ;;
CREATE TRIGGER `trg_after_insert_product` AFTER INSERT ON `商品` FOR EACH ROW BEGIN
  INSERT INTO 库存(库存编号, 数量, 数量上限, 数量下限)
  VALUES(NEW.商品编号, 0, 500, 0);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 库存
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_inv_prod_id_match_insert`;
delimiter ;;
CREATE TRIGGER `trg_inv_prod_id_match_insert` BEFORE INSERT ON `库存` FOR EACH ROW BEGIN
  -- 库存编号必须存在于商品表的商品编号中
  IF NOT EXISTS (
      SELECT 1 FROM `商品` WHERE `商品编号` = NEW.`库存编号`
  ) THEN
    SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = '库存编号必须对应已存在的商品编号';
  END IF;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table 库存
-- ----------------------------
DROP TRIGGER IF EXISTS `trg_inv_prod_id_match_update`;
delimiter ;;
CREATE TRIGGER `trg_inv_prod_id_match_update` BEFORE UPDATE ON `库存` FOR EACH ROW BEGIN
  -- 更新时也需校验库存编号对应商品编号
  IF NOT EXISTS (
      SELECT 1 FROM `商品` WHERE `商品编号` = NEW.`库存编号`
  ) THEN
    SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = '库存编号必须对应已存在的商品编号';
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
