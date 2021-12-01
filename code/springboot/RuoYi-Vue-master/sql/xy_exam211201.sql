/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : xy_exam

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 01/12/2021 11:31:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ex_answer_sheet
-- ----------------------------
DROP TABLE IF EXISTS `ex_answer_sheet`;
CREATE TABLE `ex_answer_sheet`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '答题卡id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `exam_id` bigint(0) NOT NULL COMMENT '考试id',
  `paper_id` bigint(0) NOT NULL COMMENT '试卷id',
  `question_id` bigint(0) NOT NULL COMMENT '题目id',
  `answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考生答案',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回答结果\r\n',
  `output` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编译输出',
  `creat_time` datetime(0) NOT NULL COMMENT '创建时间',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`, `question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '答题卡' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_answer_sheet
-- ----------------------------

-- ----------------------------
-- Table structure for ex_class
-- ----------------------------
DROP TABLE IF EXISTS `ex_class`;
CREATE TABLE `ex_class`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程简介',
  `major` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业',
  `teacher` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '授课老师',
  `students` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '学生成员数组',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_class
-- ----------------------------
INSERT INTO `ex_class` VALUES (1, '123', '<p>123123</p>', '123', '123', '123');

-- ----------------------------
-- Table structure for ex_exam
-- ----------------------------
DROP TABLE IF EXISTS `ex_exam`;
CREATE TABLE `ex_exam`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '考试ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试名称',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试描述',
  `paper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '试卷ID',
  `state` int(0) NOT NULL DEFAULT 1 COMMENT '考试状态',
  `start_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '结束时间',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `total_time` int(0) NOT NULL DEFAULT 90 COMMENT '总时长（分钟）',
  `class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程id，只匹配前8位',
  `term` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试学期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '考试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_exam
-- ----------------------------
INSERT INTO `ex_exam` VALUES (1, '2312', '123', '123', 123, '2021-12-07 00:00:00', '2021-12-01 00:00:00', '2021-12-01 10:41:46', '2021-12-01 10:41:45', 123, '123', '123');

-- ----------------------------
-- Table structure for ex_paper
-- ----------------------------
DROP TABLE IF EXISTS `ex_paper`;
CREATE TABLE `ex_paper`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试标题',
  `subject` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '科目',
  `value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '5,2,5,10,10' COMMENT '分值列表，\r\n{ 选择：  判断  填空  简答  编程   }',
  `state` int(0) NOT NULL DEFAULT 1 COMMENT '试卷状态',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_paper
-- ----------------------------
INSERT INTO `ex_paper` VALUES (1, '软件工程-操作系统-期末考试', '操作系统', '5，5，5，5，5', 1, '2021-12-01 03:42:07', '2021-12-01 11:11:49');

-- ----------------------------
-- Table structure for ex_paper_questions
-- ----------------------------
DROP TABLE IF EXISTS `ex_paper_questions`;
CREATE TABLE `ex_paper_questions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `paper_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '试卷ID',
  `qu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目ID',
  `qu_type` int(0) NOT NULL COMMENT '题目类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '试卷题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_paper_questions
-- ----------------------------
INSERT INTO `ex_paper_questions` VALUES (1, '123', '1212', 2);
INSERT INTO `ex_paper_questions` VALUES (2, '1', '2', 2);

-- ----------------------------
-- Table structure for ex_program
-- ----------------------------
DROP TABLE IF EXISTS `ex_program`;
CREATE TABLE `ex_program`  (
  `id` bigint(0) NOT NULL COMMENT '编程题id',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目文字内容',
  `question_code` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '代码内容\r\n',
  `case1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '测试用例1',
  `output1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用例输出1',
  `case2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '测试用例2',
  `output2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用例输出2',
  `case3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '测试用例3',
  `output3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用例输出3',
  `case4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '测试用例4',
  `output4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用例输出4',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '编程题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_program
-- ----------------------------

-- ----------------------------
-- Table structure for ex_questions
-- ----------------------------
DROP TABLE IF EXISTS `ex_questions`;
CREATE TABLE `ex_questions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
  `type` int(0) NOT NULL COMMENT '题目类型，选择判断填空简答编程',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目内容',
  `image` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '题目图片',
  `class_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程ID',
  `point` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '知识点',
  `answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '答案',
  `setterid` int(0) NOT NULL DEFAULT 0 COMMENT '出题人id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '题目备注',
  `analysis` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '整题解析',
  `is_delete` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `option_a` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'A选项',
  `option_b` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'B选项',
  `option_c` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'C选项',
  `option_d` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'D选项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_questions
-- ----------------------------
INSERT INTO `ex_questions` VALUES (1, 2, 'Java是一门面向过程的语言', '', '1111', 'java', 'F', 321, '2021-12-15 02:31:48', '2021-12-01 11:04:48', '无', '错误，是面向过程的', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ex_questions` VALUES (2, 3, 'JAVA的三大特性分别是继承，(    )，多态', '', '123', 'java', '封装', 123, '2021-12-01 02:39:42', '2021-12-01 11:09:10', '123', '123', 0, NULL, NULL, NULL, NULL);
INSERT INTO `ex_questions` VALUES (3, 1, '中国的首都是什么？', '', '312213', '常识', 'B', 0, '2021-12-01 02:44:21', '2021-12-01 02:51:48', '123', '321', 0, 'shanghai', 'beijing', 'hangzhou', 'ningbo');
INSERT INTO `ex_questions` VALUES (4, 4, '并发和并行的区别是什么', '', '21312', '操作系统', 'cpu的使用情况不同', 0, '2021-12-01 02:47:10', '2021-12-01 02:47:09', '时代', '1231234*******', 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ex_score
-- ----------------------------
DROP TABLE IF EXISTS `ex_score`;
CREATE TABLE `ex_score`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '成绩ID',
  `exam_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '考试ID',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `score` int(0) NOT NULL COMMENT '分数',
  `class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程id',
  `sheet_id` bigint(0) NOT NULL COMMENT '答题卡id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '成绩' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_score
-- ----------------------------
INSERT INTO `ex_score` VALUES (1, '1', '1', 221, '2', 12);

-- ----------------------------
-- Table structure for ex_wrong_questions
-- ----------------------------
DROP TABLE IF EXISTS `ex_wrong_questions`;
CREATE TABLE `ex_wrong_questions`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '错题id',
  `qu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '题目ID',
  `exam_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '考试ID',
  `wrong_answer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '错误答案',
  `user_id` int(0) NOT NULL COMMENT '学生id',
  `memo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '错题' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ex_wrong_questions
-- ----------------------------

-- ----------------------------
-- Table structure for exsys_log
-- ----------------------------
DROP TABLE IF EXISTS `exsys_log`;
CREATE TABLE `exsys_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志名称',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户ID',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名称',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'IP地址',
  `ip_region` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'IP归属地',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日志明细',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exsys_log
-- ----------------------------

-- ----------------------------
-- Table structure for exsys_role
-- ----------------------------
DROP TABLE IF EXISTS `exsys_role`;
CREATE TABLE `exsys_role`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exsys_role
-- ----------------------------

-- ----------------------------
-- Table structure for exsys_user
-- ----------------------------
DROP TABLE IF EXISTS `exsys_user`;
CREATE TABLE `exsys_user`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '头像',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `role_ids` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '角色ID列表',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `state` int(0) NOT NULL DEFAULT 0 COMMENT '状态',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '专业',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '管理用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exsys_user
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'ex_questions', '题目', NULL, NULL, 'ExQuestions', 'crud', 'com.ruoyi.system', 'questions', 'questions', '题库管理', 'wubin', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59', NULL);
INSERT INTO `gen_table` VALUES (2, 'ex_paper', '试卷', NULL, NULL, 'ExPaper', 'crud', 'com.ruoyi.system', 'exam', 'paper', '试卷管理', 'wubin', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05', NULL);
INSERT INTO `gen_table` VALUES (4, 'ex_class', '课程', NULL, NULL, 'ExClass', 'crud', 'com.ruoyi.system', 'exam', 'class', '课程管理', 'wubin', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47', NULL);
INSERT INTO `gen_table` VALUES (5, 'ex_exam', '考试', NULL, NULL, 'ExExam', 'crud', 'com.ruoyi.system', 'exam', 'examination', '考试', 'wubin', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35', NULL);
INSERT INTO `gen_table` VALUES (6, 'ex_paper_questions', '试卷题目', NULL, NULL, 'ExPaperQuestions', 'crud', 'com.ruoyi.system', 'exam', 'paperQu', '试卷题目', 'wubin', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:22:19', NULL);
INSERT INTO `gen_table` VALUES (8, 'ex_score', '成绩', NULL, NULL, 'ExScore', 'crud', 'com.ruoyi.system', 'exam', 'score', '成绩管理', 'wubin', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '题目ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (2, '1', 'type', '题目类型，选择判断填空简答编程', 'int', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 2, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (3, '1', 'content', '题目内容', 'varchar(2000)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (4, '1', 'image', '题目图片', 'varchar(500)', 'String', 'image', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'imageUpload', '', 4, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (5, '1', 'class_id', '课程ID', 'varchar(32)', 'String', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (6, '1', 'point', '知识点', 'varchar(32)', 'String', 'point', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (7, '1', 'answer', '答案', 'varchar(2000)', 'String', 'answer', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (8, '1', 'setterid', '出题人id', 'int', 'Long', 'setterid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (9, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (10, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (11, '1', 'remark', '题目备注', 'varchar(255)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (12, '1', 'analysis', '整题解析', 'varchar(2000)', 'String', 'analysis', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (13, '1', 'is_delete', '是否删除', 'tinyint', 'Long', 'isDelete', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (14, '1', 'option_a', 'A选项', 'varchar(100)', 'String', 'optionA', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (15, '1', 'option_b', 'B选项', 'varchar(100)', 'String', 'optionB', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (16, '1', 'option_c', 'C选项', 'varchar(100)', 'String', 'optionC', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (17, '1', 'option_d', 'D选项', 'varchar(100)', 'String', 'optionD', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2021-12-01 02:20:42', '', '2021-12-01 02:23:59');
INSERT INTO `gen_table_column` VALUES (18, '2', 'id', '试卷ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (19, '2', 'title', '考试标题', 'varchar(64)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (20, '2', 'subject', '科目', 'varchar(32)', 'String', 'subject', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (21, '2', 'value', '分值列表，\r\n{ 选择：  判断  填空  简答  编程   }', 'varchar(128)', 'String', 'value', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (22, '2', 'state', '试卷状态', 'int', 'Long', 'state', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (23, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, '1', 'EQ', 'datetime', '', 6, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (24, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, '1', 'EQ', 'datetime', '', 7, 'admin', '2021-12-01 02:52:04', '', '2021-12-01 02:53:05');
INSERT INTO `gen_table_column` VALUES (35, '4', 'id', '课程ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47');
INSERT INTO `gen_table_column` VALUES (36, '4', 'class_name', '课程名', 'varchar(32)', 'String', 'className', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47');
INSERT INTO `gen_table_column` VALUES (37, '4', 'content', '课程简介', 'varchar(255)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47');
INSERT INTO `gen_table_column` VALUES (38, '4', 'major', '专业', 'varchar(64)', 'String', 'major', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47');
INSERT INTO `gen_table_column` VALUES (39, '4', 'teacher', '授课老师', 'varchar(64)', 'String', 'teacher', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47');
INSERT INTO `gen_table_column` VALUES (40, '4', 'students', '学生成员数组', 'varchar(2000)', 'String', 'students', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:30:47');
INSERT INTO `gen_table_column` VALUES (41, '5', 'id', '考试ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (42, '5', 'title', '考试名称', 'varchar(255)', 'String', 'title', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (43, '5', 'content', '考试描述', 'varchar(255)', 'String', 'content', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'editor', '', 3, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (44, '5', 'paper_id', '试卷ID', 'varchar(64)', 'String', 'paperId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (45, '5', 'state', '考试状态', 'int', 'Long', 'state', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (46, '5', 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (47, '5', 'end_time', '结束时间', 'datetime', 'Date', 'endTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (48, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (49, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (50, '5', 'total_time', '总时长（分钟）', 'int', 'Long', 'totalTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (51, '5', 'class_id', '课程id，只匹配前8位', 'varchar(64)', 'String', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (52, '5', 'term', '考试学期', 'varchar(64)', 'String', 'term', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:32:35');
INSERT INTO `gen_table_column` VALUES (53, '6', 'id', 'ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:22:19');
INSERT INTO `gen_table_column` VALUES (54, '6', 'paper_id', '试卷ID', 'varchar(64)', 'String', 'paperId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:22:19');
INSERT INTO `gen_table_column` VALUES (55, '6', 'qu_id', '题目ID', 'varchar(64)', 'String', 'quId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:22:19');
INSERT INTO `gen_table_column` VALUES (56, '6', 'qu_type', '题目类型', 'int', 'Long', 'quType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:22:19');
INSERT INTO `gen_table_column` VALUES (68, '8', 'id', '成绩ID', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15');
INSERT INTO `gen_table_column` VALUES (69, '8', 'exam_id', '考试ID', 'varchar(64)', 'String', 'examId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15');
INSERT INTO `gen_table_column` VALUES (70, '8', 'user_id', '用户ID', 'varchar(64)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15');
INSERT INTO `gen_table_column` VALUES (71, '8', 'score', '分数', 'int', 'Long', 'score', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15');
INSERT INTO `gen_table_column` VALUES (72, '8', 'class_id', '课程id', 'varchar(64)', 'String', 'classId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15');
INSERT INTO `gen_table_column` VALUES (73, '8', 'sheet_id', '答题卡id', 'bigint', 'Long', 'sheetId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-01 10:17:18', '', '2021-12-01 10:33:15');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D71F79DE878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D71F79DE878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017D71F79DE878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-NMBVAM31638328115597', 1638329499799, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1638328120000, -1, 5, 'PAUSED', 'CRON', 1638328115000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1638328125000, -1, 5, 'PAUSED', 'CRON', 1638328116000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1638328120000, -1, 5, 'PAUSED', 'CRON', 1638328116000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-12-01 01:49:52', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-12-01 01:49:52', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-12-01 01:49:52', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-12-01 01:49:52', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-12-01 01:49:52', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-12-01 01:49:47', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-12-01 01:49:52', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-12-01 01:49:51', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-12-01 01:49:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-12-01 01:49:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-12-01 01:49:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 02:17:01');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 03:06:18');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 03:40:37');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-12-01 10:11:24');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2000 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-12-01 01:49:49', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-12-01 01:49:49', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-12-01 01:49:49', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-12-01 01:49:49', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-12-01 01:49:49', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-12-01 01:49:49', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-12-01 01:49:49', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-12-01 01:49:49', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-12-01 01:49:49', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-12-01 01:49:49', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-12-01 01:49:49', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-12-01 01:49:49', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-12-01 01:49:49', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-12-01 01:49:49', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-12-01 01:49:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '考试管理', 0, 1, 'exam', NULL, NULL, 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2021-12-01 02:17:57', 'admin', '2021-12-01 02:18:18', '');
INSERT INTO `sys_menu` VALUES (2001, '题目管理', 2000, 1, 'questions', 'exam/questions/index', '', 1, 0, 'C', '0', '0', 'exam:questions:list', 'clipboard', 'admin', '2021-12-01 02:18:53', 'admin', '2021-12-01 02:47:54', '');
INSERT INTO `sys_menu` VALUES (2002, '试卷管理', 2000, 2, 'paper', 'exam/paper/index', NULL, 1, 0, 'C', '0', '0', 'exam:paper:list', 'checkbox', 'admin', '2021-12-01 02:56:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '试卷题目', 2000, 3, 'paperQu', 'exam/paperQu/index', NULL, 1, 0, 'C', '0', '0', 'exam:paperQu:list', 'language', 'admin', '2021-12-01 10:25:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '课程管理', 2000, 4, 'class', 'exam/class/index', NULL, 1, 0, 'C', '0', '0', 'exam:class:list', 'date', 'admin', '2021-12-01 10:35:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '成绩管理', 2000, 5, 'score', 'exam/score/index', NULL, 1, 0, 'C', '0', '0', 'exam:score:list', 'edit', 'admin', '2021-12-01 10:35:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '考试管理', 2000, 6, 'examination', 'exam/examination/index', NULL, 1, 0, 'C', '0', '0', 'exam:examination:list', 'education', 'admin', '2021-12-01 10:37:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '考试入口', 0, 3, 'examPage', 'examPage/index', NULL, 1, 0, 'C', '0', '0', 'examPage:list', 'example', 'admin', '2021-12-01 11:19:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-12-01 01:49:53', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-12-01 01:49:53', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"1\",\"menuName\":\"考试管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"1\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:17:58');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"1\",\"menuName\":\"考试管理\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"exam\",\"children\":[],\"createTime\":1638296277000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:18:18');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"1\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"题目管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"1\",\"component\":\"1\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:18:53');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"1\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"题目管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"exam/question/index\",\"component\":\"1\",\"children\":[],\"createTime\":1638296333000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"exam:question:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:19:56');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"题目管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"question\",\"component\":\"exam/question/index\",\"children\":[],\"createTime\":1638296333000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"exam:question:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:20:18');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ex_questions', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:20:42');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"题目管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"questions\",\"component\":\"exam/questions/index\",\"children\":[],\"createTime\":1638296333000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"exam:questions:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:21:26');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"wubin\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"题目ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638296442000,\"tableId\":1,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"题目类型，选择判断填空简答编程\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638296442000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"type\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"htmlType\":\"editor\",\"edit\":true,\"query\":true,\"columnComment\":\"题目内容\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(2000)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638296442000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"content\"},{\"capJavaField\":\"Image\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"image\",\"htmlType\":\"imageUpload\",\"edit\":true,\"query\":true,\"columnComment\":\"题目图片\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(500)\",\"c', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:23:59');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-01 02:24:02');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"题目管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"questions\",\"component\":\"questions/questions/index\",\"children\":[],\"createTime\":1638296333000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"questions:questions:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:29:41');
INSERT INTO `sys_oper_log` VALUES (110, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2021/12/01/9e92b44b-9f77-4a69-9d6f-8d2419df1c8a.jpg\",\"isDelete\":0,\"optionC\":\"3\",\"optionD\":\"4\",\"optionA\":\"1\",\"remark\":\"aaa\",\"optionB\":\"2\",\"analysis\":\"wdqw\",\"params\":{},\"content\":\"<p>123123</p>\",\"point\":\"123123\",\"classId\":\"123123123\",\"answer\":\"21332\",\"createTime\":1638297023965,\"setterid\":1231231231}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( content,             image,             class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete,             option_a,             option_b,             option_c,             option_d )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2021-12-01 02:30:24');
INSERT INTO `sys_oper_log` VALUES (111, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"/profile/upload/2021/12/01/9e92b44b-9f77-4a69-9d6f-8d2419df1c8a.jpg,/profile/upload/2021/12/01/e546980c-454e-4112-92ca-974e984ce1b8.jpg\",\"isDelete\":0,\"optionC\":\"3\",\"optionD\":\"4\",\"optionA\":\"1\",\"remark\":\"aaa\",\"optionB\":\"2\",\"analysis\":\"wdqw\",\"params\":{},\"content\":\"<p>123123</p>\",\"point\":\"123123\",\"classId\":\"123123123\",\"answer\":\"21332\",\"createTime\":1638297032259,\"setterid\":1231231231}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( content,             image,             class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete,             option_a,             option_b,             option_c,             option_d )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2021-12-01 02:30:32');
INSERT INTO `sys_oper_log` VALUES (112, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":123,\"remark\":\"321\",\"analysis\":\"123\",\"params\":{},\"content\":\"<p>321</p>\",\"point\":\"123\",\"classId\":\"\",\"answer\":\"123\",\"createTime\":1638297315195,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( content,                                       point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2021-12-01 02:35:15');
INSERT INTO `sys_oper_log` VALUES (113, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":123,\"remark\":\"321\",\"analysis\":\"123\",\"params\":{},\"content\":\"<p>321</p>\",\"point\":\"123\",\"classId\":\"\",\"answer\":\"123\",\"createTime\":1638297331841,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( content,                                       point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2021-12-01 02:35:31');
INSERT INTO `sys_oper_log` VALUES (114, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":321,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>312</p>\",\"point\":\"123\",\"classId\":\"2\",\"answer\":\"123\",\"createTime\":1638297472661,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( type,             content,                          class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\n; Data truncation: Out of range value for column \'is_delete\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1', '2021-12-01 02:37:52');
INSERT INTO `sys_oper_log` VALUES (115, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":321,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>312</p>\",\"point\":\"123\",\"classId\":\"2\",\"answer\":\"123\",\"createTime\":1638297491219,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( type,             content,                          class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\n; Data truncation: Out of range value for column \'is_delete\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1', '2021-12-01 02:38:11');
INSERT INTO `sys_oper_log` VALUES (116, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":321,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>312</p>\",\"point\":\"123\",\"classId\":\"2\",\"answer\":\"123\",\"createTime\":1638297512059,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( type,             content,                          class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\n; Data truncation: Out of range value for column \'is_delete\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1', '2021-12-01 02:38:32');
INSERT INTO `sys_oper_log` VALUES (117, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":321,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>312</p>\",\"point\":\"123\",\"classId\":\"2\",\"answer\":\"123\",\"createTime\":1638297515669,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( type,             content,                          class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\n; Data truncation: Out of range value for column \'is_delete\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1', '2021-12-01 02:38:35');
INSERT INTO `sys_oper_log` VALUES (118, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":321,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>312</p>\",\"point\":\"123\",\"classId\":\"2\",\"answer\":\"123\",\"createTime\":1638297528763,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( type,             content,                          class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\n; Data truncation: Out of range value for column \'is_delete\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1', '2021-12-01 02:38:48');
INSERT INTO `sys_oper_log` VALUES (119, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":321,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>312</p>\",\"point\":\"123\",\"classId\":\"2\",\"answer\":\"123\",\"createTime\":1638297530137,\"setterid\":123}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\questions\\ExQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExQuestionsMapper.insertExQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_questions          ( type,             content,                          class_id,             point,             answer,             setterid,             create_time,                          remark,             analysis,             is_delete )           values ( ?,             ?,                          ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1\n; Data truncation: Out of range value for column \'is_delete\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Out of range value for column \'is_delete\' at row 1', '2021-12-01 02:38:50');
INSERT INTO `sys_oper_log` VALUES (120, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"isDelete\":0,\"remark\":\"123\",\"analysis\":\"123\",\"params\":{},\"type\":2,\"content\":\"<p>123</p>\",\"point\":\"123\",\"classId\":\"123\",\"answer\":\"312\",\"createTime\":1638297582155,\"setterid\":123,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:39:42');
INSERT INTO `sys_oper_log` VALUES (121, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"optionC\":\"hangzhou\",\"optionD\":\"ningbo\",\"optionA\":\"shanghai\",\"remark\":\"123\",\"optionB\":\"beijing\",\"analysis\":\"321\",\"params\":{},\"type\":1,\"content\":\"中国的首都是什么？\",\"point\":\"常识\",\"classId\":\"312213\",\"answer\":\"B\",\"createTime\":1638297860768,\"id\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:44:20');
INSERT INTO `sys_oper_log` VALUES (122, '题库管理', 1, 'com.ruoyi.system.controller.ExQuestionsController.add()', 'POST', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"remark\":\"时代\",\"analysis\":\"1231234*******\",\"params\":{},\"type\":4,\"content\":\"并发和并行的区别是什么\",\"point\":\"操作系统\",\"classId\":\"21312\",\"answer\":\"cpu的使用情况不同\",\"createTime\":1638298029510,\"id\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:47:09');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"query\":\"\",\"icon\":\"clipboard\",\"orderNum\":\"1\",\"menuName\":\"题目管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"questions\",\"component\":\"exam/questions/index\",\"children\":[],\"createTime\":1638296333000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"C\",\"perms\":\"exam:questions:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:47:54');
INSERT INTO `sys_oper_log` VALUES (124, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"optionC\":\"hangzhou\",\"optionD\":\"ningbo\",\"optionA\":\"shanghai\",\"remark\":\"123\",\"updateTime\":1638298307574,\"optionB\":\"beijing\",\"analysis\":\"321\",\"params\":{},\"type\":1,\"content\":\"中国的首都是什么？\",\"point\":\"常识\",\"classId\":\"312213\",\"answer\":\"B\",\"createTime\":1638297861000,\"setterid\":0,\"id\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:51:47');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ex_paper', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:52:04');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"wubin\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"试卷ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638298324000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":19,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"考试标题\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638298324000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Subject\",\"usableColumn\":false,\"columnId\":20,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"subject\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"科目\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638298324000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"subject\"},{\"capJavaField\":\"Value\",\"usableColumn\":false,\"columnId\":21,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"value\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分值列表，\\r\\n{ 选择：  判断  填空  简答  编程   }\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"colum', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:53:05');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-01 02:53:08');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":\"2\",\"menuName\":\"试卷管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"paper\",\"component\":\"exam/paper/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exam:paper:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 02:56:20');
INSERT INTO `sys_oper_log` VALUES (129, '试卷管理', 1, 'com.ruoyi.system.controller.ExPaperController.add()', 'POST', 1, 'admin', NULL, '/exam/paper', '127.0.0.1', '内网IP', '{\"createTime\":1638301327365,\"subject\":\"2\",\"id\":1,\"state\":11,\"params\":{},\"title\":\"1\",\"value\":\"21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 03:42:07');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2', '127.0.0.1', '内网IP', '{menuId=2}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-12-01 10:12:25');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{menuId=111}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-12-01 10:12:32');
INSERT INTO `sys_oper_log` VALUES (132, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1638294588000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,3,114,115,1055,1058,1056,1057,1059,1060,116,4],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:12:49');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/113', '127.0.0.1', '内网IP', '{menuId=113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:12:55');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/112', '127.0.0.1', '内网IP', '{menuId=112}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:12:57');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/111', '127.0.0.1', '内网IP', '{menuId=111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:00');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-12-01 10:13:03');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1049', '127.0.0.1', '内网IP', '{menuId=1049}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:06');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1050', '127.0.0.1', '内网IP', '{menuId=1050}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:08');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1051', '127.0.0.1', '内网IP', '{menuId=1051}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:11');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1052', '127.0.0.1', '内网IP', '{menuId=1052}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:12');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1053', '127.0.0.1', '内网IP', '{menuId=1053}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:14');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1054', '127.0.0.1', '内网IP', '{menuId=1054}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:15');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/110', '127.0.0.1', '内网IP', '{menuId=110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:17');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1046', '127.0.0.1', '内网IP', '{menuId=1046}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:20');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1047', '127.0.0.1', '内网IP', '{menuId=1047}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:21');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1048', '127.0.0.1', '内网IP', '{menuId=1048}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:23');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/109', '127.0.0.1', '内网IP', '{menuId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:27');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2', '127.0.0.1', '内网IP', '{menuId=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:13:29');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1021', '127.0.0.1', '内网IP', '{menuId=1021}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-12-01 10:14:26');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'ex_exam,ex_class,ex_paper_questions,ex_score,ex_program,ex_answer_sheet', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:17:18');
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:17:22');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:17:29');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"wubin\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":53,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638325038000,\"tableId\":6,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"PaperId\",\"usableColumn\":false,\"columnId\":54,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"试卷ID\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"paper_id\"},{\"capJavaField\":\"QuId\",\"usableColumn\":false,\"columnId\":55,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"quId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"题目ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":6,\"pk\":false,\"columnName\":\"qu_id\"},{\"capJavaField\":\"QuType\",\"usableColumn\":false,\"columnId\":56,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"quType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"题目类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:22:19');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-01 10:22:22');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"language\",\"orderNum\":\"3\",\"menuName\":\"试卷题目\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"paperQu\",\"component\":\"exam/paperQu/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exam:paperQu:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:25:09');
INSERT INTO `sys_oper_log` VALUES (156, '试卷题目', 1, 'com.ruoyi.system.controller.ExPaperQuestionsController.add()', 'POST', 1, 'admin', NULL, '/exam/paperQu', '127.0.0.1', '内网IP', '{\"quId\":\"5\",\"params\":{},\"paperId\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'qu_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Home\\Desktop\\XY_Exam\\XY_exam\\code\\springboot\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\exam\\ExPaperQuestionsMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.ExPaperQuestionsMapper.insertExPaperQuestions-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into ex_paper_questions          ( paper_id,             qu_id )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'qu_type\' doesn\'t have a default value\n; Field \'qu_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'qu_type\' doesn\'t have a default value', '2021-12-01 10:26:54');
INSERT INTO `sys_oper_log` VALUES (157, '试卷题目', 1, 'com.ruoyi.system.controller.ExPaperQuestionsController.add()', 'POST', 1, 'admin', NULL, '/exam/paperQu', '127.0.0.1', '内网IP', '{\"quType\":2,\"quId\":\"1212\",\"id\":1,\"params\":{},\"paperId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:28:11');
INSERT INTO `sys_oper_log` VALUES (158, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"wubin\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":35,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"课程ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638325038000,\"tableId\":4,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ClassName\",\"usableColumn\":false,\"columnId\":36,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"className\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"课程名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"class_name\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":37,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"htmlType\":\"editor\",\"edit\":true,\"query\":true,\"columnComment\":\"课程简介\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"content\"},{\"capJavaField\":\"Major\",\"usableColumn\":false,\"columnId\":38,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"major\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"专业\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varcha', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:30:47');
INSERT INTO `sys_oper_log` VALUES (159, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"wubin\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"考试ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638325038000,\"tableId\":5,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"Title\",\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"title\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"考试名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"title\"},{\"capJavaField\":\"Content\",\"usableColumn\":false,\"columnId\":43,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"content\",\"htmlType\":\"editor\",\"edit\":true,\"query\":true,\"columnComment\":\"考试描述\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":5,\"pk\":false,\"columnName\":\"content\"},{\"capJavaField\":\"PaperId\",\"usableColumn\":false,\"columnId\":44,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"paperId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"试卷ID\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:32:35');
INSERT INTO `sys_oper_log` VALUES (160, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"wubin\",\"columns\":[{\"capJavaField\":\"Id\",\"usableColumn\":false,\"columnId\":68,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"成绩ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1638325038000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"capJavaField\":\"ExamId\",\"usableColumn\":false,\"columnId\":69,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"examId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"考试ID\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"exam_id\"},{\"capJavaField\":\"UserId\",\"usableColumn\":false,\"columnId\":70,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户ID\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1638325038000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"user_id\"},{\"capJavaField\":\"Score\",\"usableColumn\":false,\"columnId\":71,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"score\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"分数\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int\",\"createBy\":\"admin', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:33:15');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-01 10:33:21');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-01 10:33:22');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2021-12-01 10:33:22');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"date\",\"orderNum\":\"4\",\"menuName\":\"课程管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"class\",\"component\":\"exam/class/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exam:class:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:35:02');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"edit\",\"orderNum\":\"5\",\"menuName\":\"成绩管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"score\",\"component\":\"exam/score/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exam:score:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:35:51');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"education\",\"orderNum\":\"6\",\"menuName\":\"考试管理\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"examination\",\"component\":\"exam/examination/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"exam:examination:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:37:08');
INSERT INTO `sys_oper_log` VALUES (167, '课程管理', 1, 'com.ruoyi.system.controller.ExClassController.add()', 'POST', 1, 'admin', NULL, '/exam/class', '127.0.0.1', '内网IP', '{\"students\":\"123\",\"className\":\"123\",\"params\":{},\"content\":\"<p>123123</p>\",\"teacher\":\"123\",\"major\":\"123\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:39:48');
INSERT INTO `sys_oper_log` VALUES (168, '成绩管理', 1, 'com.ruoyi.system.controller.ExScoreController.add()', 'POST', 1, 'admin', NULL, '/exam/score', '127.0.0.1', '内网IP', '{\"params\":{},\"userId\":\"1\",\"score\":221,\"classId\":\"2\",\"examId\":\"1\",\"sheetId\":12,\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:40:47');
INSERT INTO `sys_oper_log` VALUES (169, '考试', 1, 'com.ruoyi.system.controller.ExExamController.add()', 'POST', 1, 'admin', NULL, '/exam/examination', '127.0.0.1', '内网IP', '{\"totalTime\":123,\"params\":{},\"title\":\"2312\",\"content\":\"123\",\"classId\":\"123\",\"createTime\":1638326505625,\"startTime\":1638806400000,\"term\":\"123\",\"endTime\":1638288000000,\"id\":1,\"state\":123,\"paperId\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 10:41:45');
INSERT INTO `sys_oper_log` VALUES (170, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"remark\":\"无\",\"updateTime\":1638327887721,\"analysis\":\"错误，是面向过程的\",\"params\":{},\"type\":2,\"content\":\"Java是一门面向过程的语言\",\"point\":\"java\",\"classId\":\"1111\",\"answer\":\"F\",\"createTime\":1639506708000,\"setterid\":321,\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:04:47');
INSERT INTO `sys_oper_log` VALUES (171, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"remark\":\"123\",\"updateTime\":1638327957827,\"analysis\":\"123\",\"params\":{},\"type\":3,\"content\":\"JAVA的三大特性分别是继承，(  )\",\"point\":\"123\",\"classId\":\"123\",\"answer\":\"312\",\"createTime\":1638297582000,\"setterid\":123,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:05:57');
INSERT INTO `sys_oper_log` VALUES (172, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"remark\":\"123\",\"updateTime\":1638328015210,\"analysis\":\"123\",\"params\":{},\"type\":3,\"content\":\"JAVA的三大特性分别是继承，(  )，多态\",\"point\":\"java\",\"classId\":\"123\",\"answer\":\"封装\",\"createTime\":1638297582000,\"setterid\":123,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:06:55');
INSERT INTO `sys_oper_log` VALUES (173, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"remark\":\"123\",\"updateTime\":1638328073743,\"analysis\":\"123\",\"params\":{},\"type\":3,\"content\":\"JAVA的三大特性分别是继承，(    )，多态\",\"point\":\"java\",\"classId\":\"123\",\"answer\":\"封装\",\"createTime\":1638297582000,\"setterid\":123,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:07:53');
INSERT INTO `sys_oper_log` VALUES (174, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"remark\":\"123\",\"updateTime\":1638328135876,\"analysis\":\"123\",\"params\":{},\"type\":3,\"content\":\"JAVA的三大特性分别是继承，(    )，多态\",\"point\":\"JAVA\",\"classId\":\"123\",\"answer\":\"封装\",\"createTime\":1638297582000,\"setterid\":123,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:08:55');
INSERT INTO `sys_oper_log` VALUES (175, '题库管理', 2, 'com.ruoyi.system.controller.ExQuestionsController.edit()', 'PUT', 1, 'admin', NULL, '/questions/questions', '127.0.0.1', '内网IP', '{\"image\":\"\",\"isDelete\":0,\"remark\":\"123\",\"updateTime\":1638328149591,\"analysis\":\"123\",\"params\":{},\"type\":3,\"content\":\"JAVA的三大特性分别是继承，(    )，多态\",\"point\":\"java\",\"classId\":\"123\",\"answer\":\"封装\",\"createTime\":1638297582000,\"setterid\":123,\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:09:09');
INSERT INTO `sys_oper_log` VALUES (176, '试卷管理', 2, 'com.ruoyi.system.controller.ExPaperController.edit()', 'PUT', 1, 'admin', NULL, '/exam/paper', '127.0.0.1', '内网IP', '{\"createTime\":1638301327000,\"subject\":\"操作系统\",\"updateTime\":1638328309377,\"id\":1,\"state\":1,\"params\":{},\"title\":\"软件工程-操作系统-期末考试\",\"value\":\"5，5，5，5，5\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:11:49');
INSERT INTO `sys_oper_log` VALUES (177, '试卷题目', 1, 'com.ruoyi.system.controller.ExPaperQuestionsController.add()', 'POST', 1, 'admin', NULL, '/exam/paperQu', '127.0.0.1', '内网IP', '{\"quType\":2,\"quId\":\"2\",\"id\":2,\"params\":{},\"paperId\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:13:13');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"example\",\"orderNum\":\"3\",\"menuName\":\"考试入口\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"examPage\",\"component\":\"examPage/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"examPage:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:19:46');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-12-01 11:19:57');
INSERT INTO `sys_oper_log` VALUES (180, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1638294588000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:18');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:23');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2021-12-01 11:23:31');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1017', '127.0.0.1', '内网IP', '{menuId=1017}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:35');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1018', '127.0.0.1', '内网IP', '{menuId=1018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:36');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1019', '127.0.0.1', '内网IP', '{menuId=1019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:38');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1020', '127.0.0.1', '内网IP', '{menuId=1020}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:39');
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1021', '127.0.0.1', '内网IP', '{menuId=1021}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:44');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1022', '127.0.0.1', '内网IP', '{menuId=1022}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:45');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1023', '127.0.0.1', '内网IP', '{menuId=1023}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:46');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1024', '127.0.0.1', '内网IP', '{menuId=1024}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:48');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/1025', '127.0.0.1', '内网IP', '{menuId=1025}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:50');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/104', '127.0.0.1', '内网IP', '{menuId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:52');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/103', '127.0.0.1', '内网IP', '{menuId=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-01 11:23:55');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-12-01 01:49:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-12-01 01:49:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-12-01 01:49:47', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-12-01 01:49:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-12-01 01:49:48', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-12-01 01:49:48', 'admin', '2021-12-01 11:23:18', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-12-01 10:11:24', 'admin', '2021-12-01 01:49:47', '', '2021-12-01 10:11:24', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-12-01 01:49:47', 'admin', '2021-12-01 01:49:47', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
