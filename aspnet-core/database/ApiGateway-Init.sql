/*
 Navicat Premium Data Transfer

 Source Server         : 28 mysql
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : 127.0.0.1:3306
 Source Schema         : apigateway

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 05/11/2021 09:45:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for __efmigrationshistory
-- ----------------------------
DROP TABLE IF EXISTS `__efmigrationshistory`;
CREATE TABLE `__efmigrationshistory`  (
  `MigrationId` varchar(95) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`MigrationId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of __efmigrationshistory
-- ----------------------------
INSERT INTO `__efmigrationshistory` VALUES ('20200513034946_Migration-ApiGateway-MySql', '3.1.3');
INSERT INTO `__efmigrationshistory` VALUES ('20200513111130_Rename-Router-To-RouteGroup', '3.1.3');
INSERT INTO `__efmigrationshistory` VALUES ('20200618090102_Modify-ReRoute-Index-Unique', '3.1.4');
INSERT INTO `__efmigrationshistory` VALUES ('20200908020925_Upgrade-abp-3.1.0', '3.1.7');

-- ----------------------------
-- Table structure for apa.published
-- ----------------------------
DROP TABLE IF EXISTS `apa.published`;
CREATE TABLE `apa.published`  (
  `Id` bigint(20) NOT NULL,
  `Version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Retries` int(11) NULL DEFAULT NULL,
  `Added` datetime(0) NOT NULL,
  `ExpiresAt` datetime(0) NULL DEFAULT NULL,
  `StatusName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_ExpiresAt`(`ExpiresAt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of apa.published
-- ----------------------------

-- ----------------------------
-- Table structure for apa.received
-- ----------------------------
DROP TABLE IF EXISTS `apa.received`;
CREATE TABLE `apa.received`  (
  `Id` bigint(20) NOT NULL,
  `Version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Name` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `Retries` int(11) NULL DEFAULT NULL,
  `Added` datetime(0) NOT NULL,
  `ExpiresAt` datetime(0) NULL DEFAULT NULL,
  `StatusName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_ExpiresAt`(`ExpiresAt`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for appapigatewayaggregate
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayaggregate`;
CREATE TABLE `appapigatewayaggregate`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AppId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ReRouteId` bigint(20) NOT NULL,
  `ReRouteKeys` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpstreamPathTemplate` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpstreamHost` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReRouteIsCaseSensitive` tinyint(1) NOT NULL DEFAULT 0,
  `Aggregator` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Priority` int(11) NULL DEFAULT NULL,
  `UpstreamHttpMethod` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayaggregate
-- ----------------------------
INSERT INTO `appapigatewayaggregate` VALUES (5, '{}', '2ac8c1ba3c4a4237a0bcbb32e94f39d0', 'TEST-APP', 'abp接口代理服务', 1263083077348196352, 'platform-api-definition,backend-admin-api-definition,messages-api-definition,apigateway-api-definition,identity-server-api-definition,localization-api-definition,', '/api/abp/api-definition', '', 1, 'AbpApiDefinitionAggregator', NULL, '');
INSERT INTO `appapigatewayaggregate` VALUES (6, '{}', '6998c8498dff43b98b691396cf134155', 'TEST-APP', 'abp框架配置', 1263102116090970112, 'apigateway-configuration,platform-configuration,backend-admin-configuration,messages-configuration,identity-server-configuration,', '/api/abp/application-configuration', '', 1, 'AbpApiDefinitionAggregator', NULL, '');
INSERT INTO `appapigatewayaggregate` VALUES (8, '{}', 'edc962f7e0844bb09cb0fb731f358b4b', 'TEST-APP', '我的消息订阅', 1322503807309881344, 'assignables-notifilers,my-subscribes,', '/api/my-subscribes/assignables-notifilers', '', 1, 'AbpApiDefinitionAggregator', NULL, '');
INSERT INTO `appapigatewayaggregate` VALUES (9, '{}', '2265e9f270364b3f9c31afef52853203', 'TEST-APP', '全局设置', 1329708867127799808, 'setting-global,wechat-setting-global,aliyun-setting-global,oss-management-global,', '/api/setting-management/settings/by-global', '', 1, 'AbpApiDefinitionAggregator', NULL, '');
INSERT INTO `appapigatewayaggregate` VALUES (10, '{}', '47a65aba264d402ba2c0b1e068979611', 'TEST-APP', '当前租户设置', 1329709265255329792, 'setting-current-tenant,wechat-setting-current-tenant,aliyun-setting-current-tenant,oss-management-current-tenant,', '/api/setting-management/settings/by-current-tenant', '', 1, 'AbpApiDefinitionAggregator', NULL, '');

-- ----------------------------
-- Table structure for appapigatewayaggregateconfig
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayaggregateconfig`;
CREATE TABLE `appapigatewayaggregateconfig`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NOT NULL,
  `ReRouteKey` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Parameter` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `JsonPath` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AggregateReRouteId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppApiGatewayAggregateConfig_AggregateReRouteId`(`AggregateReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayAggregateConfig_AppApiGatewayAggregate_Aggregat~` FOREIGN KEY (`AggregateReRouteId`) REFERENCES `appapigatewayaggregate` (`Id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayaggregateconfig
-- ----------------------------
INSERT INTO `appapigatewayaggregateconfig` VALUES (1, 1418025237863149568, 'fff', NULL, NULL, 11);
INSERT INTO `appapigatewayaggregateconfig` VALUES (2, 1418025237863149568, 'sss', NULL, NULL, 11);
INSERT INTO `appapigatewayaggregateconfig` VALUES (3, 1418025237863149568, '242424', '', '', 11);
INSERT INTO `appapigatewayaggregateconfig` VALUES (4, 1420228420337348608, 'sss', 'ds', 'f', 12);

-- ----------------------------
-- Table structure for appapigatewayauthoptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayauthoptions`;
CREATE TABLE `appapigatewayauthoptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NOT NULL,
  `AuthenticationProviderKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AllowedScopes` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayAuthOptions_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayAuthOptions_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayauthoptions
-- ----------------------------
INSERT INTO `appapigatewayauthoptions` VALUES (3, 1261299170387169280, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (4, 1261585859064872960, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (5, 1261586605810368512, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (6, 1261587558609436672, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (7, 1261588213298348032, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (8, 1261588367619375104, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (9, 1261588628450557952, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (10, 1261588881564221440, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (11, 1261588983053795328, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (12, 1261589139039961088, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (13, 1261589197483393024, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (14, 1261589278857084928, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (15, 1261589420356124672, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (16, 1261589960393736192, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (17, 1261606600242085888, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (18, 1261606689601732608, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (21, 1262220447629058048, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (22, 1262230734939758592, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (23, 1262296916350869504, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (24, 1262632376348594176, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (25, 1262632791869902848, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (28, 1262660336921235456, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (29, 1262660528277966848, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (30, 1262660706875625472, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (31, 1262660966393991168, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (32, 1262661109474283520, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (33, 1262663888804663296, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (34, 1262664024096133120, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (35, 1262664186252120064, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (36, 1262664357044178944, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (37, 1262664632928718848, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (38, 1262664751409418240, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (39, 1262664871274237952, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (40, 1262665026111164416, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (41, 1262665159905267712, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (42, 1262665329829105664, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (43, 1262665456471920640, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (44, 1262665628165754880, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (45, 1262666172682883072, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (47, 1262723402331885568, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (48, 1262935771746734080, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (49, 1262935906522304512, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (52, 1263074419073593344, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (53, 1263075249394790400, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (54, 1263075593499684864, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (56, 1263101898440146944, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (57, 1263303878648569856, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (58, 1263304204797648896, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (59, 1263304872891555840, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (60, 1263305106250047488, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (61, 1263305244594970624, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (62, 1263305430536855552, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (63, 1263639172959174656, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (64, 1264799968944640000, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (65, 1264800070161584128, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (66, 1267360794414161920, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (67, 1267383367629807616, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (68, 1267817055527632896, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (69, 1267817221286526976, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (70, 1268893687085518848, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (94, 1288657613998579712, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (95, 1288657941770854400, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (96, 1288658134067109888, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (97, 1288658305156964352, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (98, 1288658491216289792, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (99, 1288658638302142464, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (100, 1288658791784308736, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (101, 1290849478956199936, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (102, 1290849628051124224, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (103, 1290849798553776128, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (105, 1291259822512693248, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (106, 1292620505149145088, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (107, 1292620665505775616, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (108, 1292620843398791168, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (109, 1292621027574874112, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (110, 1292621363161137152, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (111, 1292621494837116928, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (112, 1292621629260365824, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (113, 1292622526073864192, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (114, 1293470838745821184, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (115, 1293471661785706496, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (116, 1293472678392721408, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (117, 1293472857510473728, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (118, 1299273336009359360, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (119, 1299273436282585088, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (120, 1299273618470567936, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (121, 1299273770182737920, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (122, 1299273978023084032, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (123, 1299274123225694208, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (124, 1299274222299348992, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (125, 1304238876758495232, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (126, 1304678610343383040, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (127, 1304679169305694208, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (128, 1310460417141817344, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (129, 1310502391475519488, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (130, 1310515546943569920, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (131, 1310515735292985344, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (132, 1316628769783480320, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (133, 1316628940663619584, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (134, 1316629112428756992, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (135, 1316652047017246720, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (137, 1319200951383199744, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (138, 1319221929807024128, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (139, 1319554431134306304, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (140, 1319554550458060800, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (141, 1319554948434595840, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (142, 1319555067183730688, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (143, 1319555230765780992, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (144, 1319555333790470144, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (145, 1321001932510203904, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (146, 1321002059803136000, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (147, 1321002256440496128, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (148, 1321002350686507008, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (149, 1322190027988525056, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (150, 1322452079688458240, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (151, 1322452183929495552, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (152, 1322452308651319296, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (153, 1322452858176446464, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (154, 1322452989235863552, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (155, 1322453089655889920, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (156, 1329706860249804800, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (157, 1329707002411544576, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (158, 1329708512277098496, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (159, 1329708625917571072, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (160, 1335049839287357440, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (161, 1335050034221830144, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (162, 1335050145899368448, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (163, 1335050283434790912, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (164, 1335050381770248192, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (165, 1335050520941449216, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (166, 1335050615829188608, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (167, 1335111798720450560, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (168, 1335118541370314752, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (169, 1335118660417245184, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (170, 1335118782727344128, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (171, 1335118903200337920, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (172, 1336230645078921216, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (173, 1337314809113722880, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (174, 1337314938973569024, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (175, 1340961907637243904, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (176, 1341652247554379776, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (177, 1341652385555369984, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (178, 1342457939827552256, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (179, 1342458050112581632, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (180, 1363657602699718656, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (181, 1363657779665793024, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (182, 1363662350572154880, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (183, 1370283697803829248, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (184, 1370283782075785216, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (185, 1370283867966742528, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (186, 1370283988712366080, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (187, 1370284066516705280, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (188, 1370284158262910976, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (189, 1370284253045792768, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (190, 1370284344397733888, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (191, 1370284429890232320, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (197, 1370914923144478720, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (198, 1371844966074970112, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (199, 1371845082676621312, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (200, 1371845219528372224, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (203, 1375612899682799616, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (204, 1375613095783288832, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (205, 1375613222187028480, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (206, 1375613355029024768, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (207, 1375613462969438208, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (208, 1375613567365664768, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (209, 1375613732239560704, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (210, 1375613833662025728, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (211, 1375679597777637376, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (213, 1376863669256433664, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (214, 1376866215333179392, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (215, 1377049120932081664, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (216, 1377050475599998976, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (217, 1393020696332705792, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (218, 1393501090957946880, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (219, 1395924337284407296, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (220, 1406817452004757504, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (221, 1421397683162664960, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (222, 1431443151332106240, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (223, 1431443363240927232, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (224, 1431444869667151872, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (225, 1431445043261005824, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (226, 1431445186324520960, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (227, 1431445363160571904, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (228, 1431464934529622016, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (229, 1431499449952165888, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (230, 1431803251955654656, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (231, 1431806909455851520, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (232, 1432189824874373120, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (233, 1432190028071624704, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (234, 1440680494805778432, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (235, 1440680915444137984, '', '');
INSERT INTO `appapigatewayauthoptions` VALUES (236, 1442413171470688256, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (237, 1449257280751026176, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (238, 1454289352609521664, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (239, 1454289896489115648, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (240, 1456263181821501440, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (241, 1456263413661655040, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (242, 1456263574232195072, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (243, 1456263679999959040, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (244, 1456263785251823616, NULL, '');
INSERT INTO `appapigatewayauthoptions` VALUES (245, 1456263957046321152, NULL, '');

-- ----------------------------
-- Table structure for appapigatewaybalanceroptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewaybalanceroptions`;
CREATE TABLE `appapigatewaybalanceroptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemId` bigint(20) NULL DEFAULT NULL,
  `ReRouteId` bigint(20) NULL DEFAULT NULL,
  `Type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Expiry` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayBalancerOptions_ItemId`(`ItemId`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayBalancerOptions_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayBalancerOptions_AppApiGatewayGlobalConfiguratio~` FOREIGN KEY (`ItemId`) REFERENCES `appapigatewayglobalconfiguration` (`ItemId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AppApiGatewayBalancerOptions_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewaybalanceroptions
-- ----------------------------
INSERT INTO `appapigatewaybalanceroptions` VALUES (1, 1260841964962947072, NULL, 'LeastConnection', NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (4, NULL, 1261299170387169280, 'LeastConnection', NULL, 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (5, NULL, 1261585859064872960, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (6, NULL, 1261586605810368512, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (7, NULL, 1261587558609436672, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (8, NULL, 1261588213298348032, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (9, NULL, 1261588367619375104, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (10, NULL, 1261588628450557952, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (11, NULL, 1261588881564221440, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (12, NULL, 1261588983053795328, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (13, NULL, 1261589139039961088, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (14, NULL, 1261589197483393024, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (15, NULL, 1261589278857084928, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (16, NULL, 1261589420356124672, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (17, NULL, 1261589960393736192, 'LeastConnection', NULL, 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (18, NULL, 1261606600242085888, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (19, NULL, 1261606689601732608, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (22, NULL, 1262220447629058048, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (23, NULL, 1262230734939758592, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (24, NULL, 1262296916350869504, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (25, NULL, 1262632376348594176, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (26, NULL, 1262632791869902848, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (29, NULL, 1262660336921235456, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (30, NULL, 1262660528277966848, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (31, NULL, 1262660706875625472, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (32, NULL, 1262660966393991168, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (33, NULL, 1262661109474283520, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (34, NULL, 1262663888804663296, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (35, NULL, 1262664024096133120, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (36, NULL, 1262664186252120064, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (37, NULL, 1262664357044178944, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (38, NULL, 1262664632928718848, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (39, NULL, 1262664751409418240, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (40, NULL, 1262664871274237952, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (41, NULL, 1262665026111164416, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (42, NULL, 1262665159905267712, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (43, NULL, 1262665329829105664, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (44, NULL, 1262665456471920640, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (45, NULL, 1262665628165754880, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (46, NULL, 1262666172682883072, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (48, NULL, 1262723402331885568, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (49, NULL, 1262935771746734080, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (50, NULL, 1262935906522304512, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (53, NULL, 1263074419073593344, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (54, NULL, 1263075249394790400, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (55, NULL, 1263075593499684864, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (57, NULL, 1263101898440146944, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (58, NULL, 1263303878648569856, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (59, NULL, 1263304204797648896, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (60, NULL, 1263304872891555840, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (61, NULL, 1263305106250047488, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (62, NULL, 1263305244594970624, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (63, NULL, 1263305430536855552, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (64, NULL, 1263639172959174656, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (65, NULL, 1264799968944640000, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (66, NULL, 1264800070161584128, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (68, NULL, 1267360794414161920, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (69, NULL, 1267383367629807616, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (70, NULL, 1267817055527632896, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (71, NULL, 1267817221286526976, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (72, NULL, 1268893687085518848, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (97, NULL, 1288657613998579712, 'LeastConnection', '', 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (98, NULL, 1288657941770854400, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (99, NULL, 1288658134067109888, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (100, NULL, 1288658305156964352, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (101, NULL, 1288658491216289792, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (102, NULL, 1288658638302142464, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (103, NULL, 1288658791784308736, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (104, NULL, 1290849478956199936, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (105, NULL, 1290849628051124224, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (106, NULL, 1290849798553776128, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (108, NULL, 1291259822512693248, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (109, NULL, 1292620505149145088, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (110, NULL, 1292620665505775616, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (111, NULL, 1292620843398791168, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (112, NULL, 1292621027574874112, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (113, NULL, 1292621363161137152, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (114, NULL, 1292621494837116928, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (115, NULL, 1292621629260365824, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (116, NULL, 1292622526073864192, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (117, NULL, 1293470838745821184, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (118, NULL, 1293471661785706496, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (119, NULL, 1293472678392721408, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (120, NULL, 1293472857510473728, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (121, NULL, 1299273336009359360, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (122, NULL, 1299273436282585088, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (123, NULL, 1299273618470567936, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (124, NULL, 1299273770182737920, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (125, NULL, 1299273978023084032, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (126, NULL, 1299274123225694208, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (127, NULL, 1299274222299348992, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (128, NULL, 1304238876758495232, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (129, NULL, 1304678610343383040, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (130, NULL, 1304679169305694208, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (131, NULL, 1310460417141817344, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (132, NULL, 1310502391475519488, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (133, NULL, 1310515546943569920, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (134, NULL, 1310515735292985344, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (135, NULL, 1316628769783480320, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (136, NULL, 1316628940663619584, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (137, NULL, 1316629112428756992, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (138, NULL, 1316652047017246720, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (140, NULL, 1319200951383199744, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (141, NULL, 1319221929807024128, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (142, NULL, 1319554431134306304, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (143, NULL, 1319554550458060800, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (144, NULL, 1319554948434595840, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (145, NULL, 1319555067183730688, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (146, NULL, 1319555230765780992, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (147, NULL, 1319555333790470144, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (148, NULL, 1321001932510203904, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (149, NULL, 1321002059803136000, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (150, NULL, 1321002256440496128, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (151, NULL, 1321002350686507008, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (152, NULL, 1322190027988525056, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (153, NULL, 1322452079688458240, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (154, NULL, 1322452183929495552, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (155, NULL, 1322452308651319296, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (156, NULL, 1322452858176446464, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (157, NULL, 1322452989235863552, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (158, NULL, 1322453089655889920, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (159, NULL, 1329706860249804800, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (160, NULL, 1329707002411544576, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (161, NULL, 1329708512277098496, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (162, NULL, 1329708625917571072, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (163, NULL, 1335049839287357440, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (164, NULL, 1335050034221830144, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (165, NULL, 1335050145899368448, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (166, NULL, 1335050283434790912, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (167, NULL, 1335050381770248192, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (168, NULL, 1335050520941449216, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (169, NULL, 1335050615829188608, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (170, NULL, 1335111798720450560, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (171, NULL, 1335118541370314752, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (172, NULL, 1335118660417245184, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (173, NULL, 1335118782727344128, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (174, NULL, 1335118903200337920, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (175, NULL, 1336230645078921216, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (176, NULL, 1337314809113722880, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (177, NULL, 1337314938973569024, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (178, NULL, 1340961907637243904, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (179, NULL, 1341652247554379776, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (180, NULL, 1341652385555369984, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (181, NULL, 1342457939827552256, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (182, NULL, 1342458050112581632, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (183, NULL, 1363657602699718656, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (184, NULL, 1363657779665793024, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (185, NULL, 1363662350572154880, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (186, 1364484859756847104, NULL, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (187, NULL, 1370283697803829248, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (188, NULL, 1370283782075785216, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (189, NULL, 1370283867966742528, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (190, NULL, 1370283988712366080, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (191, NULL, 1370284066516705280, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (192, NULL, 1370284158262910976, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (193, NULL, 1370284253045792768, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (194, NULL, 1370284344397733888, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (195, NULL, 1370284429890232320, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (201, NULL, 1370914923144478720, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (202, 1371652231699025920, NULL, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (203, NULL, 1371844966074970112, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (204, NULL, 1371845082676621312, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (205, NULL, 1371845219528372224, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (208, NULL, 1375612899682799616, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (209, NULL, 1375613095783288832, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (210, NULL, 1375613222187028480, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (211, NULL, 1375613355029024768, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (212, NULL, 1375613462969438208, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (213, NULL, 1375613567365664768, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (214, NULL, 1375613732239560704, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (215, NULL, 1375613833662025728, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (216, NULL, 1375679597777637376, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (218, 1376862654239059968, NULL, 'LeastConnection', '', 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (219, NULL, 1376863669256433664, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (220, NULL, 1376866215333179392, 'LeastConnection', '', 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (221, NULL, 1377049120932081664, 'LeastConnection', '', 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (222, NULL, 1377050475599998976, 'LeastConnection', '', 60000);
INSERT INTO `appapigatewaybalanceroptions` VALUES (223, NULL, 1393020696332705792, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (224, NULL, 1393501090957946880, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (225, 1393502847586988032, NULL, 'LeastConnection', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (226, NULL, 1395924337284407296, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (227, NULL, 1406817452004757504, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (228, 1416295790013263872, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (230, 1417661085990727680, NULL, 'NoLoadBalancer', NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (231, NULL, 1421397683162664960, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (232, NULL, 1431443151332106240, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (233, NULL, 1431443363240927232, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (234, NULL, 1431444869667151872, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (235, NULL, 1431445043261005824, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (236, NULL, 1431445186324520960, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (237, NULL, 1431445363160571904, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (238, NULL, 1431464934529622016, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (239, NULL, 1431499449952165888, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (240, NULL, 1431803251955654656, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (241, NULL, 1431806909455851520, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (242, NULL, 1432189824874373120, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (243, NULL, 1432190028071624704, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (244, NULL, 1440680494805778432, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (245, NULL, 1440680915444137984, '', '', 0);
INSERT INTO `appapigatewaybalanceroptions` VALUES (246, NULL, 1442413171470688256, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (247, NULL, 1449257280751026176, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (248, NULL, 1454289352609521664, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (249, NULL, 1454289896489115648, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (250, NULL, 1456263181821501440, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (251, NULL, 1456263413661655040, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (252, NULL, 1456263574232195072, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (253, NULL, 1456263679999959040, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (254, NULL, 1456263785251823616, NULL, NULL, NULL);
INSERT INTO `appapigatewaybalanceroptions` VALUES (255, NULL, 1456263957046321152, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for appapigatewaycacheoptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewaycacheoptions`;
CREATE TABLE `appapigatewaycacheoptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NOT NULL,
  `TtlSeconds` int(11) NULL DEFAULT NULL,
  `Region` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayCacheOptions_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayCacheOptions_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewaycacheoptions
-- ----------------------------
INSERT INTO `appapigatewaycacheoptions` VALUES (3, 1261299170387169280, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (4, 1261585859064872960, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (5, 1261586605810368512, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (6, 1261587558609436672, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (7, 1261588213298348032, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (8, 1261588367619375104, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (9, 1261588628450557952, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (10, 1261588881564221440, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (11, 1261588983053795328, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (12, 1261589139039961088, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (13, 1261589197483393024, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (14, 1261589278857084928, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (15, 1261589420356124672, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (16, 1261589960393736192, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (17, 1261606600242085888, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (18, 1261606689601732608, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (21, 1262220447629058048, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (22, 1262230734939758592, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (23, 1262296916350869504, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (24, 1262632376348594176, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (25, 1262632791869902848, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (28, 1262660336921235456, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (29, 1262660528277966848, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (30, 1262660706875625472, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (31, 1262660966393991168, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (32, 1262661109474283520, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (33, 1262663888804663296, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (34, 1262664024096133120, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (35, 1262664186252120064, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (36, 1262664357044178944, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (37, 1262664632928718848, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (38, 1262664751409418240, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (39, 1262664871274237952, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (40, 1262665026111164416, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (41, 1262665159905267712, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (42, 1262665329829105664, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (43, 1262665456471920640, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (44, 1262665628165754880, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (45, 1262666172682883072, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (47, 1262723402331885568, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (48, 1262935771746734080, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (49, 1262935906522304512, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (52, 1263074419073593344, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (53, 1263075249394790400, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (54, 1263075593499684864, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (56, 1263101898440146944, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (57, 1263303878648569856, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (58, 1263304204797648896, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (59, 1263304872891555840, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (60, 1263305106250047488, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (61, 1263305244594970624, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (62, 1263305430536855552, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (63, 1263639172959174656, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (64, 1264799968944640000, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (65, 1264800070161584128, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (66, 1267360794414161920, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (67, 1267383367629807616, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (68, 1267817055527632896, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (69, 1267817221286526976, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (70, 1268893687085518848, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (94, 1288657613998579712, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (95, 1288657941770854400, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (96, 1288658134067109888, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (97, 1288658305156964352, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (98, 1288658491216289792, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (99, 1288658638302142464, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (100, 1288658791784308736, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (101, 1290849478956199936, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (102, 1290849628051124224, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (103, 1290849798553776128, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (105, 1291259822512693248, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (106, 1292620505149145088, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (107, 1292620665505775616, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (108, 1292620843398791168, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (109, 1292621027574874112, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (110, 1292621363161137152, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (111, 1292621494837116928, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (112, 1292621629260365824, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (113, 1292622526073864192, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (114, 1293470838745821184, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (115, 1293471661785706496, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (116, 1293472678392721408, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (117, 1293472857510473728, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (118, 1299273336009359360, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (119, 1299273436282585088, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (120, 1299273618470567936, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (121, 1299273770182737920, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (122, 1299273978023084032, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (123, 1299274123225694208, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (124, 1299274222299348992, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (125, 1304238876758495232, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (126, 1304678610343383040, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (127, 1304679169305694208, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (128, 1310460417141817344, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (129, 1310502391475519488, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (130, 1310515546943569920, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (131, 1310515735292985344, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (132, 1316628769783480320, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (133, 1316628940663619584, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (134, 1316629112428756992, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (135, 1316652047017246720, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (137, 1319200951383199744, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (138, 1319221929807024128, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (139, 1319554431134306304, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (140, 1319554550458060800, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (141, 1319554948434595840, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (142, 1319555067183730688, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (143, 1319555230765780992, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (144, 1319555333790470144, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (145, 1321001932510203904, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (146, 1321002059803136000, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (147, 1321002256440496128, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (148, 1321002350686507008, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (149, 1322190027988525056, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (150, 1322452079688458240, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (151, 1322452183929495552, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (152, 1322452308651319296, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (153, 1322452858176446464, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (154, 1322452989235863552, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (155, 1322453089655889920, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (156, 1329706860249804800, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (157, 1329707002411544576, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (158, 1329708512277098496, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (159, 1329708625917571072, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (160, 1335049839287357440, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (161, 1335050034221830144, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (162, 1335050145899368448, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (163, 1335050283434790912, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (164, 1335050381770248192, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (165, 1335050520941449216, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (166, 1335050615829188608, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (167, 1335111798720450560, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (168, 1335118541370314752, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (169, 1335118660417245184, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (170, 1335118782727344128, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (171, 1335118903200337920, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (172, 1336230645078921216, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (173, 1337314809113722880, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (174, 1337314938973569024, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (175, 1340961907637243904, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (176, 1341652247554379776, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (177, 1341652385555369984, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (178, 1342457939827552256, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (179, 1342458050112581632, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (180, 1363657602699718656, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (181, 1363657779665793024, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (182, 1363662350572154880, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (183, 1370283697803829248, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (184, 1370283782075785216, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (185, 1370283867966742528, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (186, 1370283988712366080, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (187, 1370284066516705280, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (188, 1370284158262910976, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (189, 1370284253045792768, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (190, 1370284344397733888, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (191, 1370284429890232320, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (197, 1370914923144478720, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (198, 1371844966074970112, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (199, 1371845082676621312, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (200, 1371845219528372224, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (203, 1375612899682799616, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (204, 1375613095783288832, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (205, 1375613222187028480, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (206, 1375613355029024768, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (207, 1375613462969438208, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (208, 1375613567365664768, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (209, 1375613732239560704, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (210, 1375613833662025728, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (211, 1375679597777637376, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (213, 1376863669256433664, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (214, 1376866215333179392, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (215, 1377049120932081664, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (216, 1377050475599998976, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (217, 1393020696332705792, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (218, 1393501090957946880, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (219, 1395924337284407296, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (220, 1406817452004757504, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (221, 1421397683162664960, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (222, 1431443151332106240, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (223, 1431443363240927232, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (224, 1431444869667151872, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (225, 1431445043261005824, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (226, 1431445186324520960, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (227, 1431445363160571904, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (228, 1431464934529622016, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (229, 1431499449952165888, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (230, 1431803251955654656, 0, '');
INSERT INTO `appapigatewaycacheoptions` VALUES (231, 1431806909455851520, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (232, 1432189824874373120, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (233, 1432190028071624704, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (234, 1440680494805778432, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (235, 1440680915444137984, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (236, 1442413171470688256, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (237, 1449257280751026176, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (238, 1454289352609521664, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (239, 1454289896489115648, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (240, 1456263181821501440, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (241, 1456263413661655040, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (242, 1456263574232195072, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (243, 1456263679999959040, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (244, 1456263785251823616, NULL, NULL);
INSERT INTO `appapigatewaycacheoptions` VALUES (245, 1456263957046321152, NULL, NULL);

-- ----------------------------
-- Table structure for appapigatewaydiscovery
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewaydiscovery`;
CREATE TABLE `appapigatewaydiscovery`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemId` bigint(20) NOT NULL,
  `Host` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Port` int(11) NULL DEFAULT NULL,
  `Type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ConfigurationKey` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PollingInterval` int(11) NULL DEFAULT NULL,
  `Namespace` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Scheme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayDiscovery_ItemId`(`ItemId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayDiscovery_AppApiGatewayGlobalConfiguration_Item~` FOREIGN KEY (`ItemId`) REFERENCES `appapigatewayglobalconfiguration` (`ItemId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewaydiscovery
-- ----------------------------
INSERT INTO `appapigatewaydiscovery` VALUES (1, 1260841964962947072, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaydiscovery` VALUES (2, 1364484859756847104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaydiscovery` VALUES (3, 1371652231699025920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaydiscovery` VALUES (4, 1376862654239059968, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaydiscovery` VALUES (5, 1393502847586988032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaydiscovery` VALUES (6, 1416295790013263872, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appapigatewaydiscovery` VALUES (7, 1417661085990727680, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for appapigatewaydynamicreroute
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewaydynamicreroute`;
CREATE TABLE `appapigatewaydynamicreroute`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DynamicReRouteId` bigint(20) NOT NULL,
  `ServiceName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DownstreamHttpVersion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AppId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `AK_AppApiGatewayDynamicReRoute_DynamicReRouteId`(`DynamicReRouteId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for appapigatewayglobalconfiguration
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayglobalconfiguration`;
CREATE TABLE `appapigatewayglobalconfiguration`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ItemId` bigint(20) NOT NULL,
  `RequestIdKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `BaseUrl` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DownstreamScheme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DownstreamHttpVersion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL DEFAULT 0,
  `IsActive` tinyint(1) NOT NULL,
  `AppId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `AK_AppApiGatewayGlobalConfiguration_ItemId`(`ItemId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayglobalconfiguration
-- ----------------------------
INSERT INTO `appapigatewayglobalconfiguration` VALUES (1, '{}', 'f7973118f2c2425c8cc96b59883b99aa', 1260841964962947072, NULL, 'http://localhost:30000', 'HTTP', NULL, 0, 1, 'TEST-APP');
I
-- ----------------------------
-- Table structure for appapigatewayheaders
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayheaders`;
CREATE TABLE `appapigatewayheaders`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NOT NULL,
  `Key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for appapigatewayhostandport
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayhostandport`;
CREATE TABLE `appapigatewayhostandport`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NOT NULL,
  `Host` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Port` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for appapigatewayhttpoptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayhttpoptions`;
CREATE TABLE `appapigatewayhttpoptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemId` bigint(20) NULL DEFAULT NULL,
  `ReRouteId` bigint(20) NULL DEFAULT NULL,
  `MaxConnectionsPerServer` int(11) NULL DEFAULT NULL,
  `AllowAutoRedirect` tinyint(1) NOT NULL,
  `UseCookieContainer` tinyint(1) NOT NULL,
  `UseTracing` tinyint(1) NOT NULL,
  `UseProxy` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayHttpOptions_ItemId`(`ItemId`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayHttpOptions_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayHttpOptions_AppApiGatewayGlobalConfiguration_It~` FOREIGN KEY (`ItemId`) REFERENCES `appapigatewayglobalconfiguration` (`ItemId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AppApiGatewayHttpOptions_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayhttpoptions
-- ----------------------------
INSERT INTO `appapigatewayhttpoptions` VALUES (1, 1260841964962947072, NULL, NULL, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (4, NULL, 1261299170387169280, 1000, 1, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (5, NULL, 1261585859064872960, NULL, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (6, NULL, 1261586605810368512, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (7, NULL, 1261587558609436672, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (8, NULL, 1261588213298348032, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (9, NULL, 1261588367619375104, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (10, NULL, 1261588628450557952, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (11, NULL, 1261588881564221440, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (12, NULL, 1261588983053795328, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (13, NULL, 1261589139039961088, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (14, NULL, 1261589197483393024, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (15, NULL, 1261589278857084928, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (16, NULL, 1261589420356124672, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (17, NULL, 1261589960393736192, 1000, 1, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (18, NULL, 1261606600242085888, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (19, NULL, 1261606689601732608, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (22, NULL, 1262220447629058048, NULL, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (23, NULL, 1262230734939758592, NULL, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (24, NULL, 1262296916350869504, NULL, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (25, NULL, 1262632376348594176, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (26, NULL, 1262632791869902848, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (29, NULL, 1262660336921235456, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (30, NULL, 1262660528277966848, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (31, NULL, 1262660706875625472, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (32, NULL, 1262660966393991168, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (33, NULL, 1262661109474283520, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (34, NULL, 1262663888804663296, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (35, NULL, 1262664024096133120, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (36, NULL, 1262664186252120064, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (37, NULL, 1262664357044178944, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (38, NULL, 1262664632928718848, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (39, NULL, 1262664751409418240, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (40, NULL, 1262664871274237952, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (41, NULL, 1262665026111164416, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (42, NULL, 1262665159905267712, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (43, NULL, 1262665329829105664, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (44, NULL, 1262665456471920640, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (45, NULL, 1262665628165754880, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (46, NULL, 1262666172682883072, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (48, NULL, 1262723402331885568, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (49, NULL, 1262935771746734080, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (50, NULL, 1262935906522304512, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (53, NULL, 1263074419073593344, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (54, NULL, 1263075249394790400, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (55, NULL, 1263075593499684864, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (57, NULL, 1263101898440146944, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (58, NULL, 1263303878648569856, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (59, NULL, 1263304204797648896, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (60, NULL, 1263304872891555840, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (61, NULL, 1263305106250047488, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (62, NULL, 1263305244594970624, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (63, NULL, 1263305430536855552, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (64, NULL, 1263639172959174656, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (65, NULL, 1264799968944640000, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (66, NULL, 1264800070161584128, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (68, NULL, 1267360794414161920, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (69, NULL, 1267383367629807616, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (70, NULL, 1267817055527632896, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (71, NULL, 1267817221286526976, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (72, NULL, 1268893687085518848, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (97, NULL, 1288657613998579712, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (98, NULL, 1288657941770854400, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (99, NULL, 1288658134067109888, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (100, NULL, 1288658305156964352, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (101, NULL, 1288658491216289792, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (102, NULL, 1288658638302142464, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (103, NULL, 1288658791784308736, 1000, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (104, NULL, 1290849478956199936, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (105, NULL, 1290849628051124224, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (106, NULL, 1290849798553776128, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (108, NULL, 1291259822512693248, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (109, NULL, 1292620505149145088, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (110, NULL, 1292620665505775616, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (111, NULL, 1292620843398791168, 100, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (112, NULL, 1292621027574874112, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (113, NULL, 1292621363161137152, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (114, NULL, 1292621494837116928, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (115, NULL, 1292621629260365824, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (116, NULL, 1292622526073864192, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (117, NULL, 1293470838745821184, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (118, NULL, 1293471661785706496, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (119, NULL, 1293472678392721408, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (120, NULL, 1293472857510473728, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (121, NULL, 1299273336009359360, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (122, NULL, 1299273436282585088, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (123, NULL, 1299273618470567936, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (124, NULL, 1299273770182737920, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (125, NULL, 1299273978023084032, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (126, NULL, 1299274123225694208, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (127, NULL, 1299274222299348992, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (128, NULL, 1304238876758495232, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (129, NULL, 1304678610343383040, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (130, NULL, 1304679169305694208, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (131, NULL, 1310460417141817344, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (132, NULL, 1310502391475519488, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (133, NULL, 1310515546943569920, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (134, NULL, 1310515735292985344, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (135, NULL, 1316628769783480320, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (136, NULL, 1316628940663619584, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (137, NULL, 1316629112428756992, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (138, NULL, 1316652047017246720, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (140, NULL, 1319200951383199744, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (141, NULL, 1319221929807024128, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (142, NULL, 1319554431134306304, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (143, NULL, 1319554550458060800, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (144, NULL, 1319554948434595840, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (145, NULL, 1319555067183730688, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (146, NULL, 1319555230765780992, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (147, NULL, 1319555333790470144, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (148, NULL, 1321001932510203904, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (149, NULL, 1321002059803136000, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (150, NULL, 1321002256440496128, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (151, NULL, 1321002350686507008, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (152, NULL, 1322190027988525056, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (153, NULL, 1322452079688458240, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (154, NULL, 1322452183929495552, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (155, NULL, 1322452308651319296, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (156, NULL, 1322452858176446464, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (157, NULL, 1322452989235863552, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (158, NULL, 1322453089655889920, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (159, NULL, 1329706860249804800, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (160, NULL, 1329707002411544576, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (161, NULL, 1329708512277098496, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (162, NULL, 1329708625917571072, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (163, NULL, 1335049839287357440, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (164, NULL, 1335050034221830144, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (165, NULL, 1335050145899368448, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (166, NULL, 1335050283434790912, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (167, NULL, 1335050381770248192, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (168, NULL, 1335050520941449216, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (169, NULL, 1335050615829188608, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (170, NULL, 1335111798720450560, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (171, NULL, 1335118541370314752, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (172, NULL, 1335118660417245184, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (173, NULL, 1335118782727344128, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (174, NULL, 1335118903200337920, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (175, NULL, 1336230645078921216, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (176, NULL, 1337314809113722880, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (177, NULL, 1337314938973569024, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (178, NULL, 1340961907637243904, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (179, NULL, 1341652247554379776, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (180, NULL, 1341652385555369984, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (181, NULL, 1342457939827552256, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (182, NULL, 1342458050112581632, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (183, NULL, 1363657602699718656, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (184, NULL, 1363657779665793024, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (185, NULL, 1363662350572154880, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (186, 1364484859756847104, NULL, 1000, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (187, NULL, 1370283697803829248, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (188, NULL, 1370283782075785216, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (189, NULL, 1370283867966742528, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (190, NULL, 1370283988712366080, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (191, NULL, 1370284066516705280, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (192, NULL, 1370284158262910976, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (193, NULL, 1370284253045792768, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (194, NULL, 1370284344397733888, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (195, NULL, 1370284429890232320, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (201, NULL, 1370914923144478720, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (202, 1371652231699025920, NULL, 1000, 0, 1, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (203, NULL, 1371844966074970112, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (204, NULL, 1371845082676621312, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (205, NULL, 1371845219528372224, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (208, NULL, 1375612899682799616, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (209, NULL, 1375613095783288832, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (210, NULL, 1375613222187028480, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (211, NULL, 1375613355029024768, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (212, NULL, 1375613462969438208, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (213, NULL, 1375613567365664768, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (214, NULL, 1375613732239560704, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (215, NULL, 1375613833662025728, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (216, NULL, 1375679597777637376, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (218, 1376862654239059968, NULL, 1000, 1, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (219, NULL, 1376863669256433664, 0, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (220, NULL, 1376866215333179392, 1000, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (221, NULL, 1377049120932081664, 0, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (222, NULL, 1377050475599998976, 0, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (223, NULL, 1393020696332705792, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (224, NULL, 1393501090957946880, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (225, 1393502847586988032, NULL, 1000, 0, 1, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (226, NULL, 1395924337284407296, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (227, NULL, 1406817452004757504, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (228, 1416295790013263872, NULL, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (230, 1417661085990727680, NULL, NULL, 1, 0, 0, 1);
INSERT INTO `appapigatewayhttpoptions` VALUES (231, NULL, 1421397683162664960, NULL, 0, 0, 1, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (232, NULL, 1431443151332106240, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (233, NULL, 1431443363240927232, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (234, NULL, 1431444869667151872, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (235, NULL, 1431445043261005824, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (236, NULL, 1431445186324520960, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (237, NULL, 1431445363160571904, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (238, NULL, 1431464934529622016, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (239, NULL, 1431499449952165888, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (240, NULL, 1431803251955654656, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (241, NULL, 1431806909455851520, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (242, NULL, 1432189824874373120, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (243, NULL, 1432190028071624704, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (244, NULL, 1440680494805778432, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (245, NULL, 1440680915444137984, 0, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (246, NULL, 1442413171470688256, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (247, NULL, 1449257280751026176, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (248, NULL, 1454289352609521664, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (249, NULL, 1454289896489115648, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (250, NULL, 1456263181821501440, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (251, NULL, 1456263413661655040, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (252, NULL, 1456263574232195072, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (253, NULL, 1456263679999959040, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (254, NULL, 1456263785251823616, NULL, 0, 0, 0, 0);
INSERT INTO `appapigatewayhttpoptions` VALUES (255, NULL, 1456263957046321152, NULL, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for appapigatewayqosoptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayqosoptions`;
CREATE TABLE `appapigatewayqosoptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemId` bigint(20) NULL DEFAULT NULL,
  `ReRouteId` bigint(20) NULL DEFAULT NULL,
  `ExceptionsAllowedBeforeBreaking` int(11) NULL DEFAULT NULL,
  `DurationOfBreak` int(11) NULL DEFAULT NULL,
  `TimeoutValue` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayQoSOptions_ItemId`(`ItemId`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayQoSOptions_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayQoSOptions_AppApiGatewayGlobalConfiguration_Ite~` FOREIGN KEY (`ItemId`) REFERENCES `appapigatewayglobalconfiguration` (`ItemId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AppApiGatewayQoSOptions_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 258 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayqosoptions
-- ----------------------------
INSERT INTO `appapigatewayqosoptions` VALUES (1, 1260841964962947072, NULL, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (4, NULL, 1261299170387169280, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (5, NULL, 1261585859064872960, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (6, NULL, 1261586605810368512, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (7, NULL, 1261587558609436672, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (8, NULL, 1261588213298348032, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (9, NULL, 1261588367619375104, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (10, NULL, 1261588628450557952, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (11, NULL, 1261588881564221440, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (12, NULL, 1261588983053795328, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (13, NULL, 1261589139039961088, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (14, NULL, 1261589197483393024, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (15, NULL, 1261589278857084928, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (16, NULL, 1261589420356124672, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (17, NULL, 1261589960393736192, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (18, NULL, 1261606600242085888, NULL, NULL, NULL);
INSERT INTO `appapigatewayqosoptions` VALUES (19, NULL, 1261606689601732608, NULL, NULL, NULL);
INSERT INTO `appapigatewayqosoptions` VALUES (22, NULL, 1262220447629058048, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (23, NULL, 1262230734939758592, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (24, NULL, 1262296916350869504, 60, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (25, NULL, 1262632376348594176, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (26, NULL, 1262632791869902848, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (29, NULL, 1262660336921235456, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (30, NULL, 1262660528277966848, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (31, NULL, 1262660706875625472, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (32, NULL, 1262660966393991168, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (33, NULL, 1262661109474283520, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (34, NULL, 1262663888804663296, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (35, NULL, 1262664024096133120, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (36, NULL, 1262664186252120064, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (37, NULL, 1262664357044178944, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (38, NULL, 1262664632928718848, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (39, NULL, 1262664751409418240, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (40, NULL, 1262664871274237952, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (41, NULL, 1262665026111164416, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (42, NULL, 1262665159905267712, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (43, NULL, 1262665329829105664, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (44, NULL, 1262665456471920640, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (45, NULL, 1262665628165754880, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (46, NULL, 1262666172682883072, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (48, NULL, 1262723402331885568, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (49, NULL, 1262935771746734080, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (50, NULL, 1262935906522304512, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (53, NULL, 1263074419073593344, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (54, NULL, 1263075249394790400, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (55, NULL, 1263075593499684864, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (57, NULL, 1263101898440146944, 50, 60000, 120000);
INSERT INTO `appapigatewayqosoptions` VALUES (58, NULL, 1263303878648569856, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (59, NULL, 1263304204797648896, 50, 60000, 120000);
INSERT INTO `appapigatewayqosoptions` VALUES (60, NULL, 1263304872891555840, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (61, NULL, 1263305106250047488, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (62, NULL, 1263305244594970624, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (63, NULL, 1263305430536855552, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (64, NULL, 1263639172959174656, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (65, NULL, 1264799968944640000, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (66, NULL, 1264800070161584128, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (68, NULL, 1267360794414161920, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (69, NULL, 1267383367629807616, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (70, NULL, 1267817055527632896, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (71, NULL, 1267817221286526976, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (72, NULL, 1268893687085518848, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (97, NULL, 1288657613998579712, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (98, NULL, 1288657941770854400, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (99, NULL, 1288658134067109888, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (100, NULL, 1288658305156964352, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (101, NULL, 1288658491216289792, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (102, NULL, 1288658638302142464, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (103, NULL, 1288658791784308736, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (104, NULL, 1290849478956199936, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (105, NULL, 1290849628051124224, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (106, NULL, 1290849798553776128, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (108, NULL, 1291259822512693248, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (109, NULL, 1292620505149145088, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (110, NULL, 1292620665505775616, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (111, NULL, 1292620843398791168, 50, 60000, 1200000);
INSERT INTO `appapigatewayqosoptions` VALUES (112, NULL, 1292621027574874112, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (113, NULL, 1292621363161137152, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (114, NULL, 1292621494837116928, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (115, NULL, 1292621629260365824, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (116, NULL, 1292622526073864192, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (117, NULL, 1293470838745821184, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (118, NULL, 1293471661785706496, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (119, NULL, 1293472678392721408, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (120, NULL, 1293472857510473728, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (121, NULL, 1299273336009359360, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (122, NULL, 1299273436282585088, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (123, NULL, 1299273618470567936, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (124, NULL, 1299273770182737920, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (125, NULL, 1299273978023084032, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (126, NULL, 1299274123225694208, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (127, NULL, 1299274222299348992, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (128, NULL, 1304238876758495232, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (129, NULL, 1304678610343383040, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (130, NULL, 1304679169305694208, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (131, NULL, 1310460417141817344, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (132, NULL, 1310502391475519488, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (133, NULL, 1310515546943569920, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (134, NULL, 1310515735292985344, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (135, NULL, 1316628769783480320, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (136, NULL, 1316628940663619584, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (137, NULL, 1316629112428756992, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (138, NULL, 1316652047017246720, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (140, NULL, 1319200951383199744, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (141, NULL, 1319221929807024128, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (142, NULL, 1319554431134306304, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (143, NULL, 1319554550458060800, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (144, NULL, 1319554948434595840, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (145, NULL, 1319555067183730688, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (146, NULL, 1319555230765780992, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (147, NULL, 1319555333790470144, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (148, NULL, 1321001932510203904, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (149, NULL, 1321002059803136000, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (150, NULL, 1321002256440496128, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (151, NULL, 1321002350686507008, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (152, NULL, 1322190027988525056, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (153, NULL, 1322452079688458240, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (154, NULL, 1322452183929495552, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (155, NULL, 1322452308651319296, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (156, NULL, 1322452858176446464, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (157, NULL, 1322452989235863552, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (158, NULL, 1322453089655889920, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (159, NULL, 1329706860249804800, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (160, NULL, 1329707002411544576, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (161, NULL, 1329708512277098496, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (162, NULL, 1329708625917571072, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (163, NULL, 1335049839287357440, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (164, NULL, 1335050034221830144, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (165, NULL, 1335050145899368448, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (166, NULL, 1335050283434790912, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (167, NULL, 1335050381770248192, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (168, NULL, 1335050520941449216, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (169, NULL, 1335050615829188608, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (170, NULL, 1335111798720450560, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (171, NULL, 1335118541370314752, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (172, NULL, 1335118660417245184, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (173, NULL, 1335118782727344128, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (174, NULL, 1335118903200337920, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (175, NULL, 1336230645078921216, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (176, NULL, 1337314809113722880, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (177, NULL, 1337314938973569024, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (178, NULL, 1340961907637243904, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (179, NULL, 1341652247554379776, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (180, NULL, 1341652385555369984, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (181, NULL, 1342457939827552256, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (182, NULL, 1342458050112581632, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (183, NULL, 1363657602699718656, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (184, NULL, 1363657779665793024, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (185, NULL, 1363662350572154880, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (186, 1364484859756847104, NULL, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (187, NULL, 1370283697803829248, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (188, NULL, 1370283782075785216, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (189, NULL, 1370283867966742528, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (190, NULL, 1370283988712366080, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (191, NULL, 1370284066516705280, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (192, NULL, 1370284158262910976, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (193, NULL, 1370284253045792768, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (194, NULL, 1370284344397733888, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (195, NULL, 1370284429890232320, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (201, NULL, 1370914923144478720, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (202, 1371652231699025920, NULL, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (203, NULL, 1371844966074970112, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (204, NULL, 1371845082676621312, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (205, NULL, 1371845219528372224, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (208, NULL, 1375612899682799616, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (209, NULL, 1375613095783288832, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (210, NULL, 1375613222187028480, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (211, NULL, 1375613355029024768, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (212, NULL, 1375613462969438208, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (213, NULL, 1375613567365664768, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (214, NULL, 1375613732239560704, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (215, NULL, 1375613833662025728, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (216, NULL, 1375679597777637376, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (218, 1376862654239059968, NULL, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (219, NULL, 1376863669256433664, 50, 60000, 1200000);
INSERT INTO `appapigatewayqosoptions` VALUES (220, NULL, 1376866215333179392, 50, 60000, 1200000);
INSERT INTO `appapigatewayqosoptions` VALUES (221, NULL, 1377049120932081664, 50, 60000, 1200000);
INSERT INTO `appapigatewayqosoptions` VALUES (222, NULL, 1377050475599998976, 50, 60000, 1200000);
INSERT INTO `appapigatewayqosoptions` VALUES (223, NULL, 1393020696332705792, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (224, NULL, 1393501090957946880, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (225, 1393502847586988032, NULL, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (226, NULL, 1395924337284407296, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (227, NULL, 1406817452004757504, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (228, 1416295790013263872, NULL, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (230, 1417661085990727680, NULL, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (231, NULL, 1421397683162664960, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (232, NULL, 1431443151332106240, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (233, NULL, 1431443363240927232, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (234, NULL, 1431444869667151872, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (235, NULL, 1431445043261005824, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (236, NULL, 1431445186324520960, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (237, NULL, 1431445363160571904, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (238, NULL, 1431464934529622016, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (239, NULL, 1431499449952165888, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (240, NULL, 1431803251955654656, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (241, NULL, 1431806909455851520, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (242, NULL, 1432189824874373120, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (243, NULL, 1432190028071624704, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (244, NULL, 1440680494805778432, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (245, NULL, 1440680915444137984, 50, 60000, 30000);
INSERT INTO `appapigatewayqosoptions` VALUES (246, NULL, 1442413171470688256, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (247, NULL, 1449257280751026176, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (248, NULL, 1454289352609521664, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (249, NULL, 1454289896489115648, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (250, NULL, 1456263181821501440, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (251, NULL, 1456263413661655040, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (252, NULL, 1456263574232195072, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (253, NULL, 1456263679999959040, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (254, NULL, 1456263785251823616, 50, 60000, 10000);
INSERT INTO `appapigatewayqosoptions` VALUES (255, NULL, 1456263957046321152, 50, 60000, 10000);

-- ----------------------------
-- Table structure for appapigatewayratelimitoptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayratelimitoptions`;
CREATE TABLE `appapigatewayratelimitoptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ItemId` bigint(20) NOT NULL,
  `ClientIdHeader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'ClientId',
  `QuotaExceededMessage` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RateLimitCounterPrefix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'ocelot',
  `DisableRateLimitHeaders` tinyint(1) NOT NULL,
  `HttpStatusCode` int(11) NULL DEFAULT 429,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayRateLimitOptions_ItemId`(`ItemId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayRateLimitOptions_AppApiGatewayGlobalConfigurati~` FOREIGN KEY (`ItemId`) REFERENCES `appapigatewayglobalconfiguration` (`ItemId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayratelimitoptions
-- ----------------------------
INSERT INTO `appapigatewayratelimitoptions` VALUES (1, 1260841964962947072, 'ClientId', '{\n  \"error\": {\n    \"code\": \"429\",\n    \"message\": \"您的操作过快,请稍后再试!\",\n    \"details\": \"您的操作过快,请稍后再试!\",\n    \"data\": {},\n    \"validationErrors\": []\n  }\n}', 'ocelot', 1, 429);


-- ----------------------------
-- Table structure for appapigatewayratelimitrule
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayratelimitrule`;
CREATE TABLE `appapigatewayratelimitrule`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NULL DEFAULT NULL,
  `DynamicReRouteId` bigint(20) NULL DEFAULT NULL,
  `ClientWhitelist` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `EnableRateLimiting` tinyint(1) NOT NULL,
  `Period` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `PeriodTimespan` double NULL DEFAULT NULL,
  `Limit` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayRateLimitRule_DynamicReRouteId`(`DynamicReRouteId`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayRateLimitRule_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewayRateLimitRule_AppApiGatewayDynamicReRoute_Dynam~` FOREIGN KEY (`DynamicReRouteId`) REFERENCES `appapigatewaydynamicreroute` (`DynamicReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `FK_AppApiGatewayRateLimitRule_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayratelimitrule
-- ----------------------------
INSERT INTO `appapigatewayratelimitrule` VALUES (3, 1261299170387169280, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (4, 1261585859064872960, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (5, 1261586605810368512, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (6, 1261587558609436672, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (7, 1261588213298348032, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (8, 1261588367619375104, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (9, 1261588628450557952, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (10, 1261588881564221440, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (11, 1261588983053795328, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (12, 1261589139039961088, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (13, 1261589197483393024, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (14, 1261589278857084928, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (15, 1261589420356124672, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (16, 1261589960393736192, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (17, 1261606600242085888, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (18, 1261606689601732608, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (21, 1262220447629058048, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (22, 1262230734939758592, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (23, 1262296916350869504, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (24, 1262632376348594176, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (25, 1262632791869902848, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (28, 1262660336921235456, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (29, 1262660528277966848, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (30, 1262660706875625472, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (31, 1262660966393991168, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (32, 1262661109474283520, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (33, 1262663888804663296, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (34, 1262664024096133120, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (35, 1262664186252120064, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (36, 1262664357044178944, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (37, 1262664632928718848, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (38, 1262664751409418240, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (39, 1262664871274237952, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (40, 1262665026111164416, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (41, 1262665159905267712, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (42, 1262665329829105664, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (43, 1262665456471920640, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (44, 1262665628165754880, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (45, 1262666172682883072, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (47, 1262723402331885568, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (48, 1262935771746734080, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (49, 1262935906522304512, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (52, 1263074419073593344, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (53, 1263075249394790400, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (54, 1263075593499684864, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (56, 1263101898440146944, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (57, 1263303878648569856, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (58, 1263304204797648896, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (59, 1263304872891555840, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (60, 1263305106250047488, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (61, 1263305244594970624, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (62, 1263305430536855552, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (63, 1263639172959174656, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (64, 1264799968944640000, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (65, 1264800070161584128, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (66, 1267360794414161920, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (67, 1267383367629807616, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (68, 1267817055527632896, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (69, 1267817221286526976, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (70, 1268893687085518848, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (94, 1288657613998579712, NULL, '', 1, '1m', 60, 200);
INSERT INTO `appapigatewayratelimitrule` VALUES (95, 1288657941770854400, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (96, 1288658134067109888, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (97, 1288658305156964352, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (98, 1288658491216289792, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (99, 1288658638302142464, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (100, 1288658791784308736, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (101, 1290849478956199936, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (102, 1290849628051124224, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (103, 1290849798553776128, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (105, 1291259822512693248, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (106, 1292620505149145088, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (107, 1292620665505775616, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (108, 1292620843398791168, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (109, 1292621027574874112, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (110, 1292621363161137152, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (111, 1292621494837116928, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (112, 1292621629260365824, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (113, 1292622526073864192, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (114, 1293470838745821184, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (115, 1293471661785706496, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (116, 1293472678392721408, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (117, 1293472857510473728, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (118, 1299273336009359360, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (119, 1299273436282585088, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (120, 1299273618470567936, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (121, 1299273770182737920, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (122, 1299273978023084032, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (123, 1299274123225694208, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (124, 1299274222299348992, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (125, 1304238876758495232, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (126, 1304678610343383040, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (127, 1304679169305694208, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (128, 1310460417141817344, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (129, 1310502391475519488, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (130, 1310515546943569920, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (131, 1310515735292985344, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (132, 1316628769783480320, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (133, 1316628940663619584, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (134, 1316629112428756992, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (135, 1316652047017246720, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (137, 1319200951383199744, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (138, 1319221929807024128, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (139, 1319554431134306304, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (140, 1319554550458060800, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (141, 1319554948434595840, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (142, 1319555067183730688, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (143, 1319555230765780992, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (144, 1319555333790470144, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (145, 1321001932510203904, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (146, 1321002059803136000, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (147, 1321002256440496128, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (148, 1321002350686507008, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (149, 1322190027988525056, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (150, 1322452079688458240, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (151, 1322452183929495552, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (152, 1322452308651319296, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (153, 1322452858176446464, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (154, 1322452989235863552, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (155, 1322453089655889920, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (156, 1329706860249804800, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (157, 1329707002411544576, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (158, 1329708512277098496, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (159, 1329708625917571072, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (160, 1335049839287357440, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (161, 1335050034221830144, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (162, 1335050145899368448, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (163, 1335050283434790912, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (164, 1335050381770248192, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (165, 1335050520941449216, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (166, 1335050615829188608, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (167, 1335111798720450560, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (168, 1335118541370314752, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (169, 1335118660417245184, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (170, 1335118782727344128, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (171, 1335118903200337920, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (172, 1336230645078921216, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (173, 1337314809113722880, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (174, 1337314938973569024, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (175, 1340961907637243904, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (176, 1341652247554379776, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (177, 1341652385555369984, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (178, 1342457939827552256, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (179, 1342458050112581632, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (180, 1363657602699718656, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (181, 1363657779665793024, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (182, 1363662350572154880, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (183, 1370283697803829248, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (184, 1370283782075785216, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (185, 1370283867966742528, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (186, 1370283988712366080, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (187, 1370284066516705280, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (188, 1370284158262910976, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (189, 1370284253045792768, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (190, 1370284344397733888, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (191, 1370284429890232320, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (197, 1370914923144478720, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (198, 1371844966074970112, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (199, 1371845082676621312, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (200, 1371845219528372224, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (203, 1375612899682799616, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (204, 1375613095783288832, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (205, 1375613222187028480, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (206, 1375613355029024768, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (207, 1375613462969438208, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (208, 1375613567365664768, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (209, 1375613732239560704, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (210, 1375613833662025728, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (211, 1375679597777637376, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (213, 1376863669256433664, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (214, 1376866215333179392, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (215, 1377049120932081664, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (216, 1377050475599998976, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (217, 1393020696332705792, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (218, 1393501090957946880, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (219, 1395924337284407296, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (220, 1406817452004757504, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (221, 1421397683162664960, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (222, 1431443151332106240, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (223, 1431443363240927232, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (224, 1431444869667151872, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (225, 1431445043261005824, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (226, 1431445186324520960, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (227, 1431445363160571904, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (228, 1431464934529622016, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (229, 1431499449952165888, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (230, 1431803251955654656, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (231, 1431806909455851520, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (232, 1432189824874373120, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (233, 1432190028071624704, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (234, 1440680494805778432, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (235, 1440680915444137984, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (236, 1442413171470688256, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (237, 1449257280751026176, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (238, 1454289352609521664, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (239, 1454289896489115648, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (240, 1456263181821501440, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (241, 1456263413661655040, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (242, 1456263574232195072, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (243, 1456263679999959040, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (244, 1456263785251823616, NULL, '', 0, NULL, NULL, NULL);
INSERT INTO `appapigatewayratelimitrule` VALUES (245, 1456263957046321152, NULL, '', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for appapigatewayreroute
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayreroute`;
CREATE TABLE `appapigatewayreroute`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReRouteId` bigint(20) NOT NULL,
  `ReRouteName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `DownstreamPathTemplate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ChangeDownstreamPathTemplate` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DownstreamHttpMethod` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpstreamPathTemplate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `UpstreamHttpMethod` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AddHeadersToRequest` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpstreamHeaderTransform` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DownstreamHeaderTransform` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AddClaimsToRequest` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RouteClaimsRequirement` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AddQueriesToRequest` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `RequestIdKey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ReRouteIsCaseSensitive` tinyint(1) NOT NULL,
  `ServiceName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ServiceNamespace` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DownstreamScheme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DownstreamHostAndPorts` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `DelegatingHandlers` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `UpstreamHost` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Priority` int(11) NULL DEFAULT NULL,
  `Timeout` int(11) NULL DEFAULT NULL,
  `DangerousAcceptAnyServerCertificateValidator` tinyint(1) NOT NULL,
  `DownstreamHttpVersion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AppId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `AK_AppApiGatewayReRoute_ReRouteId`(`ReRouteId`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewayReRoute_AppId_DownstreamPathTemplate_UpstreamPa~`(`AppId`, `DownstreamPathTemplate`, `UpstreamPathTemplate`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 511 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayreroute
-- ----------------------------
INSERT INTO `appapigatewayreroute` VALUES (4, '{}', '84059fcecc91498b9beafac914865e2c', 1261299170387169280, '【后台管理】- 权限管理', '/api/permission-management/permissions', '', NULL, '/api/permission-management/permissions', 'GET,PUT,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30010,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (5, '{}', 'f2312eed73cc4d3cbefcd1816849fd74', 1261585859064872960, '【身份认证服务】- 客户端', '/api/identity-server/clients', '', NULL, '/api/identity-server/clients', 'POST,GET,', '', '', 'X-Forwarded-For:{RemoteIpAddress},', '', '', '', NULL, 1, '', NULL, 'HTTP', '127.0.0.1:30015,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (6, '{}', 'b764ec7b994147abb12974bfcee4a0a9', 1261586605810368512, '【身份认证服务】- 管理客户端', '/api/identity-server/clients/{Id}', '', NULL, '/api/identity-server/clients/{Id}', 'GET,DELETE,PUT,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30015,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (7, '{}', 'b4ce189320804dc6b87e602594e93d35', 1261587558609436672, '【服务网关管理】- 路由组管理', '/api/ApiGateway/RouteGroups', '', '', '/api/ApiGateway/RouteGroups', 'GET,POST,PUT,DELETE,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (8, '{}', '8736fefa36da4b129f3fcf6aa095f2ce', 1261588213298348032, '【服务网关管理】- 查询单个路由组', '/api/ApiGateway/RouteGroups/By-AppId/{AppId}', '', '', '/api/ApiGateway/RouteGroups/By-AppId/{AppId}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (9, '{}', 'befd14ad39e244bc9dea7e0c01e642ce', 1261588367619375104, '【服务网关管理】- 查询所有有效路由组', '/api/ApiGateway/RouteGroups/Actived', '', '', '/api/ApiGateway/RouteGroups/Actived', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (10, '{}', '0a95945d77144ce69addb0d1e8d37837', 1261588628450557952, '【服务网关管理】- 基础配置', '/api/ApiGateway/Globals', '', '', '/api/ApiGateway/Globals', 'GET,POST,PUT,DELETE,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (11, '{}', '70ee7f919bf44b42b549c905316bfd75', 1261588881564221440, '【服务网关管理】- 查询单个基础配置', '/api/ApiGateway/Globals/By-AppId/{AppId}', '', '', '/api/ApiGateway/Globals/By-AppId/{AppId}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (12, '{}', 'caf54542d561428a9123ebed88e4b2e9', 1261588983053795328, '【服务网关管理】- 路由配置', '/api/ApiGateway/Routes', '', '', '/api/ApiGateway/Routes', 'GET,POST,PUT,DELETE,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (13, '{}', 'df6c48fdaab44a37842992ae61c59dc5', 1261589139039961088, '【服务网关管理】- 通过标识查询路由', '/api/ApiGateway/Routes/By-RouteId/{RouteId}', '', '', '/api/ApiGateway/Routes/By-RouteId/{RouteId}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (14, '{}', 'aaeaedebd24a4011ad565b5559f84c5f', 1261589197483393024, '【服务网关管理】- 通过名称查询路由', '/api/ApiGateway/Routes/By-RouteName/{RouteName}', '', '', '/api/ApiGateway/Routes/By-RouteName/{RouteName}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (15, '{}', '559c9f1b2b8c44caac86f7a643a16aaa', 1261589278857084928, '【服务网关管理】- 通过应用标识查询路由', '/api/ApiGateway/Routes/By-AppId/{AppId}', '', '', '/api/ApiGateway/Routes/By-AppId/{AppId}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (16, '{}', '00d0a12f403a4a919c99c534bd76d0d0', 1261589420356124672, '【服务网关管理】- 清空应用标识下所有路由', '/api/ApiGateway/Routes/Clear', '', '', '/api/ApiGateway/Routes/Clear', 'DELETE,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, '', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (17, '{}', '8c308f1386ad49c799cd281eb95170ac', 1261589960393736192, '【服务网关管理】- 通过应用标识查询动态路由', '/api/ApiGateway/DynamicRoutes/By-AppId/{AppId}', '', NULL, '/api/ApiGateway/DynamicRoutes/By-AppId/{AppId}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (18, '{}', 'e659ebbf61534a978335cfeabdc0b375', 1261606600242085888, '【服务网关管理】- 通过应用标识查询聚合路由', '/api/ApiGateway/Aggregates/by-AppId/{AppId}', '', NULL, '/api/ApiGateway/Aggregates/by-AppId/{AppId}', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (19, '{}', 'd665e4491b81413385858601d9cf9a1d', 1261606689601732608, '【服务网关管理】- 聚合路由', '/api/ApiGateway/Aggregates', '', NULL, '/api/ApiGateway/Aggregates', 'GET,POST,PUT,DELETE,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (22, '{}', '2aad614e2c2a497593a4784ff639c3d9', 1262220447629058048, '【身份认证服务】- 克隆客户端', '/api/identity-server/clients/{id}/clone', '', NULL, '/api/identity-server/clients/{id}/clone', 'POST,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30015,', '', NULL, NULL, NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (23, '{}', '1504c5e4a7334298878339a305445b21', 1262230734939758592, '【身份认证服务】- 可用的Api资源', '/api/identity-server/clients/assignable-api-resources', '', NULL, '/api/identity-server/clients/assignable-api-resources', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30015,', '', NULL, 'assignable-api-resources', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (25, '{}', '53dd1751d9104940a966006a5e93d1fa', 1262296916350869504, '【身份认证服务】- 可用的身份资源', '/api/identity-server/clients/assignable-identity-resources', '', NULL, '/api/identity-server/clients/assignable-identity-resources', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30015,', '', NULL, 'assignable-identity-resources', NULL, 30000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (26, '{}', '3fccd1318d0d47d9aef85542668829a6', 1262632376348594176, '【身份认证服务】- Api资源', '/api/identity-server/api-resources', '', '', '/api/identity-server/api-resources', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (27, '{}', 'de6bd0ddea6d4019b4855be5442fafdc', 1262632791869902848, '【身份认证服务】- 管理Api资源', '/api/identity-server/api-resources/{id}', '', '', '/api/identity-server/api-resources/{id}', 'GET,DELETE,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (30, '{}', '0f9875697b74420c9dc2eaf77099b210', 1262660336921235456, '【身份认证服务】- 用户登录', '/api/account/login', '', '', '/api/account/login', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (31, '{}', 'a890c6ecc6a64c9fa313a0f6b5406e1c', 1262660528277966848, '【身份认证服务】- 用户登出', '/api/account/logout', '', '', '/api/account/logout', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (32, '{}', '88de580b6beb4d9d9d4367840ba1fcea', 1262660706875625472, '【身份认证服务】- 检查密码', '/api/account/checkPassword', '', '', '/api/account/checkPassword', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (33, '{}', '78f3c1adc7a54696af37a419eda47c62', 1262660966393991168, '【身份认证服务】- 个人信息页', '/api/identity/my-profile', '', '', '/api/identity/my-profile', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (34, '{}', '95b23aa5cebb40598a78c0761cfd0b26', 1262661109474283520, '【身份认证服务】- 修改密码', '/api/identity/my-profile/change-password', '', '', '/api/identity/my-profile/change-password', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (35, '{}', '4828f7c2aff8485189f37aba5de62d60', 1262663888804663296, '【身份认证管理】- 角色管理', '/api/identity/roles', '', '', '/api/identity/roles', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (36, '{}', '0fddcd3b50a24c6795ec9034fdb44778', 1262664024096133120, '【身份认证服务】- 角色列表', '/api/identity/roles/all', '', '', '/api/identity/roles/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (37, '{}', '191e555219e845069dfd93793263a840', 1262664186252120064, '【身份认证服务】- 单个角色', '/api/identity/roles/{id}', '', '', '/api/identity/roles/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (38, '{}', 'c316858e82f74e6ca6e923d6b3a3fa76', 1262664357044178944, '【身份认证服务】- 用户注册', '/api/account/register', '', '', '/api/account/register', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (39, '{}', 'db53b6f957914a10a6a97ba306b1f6ef', 1262664632928718848, '【身份认证服务】- 单个用户', '/api/identity/users/{id}', '', '', '/api/identity/users/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (40, '{}', '1833434b8ce34f8ab791e7e950f4c61f', 1262664751409418240, '【身份认证服务】- 用户管理', '/api/identity/users', '', '', '/api/identity/users', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (41, '{}', 'b3c963a1612144918bffaf272697498c', 1262664871274237952, '【身份认证服务】- 用户角色', '/api/identity/users/{id}/roles', '', '', '/api/identity/users/{id}/roles', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (42, '{}', '33dd757b79cb4f52994af13bfb4f6783', 1262665026111164416, '【身份认证服务】- 通过用户名查询用户', '/api/identity/users/by-username/{userName}', '', '', '/api/identity/users/by-username/{userName}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (43, '{}', 'e46fd6cb3a104da3aadfe0149fe4de68', 1262665159905267712, '【身份认证服务】- 通过邮件查询用户', '/api/identity/users/by-email/{email}', '', '', '/api/identity/users/by-email/{email}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (44, '{}', '8c8ec5ad6aaa4145981ee7ac876c36c9', 1262665329829105664, '【身份认证服务】- 通过标识查询用户', '/api/identity/users/lookup/{id}', '', '', '/api/identity/users/lookup/{id}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (45, '{}', 'f5c0c8c02c0846fdbe5015cd86f3d81b', 1262665456471920640, '【身份认证服务】- 通过名称查询用户', '/api/identity/users/lookup/by-username/{userName}', '', '', '/api/identity/users/lookup/by-username/{userName}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (46, '{}', 'ecf0ea4a3e3c4b2e8fa3621514d00c74', 1262665628165754880, '【基础服务】- 通过名称查询租户', '/api/abp/multi-tenancy/tenants/by-name/{name}', '', '', '/api/abp/multi-tenancy/tenants/by-name/{name}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (47, '{}', '69132bc515b64005af4292ce0dee5626', 1262666172682883072, '【基础服务】- 通过标识查询租户', '/api/abp/multi-tenancy/tenants/by-id/{id}', '', '', '/api/abp/multi-tenancy/tenants/by-id/{id}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (49, '{}', '35f48d7bc3694bbf95d64fe59aa631ac', 1262723402331885568, '【身份认证服务】- 已有的跨域资源', '/api/identity-server/clients/distinct-cors-origins', '', '', '/api/identity-server/clients/distinct-cors-origins', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', 'distinct-cors-origins', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (50, '{}', 'f333d028839d4fc2aafa8509e674d7dd', 1262935771746734080, '【身份认证服务】- 身份资源', '/api/identity-server/identity-resources', '', '', '/api/identity-server/identity-resources', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (51, '{}', 'dffd1bfaca5b4c1890221678f2b16cd5', 1262935906522304512, '【身份认证服务】- 身份资源管理', '/api/identity-server/identity-resources/{id}', '', '', '/api/identity-server/identity-resources/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (54, '{}', '7b847d8434bc4d1db07fa8961d90c14a', 1263074419073593344, '【服务网关管理】- 接口代理', '/api/abp/api-definition', '', '', '/api/abp/apigateway/api-definition', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30001,', '', '', 'apigateway-api-definition', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (55, '{}', 'ca2cedfa620045a9adef0be2f958c4bc', 1263075249394790400, '【服务网关管理】- 查询聚合路由', '/api/ApiGateway/Aggregates/{RouteId}', '', '', '/api/ApiGateway/Aggregates/{RouteId}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30001,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (57, '{}', '98fbc99fc8644946ac0a72cc3dc5fd1f', 1263075593499684864, '【服务网关管理】- 聚合路由配置', '/api/ApiGateway/Aggregates/RouteConfig', '', '', '/api/ApiGateway/Aggregates/RouteConfig', 'POST,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30001,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (59, '{}', 'c692b30c72d4424eb4740ac49f4e9373', 1263101898440146944, '【服务网关管理】- 框架配置', '/api/abp/application-configuration', '', '', '/api/abp/apigateway/application-configuration', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30001,', '', '', 'apigateway-configuration', 0, 120000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (60, '{}', '8409117162504f71aa66982f05c38a80', 1263303878648569856, '【平台服务】- 接口代理', '/api/abp/api-definition', '', '', '/api/abp/platform/api-definition', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', 'platform-api-definition', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (61, '{}', '9f520820071b4e14bc94ab57989cea1f', 1263304204797648896, '【平台服务】- 框架配置', '/api/abp/application-configuration', '', '', '/api/abp/platform/application-configuration', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', 'platform-configuration', 0, 120000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (62, '{}', '530ab314560f41678b40f48da9383d51', 1263304872891555840, '【后台管理】- 租户管理', '/api/tenant-management/tenants', '', '', '/api/tenant-management/tenants', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (63, '{}', '21334c6da4c349cc883c38c13de0e754', 1263305106250047488, '【后台管理】- 特定租户管理', '/api/tenant-management/tenants/{id}', '', '', '/api/tenant-management/tenants/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (64, '{}', 'cc8fdf1b2d0b414ebf2dc51a6dc78305', 1263305244594970624, '【后台管理】- 租户连接字符串', '/api/tenant-management/tenants/{id}/connection-string', '', '', '/api/tenant-management/tenants/{id}/connection-string', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 2, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (65, '{}', 'aaf285ed10da4024ba561d5cf8c6322b', 1263305430536855552, '【后台管理】- 特定租户连接字符串', '/api/tenant-management/tenants/{id}/connection-string/{name}', '', '', '/api/tenant-management/tenants/{id}/connection-string/{name}', 'GET,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 1, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (66, '{}', '6a7da198f4c84d94969a437adc47642b', 1263639172959174656, '【后台管理】- 全局设置', '/api/setting-management/settings/by-global', '', '', '/api/setting-management/settings/by-global/app', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'setting-global', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (67, '{}', '755b4dce5c34444785fa3b647fef4131', 1264799968944640000, '【身份认证服务】- 验证手机号', '/api/account/phone/verify', '', '', '/api/account/phone/verify', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (68, '{}', '535191c570ae453ab320012304d7a62c', 1264800070161584128, '【身份认证服务】- 手机号注册', '/api/account/phone/register', '', '', '/api/account/phone/register', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (69, '{}', '723c9b111f9f4a1aa804118cdde193d3', 1267360794414161920, '【消息服务】- 通知', '/signalr-hubs/notifications/{everything}', '', '', '/signalr-hubs/notifications/{everything}', 'POST,GET,OPTIONS,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'ws', '127.0.0.1:30020,', '', '', '', 1, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (70, '{}', 'f3aa2b42dd9f468aa5aae4ef64754427', 1267383367629807616, '【消息服务】- 通知0', '/signalr-hubs/notifications', '', '', '/signalr-hubs/notifications', 'GET,POST,PUT,DELETE,OPTIONS,', '', '', '', '', '', '', '', 1, '', '', 'ws', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (71, '{}', '0344947bb79b401baa2ef7b4e58297f6', 1267817055527632896, '【消息服务】- 聊天', '/signalr-hubs/messages', '', '', '/signalr-hubs/messages', 'GET,POST,PUT,DELETE,OPTIONS,', '', '', '', '', '', '', '', 1, '', '', 'ws', '127.0.0.1:30020,', '', '', '', 1, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (72, '{}', '6676b5e5f76d40739f9ccc3e371e2f18', 1267817221286526976, '【消息服务】- 聊天1', '/signalr-hubs/messages/{everything}', '', '', '/signalr-hubs/messages/{everything}', 'GET,POST,PUT,DELETE,OPTIONS,', '', '', '', '', '', '', '', 1, '', '', 'ws', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (73, '{}', 'cfb5f09a12bf495fbcaf2fa5d9123a40', 1268893687085518848, '【身份认证服务】- 重置密码', '/api/account/phone/reset-password', '', '', '/api/account/phone/reset-password', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 1, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (101, '{}', '997a4c27a433458aafed9b8aa252d957', 1288657613998579712, '【身份认证服务】- 组织机构列表', '/api/identity/organization-units', '', '', '/api/identity/organization-units', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (102, '{}', 'a2c6acc9882a425ab26bd3ad5a9c17c6', 1288657941770854400, '【身份认证服务】- 组织机构管理', '/api/identity/organization-units/{id}', '', '', '/api/identity/organization-units/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 1, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (103, '{}', '390acfb0e16943c6b61e731d47c282e9', 1288658134067109888, '【身份认证服务】- 组织机构移动', '/api/identity/organization-units/{id}/move', '', '', '/api/identity/organization-units/{id}/move', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (104, '{}', '3515e75becf9447492ad60466b27c397', 1288658305156964352, '【身份认证服务】- 查询组织机构子级', '/api/identity/organization-units/find-children', '', '', '/api/identity/organization-units/find-children', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (105, '{}', 'aab0a24d930f4f9687497e5ccaac2a31', 1288658491216289792, '【身份认证服务】- 查询组织机构最后一个子节点', '/api/identity/organization-units/last-children', '', '', '/api/identity/organization-units/last-children', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (106, '{}', '9b7c999b1c5140c497bc15914a815401', 1288658638302142464, '【身份认证服务】- 未加入组织机构角色', '/api/identity/organization-units/{id}/unadded-roles', '', '', '/api/identity/organization-units/{id}/unadded-roles', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (107, '{}', 'b0cdb3f6908e42bd934ca99a78f22c3f', 1288658791784308736, '【身份认证服务】- 未加入组织机构用户', '/api/identity/organization-units/{id}/unadded-users', '', '', '/api/identity/organization-units/{id}/unadded-users', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (108, '{}', '9362040d10a94fb991f60bc391efcb85', 1290849478956199936, '【后台管理】- 当前租户设置', '/api/setting-management/settings/by-current-tenant', '', '', '/api/setting-management/settings/by-current-tenant/app', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'setting-current-tenant', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (109, '{}', 'a7df3a04805d4cc8a6e6b3823c6dd468', 1290849628051124224, '【后台管理】- 用户设置', '/api/setting-management/settings/by-user/{userId}', '', '', '/api/setting-management/settings/by-user/{userId}', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (110, '{}', 'ef6e38a529a345fab67f6a627cf20635', 1290849798553776128, '【后台管理】- 当前用户设置', '/api/setting-management/settings/by-current-user', '', '', '/api/setting-management/settings/by-current-user', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (112, '{}', '9844fed6507844f2ac64bd08649bd3a6', 1291259822512693248, '【身份认证服务】- 查询组织机构根节点', '/api/identity/organization-units/root-node', '', '', '/api/identity/organization-units/root-node', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (113, '{}', '24d8794cf8f943b4ac45d2bcccf7c128', 1292620505149145088, '【平台服务】- 文件系统', '/api/file-management/file-system', '', '', '/api/file-management/file-system', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (114, '{}', '0acf6762d3af43efb655107e0039f5fc', 1292620665505775616, '【平台服务】- 文件系统 - 目录管理', '/api/file-management/file-system/folders', '', '', '/api/file-management/file-system/folders', 'POST,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (115, '{}', '8b4363f70865419089b5f62ba35382df', 1292620843398791168, '【平台服务】- 文件系统 - 文件管理', '/api/file-management/file-system/files', '', '', '/api/file-management/file-system/files', 'GET,POST,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 1200000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (116, '{}', '7eb315567bbc470bbbfd26923c5d0aba', 1292621027574874112, '【平台服务】- 文件系统 - 复制目录', '/api/file-management/file-system/folders/copy', '', '', '/api/file-management/file-system/folders/copy', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (117, '{}', 'af5853680cff454fa66ff6022f18da23', 1292621363161137152, '【平台服务】- 文件系统 - 移动目录', '/api/file-management/file-system/folders/move', '', '', '/api/file-management/file-system/folders/move', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (118, '{}', '6daa6d8c8adb466899988fd8181c29a8', 1292621494837116928, '【平台服务】- 文件系统 - 复制文件', '/api/file-management/file-system/files/copy', '', '', '/api/file-management/file-system/files/copy', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (119, '{}', '9560caaa3bd9424984c44724aa54bfe9', 1292621629260365824, '【平台服务】- 文件系统 - 移动文件', '/api/file-management/file-system/files/move', '', '', '/api/file-management/file-system/files/move', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (120, '{}', 'fc2aaa6035484201b9014912930fb7cb', 1292622526073864192, '【平台服务】- 文件系统 - 详情页', '/api/file-management/file-system/profile', '', '', '/api/file-management/file-system/profile', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (121, '{}', 'c6c7b027000942dda8ba0d2e2d8cf705', 1293470838745821184, '【后台管理】- 框架配置', '/api/abp/application-configuration', '', '', '/api/abp/backend-admin/application-configuration', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'backend-admin-configuration', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (122, '{}', 'becd4342079d4399abda5b5ba3b46fdc', 1293471661785706496, '【消息服务】- 框架配置', '/api/abp/application-configuration', '', '', '/api/abp/messages/application-configuration', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', 'messages-configuration', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (123, '{}', 'c828140cee3043c18ffc274f6461f0f2', 1293472678392721408, '【后台管理】- 接口代理', '/api/abp/api-definition', '', '', '/api/abp/backend-admin/api-definition', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'backend-admin-api-definition', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (124, '{}', 'e683cff8066d4c2899a17d0f618f1a0b', 1293472857510473728, '【消息服务】- 接口代理', '/api/abp/api-definition', '', '', '/api/abp/messages/api-definition', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', 'messages-api-definition', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (125, '{}', '0e9c3bff5b58428eba97a5516140ba5e', 1299273336009359360, '【消息服务】- Hangfire仪表板 ', '/hangfire', '', '', '/hangfire', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (126, '{}', 'e906924ad3a947cf8e6956e2dd258192', 1299273436282585088, '【消息服务】- Hangfire仪表板 - 主页', '/hangfire/', '', '', '/hangfire/', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (127, '{}', 'e02f2049efbc4ee1ad6629bd0341ed2b', 1299273618470567936, '【消息服务】- Hangfire仪表板 - 状态', '/hangfire/stats', '', '', '/hangfire/stats', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (128, '{}', 'f8d2b2f0f1d649c2a07eeef23d6adb0e', 1299273770182737920, '【消息服务】- Hangfire仪表板 - 作业管理', '/hangfire/jobs/{everything}', '', '', '/hangfire/jobs/{everything}', 'GET,POST,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (129, '{}', '9785be7a29774b468e271b23009fe115', 1299273978023084032, '【消息服务】- Hangfire仪表板 - 重试', '/hangfire/retries', '', '', '/hangfire/retries', 'GET,POST,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (130, '{}', '9c0c1cd196bb45c0bc03fafb7a1eb8f2', 1299274123225694208, '【消息服务】- Hangfire仪表板 - 周期性作业', '/hangfire/recurring', '', '', '/hangfire/recurring', 'GET,POST,DELETE,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (131, '{}', '243bafe828be463ea63a3e2b521f9923', 1299274222299348992, '【消息服务】- Hangfire仪表板 - 服务器列表', '/hangfire/servers', '', '', '/hangfire/servers', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (132, '{}', '57a8ac1b41bb434cad38fbde0e2ba2f0', 1304238876758495232, '【后台管理】- 管理功能', '/api/feature-management/features', '', '', '/api/feature-management/features', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (133, '{}', '40a150f629b047f587c91a9436a699c0', 1304678610343383040, '【身份认证服务】- 接口代理', '/api/abp/api-definition', '', '', '/api/abp/identity-server/api-definition', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', 'identity-server-api-definition', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (134, '{}', '3a2d5d538fa44ac690402fc5c4e1a401', 1304679169305694208, '【身份认证服务】- 框架配置', '/api/abp/application-configuration', '', '', '/api/abp/identity-server/application-configuration', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', 'identity-server-configuration', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (135, '{}', '2ecfe7483bc94c28ad0769b654eb765d', 1310460417141817344, '【后台管理】- 审计日志列表', '/api/auditing/audit-log', '', '', '/api/auditing/audit-log', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (136, '{}', '744e340c0024462d88458b7ea9605b3c', 1310502391475519488, '【后台服务】- 安全日志列表', '/api/auditing/security-log', '', '', '/api/auditing/security-log', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (137, '{}', 'a99639f4172547c4ba9b4f4ca5cb4ab9', 1310515546943569920, '【后台服务】- 安全日志', '/api/auditing/security-log/{id}', '', '', '/api/auditing/security-log/{id}', 'DELETE,GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (138, '{}', 'c3ebc82d55f640fb9d70a911e97e4ec1', 1310515735292985344, '【后台管理】- 审计日志', '/api/auditing/audit-log/{id}', '', '', '/api/auditing/audit-log/{id}', 'DELETE,GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (139, '{}', '0379fcb3a9cd4b13b562b3b5b5c3eb7d', 1316628769783480320, '【身份认证服务】- 声明类型', '/api/identity/claim-types', '', '', '/api/identity/claim-types', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (140, '{}', 'de25c9a80d994f728b37eb483b2f5127', 1316628940663619584, '【身份认证服务】- 管理声明类型', '/api/identity/claim-types/{id}', '', '', '/api/identity/claim-types/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (141, '{}', '25c19106baff4cf3a877ae8cd690a1b5', 1316629112428756992, '【身份认证服务】- 查询在用的声明类型列表', '/api/identity/claim-types/actived-list', '', '', '/api/identity/claim-types/actived-list', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (142, '{}', '7d3b941d8c4d4d3ebc05b6332308b992', 1316652047017246720, '【身份认证服务】- 管理用户声明', '/api/identity/users/{id}/claims', '', '', '/api/identity/users/{id}/claims', 'POST,PUT,DELETE,GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (144, '{}', '51a14bc295044de985ae014fbcc5bddf', 1319200951383199744, '【IdentityServer4】- 发现端点', '/.well-known/openid-configuration', '', '', '/.well-known/openid-configuration', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:44385,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (145, '{}', '9d859a444d774e93818237e53b6cc102', 1319221929807024128, '【身份认证服务】- 查询所有组织机构', '/api/identity/organization-units/all', '', '', '/api/identity/organization-units/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (146, '{}', '89f42175b24540caba2a1fded145acf8', 1319554431134306304, '【身份认证服务】- 管理组织机构用户', '/api/identity/organization-units/{id}/users', '', '', '/api/identity/organization-units/{id}/users', 'POST,GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (147, '{}', '126d82509cec43eda712e94737b01039', 1319554550458060800, '【身份认证服务】- 管理组织机构角色', '/api/identity/organization-units/{id}/roles', '', '', '/api/identity/organization-units/{id}/roles', 'POST,GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (148, '{}', '824f5eee6877489f96f1022e306c968a', 1319554948434595840, '【身份认证服务】- 管理角色组织机构', '/api/identity/roles/{id}/organization-units', '', '', '/api/identity/roles/{id}/organization-units', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (149, '{}', 'fe1379d4a13f41afb6410f4c948871f3', 1319555067183730688, '【身份认证服务】- 删除角色组织机构', '/api/identity/roles/{id}/organization-units/{ouId}', '', '', '/api/identity/roles/{id}/organization-units/{ouId}', 'DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (150, '{}', '197a69bb723346aba3601bd61e7fa655', 1319555230765780992, '【身份认证服务】- 管理用户组织机构', '/api/identity/users/{id}/organization-units', '', '', '/api/identity/users/{id}/organization-units', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (151, '{}', '1a7e6d0b1c95484f82a75a2ce6e6f453', 1319555333790470144, '【身份认证服务】- 删除用户组织机构', '/api/identity/users/{id}/organization-units/{ouId}', '', '', '/api/identity/users/{id}/organization-units/{ouId}', 'DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (152, '{}', 'ecfa9bbd19694097b33e691b653f2124', 1321001932510203904, '【消息服务】- 我的消息', '/api/im/chat/my-messages', '', '', '/api/im/chat/my-messages', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (153, '{}', '4867ad188ca54acb8b961d20297b6545', 1321002059803136000, '【消息服务】- 我的最近消息', '/api/im/chat/my-last-messages', '', '', '/api/im/chat/my-last-messages', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (154, '{}', '291ab802d7bc4af98fc15c509f98fa75', 1321002256440496128, '【消息服务】- 我的朋友', '/api/im/my-friends', '', '', '/api/im/my-friends', 'GET,POST,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (155, '{}', '08438dabb1e849988e0c304f82b08a10', 1321002350686507008, '【消息服务】- 我的所有朋友', '/api/im/my-friends/all', '', '', '/api/im/my-friends/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (156, '{}', 'cecf632785b7402299764698369c751f', 1322190027988525056, '【消息服务】- 发送好友请求', '/api/im/my-friends/add-request', '', '', '/api/im/my-friends/add-request', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (157, '{}', '91b088ab3e164116b8c4a2b6109e37e9', 1322452079688458240, '【消息服务】- 我的订阅', '/api/my-subscribes', '', '', '/api/my-subscribes', 'GET,POST,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (158, '{}', 'b9f57600634b40c087ac0730926895e2', 1322452183929495552, '【消息服务】- 我的订阅列表', '/api/my-subscribes/all', '', '', '/api/my-subscribes/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', 'my-subscribes', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (159, '{}', '8e6a0c6759df42e29b9abd4d833646a3', 1322452308651319296, '【消息服务】- 是否已订阅', '/api/my-subscribes/is-subscribed/{Name}', '', '', '/api/my-subscribes/is-subscribed/{Name}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (160, '{}', '6b747d0acfee478ea64241b7ea519861', 1322452858176446464, '【消息服务】- 我的通知', '/api/my-notifilers', '', '', '/api/my-notifilers', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (161, '{}', '25a64613f37f44cf8efff8d0cf6cd0ca', 1322452989235863552, '【消息服务】- 管理我的通知', '/api/my-notifilers/{id}', '', '', '/api/my-notifilers/{id}', 'GET,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (162, '{}', 'ddc7f13aaa2741b28c2102fbff18d836', 1322453089655889920, '【消息服务】- 可用通知列表', '/api/my-notifilers/assignables', '', '', '/api/my-notifilers/assignables', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30020,', '', '', 'assignables-notifilers', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (163, '{}', '1d586107d7e240b3bfc14c8ca04baea8', 1329706860249804800, '【微信管理】- 微信公共配置', '/api/setting-management/wechat/by-global', '', '', '/api/setting-management/wechat/by-global', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'wechat-setting-global', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (164, '{}', 'bd9b34dd564f405bb3a063d6a719ce6e', 1329707002411544576, '【微信管理】- 微信租户配置', '/api/setting-management/wechat/by-current-tenant', '', '', '/api/setting-management/wechat/by-current-tenant', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'wechat-setting-current-tenant', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (165, '{}', 'e9847659244b47dc80101b1c3f4edb31', 1329708512277098496, '【后台管理】- 变更全局设置', '/api/setting-management/settings/change-global', '', '', '/api/setting-management/settings/change-global', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (166, '{}', '94c3692dea394b39ac0cc19f60fc1964', 1329708625917571072, '【后台管理】- 变更当前租户设置', '/api/setting-management/settings/change-current-tenant', '', '', '/api/setting-management/settings/change-current-tenant', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (167, '{}', '626efeddcc0a474aa5e472b6089ca6fe', 1335049839287357440, '【平台服务】- 菜单管理', '/api/platform/menus', '', '', '/api/platform/menus', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (168, '{}', 'e4b4acf5f7dd4015828bdcd735424937', 1335050034221830144, '【平台服务】- 管理菜单', '/api/platform/menus/{id}', '', '', '/api/platform/menus/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (169, '{}', 'bbdb31a7eaba4bf7bead6a7e1151872c', 1335050145899368448, '【平台服务】- 获取当前用户菜单', '/api/platform/menus/by-current-user', '', '', '/api/platform/menus/by-current-user', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (170, '{}', '56a6d15682ba489aa46296cd8235cf81', 1335050283434790912, '【平台服务】- 管理用户菜单', '/api/platform/menus/by-user', '', '', '/api/platform/menus/by-user', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (171, '{}', '484dc97d5f4843fc85679c1faf1488bf', 1335050381770248192, '【平台服务】- 获取用户菜单', '/api/platform/menus/by-user/{userId}/{platformType}', '', '', '/api/platform/menus/by-user/{userId}/{platformType}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (172, '{}', '63b34bbe4d3b41f397432aa12e73a40d', 1335050520941449216, '【平台服务】- 管理角色菜单', '/api/platform/menus/by-role', '', '', '/api/platform/menus/by-role', 'GET,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (173, '{}', 'c858522741c941bf838aef7eba34b213', 1335050615829188608, '【平台服务】- 获取角色菜单', '/api/platform/menus/by-role/{role}/{platformType}', '', '', '/api/platform/menus/by-role/{role}/{platformType}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (174, '{}', 'da02cbd7a46746f288bb98d40af03a21', 1335111798720450560, '【平台服务】- 获取所有数据字典', '/api/platform/datas/all', '', '', '/api/platform/datas/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (175, '{}', '6c6096b6593c47398d59f73ab62e54a3', 1335118541370314752, '【平台服务】- 数据字典', '/api/platform/datas', '', '', '/api/platform/datas', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (176, '{}', '5efb1b49a1cc4d34a3e338b9e83c12c7', 1335118660417245184, '【平台服务】- 管理数据字典', '/api/platform/datas/{id}', '', '', '/api/platform/datas/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (177, '{}', '00bd2892c6574942bda538aa9d3513cd', 1335118782727344128, '【平台服务】- 增加数据字典项目', '/api/platform/datas/{id}/items', '', '', '/api/platform/datas/{id}/items', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (178, '{}', '9fae5da5d4634eaab7a59d643a8248a7', 1335118903200337920, '【平台服务】- 管理数据字典项目', '/api/platform/datas/{id}/items/{name}', '', '', '/api/platform/datas/{id}/items/{name}', 'DELETE,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (179, '{}', '70d6120e560f41c3879ec4549636cdb8', 1336230645078921216, '【平台服务】- 获取所有菜单', '/api/platform/menus/all', '', '', '/api/platform/menus/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (180, '{}', 'c67549cd6cd246f08d9f6ce93c906c21', 1337314809113722880, '【平台服务】- 布局', '/api/platform/layouts', '', '', '/api/platform/layouts', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (181, '{}', 'bacca946a092434cb2ee5994c88f2c33', 1337314938973569024, '【平台服务】- 管理布局', '/api/platform/layouts/{id}', '', '', '/api/platform/layouts/{id}', 'GET,DELETE,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (182, '{}', '741fdd4cc05a4025a9073a2e1ab9d5ea', 1340961907637243904, '【平台服务】- 获取所有布局', '/api/platform/layouts/all', '', '', '/api/platform/layouts/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (183, '{}', '26a1ef4016704dab8c254f90bc26ecfe', 1341652247554379776, '【身份认证服务】- Api范围', '/api/identity-server/api-scopes', '', '', '/api/identity-server/api-scopes', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (184, '{}', '3bfc1fef7f5446638f91c9b6e2fb12db', 1341652385555369984, '【身份认证服务】- 管理Api范围', '/api/identity-server/api-scopes/{id}', '', '', '/api/identity-server/api-scopes/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (185, '{}', '3288c25dd61e491db95313ca72016918', 1342457939827552256, '【身份认证服务】- 持久授权', '/api/identity-server/persisted-grants', '', '', '/api/identity-server/persisted-grants', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (186, '{}', '23f94678093148f58ba842096c3a0e39', 1342458050112581632, '【身份认证服务】- 管理持久授权', '/api/identity-server/persisted-grants/{id}', '', '', '/api/identity-server/persisted-grants/{id}', 'GET,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (187, '{}', '3123cac8174142e5b024b30898dc3e6b', 1363657602699718656, '【阿里云】- 阿里云公共配置', '/api/setting-management/aliyun/by-global', '', '', '/api/setting-management/aliyun/by-global', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'aliyun-setting-global', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (188, '{}', 'c112dd1b259a44e58a992480eb237526', 1363657779665793024, '【阿里云】- 阿里云租户配置', '/api/setting-management/aliyun/by-current-tenant', '', '', '/api/setting-management/aliyun/by-current-tenant', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', 'aliyun-setting-current-tenant', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (189, '{}', '9b27e192f9094d2c8e32e9a0fa9fb589', 1363662350572154880, '【身份认证服务】- 发送重置密码短信', '/api/account/phone/send-password-reset-code', '', '', '/api/account/phone/send-password-reset-code', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (190, '{}', 'a118a783851e4dbbbbaa4e1cfd2b4079', 1370283697803829248, '【Oss对象存储】- 管理容器（Bucket）', '/api/oss-management/containes/{name}', '', '', '/api/oss-management/containes/{name}', 'POST,GET,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (191, '{}', '02c0d3e9ae6f4f3a91cb2b09954b8df1', 1370283782075785216, '【Oss对象存储】- 获取容器列表', '/api/oss-management/containes', '', '', '/api/oss-management/containes', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (192, '{}', 'b9eca50649a742129cff9767484b45bd', 1370283867966742528, '【Oss对象存储】- 获取对象列表', '/api/oss-management/containes/objects', '', '', '/api/oss-management/containes/objects', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (193, '{}', 'ac2c34befa0e4838b32b73b2b1f31cb6', 1370283988712366080, '【Oss对象存储】- 管理Oss对象', '/api/oss-management/objects', '', '', '/api/oss-management/objects', 'GET,POST,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (194, '{}', '84d3ebd88d8842acb134524d0d1a3f72', 1370284066516705280, '【Oss对象存储】- 上传Oss对象', '/api/oss-management/objects/upload', '', '', '/api/oss-management/objects/upload', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', NULL, '', 0, 3000000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (195, '{}', '69baeb0faf3d4fd29e1a4010fb9d7be5', 1370284158262910976, '【Oss对象存储】- 批量删除Oss对象', '/api/oss-management/objects/bulk-delete', '', '', '/api/oss-management/objects/bulk-delete', 'DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (196, '{}', '12a080797fe846f19fb47b0e2718617f', 1370284253045792768, '【Oss对象存储】- 静态文件管理', '/api/files/static/{everything}', '', '', '/api/api/files/static/{everything}', 'POST,GET,OPTIONS,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (197, '{}', 'cd88951cb09e4e3ca7defa469b8aa399', 1370284344397733888, '【Oss对象存储】- 获取公共配置', '/api/setting-management/oss-management/by-global', '', '', '/api/setting-management/oss-management/by-global', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', 'oss-management-global', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (198, '{}', 'd991900c932d4793b7ae0cd6fee264a6', 1370284429890232320, '【Oss对象存储】- 获取租户配置', '/api/setting-management/oss-management/by-current-tenant', '', '', '/api/setting-management/oss-management/by-current-tenant', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', 'oss-management-current-tenant', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (204, '{}', '2caffdb6c441469db8ad820115b5638b', 1370914923144478720, '【Oss对象存储】- 外部访问静态文件', '/api/files/static/{everything}', '', '', '/api/files/static/{everything}', 'GET,POST,OPTIONS,DELETE,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 1200000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (205, '{}', '71e8dad2c3674b37bc6d52d19378d1d2', 1371844966074970112, '【位置服务】- 逆地址解析', '/api/location/re-gercode', '', '', '/api/location/re-gercode', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:40011,', '', NULL, '', 1, 30000, 1, '', 'w-shop');
INSERT INTO `appapigatewayreroute` VALUES (206, '{}', '0f4561aaad3840cb912a5b9ba70064fb', 1371845082676621312, '【位置服务】- 地理位置解析', '/api/location/gercode', '', '', '/api/location/gercode', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:40011,', '', '', '', 0, 30000, 1, '', 'w-shop');
INSERT INTO `appapigatewayreroute` VALUES (207, '{}', '76092a930ab345f0899f5258e3580e4a', 1371845219528372224, '【位置服务】- 逆地址解析-通过IP地址', '/api/location/ip-gercode', '', '', '/api/location/ip-gercode', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:40011,', '', '', '', 0, 30000, 1, '', 'w-shop');
INSERT INTO `appapigatewayreroute` VALUES (211, '{}', '9c4188bbc68f455a8d21899f3d257aa8', 1375612899682799616, '【本地化管理】- 本地化语言', '/api/localization/languages', '', '', '/api/localization/languages', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (212, '{}', '84a18bc0531a4f7d8c5c6868b2732395', 1375613095783288832, '【本地化管理】- 语言管理', '/api/localization/languages/{id}', '', '', '/api/localization/languages/{id}', 'GET,DELETE,PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (213, '{}', '941a9d7c8c1c49a2afa7c24d33d170df', 1375613222187028480, '【本地化管理】- 获取所有语言', '/api/localization/languages/all', '', '', '/api/localization/languages/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (214, '{}', '616a39bec0b94d90911a1a95bf66d327', 1375613355029024768, '【本地化管理】- 资源管理', '/api/localization/resources', '', '', '/api/localization/resources', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (215, '{}', '07d74f02e2ff4efd88e11744eb76c5d2', 1375613462969438208, '【本地化管理】- 管理单个资源', '/api/localization/resources/{id}', '', '', '/api/localization/resources/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (216, '{}', '1f8fbd2d416744f6b76cb4ac223e3e5a', 1375613567365664768, '【本地化管理】- 获取所有资源', '/api/localization/resources/all', '', '', '/api/localization/resources/all', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (217, '{}', 'ad15a2e9e2e24a019dc3b892ea674934', 1375613732239560704, '【本地化管理】- 文本管理', '/api/localization/texts', '', '', '/api/localization/texts', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (218, '{}', '2582e861680a42d78ec2cc7f853bf303', 1375613833662025728, '【本地化管理】- 管理单个文本', '/api/localization/texts/{id}', '', '', '/api/localization/texts/{id}', 'GET,PUT,DELETE,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (219, '{}', '701ddf9f15844e968f0a980018d5e687', 1375679597777637376, '【本地化管理】- 接口代理', '/api/abp/api-definition', '', '', '/api/abp/localization/api-definition', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30030,', '', '', 'localization-api-definition', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (225, '{}', '13249916a52a4568b55b6c3fa813b374', 1393020696332705792, '【后台管理】- 路由代理测试', '/api/connect', '', '', '/api/connect', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (482, '{}', '295034c498744783ba0ecf3b80546ca5', 1395924337284407296, '【后台管理】- 通过名称查询租户', '/api/tenant-management/tenants/name/{name}', '', '', '/api/tenant-management/tenants/name/{name}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30010,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (483, '{}', 'be25633a37d14ab4b94803698c528e4c', 1406817452004757504, '【平台服务】- 参照名称查询字典', '/api/platform/datas/by-name/{name}', '', '', '/api/platform/datas/by-name/{name}', 'GET,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30025,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (493, '{}', '7f1af94bf83343fd91bf9e8eaa0e2fc5', 1431803251955654656, '【身份认证服务】- 换取token', '/connect/token', '', '', '/connect/token', 'POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:44385,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (494, '{}', 'dd09d208eca64c91b804377f45c85974', 1431806909455851520, '【身份认证服务】- 用户信息', '/connect/userinfo', '', '', '/connect/userinfo', 'GET,POST,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:44385,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (495, '{}', 'f0660047374f43b3bcdf3555799488c6', 1432189824874373120, '【身份认证服务】- 发送变更手机号短信', '/api/identity/my-profile/send-phone-number-change-code', '', '', '/api/identity/my-profile/send-phone-number-change-code', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (496, '{}', 'da9dbe339b3e453abf79df15fe774bda', 1432190028071624704, '【身份认证服务】- 变更手机号', '/api/identity/my-profile/change-phone-number', '', '', '/api/identity/my-profile/change-phone-number', 'PUT,', '', '', '', '', '', '', '', 1, '', '', 'HTTP', '127.0.0.1:30015,', '', '', '', 0, 30000, 1, '', 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (501, '{}', '4019724446ad4a609916b6fb4eb2b489', 1454289352609521664, '【后台管理】- 系统日志列表', '/api/auditing/logging', '', NULL, '/api/auditing/logging', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30010,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (502, '{}', '03fd15647a4b41f3bd650fdbaa069cc0', 1454289896489115648, '【后台管理】- 系统日志', '/api/auditing/logging/{everything}', '', NULL, '/api/auditing/logging/{everything}', 'GET,DELETE,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30010,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (503, '{}', '31dfee95c57b4558b9d96c92ed07334d', 1456263181821501440, '【后台管理服务】- Api文档', '/swagger/v1/swagger.json', '', NULL, '/admin/v1/swagger.json', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30010,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (504, '{}', '6dd0dce5366d40e0930c09940253653d', 1456263413661655040, '【身份认证服务】- Api文档', '/swagger/v1/swagger.json', '', NULL, '/ids-admin/v1/swagger.json', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30015,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (505, '{}', '611409b212844d9c9d90445e09c59cd0', 1456263574232195072, '【消息服务】- Api文档', '/swagger/v1/swagger.json', '', NULL, '/messages/v1/swagger.json', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30020,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (506, '{}', 'c2fd89c2cc9a4823be4d691eaad75c45', 1456263679999959040, '【平台服务】- Api文档', '/swagger/v1/swagger.json', '', NULL, '/platform/v1/swagger.json', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30025,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (507, '{}', '814d4b9e3c7b4179950047fb43c1ab82', 1456263785251823616, '【本地化管理】- Api文档', '/swagger/v1/swagger.json', '', NULL, '/localization/v1/swagger.json', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30030,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');
INSERT INTO `appapigatewayreroute` VALUES (508, '{}', '34fd7f3411fe487bbf6d1cb487349b86', 1456263957046321152, '【服务网关管理】- Api文档', '/swagger/v1/swagger.json', '', NULL, '/apigateway-admin/v1/swagger.json', 'GET,', '', '', '', '', '', '', NULL, 1, NULL, NULL, 'HTTP', '127.0.0.1:30001,', '', NULL, NULL, 0, 10000, 1, NULL, 'TEST-APP');

-- ----------------------------
-- Table structure for appapigatewayroutegroup
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewayroutegroup`;
CREATE TABLE `appapigatewayroutegroup`  (
  `Id` char(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ExtraProperties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ConcurrencyStamp` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `CreationTime` datetime(6) NOT NULL,
  `CreatorId` char(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `LastModificationTime` datetime(6) NULL DEFAULT NULL,
  `LastModifierId` char(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `IsDeleted` tinyint(1) NOT NULL,
  `DeleterId` char(36) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `DeletionTime` datetime(6) NULL DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AppId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AppName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `AppIpAddress` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `IX_AppApiGatewayRouteGroup_AppId_AppName_AppIpAddress`(`AppId`, `AppName`, `AppIpAddress`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewayroutegroup
-- ----------------------------
INSERT INTO `appapigatewayroutegroup` VALUES ('08d7f735-a83b-49ab-8cee-5d602502bea8', '{}', '83cac848676f4b658d5c9f7d802a497a', '2020-05-13 20:03:32.524271', NULL, '2020-08-05 15:43:28.205288', 'bf289dbb-838e-a89b-c622-39f51dcc4f43', 0, NULL, NULL, 'abp后台管理', 'TEST-APP', 'abp后台管理', '127.0.0.1', 'abp后台管理项目网关', 1);

-- ----------------------------
-- Table structure for appapigatewaysecurityoptions
-- ----------------------------
DROP TABLE IF EXISTS `appapigatewaysecurityoptions`;
CREATE TABLE `appapigatewaysecurityoptions`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `ReRouteId` bigint(20) NOT NULL,
  `IPAllowedList` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `IPBlockedList` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `IX_AppApiGatewaySecurityOptions_ReRouteId`(`ReRouteId`) USING BTREE,
  CONSTRAINT `FK_AppApiGatewaySecurityOptions_AppApiGatewayReRoute_ReRouteId` FOREIGN KEY (`ReRouteId`) REFERENCES `appapigatewayreroute` (`ReRouteId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 248 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appapigatewaysecurityoptions
-- ----------------------------
INSERT INTO `appapigatewaysecurityoptions` VALUES (3, 1261299170387169280, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (4, 1261585859064872960, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (5, 1261586605810368512, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (6, 1261587558609436672, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (7, 1261588213298348032, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (8, 1261588367619375104, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (9, 1261588628450557952, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (10, 1261588881564221440, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (11, 1261588983053795328, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (12, 1261589139039961088, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (13, 1261589197483393024, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (14, 1261589278857084928, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (15, 1261589420356124672, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (16, 1261589960393736192, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (17, 1261606600242085888, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (18, 1261606689601732608, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (21, 1262220447629058048, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (22, 1262230734939758592, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (23, 1262296916350869504, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (24, 1262632376348594176, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (25, 1262632791869902848, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (28, 1262660336921235456, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (29, 1262660528277966848, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (30, 1262660706875625472, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (31, 1262660966393991168, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (32, 1262661109474283520, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (33, 1262663888804663296, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (34, 1262664024096133120, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (35, 1262664186252120064, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (36, 1262664357044178944, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (37, 1262664632928718848, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (38, 1262664751409418240, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (39, 1262664871274237952, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (40, 1262665026111164416, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (41, 1262665159905267712, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (42, 1262665329829105664, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (43, 1262665456471920640, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (44, 1262665628165754880, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (45, 1262666172682883072, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (47, 1262723402331885568, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (48, 1262935771746734080, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (49, 1262935906522304512, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (52, 1263074419073593344, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (53, 1263075249394790400, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (54, 1263075593499684864, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (56, 1263101898440146944, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (57, 1263303878648569856, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (58, 1263304204797648896, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (59, 1263304872891555840, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (60, 1263305106250047488, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (61, 1263305244594970624, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (62, 1263305430536855552, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (63, 1263639172959174656, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (64, 1264799968944640000, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (65, 1264800070161584128, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (66, 1267360794414161920, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (67, 1267383367629807616, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (68, 1267817055527632896, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (69, 1267817221286526976, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (70, 1268893687085518848, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (94, 1288657613998579712, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (95, 1288657941770854400, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (96, 1288658134067109888, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (97, 1288658305156964352, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (98, 1288658491216289792, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (99, 1288658638302142464, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (100, 1288658791784308736, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (101, 1290849478956199936, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (102, 1290849628051124224, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (103, 1290849798553776128, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (105, 1291259822512693248, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (106, 1292620505149145088, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (107, 1292620665505775616, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (108, 1292620843398791168, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (109, 1292621027574874112, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (110, 1292621363161137152, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (111, 1292621494837116928, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (112, 1292621629260365824, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (113, 1292622526073864192, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (114, 1293470838745821184, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (115, 1293471661785706496, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (116, 1293472678392721408, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (117, 1293472857510473728, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (118, 1299273336009359360, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (119, 1299273436282585088, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (120, 1299273618470567936, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (121, 1299273770182737920, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (122, 1299273978023084032, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (123, 1299274123225694208, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (124, 1299274222299348992, '127.0.0.1', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (125, 1304238876758495232, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (126, 1304678610343383040, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (127, 1304679169305694208, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (128, 1310460417141817344, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (129, 1310502391475519488, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (130, 1310515546943569920, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (131, 1310515735292985344, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (132, 1316628769783480320, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (133, 1316628940663619584, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (134, 1316629112428756992, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (135, 1316652047017246720, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (137, 1319200951383199744, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (138, 1319221929807024128, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (139, 1319554431134306304, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (140, 1319554550458060800, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (141, 1319554948434595840, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (142, 1319555067183730688, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (143, 1319555230765780992, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (144, 1319555333790470144, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (145, 1321001932510203904, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (146, 1321002059803136000, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (147, 1321002256440496128, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (148, 1321002350686507008, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (149, 1322190027988525056, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (150, 1322452079688458240, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (151, 1322452183929495552, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (152, 1322452308651319296, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (153, 1322452858176446464, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (154, 1322452989235863552, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (155, 1322453089655889920, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (156, 1329706860249804800, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (157, 1329707002411544576, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (158, 1329708512277098496, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (159, 1329708625917571072, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (160, 1335049839287357440, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (161, 1335050034221830144, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (162, 1335050145899368448, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (163, 1335050283434790912, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (164, 1335050381770248192, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (165, 1335050520941449216, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (166, 1335050615829188608, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (167, 1335111798720450560, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (168, 1335118541370314752, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (169, 1335118660417245184, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (170, 1335118782727344128, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (171, 1335118903200337920, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (172, 1336230645078921216, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (173, 1337314809113722880, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (174, 1337314938973569024, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (175, 1340961907637243904, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (176, 1341652247554379776, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (177, 1341652385555369984, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (178, 1342457939827552256, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (179, 1342458050112581632, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (180, 1363657602699718656, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (181, 1363657779665793024, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (182, 1363662350572154880, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (183, 1370283697803829248, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (184, 1370283782075785216, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (185, 1370283867966742528, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (186, 1370283988712366080, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (187, 1370284066516705280, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (188, 1370284158262910976, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (189, 1370284253045792768, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (190, 1370284344397733888, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (191, 1370284429890232320, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (197, 1370914923144478720, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (198, 1371844966074970112, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (199, 1371845082676621312, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (200, 1371845219528372224, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (203, 1375612899682799616, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (204, 1375613095783288832, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (205, 1375613222187028480, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (206, 1375613355029024768, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (207, 1375613462969438208, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (208, 1375613567365664768, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (209, 1375613732239560704, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (210, 1375613833662025728, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (211, 1375679597777637376, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (213, 1376863669256433664, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (214, 1376866215333179392, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (215, 1377049120932081664, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (216, 1377050475599998976, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (217, 1393020696332705792, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (218, 1393501090957946880, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (219, 1395924337284407296, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (220, 1406817452004757504, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (221, 1421397683162664960, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (222, 1431443151332106240, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (223, 1431443363240927232, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (224, 1431444869667151872, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (225, 1431445043261005824, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (226, 1431445186324520960, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (227, 1431445363160571904, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (228, 1431464934529622016, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (229, 1431499449952165888, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (230, 1431803251955654656, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (231, 1431806909455851520, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (232, 1432189824874373120, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (233, 1432190028071624704, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (234, 1440680494805778432, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (235, 1440680915444137984, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (236, 1442413171470688256, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (237, 1449257280751026176, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (238, 1454289352609521664, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (239, 1454289896489115648, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (240, 1456263181821501440, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (241, 1456263413661655040, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (242, 1456263574232195072, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (243, 1456263679999959040, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (244, 1456263785251823616, '', '');
INSERT INTO `appapigatewaysecurityoptions` VALUES (245, 1456263957046321152, '', '');

SET FOREIGN_KEY_CHECKS = 1;
