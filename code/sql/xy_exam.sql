/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : xy_exam

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 12/11/2021 12:10:23
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `ex_questions` VALUES (1, 1, '123213123', '', '', '操作系统', '略', 0, '2021-11-10 10:10:19', '2021-11-10 10:10:23', '123', '123', 0, '123', '321', '11', '22');

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
-- Table structure for sys_log

-- ----------------------------
-- Records of sys_user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
