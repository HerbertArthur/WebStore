# 2019年4月18日
#建立数据库
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

#插入数据
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (1, 'iPhone XS Max', 9699);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (2, '欧珀莱 AUPRES 时光锁紧致塑颜洁面膏125g', 112);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (3, '实木电脑桌台式办公桌北欧风', 310);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (4, '棉麻连体裤女夏装韩版宽松阔腿裤中长款亚麻连衣裤裙学院风七分裤', 79);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (5, '圆形创意简约边几 角几客厅电话几移动沙发小茶几 笔记本桌床头柜', 79);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (6, '2条高腰收腹平角内裤女薄莫代尔棉质面料防走光蕾丝边打底安全裤', 69);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (7, '生日礼物包邮 专柜正品毛衣泰迪熊smile熊', 88);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (8, '乜Q自制睡衣风港仔衬衫韩国长袖宽松休闲衬衫丝绸真丝男女同款潮', 78);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (9, '爱迪生13-14-15-16稀有金属色裸珠 正圆强光无暇级别吊坠路路通', 1000);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (10, '进口北欧波西米亚家居简约羊毛手工编织挂毯壁毯', 86);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (11, '儿童秋冬睡衣宝宝长袖纯棉绒布家居服春秋季全棉套装日系无印风', 79);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (12, '女生礼品泰迪熊特价 大脚掌版巨型1.2 1.6米', 165);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (13, 'PUMA/彪马 专柜男子运动服春秋款开衫休闲连帽针织外套576299', 229);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (14, '性感内裤女人蕾丝低腰火辣女士超薄夏镂空透明无痕女性惑三角裤头', 11);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (15, '少女派对少女心口红南瓜吃土色复古小样套装哑光雾面迷你唇膏礼物', 28);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (16, '大树户外帐篷双层3-4人露营铝合金专业防雨休闲帐篷野外双层帐篷', 329);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (17, '新年送女生 正品泰迪熊公仔 毛绒玩具1.8米', 85);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (18, '0-12个月一岁女宝宝婴儿学步凉鞋女防滑软底包头0-1-2-3岁小公主', 28);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (19, '维多利亚气质法式复古桔梗山本法国小众超仙女甜美森系很仙的裙子', 158);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (20, '埃菲尔铁塔钻戒女红宝石钻石戒指do专柜正品婚戒I 深圳水贝定制', 6099);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (21, '2019早春新款开衫女V领春秋慵懒风中长款宽松毛衣针织衫外套 女', 89);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (22, '大号泰迪熊公仔 布娃娃抱抱熊生日礼物1.5米', 233);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (23, '美思奇023固定电话机 壁挂式插线座机创意家用单机小分机迷你挂机', 28);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (24, '【特价不退换】DAJO大椒驾到  精致优雅圆角翻领圆弧袖口双排扣呢', 199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (25, '日系软绵绵简约纯色竖条纹睡衣女加厚可爱长袖长裤家居服套装冬季', 228);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (26, '2018春季韩版女鞋内增高低帮水钻休闲鞋一脚蹬松糕鞋厚底女单鞋子', 89);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (27, '专柜正品超胖 可爱大熊猫娃娃 女生生日礼物', 59);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (28, '2019新款7分七分中袖t恤女体桖丅血衫短袖学生宽松欧货大版上衣夏', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (29, '比基尼防走光遮肚锦纶面料女士搭配小裙  桶裙 里面没有底裤', 30);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (30, '2019新款时尚气质收腰显瘦甜美蕾丝刺绣星星网纱裙子气质连衣裙女', 44);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (31, '2019韩版小西装外套女秋春装新款女装修身长袖工作服黑色大码西服', 59);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (32, '正版毛绒玩具熊毛衣泰迪熊公仔布娃娃', 96);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (33, '帽子女遮阳帽海边度假出游防紫外线太阳帽沙滩帽大沿大檐防晒凉帽', 18);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (34, '波点连衣裙女夏2019新款中长款气质时尚韩版学生短袖收腰裙子显瘦', 219);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (35, '中长款t恤女2019春装新款修身条纹大码女装长袖纯棉打底衫女上衣', 29);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (36, 'edition抽绳高腰阔腿裤夏荷叶边宽松纸袋裤EA182PAT107 moco', 929);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (37, '大型欧式落地大花瓶仿真假花套装售楼处酒店', 598);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (38, 'MLS 女装2019款春裙子韩版衬衫领五分袖收腰中长款雪纺连衣裙女', 199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (39, 'UOOYAA/乌丫专柜正品个性时髦感钻扣复古金丝雪纺套头衫', 1599);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (40, '清仓专柜样本包头层手提单肩斜跨休闲斜跨包外贸工厂亏本秋冬大包', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (41, '新款 外贸女童冬珊瑚绒保暖套头家居服 儿童冬天睡衣套装', 43);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (42, '史努比正品公仔 抱抱狗 女生生日礼物首选', 98);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (43, '韩国SOLO儿童睡衣夏季男孩女孩短袖卡通家居服套装空调衫可爱', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (44, '亮片不规则网纱裙半身裙女2018春夏新款星空裙A字蓬蓬中长裙子潮', 42);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (45, '怪力少女运动上衣女修身弹力速干透气健身t恤跑步训练运动短袖', 89);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (46, '悦己容原创手工古风汉服配饰天然岫玉珍珠软璎珞项链【醉惜君】', 108);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (47, '几何立体水晶钛金属办公室家居茶几桌面摆件', 218);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (48, 'milicamp户外野餐垫公园防潮垫可折叠便携爬行垫帐篷地垫绒面加厚', 49);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (49, '地毯卧室床边地毯满铺定制中式客厅茶几地垫定做编织榻榻米竹地毯', 54);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (50, '2019新款中空鞋真皮粗跟珍珠闪闪女单鞋公主鞋扣带镂空中跟凉鞋女', 149);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (51, '美国直邮Mountain Hardwear山浩1545161户外野营双门2人Optic帐篷', 4669);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (52, '花瓶家居装饰品花器两件套粗陶中式仿古摆件', 360);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (53, '包包女2019新款韩版刺绣文艺大容量帆布包简约手提单肩包托特包', 138);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (54, 'Artmu阿木原创夏季新款欧美复古牛皮凉拖女外穿平底人字拖鞋', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (55, '美式乡村 复古铁艺花架落地式花盆架多层室内客厅阳台绿萝花架子', 187);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (56, '自驾游户外3-4人全自动帐篷/免搭速开野营帐篷/家庭露营四季帐篷', 388);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (57, '温婉动人 舒适有弹 显白显瘦 秋季新款旗袍', 628);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (58, '日韩卡通可爱搞怪个性仿真煎饼卷笔袋 中小学生PU皮质文具收纳袋', 22);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (59, '凡猎童装春装女宝宝新品连衣裙公主裙背带裙儿童红色1周岁礼服裙', 139);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (60, '百分百桑蚕丝针织真丝童装 双面料纯色宝宝短袖短裤居家服套装', 89);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (61, '煤油灯 马灯 怀旧桅灯 野营灯 营地灯 户外帐篷灯 应急灯 露营灯', 16);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (62, '面包超人跳跳跳球海草跳跳猪会说话抖音同款', 49);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (63, '狂野者甜心户外帐篷垫床自动充气垫 单人加厚 可拼接防潮垫 包邮', 45);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (64, '包邮户外2-3人帐篷防雨防晒旅游帐篷双人多人情侣沙滩露营帐篷', 90);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (65, '坡跟女夏欧美时尚亮片外穿韩版高跟一字拖鞋沙滩鞋防滑厚底凉拖鞋', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (66, '简约水钻圆球发圈发绳头绳头饰 韩国双球气质扎马尾皮筋发饰品', 15);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (67, 'SAUMUR欧式客厅陶瓷花瓶花艺美式摆件家居装', 102);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (68, '亲宝水晶天然马达加斯加粉晶手镯女款天然粉水晶芙蓉石送七夕礼物', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (69, '饭碗家用10个装5英寸吃饭碗彩色日式个性陶瓷小碗小清新粉色瓷碗', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (70, 'Organic Dreamer 18ss 浅嫩黄条纹薄款褶皱感宽松大衬衫', 699);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (71, '美国supcase适用苹果Apple Watch手表表带保护壳套iwatch4/2/3外壳表套', 158);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (72, '优雅丝绒旗袍3色入 礼服经典 光泽显白质感', 498);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (73, '袜子女船袜隐形袜女士短袜春夏薄款夏天纯棉全棉浅口袜韩国可爱秋', 12);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (74, '儿童仿真动物下蛋玩具会生蛋的小鸭子卡通黄鸭电动灯光下蛋鸭子', 23);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (75, 'chic交叉细带粗跟凉鞋2018夏新款ins时尚中跟夹趾凉拖鞋女外穿', 168);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (76, '小户型懒人沙发布艺沙发双人沙发折叠休闲榻榻米沙发折叠沙发', 318);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (77, '木真了改良旗袍裙专柜新品修身显瘦蕾丝连衣', 480);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (78, '女童1夏装2女宝宝娃娃裙3夏季4短袖5岁婴儿童装夏天公主连衣裙子5', 17);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (79, '地垫进门门垫入户家用卫生间地毯门厅入门大门丝圈入户门门口脚垫', 49);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (80, '现代简约布艺单人沙发北欧休闲懒人沙发椅阳台桌椅卧室洽谈沙发椅', 168);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (81, '盾郎帐篷拉绳速搭防雨遮阳自动1-5人露营家庭帐篷套装沙滩', 198);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (82, '新款男孩儿童家居服套装夏季男童薄款中大童纯棉睡衣中袖T恤短裤', 89);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (83, '水舞 新娘中式红色凤冠头饰耳环古装流苏秀禾礼服婚礼发饰A2761', 96);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (84, '运动登山鞋男鞋透气徒步鞋防滑户外鞋春秋季旅游鞋越野跑鞋步行鞋', 98);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (85, '翱翔者两室一厅大帐篷 多人户外旅游大帐篷 包邮特价帐篷', 390);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (86, '宝宝洗头椅儿童躺椅小孩洗头床加大号婴儿洗发架洗头神器可调节', 78);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (87, '韩版个性简约刻英文字母光面细戒指尾戒女钛钢玫瑰金不掉色防过敏', 24);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (88, '网红马尔代夫巴厘岛长裙 蓝色美人鱼尾巴开叉半身裙 沙滩海边度假', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (89, '儿童棉绸睡衣夏季男孩女童薄款空调服小宝宝中长袖绵绸家居服套装', 22);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (90, '百洛安短袖针织衫女装2019夏季新品套头圆领T恤修身显瘦百搭上衣', 96);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (91, '回忆录DIY粘贴式相册本插页式拍立得情侣手工家庭覆膜纪念册礼物', 33);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (92, '初语春秋新款翻领刺绣字母宽松休闲单排扣长袖时尚短外套女', 159);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (93, '2018秋冬新款韩版毛绒小熊包包个性大包百搭单肩包大容量手提女包', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (94, '加厚一次性外卖打包小汤碗汤杯西米露烧仙草甜品餐盒整箱带盖包邮', 108);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (95, '2019春季新款简约高级灰排扣高腰小脚西裤修身显瘦九分裤女', 169);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (96, 'ins韩式小清新全棉四件套贡缎流苏纯棉三4件套床单床笠床裙刺绣夏', 258);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (97, '春秋款儿童纯棉家居服套装男女童无荧光彩条棉睡衣长袖高护肚长裤', 58);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (98, '天然酸枝红木筷子越南进口原木家用家庭装无漆无蜡高档筷10双筷子', 68);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (99, 'Adidas 阿迪达斯 NMD XR1三叶草白迷彩时尚男子运动跑鞋BA7233  -', 923);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (100, '小冰熊17秋冬新款 男宝宝居家服 薄棉连帽外套/马甲/裤子/T恤Z', 95);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (101, '户外双层5-6人露营休闲帐篷 野外双层帐篷 自驾游帐篷 钓鱼帐篷', 178);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (102, '在耳边日式童装儿童纱布睡衣中小童全棉纱布家居服套装吸汗透气', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (103, '夏季潮牌潮流中国风丅恤纯棉大码半截袖刺绣仙鹤短袖T恤男装宽松', 69);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (104, '乐活森陶瓷调味罐 厨房调料罐创意餐馆面馆盐辣椒酱料缸调味品罐', 9);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (105, '小男孩动漫七龙珠悟空男童睡衣纯棉长袖裤儿童家居服秋春季中大童', 55);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (106, '嘿马日系加绒冬季装仿羊羔毛牛仔外套夹克棉衣袄潮牌男棉服情侣装', 205);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (107, '复古温柔裙超仙收腰网纱刺绣连衣裙修身气质海边度假大摆沙滩长裙', 168);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (108, '春秋七分袖百搭小披肩裙子外搭开衫蕾丝上衣女士夏季镂空短款外套', 59);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (109, '创意懒人沙发单人沙发椅家用卧室小沙发阳台休闲太阳椅孕妇椅圆椅', 255);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (110, '御風猫客 招财猫金色汽车挂件饰品简约时尚可爱车内挂饰装饰用品', 138);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (111, '雷神巧克力奶酪馅软面包生酮饮食零食面包无麸质无面粉低碳水无糖', 35);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (112, '棉麻大码女装2019夏装新款宽松亚麻体恤衫刺绣花上衣短袖女式T恤', 48);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (113, '儿童装女童春秋季睡衣卡通公主睡裙中大童纯棉长袖睡裙全棉睡衣', 39);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (114, '三合一七彩旋转舞台灯LED充电 露营帐篷马灯 户外手提伸缩应急灯', 15);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (115, '现货德国HABA哈芭2961Rosalina地毯地垫游戏垫可搭配帐篷用120cm', 2350);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (116, '盾郎户外液压帐篷全自动搭建双层防暴雨帐篷3-5人沙滩露营郊游', 520);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (117, '婴蓓乐新款 男宝可爱纯棉舒服莫代尔清凉背心外出套装87343', 21);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (118, '出口手捏器型 做旧擦色不规则大盘 西餐盘 菜盘 水果盘 点心盘', 28);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (119, '中长款过膝风衣女韩版春装2019新款薄款气质淑女鹿皮绒女士外套长', 179);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (120, '迪子DIAZ 2018冬装韩版皮毛一体2面穿羊羔毛加厚保暖长款马甲外套', 69);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (121, '150*200cm 铝膜防潮垫 野营垫 野餐垫 儿童玩耍垫 午睡垫 帐篷垫', 20);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (122, '牛仔背带裤女九分裤韩版春秋季新款破洞显瘦小脚裤宽松森女连体裤', 169);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (123, 'Hellokitty儿童睡衣套装女童棉春秋装中大童春秋宝宝家居服长袖', 19);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (125, '【限时下单低至8788】Apple/苹果 iPhone Xs Max 256G 移动联通电信全网通4G手机 双卡双待苹果Xsmax', 9088);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (126, '科沃斯扫地机器人地宝T5智能家用超薄全自动洗擦地拖地扫一体机', 2999);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (127, 'Xiaomi/小米 小米电视4A 65英寸4k超清智能网络平板电视机6070', 2999);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (128, '亿健精灵ELF跑步机家用款电动走步超静音折叠小型室内健身房专用', 1799);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (129, 'Midea/美的 KFR-35GW/WDCN8A3@ 大1.5匹变频冷暖壁挂式空调挂机', 2299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (130, '【6期免息 新品直降】Apple/苹果 7.9 英寸iPad mini平板电脑2019新款mini第5代掌上电脑 支持Apple Pencil', 2899);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (131, '【官方正品】纪梵希小粉唇口红女唇膏 小粉皮302 粉管全新上市', 320);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (132, '雅诗兰黛小棕瓶抗蓝光眼霜 特润修护精华眼霜 淡化细纹黑眼圈', 510);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (133, 'Haier/海尔 EG10014B39GU1 10公斤kg蓝晶变频滚筒全自动洗衣机', 2699);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (134, '【官方正品】纪梵希明星四宫格散粉 定妆粉 细腻粉质 四色散粉', 550);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (135, '方太JQD2T+HT8BE家用抽油烟机套餐燃气灶煤气灶烟灶烟机灶具套装', 4999);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (136, '【设计师合作款】女装 圆领T恤(短袖) 414443 优衣库UNIQLO', 79);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (137, '雅诗兰黛 dw持妆粉底液 油皮亲妈 保湿遮瑕防晒 长效控油不脱妆', 390);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (138, '兰蔻防晒乳 防紫外线隔离UV小白管轻透保湿防护SPF50 防晒霜正品', 480);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (139, '九阳新款加热破壁机家用小型料理全自动多功能官方旗舰店官网正品', 899);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (140, 'Haier/海尔 BCD-572WDENU1 智能变频双开门风冷家用对开门冰箱', 3499);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (141, '美的净水器家用直饮自来水过滤器反渗透RO净水机花生官方旗舰店', 1998);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (142, '雅诗兰黛小棕瓶面部精华 特润修护肌透精华露30/50ml补水修护抗皱', 590);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (143, '维达抽纸超韧3层M码120抽24包整箱装 中规格卫生纸巾新旧交替', 59);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (144, '维达卷纸蓝色经典4层140克27卷整箱装有芯卷纸卫生纸巾 新旧交替', 56);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (145, '兰蔻菁纯柔润唇膏口红唇彩显色持久保湿滋润不拔干 290豆沙色', 270);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (146, '九阳破壁免洗豆浆机家用全自动新款煮多功能预约官方旗舰店K迷你', 2199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (147, '全新Kindle Paperwhite4 亚马逊电子书阅读器 KPW4 纯平电子墨水屏 电纸书 开学季文具 泡面盖子', 998);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (148, '欧莱雅安瓶面膜女复颜玻尿酸精华液补水保湿亮肤淡化细纹正品15片', 349);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (149, '【爆款轻薄本】Lenovo/联想小新Air13英特尔酷睿i5 13.3英寸轻薄笔记本电脑(i5/8G/PCIE固态/高色域)', 5299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (150, '欧莱雅小钢笔印迹唇釉113哑光持久染唇液口红女116唇彩豆沙色正品', 145);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (151, '阿芙荷荷巴油/霍霍巴油去黑头jojoba精油基础油护肤脸部面部按摩', 98);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (152, '女装 便携式防紫外线连帽外套 414188 优衣库UNIQLO', 249);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (153, '奥克斯电风扇落地扇家用宿舍台立式风扇机械静音摇头工业电扇定时', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (154, '【三只松鼠_零食大礼包】网红坚果组合休闲小吃食品超大一箱批发', 59);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (155, '花王日本进口纸尿裤XL44片 超薄透气男女通用婴儿尿不湿', 170);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (156, '【设计师合作款】男装 圆领T恤(短袖) 414351 优衣库UNIQLO', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (157, '苏泊尔电饭煲家用3L迷你电饭锅小型智能5官方旗舰店6宿舍1-2人3-4', 189);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (158, '美的挂烫机家用蒸汽小型手持熨斗挂立式烫衣机衣服熨烫机熨衣服机', 178);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (159, 'Braun/博朗 MQ5025多功能小型料理机婴儿辅食手持家用搅拌料理棒', 569);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (160, '女装 高腰男友款牛仔裤(水洗产品) 417576 优衣库UNIQLO', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (161, '飞科剃须刀电动男士刮胡刀全身水洗智能充电式胡须刀正品刮胡子刀', 95);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (162, '??绝世澳洲家庭原肉整切牛排套餐团购黑椒10片儿童新鲜菲力西冷', 218);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (163, '【设计师合作款】女装 乔其纱吊带连衣裙 417143 优衣库', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (164, '好太太电动晾衣架遥控升降智能自动晒衣架室内阳台家用四杆晾衣机', 1899);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (165, '【小黑盒预售】LA MER海蓝之谜保湿修护套装 精华面霜+修护精萃液', 1550);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (166, '美的电热水壶家用304不锈钢正品电热烧水壶自动断电大容量开水壶', 79);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (167, 'Nike耐克官方NIKE AIR FORCE 1 07女子运动鞋 板鞋315115', 519);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (168, '苏泊尔榨汁机家用全自动水果小型多功能迷你便携式学生电动榨汁杯', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (169, '苏泊尔电磁炉火锅家用智能正品学生电池炉灶特价炒菜官方旗舰店', 199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (170, '飞科电吹风机家用理发店专用风力大功率负离子不伤发廊静音吹风筒', 69);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (171, '【三只松鼠_手撕面包1kg/整箱】网红早餐营养食品小零食蛋糕点心', 29);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (172, '方太X1TS水槽洗碗机全自动家用一体嵌入式6套智能刷碗机家电小型', 6599);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (173, '佳能CP1300小型手机照片打印机便携式热升华迷你家用无线彩色相片冲印拍立得1200手账洗照片机神器相机打印机', 798);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (174, '广西百香果热带水果新鲜西番莲鸡蛋果现摘5斤精装大红果酸爽香甜', 59);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (175, 'Nike 耐克官方FLEX EXPERIENCE RN 7/8男子跑步鞋 AJ5900 908985', 499);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (176, '美的空气净化器家用去除甲醛二手烟pm2.5雾霾尘卧室客厅净化机E33', 1998);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (177, '男装 EZY九分裤 413171 优衣库UNIQLO', 249);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (178, '爱丽思收纳箱抽屉式衣柜内收纳盒家用塑料整理箱衣服爱丽丝储物箱', 28);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (179, '【超品预售】兰蔻粉水清滢柔肤水400ml 爽肤水女保湿舒缓滋润嫩肤', 420);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (180, '小白熊恒温调奶器暖奶器旗舰店婴儿泡奶粉机热水壶冲奶器温奶器', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (181, '【小黑盒预售】LA MER海蓝之谜修护精华面霜补水保湿滋润舒缓修护', 760);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (182, '奥克斯手持挂烫机家用小型便携式电熨斗迷你烫斗蒸汽刷旅行熨烫机', 89);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (183, 'babycare婴儿背带 宝宝前抱式多功能婴儿腰凳 四季通用抱娃神器', 359);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (184, '苏泊尔电饼铛电饼档家用双面加热烙饼锅煎饼机称新款加深加大正品', 189);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (185, '美的燃气热水器家用天然气13升16L变频恒温强排式H1S 有12L液化气', 1199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (186, '迪卡侬全自动帐篷户外露营野营速开帐篷3-4人加厚防晒防雨QUNC', 199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (187, 'KUB可优比椰棕婴儿床棕垫宝宝床垫儿童乳胶床垫冬夏两用可定做', 150);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (188, '美的M3-L205C微波炉蒸烤箱一体家用小型全自动光波智能平板式正品', 499);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (189, '预售 YSL圣罗兰明彩轻垫粉底液 羽毛气垫墨水气垫遮瑕星钻经典', 510);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (190, '飞科理发器电推剪充电式电推子成人婴儿童剃发电动头发剃头刀家用', 69);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (191, '苏泊尔电压力锅家用智能5L高压饭煲官方1特价2旗舰店3-4正品5-6人', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (192, '【三只松鼠_夏威夷果265gx2】休闲零食特产坚果炒货干果仁奶油味', 48);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (193, '美的无线吸尘器家用小型大吸力超静音强力除螨无绳吸尘器手持式P3', 899);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (194, 'Haier/海尔 EC6002-MC3热水器电家用60升速热卫生间储水小型洗澡', 1199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (195, '格力除湿机家用静音抽湿机DH40EF 大功率地下室吸湿器干燥机防潮', 3580);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (196, 'Nike 耐克官方 KYRIE 5 EP男子篮球鞋  AO2919', 999);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (197, '苏泊尔养生壶家用玻璃电全自动加厚煮茶壶煮茶器多功能养身烧水壶', 249);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (198, '威露士有氧倍净洗衣液2kgx4送300gx2瓶+60mLx3瓶消毒液', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (199, '女装 高腰修身牛仔九分裤(水洗产品) 413116 优衣库UNIQLO', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (200, '男装 牛仔茄克(水洗产品) 413979 优衣库UNIQLO', 299);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (201, '美宝莲眼唇卸妆液 脸部眼部及唇部卸妆油卸妆水温和清洁', 56);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (202, 'KUB可优比实木婴儿床儿新生拼接大床摇篮床多功能宝宝床bb床', 598);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (203, '欧莱雅护发精油女免洗头发卷发柔顺护理发油防毛躁修复烫染干枯发', 139);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (204, '水星家纺被子冬被单人加厚保暖春秋被芯太空调被学生宿舍双人被褥', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (205, '威露士衣物家居消毒液1Lx3 送3支60ml便携装合计3.18L灭菌99.999%', 86);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (206, '阿芙马鞭草酮迷迭香马迷纯露闭口粉刺毛孔收缩堵塞疏通爽肤喷雾去', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (207, '欧莱雅男士护肤品套装水能保湿补水面霜水乳爽肤水男士洗面奶正品', 199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (208, '【亲子节】娇韵诗准妈妈身体护理套装孕育美好妇女肌肤预防纹路', 1070);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (209, 'Danielwellington 丹尼尔惠灵顿DW手表女28mm简约时尚女表', 1290);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (210, '九阳榨汁机家用多功能汁渣分离原汁机商用全自动冷压炸果汁机v18A', 799);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (211, '[旗舰店]Canon/佳能 EOS 200D 单反套机 EF-S 18-55mm', 4199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (212, '【极速发货】DJI 大疆 灵眸Osmo Mobile 2 防抖手持云台  手机稳定器', 899);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (213, '礼品周大福字母转运珠足金黄金吊坠计价工费48元F多款', 404);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (215, '男装 弹力运动拉链连帽开衫 413436 优衣库UNIQLO', 179);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (216, '施华洛世奇SPARKLING DC跃动晶彩项链锁骨链女首饰 送女友礼物', 1290);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (217, '女装 华夫格V领开衫(长袖) 415600 优衣库UNIQLO', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (218, '欧舒丹梦境初樱樱花魔方礼盒限量套装沐浴润肤露身体乳持久留香', 530);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (219, 'KUB可优比幼婴儿睡袋夏季儿童防踢被春秋薄款宝宝纱布分腿睡袋', 128);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (220, '苏泊尔不粘锅电磁炉燃气灶适用多功能炒菜锅少油烟平底锅家用炒锅', 99);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (221, '男装 牛仔衬衫(水洗产品)(长袖) 414565 优衣库UNIQLO', 199);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (222, '婴儿电动摇摇椅宝宝摇篮椅哄娃非神器哄睡新生儿安抚椅抖音摇摇床', 468);
INSERT INTO `item`(`item_id`, `item_name`, `price`) VALUES (214, '朱一龙同款膳魔师便携水杯Tritan塑料运动杯随手杯太空杯TCSA-500', 158);

INSERT INTO `user`(`user_id`, `user_name`, `password`, `sex`, `mail`, `phone`, `address`) VALUES (1000, 'admin', 'admin', NULL, NULL, 123456, 'aaaaa');
INSERT INTO `user`(`user_id`, `user_name`, `password`, `sex`, `mail`, `phone`, `address`) VALUES (1001, 'liming', '123456', 1, NULL, 1300000000, '北京');
INSERT INTO `user`(`user_id`, `user_name`, `password`, `sex`, `mail`, `phone`, `address`) VALUES (1002, 'lihua', '123456', 0, NULL, 1300000000, '上海');
