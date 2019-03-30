-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-03-30 08:33:29
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wkauction`
--
CREATE DATABASE IF NOT EXISTS `wkauction` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wkauction`;

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_remind_status`()
BEGIN  
    IF exists (select id from `goods` where `status`=1 and SYSDATE()-endtime>0) THEN  
            update `goods` o set o.status=0 where o.id in (select t.id from (select id from `goods` where `status`=1 and SYSDATE()-endtime>0) t);
    END IF;  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `article`
--
-- 创建时间： 2018-12-10 12:08:28
--

CREATE TABLE IF NOT EXISTS `article` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `createat` date DEFAULT NULL,
  `editorid` int(11) DEFAULT NULL,
  `pv` int(11) DEFAULT NULL,
  PRIMARY KEY (`articleid`),
  KEY `aredid` (`editorid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `article`
--

INSERT INTO `article` (`articleid`, `title`, `content`, `createat`, `editorid`, `pv`) VALUES
(1, '我们的专家每周拍卖成交 50,000件拍品！', '耳边的风，轻轻的吹。08098', '2018-12-19', 1, 1),
(2, '请注意：Catawiki的用户在使用本网站服务时，应自行了解其所购物品是否符合当地法律法规政策。', '请注意：Catawiki的用户在使用本网站服务时，应自行了解其所购物品是否符合当地法律法规政策。请注意：Catawiki的用户在使用本网站服务时，应自行了解其所购物品是否符合当地法律法规政策。请注意：Catawiki的用户在使用本网站服务时，应自行了解其所购物品是否符合当地法律法规政策。请注意：Catawiki的用户在使用本网站服务时，应自行了解其所购物品是否符合当地法律法规政策。', '2018-12-19', 1, 1),
(4, '由此产生的全部法律责任与损失须由用户自行承担。', '我想问，是什么陪伴着我们成长呢？是家长、是朋友、是美食、还是一本一本叠成山的书本？不，都不是的，是那值得我们去回忆的童年，在童年里，你还记得 第一次学会走路、学会才饭、学会说话吗？你还记得第一次去外面旅行、第一次去上学、第一次帮爸妈做家务事等那些美好的时刻吗？可能当时我没有好好地去记在日记上，可我的脑海里却已经深深地记住了。', '2018-12-19', 1, 1),
(6, '我怎么知道拍卖中的拍品不是伪造品或是未经授权的出版物？', '  这是一朵极普通的花，普通得谁也记不清它的名字，只知道它春天开花的日子，田埂和塘堤四处可见它的踪影。花的颜色很朴素，介于红白之间。虽不鲜艳，却别有一番动人的妩媚。香气也不浓郁，但那若有若无、若远若近的芳馨，更叫人沉醉；花的体积也并不庞大，像那婴儿小拳头的样子，让人一望就怜爱不已。      那小蜜蜂就在这朵花的花蕊中安静地休息着，一动不动。偶尔微风袭来，轻轻拂起它柔软的翅膀，但它却仍在沉沉地小睡，仿佛在做着一个甜甜的梦。这小蜜蜂竟把小憩的地方安排在花蕊里。难道它也不知道应该把灵魂寄放在美好而洁静的地方吗？      小蜜蜂静静地在花蕊里睡着。美和美相互映衬，简直就是一帧绝美的静物画。      灵魂歇息的地方，其实不一定需要广阔堂皇的空间，有一朵美好而洁净的花其实也就静了。灵魂也吸有在这样的花或者花一样的地方，才能心安理得地悄然入睡，才能远远地避开邪恶与危险，才能得到生生不息的力量、勇气和信心，从而在生活的旅途上更加坚强有力地昂首向前迈进。      如果我们总是沮丧颓废或烦躁不安，那一定是我们还没有像那只小蜜蜂那样找到属于自己的那朵花！！！！！ok好的。。', '2018-12-19', 1, 1),
(7, '国产手游海外市场下载量TOP30公布 《PUBG Mobile》重回榜首', '秋天的夜，还是一如既往的深沉，安静得不沾染一丝喧嚣的气息，这沉寂的感觉有点浪漫，有点孤单。淡然的感受风滑过指尖的微凉，它将带着你的灵魂轻轻地飘进我的梦乡。依稀的霓虹灯照亮了思绪，滴落在我想念你的路上，斑驳的月光洗礼着我心底爱你的痕迹，最后成为我梦里的依稀。', '2018-12-19', 1, 1),
(8, 'AMD Ryzen三代APU曝光：性价比玩家首选', '时光轻逝，那些季节，我们曾不遗余力地去追寻；那些岁月，我们勇于承受敢作敢当\r\n\r\n时光回转，那些片段，我们有过一起繁华的邂逅；那些风景，我们赐予它完美的结局\r\n\r\n时光的路口，孤单、幸福、迷茫、辛酸、内疚、快乐，每一次的得到，就代表着每一次的失去，每一次的领悟，就代表着每一次的痛楚，每一次的渴望，每一次的感受，简单、单纯、安慰、寄托，然后离开了。。。', '2018-12-19', 1, 1),
(9, '米家互联网空调新品 将于12月20日正式推出', '米家互联网空调新品 将于12月20日正式推出试一下测试一下测试一下测试一下测试一下测试一下', '2018-12-19', 1, 1),
(10, '尼康58mm f/0.95镜头曝光 或于明年1月发布', 'awk是处理文本文件的一个应用程序，几乎所有 Linux 系统都自带这个程序。', '2018-12-19', 1, 1),
(11, '微软HoloLens 2或搭载骁龙850 明年第二季度亮相', '最近在学习 Tomcat 架构，其中很重要的一个模块是类加载器，因为以前学习的不够深入，所以趁这个机会好好把类加载机制搞明白。', '2018-12-19', 1, 1),
(12, 'Java调试检查表', '程序运行不正常的时候通常要调试，调试技术（Debugging）是每位开发者必须要掌握的一项技能。', '2018-11-22', 1, 1),
(13, 'Git 实用小命令收集！', '平时大家都习惯使用 Git，但是有的时候我们相对而言需要使用比较复杂一点的命令，如果大家记不住，可以收藏下，毕竟也不是算使用频率很高的命令。', '2018-11-23', 1, 1),
(15, '神大蛇大多', '按时打算打算打算的', '2018-11-23', 1, 1),
(16, '不愿错过，偏偏错过', '阿狸登上了一辆没有终点站的巴士车，开始了他寻找永远的旅程。可是，永远站在哪里呢？', '2018-11-23', 1, 1),
(17, '商品拍卖技巧', '商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧商品拍卖技巧。', '2018-12-17', 21, 1);

-- --------------------------------------------------------

--
-- 表的结构 `auser`
--
-- 创建时间： 2018-12-10 12:08:29
--

CREATE TABLE IF NOT EXISTS `auser` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `auser`
--

INSERT INTO `auser` (`userid`, `username`, `password`, `sex`, `weight`) VALUES
(1, 'admin', '12345', '无', 1),
(2, 'chenzi', 'chenzi', '女', 2),
(3, 'System', '12345', '无', 3),
(4, 'root00', 'root00', '无', 4),
(5, '2015130241', '2015130241', '女', 5),
(6, 'Administrator', 'Administrator', '无', 1),
(7, 'root01', 'root01', '无', 5),
(8, 'root02', 'root02', '无', 5),
(11, 'root05', 'root05', '无', 5),
(16, '王昆abc', 'CZwangkun41', '女', 1),
(17, 'root25', 'root25', '男', 25),
(18, 'root41', 'root41', '女', 41),
(19, 'TL181', 'zhiquan', '男', 1),
(20, 'xixi', 'xixi', '男', 2),
(21, '草薙京', '12345', '男', 51);

-- --------------------------------------------------------

--
-- 表的结构 `catalog`
--
-- 创建时间： 2018-12-12 01:41:12
--

CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catalogname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=123 ;

--
-- 转存表中的数据 `catalog`
--

INSERT INTO `catalog` (`id`, `catalogname`) VALUES
(101, '电子类'),
(102, '美妆类'),
(103, '书籍类'),
(105, '艺术类'),
(106, '珠宝类'),
(107, '酒类'),
(108, '香烟类'),
(109, '邮票钱币类'),
(110, '钻石宝石类'),
(111, '手表类'),
(112, '服装类'),
(113, '古玩类'),
(114, '纪念品类'),
(115, '虚拟货币类'),
(116, '腕表类'),
(117, '漫画类'),
(118, '玩具类'),
(119, '枪支类'),
(120, '程序代码类'),
(121, '时尚类'),
(122, '运动类');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--
-- 创建时间： 2018-12-25 14:34:35
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `remark` varchar(5000) NOT NULL,
  `userid` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `createat` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `typename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `ugfk` (`userid`),
  KEY `cgfk` (`typename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `title`, `remark`, `userid`, `status`, `createat`, `endtime`, `picture`, `price`, `typename`) VALUES
(1, '贝吉塔壁纸 Bulgari - TUBOGAS - REF. 20769', 'Bulgari - TUBOGAS - REF. 20769 贝吉塔', 10001, 0, '2018-12-24 23:03:12', '2018-12-27 00:00:00', 'images/product/0c613457154d47f3910a9e192a16609a.png', 2, '时尚类'),
(2, '4TB硬盘', '超大容量4TB', 10002, 0, '2018-12-13 21:56:00', '2018-12-25 00:00:00', 'images/product/e6df893b367345bf9b36611713365410.jpg', 500, '电子类'),
(3, '酷炫手表', '珍品', 10001, 0, '2018-12-26 00:08:29', '2018-12-28 00:00:00', 'images/product/87d4d069159d45e2a79e27b7caff30d3.jpg', 2000, '电子类'),
(4, '手绘插画', '超精致的手绘花环。', 10001, 1, '2019-03-21 23:39:12', '2019-04-01 00:00:00', 'images/product/84ead1ab59b74908a80729cb76e9cdfc.jpg', 50, '时尚类'),
(5, '中国芯', '所谓虚空引擎就是一个程序，一个由虚空能力和反虚空能力编写的程序，葛小伦的雄芯也是这样一个程序，饕餮王的低级版冥河版，华老爷的高配版也是，都是一个虚空程序。', 10002, 1, '2019-03-22 11:15:04', '2142-10-16 00:00:00', 'images/product/6504f791a2dc4fa98ff1412cd4b25899.jpg', 99999999, '电子类'),
(6, 'Seiko - Sports Automatic - SSA381K1 - 男士', 'Seiko - Sports Automatic - SSA381K1 - Men''s - 2011-present ', 10003, 0, '2019-03-28 03:58:52', '2019-03-29 00:00:00', 'images/product/b443fe5d321349afb26f4c70165ffb2f.jpg', 600, '腕表类'),
(7, 'Handarbeit "GT" - 14K包金 黄金 - 戒指 - 1.00 ct 紫水晶', 'Brushed yellow gold polished to a high gloss, hallmarked ', 10003, 0, '2019-03-28 04:01:27', '2019-03-30 00:00:00', 'images/product/d2ed7de6e3c54ea78e7cfdfae2826bcb.jpg', 5000, '美妆类'),
(8, 'Tiffany & Co - 18K包金 黄金 - 戒指', 'Estate Authentic Tiffany & Co. Elsa Peretti 18k Yellow Gold Ring ', 10003, 0, '2019-03-28 04:04:17', '2019-03-30 00:00:00', 'images/product/f86c69db9d094145aa159f90febc0a11.jpg', 4000, '美妆类'),
(9, '14K包金 白金 - 戒指 - 3.63 ct 钻石', 'Main Stone Treatment:	Natural (untreated)', 10003, 0, '2019-03-28 04:07:50', '2019-03-29 00:00:00', 'images/product/8c2bd28749c44908bd2d8464d3c7332b.jpg', 900000, '美妆类'),
(10, '18K包金 金 - 戒指 紫色尖晶石 - Diamonds', '尺寸: 6.5 US / 17 / 53 EU - 总重量: 4.33 g', 10003, 1, '2019-03-28 04:09:28', '2019-12-12 00:00:00', 'images/product/85c2305c308b4604a502ae52e13be0c3.jpg', 88888, '美妆类'),
(11, '澳大利亚 - Sovereign 1901 P (Perth) - Victoria - 金', 'Gold coin in extremely fine condition', 10001, 0, '2019-03-28 19:37:43', '2019-03-29 22:46:00', 'images/product/444fadad67834709962fbc398d8f7aa2.jpg', 1000, '纪念品类'),
(12, '银 - 1860年代 - 维多利亚风格, 耳环 钻石', '尺寸: 4,62 cm (1,82 inch) x 3,55 cm (1,40 inch) - 总重量: 4.4 g', 10005, 0, '2019-03-30 15:17:30', '2019-03-30 15:20:00', 'images/product/901fd187a81943bb804b4d58dc94d1a7.jpg', 899, '珠宝类');

-- --------------------------------------------------------

--
-- 表的结构 `link`
--
-- 创建时间： 2018-12-10 12:08:30
--

CREATE TABLE IF NOT EXISTS `link` (
  `linkid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `createat` date DEFAULT NULL,
  `editorid` int(11) DEFAULT NULL,
  PRIMARY KEY (`linkid`),
  KEY `editorid` (`editorid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `link`
--

INSERT INTO `link` (`linkid`, `title`, `domain`, `createat`, `editorid`) VALUES
(1, '广东科技学院', 'http://gdgk.cc/', '2018-11-20', 3),
(2, 'Vegeta', 'http://k10000.top/', '2018-11-21', 1),
(3, 'Github', 'https://github.com/', '2018-11-21', 1),
(4, 'leetcode', 'https://leetcode.com/', '2018-11-21', 1),
(5, '牛客网', 'https://www.nowcoder.com/', '2018-11-21', 1),
(6, 'ACM', 'http://acmicpc.info/', '2018-11-21', 1),
(7, '开源中国', 'https://www.oschina.net/', '2018-11-21', 1),
(8, 'CSDN', 'https://www.csdn.net/', '2018-11-21', 1),
(9, 'Github', 'http://github.com/zhiquan181', '2018-12-25', 1),
(10, '微软官网', 'https://www.microsoft.com', '2018-11-21', 1),
(12, 'Processon免费在线作图', 'https://www.processon.com/', '2019-03-28', 1),
(13, '中国知网', 'http://www.cnki.net/', '2019-03-28', 1),
(14, '菜鸟教程', 'http://www.runoob.com/', '2019-03-28', 1),
(19, 'jQuery特效网', 'http://www.jq22.com/', '2019-03-28', 1);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--
-- 创建时间： 2019-03-29 17:15:26
--

CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `createat` datetime NOT NULL,
  `jprice` int(11) NOT NULL,
  `fkstatus` int(1) NOT NULL DEFAULT '0',
  `paystatus` varchar(20) NOT NULL,
  `paynumber` varchar(50) NOT NULL,
  PRIMARY KEY (`id`,`userid`,`goodsid`),
  KEY `uofk` (`userid`),
  KEY `gofk` (`goodsid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `userid`, `goodsid`, `createat`, `jprice`, `fkstatus`, `paystatus`, `paynumber`) VALUES
(1, 10001, 11, '2019-03-29 01:00:00', 1001, 0, '未支付', '0e74f718b8e1416b947096429962f170'),
(2, 10001, 11, '2019-03-29 02:00:00', 3000, 0, '未支付', '1e74f718b8e1416b947096429962f170'),
(3, 10001, 11, '2019-03-29 04:00:00', 40000, 0, '未支付', '2e74f718b8e1416b947096429962f170'),
(4, 10001, 11, '2019-03-29 06:00:00', 50000, 0, '未支付', '3e74f718b8e1416b947096429962f170'),
(14, 10001, 11, '2019-03-29 03:00:00', 9000, 0, '未支付', '4e74f718b8e1416b947096429962f170'),
(15, 10001, 6, '2019-03-29 08:00:00', 700, 1, '已支付', '5e74f718b8e1416b947096429962f170'),
(16, 10001, 10, '2019-03-29 09:00:03', 88889, 0, '未支付', '6e74f718b8e1416b947096429962f170'),
(17, 10001, 5, '2019-03-29 07:00:00', 100000000, 0, '未支付', '7e74f718b8e1416b947096429962f170'),
(18, 10001, 4, '2019-03-29 11:23:00', 80, 0, '未支付', '8e74f718b8e1416b947096429962f170'),
(19, 10001, 9, '2019-03-28 10:00:00', 9000001, 1, '未支付', '9e74f718b8e1416b947096429962f170'),
(20, 10001, 11, '2019-03-29 07:36:28', 66666, 0, '未支付', '1074f718b8e1416b947096429962f170'),
(21, 10001, 11, '2019-03-29 13:43:50', 66667, 0, '未支付', '1174f718b8e1416b947096429962f170'),
(22, 10001, 11, '2019-03-29 13:44:16', 66668, 0, '未支付', '1274f718b8e1416b947096429962f170'),
(23, 10002, 4, '2019-03-29 14:19:17', 100, 0, '未支付', '1374f718b8e1416b947096429962f170'),
(24, 10002, 11, '2019-03-29 22:42:49', 88888, 0, '未支付', '1474f718b8e1416b947096429962f170'),
(25, 10005, 11, '2019-03-29 22:43:59', 90000, 1, '未支付', '1574f718b8e1416b947096429962f170'),
(26, 10002, 10, '2019-03-30 02:08:06', 90000, 0, '未支付', '3b9069d44eca45208fabb0cbcf95c038'),
(27, 10001, 12, '2019-03-30 15:19:22', 900, 0, '未支付', '9d1bf3792c304ce98cc799736b1d2e8a'),
(28, 10002, 12, '2019-03-30 15:19:38', 99999, 1, '未支付', '28be5d9f3f574ccd9608d5014b97e657');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--
-- 创建时间： 2018-12-14 14:19:42
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `truename` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10037 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `truename`, `birthday`, `sex`, `email`, `phone`, `picture`, `address`, `specialty`) VALUES
(10001, 'chenzi', 'chenzi', '', '1996-07-09', '女', 'chenzi41@163.com', '13401138001', 'images/31781b570fb8453aa777479a678a2b15.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10002, 'LeiNa', '12345', '', '1995-10-16', '女', 'leina@163.com', '13414503051', 'images/de356e0cecf3482ba13588c87db1e1fa.png', '中国 广东省 东莞市', '平面拍摄 电商拍摄 工作室拍摄'),
(10003, '千秋', '12345', '', '1996-09-16', NULL, 'qianqiu@qq.com', '13800138000', 'images/c285530906464c95b56f319d68ce9527.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10004, 'King', '12345', '', '2018-11-08', '女', 'king@qq.com', '13800138000', 'images/75a1d273a8b04e938644801b4adc4317.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10005, 'K9999', '12345', '', '2018-12-13', '男', 'king@12.com', '13414503051', 'images/a773cf24cc9d47b28d7756872b786822.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10006, '蔷薇', 'qiangwei', '', '1984-07-21', NULL, 'qwe@qq.com', '13800138000', 'images/afdbf48bb8d249a5a67a430815f31938.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10007, 'TL181', '12345', '', '2018-11-15', NULL, 'tianlin181@163.com', '13414503051', 'images/282e68675e5e4977b2ba727c9a914e22.png', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10009, '凉冰', 'liangbing', '', '1995-07-06', '女', 'king@qq.com', '13800138000', 'images/a5cad3f7b54643ca9073e587242c8984.png', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10010, 'lucky', 'lucky', '', '2018-12-12', NULL, 'king@qq.com', '13800138000', 'images/0e74f718b8e1416b947096429962f170.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10012, 'lucky', 'lucky', '', '2019-03-25', NULL, 'king@qq.com', '13800138000', 'images/05dea9148c4a4a7aae42bc8f9f59cbd0.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10013, '龙族驸马', '890890890', '', '2018-11-21', NULL, 'king@qq.com', '13800138000', 'images/e93e846b47e94d669453629c8eae806c.png', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10014, '123', '123', '', '2018-11-25', NULL, 'king@qq.com', '13800138000', 'images/3cd43641efb44758b4b91f2b343fa16a.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10015, '456', '456', '', '2018-11-25', NULL, 'king@qq.com', '13800138000', 'images/e28e34420961475eb91189a08e5ab0d3.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10016, '迪丽热巴', '12345', '', '2018-12-03', NULL, 'king@qq.com', '13800138000', 'images/2e6356fc2e9b4587a3adfc5cb633ab71.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10017, '000', '000', '', '2018-11-25', NULL, 'king@qq.com', '13800138000', 'images/9b580211571a400ba35216f1b262bd06.png', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10018, '盖伦', '999', '', '1991-02-13', NULL, 'king@qq.com', '13800138000', 'images/7768e4431b3b4286b3265e33aee2e480.png', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10019, '莫甘娜', '181191', '', '2018-11-06', NULL, 'moganna@qq.com', '13414503051', 'images/8c54ab154111460882ed317e3a2508b8.png', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10020, '阿狸', '12345', '', '2018-12-20', '女', 'king@qq.com', '13414503051', 'images/763d26ca31f141659e486be0524a9f27.jpg', '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10022, '孙悟空', 'qitiandasheng', '', '1991-03-15', NULL, 'king@qq.com', '13800138000', NULL, '中国 广东省 东莞市', '喜欢拍照，特别喜欢表现自我'),
(10023, '剑魔', 'jianmo', '', '2017-03-02', NULL, 'qianqiu@qq.com', '13414503051', 'images/c89f8399a20d44c0b8acc8e3f7169055.jpg', '恶魔天使云', '剑魔阿托！'),
(10026, 'kaisha', 'kaisha', '', '2018-12-14', '女', 'qianqiu@qq.com', '13800138000', 'images/420ed7afd5524cb0a90af6352a9b0858.jpg', '天使星云', '维护天使的正义。'),
(10027, '一度王爵', '12345', '', '2018-11-19', NULL, 'jejms@qq.com', '13800138000', NULL, '奥汀大陆西之水源亚斯蓝帝国奥汀大陆西之水', '爵迹丨吉尔伽美什'),
(10028, '反虚空', 'dalong', '', '2018-11-05', NULL, 'king@qq.com', '13800138000', NULL, '中国 广东 广州', '手握日月摘形成，时间无我这般人。'),
(10029, 'proya', 'proya', '', '1995-11-17', NULL, 'proya@qq.com', '13414503051', 'images/67bb9088360a46b2bfef01c8be4bc7f2.jpg', '中国 广东 广州', '手握日月摘形成，时间无我这般人。'),
(10035, 'ymk', 'asdasd', '', '2018-12-05', NULL, '103659195@qq.com', '15111', 'images/f1420c6bc5d6485e97cbe12d29f58efc.jpg', 'asd', 'asd'),
(10036, '机器人', '12345', '', '2000-07-12', NULL, '937598186@qq.com', '13414503051', 'images/f8947c9cf1db4e9aaee17895d196d135.jpg', '中国 广州', '民主 和谐');

--
-- 限制导出的表
--

--
-- 限制表 `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`editorid`) REFERENCES `auser` (`userid`) ON DELETE CASCADE;

--
-- 限制表 `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `ugfk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- 限制表 `link`
--
ALTER TABLE `link`
  ADD CONSTRAINT `link_ibfk_1` FOREIGN KEY (`editorid`) REFERENCES `auser` (`userid`) ON DELETE CASCADE;

--
-- 限制表 `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `gofk` FOREIGN KEY (`goodsid`) REFERENCES `goods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `uofk` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE;

DELIMITER $$
--
-- 事件
--
CREATE DEFINER=`root`@`localhost` EVENT `event_remind_status` ON SCHEDULE EVERY 1 SECOND STARTS '2019-03-30 15:12:06' ON COMPLETION PRESERVE ENABLE DO begin  
call update_remind_status();  
end$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
