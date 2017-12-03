-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-03 10:49:06
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phonestore`
--
CREATE DATABASE IF NOT EXISTS `phonestore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phonestore`;

-- --------------------------------------------------------

--
-- 表的结构 `tb_feedback`
--

CREATE TABLE `tb_feedback` (
  `f_id` int(11) NOT NULL COMMENT '反馈id',
  `f_name` varchar(20) NOT NULL COMMENT '反馈者姓名',
  `f_phone` varchar(20) NOT NULL COMMENT '联系方式',
  `f_content` varchar(255) NOT NULL COMMENT '反馈意见'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='反馈收集';

--
-- 转存表中的数据 `tb_feedback`
--

INSERT INTO `tb_feedback` (`f_id`, `f_name`, `f_phone`, `f_content`) VALUES
(1, '小李', '13588765249', '你们的商品太久了'),
(2, '蝴蝶花都', '1656557575757', '话uahuahuh1111');

-- --------------------------------------------------------

--
-- 表的结构 `tb_message`
--

CREATE TABLE `tb_message` (
  `message_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '留言者',
  `content` varchar(255) NOT NULL,
  `createAt` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论留言';

--
-- 转存表中的数据 `tb_message`
--

INSERT INTO `tb_message` (`message_id`, `name`, `content`, `createAt`) VALUES
(1, '环', '222', 2014),
(2, '花心大侠', '我想要电脑', 1512139539),
(3, 'admin啊啊', '羡慕羡慕羡慕', 1512141603),
(4, '手机', '睡了吗？', 1512141633),
(5, 'admin11', '花蛤', 1512141658),
(6, '小明', '我喜欢这个网页', 1512210707),
(7, '是是是11', '撒旦的哇121王1恩爱的群二', 1512215156);

-- --------------------------------------------------------

--
-- 表的结构 `tb_order`
--

CREATE TABLE `tb_order` (
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `b_id` int(11) DEFAULT NULL COMMENT '打类型Id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '订购人的昵称',
  `user_truename` varchar(50) DEFAULT NULL COMMENT '订购人的真实名字',
  `user_address` varchar(100) DEFAULT NULL COMMENT '订购人地址',
  `user_sex` char(2) DEFAULT NULL COMMENT '订购人的性别',
  `user_yb` char(10) DEFAULT NULL COMMENT '订购人的邮政编码',
  `user_tel` char(20) DEFAULT NULL COMMENT '订购人电话',
  `book_newprice` float DEFAULT NULL COMMENT '订购价格',
  `order_yjprice` float DEFAULT NULL COMMENT '邮寄价格',
  `order_num` int(11) DEFAULT NULL COMMENT '定数量',
  `order_totalprice` float DEFAULT NULL COMMENT '总价格',
  `order_rectype` varchar(20) DEFAULT NULL COMMENT '收货方式',
  `order_paytype` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `order_addtIme` datetime DEFAULT NULL COMMENT '订单时间',
  `order_isfk` bit(1) DEFAULT b'0' COMMENT '是否付款',
  `order_idfh` bit(1) DEFAULT b'0' COMMENT '是否发货',
  `order_issh` bit(1) DEFAULT b'0' COMMENT '是否收获',
  `order_idqx` bit(1) DEFAULT b'0' COMMENT '是否取消'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tb_phones`
--

CREATE TABLE `tb_phones` (
  `phone_id` int(11) NOT NULL COMMENT '手机产品ID',
  `phone_name` varchar(50) DEFAULT NULL COMMENT '手机产品名',
  `phone_company` varchar(50) DEFAULT NULL COMMENT 'test',
  `phone_isbn` varchar(10) DEFAULT NULL COMMENT '手机商品isbn码',
  `s_id` int(11) DEFAULT NULL COMMENT '手机小类型ID',
  `phone_addtime` datetime DEFAULT NULL COMMENT '添加时间',
  `phone_oldprice` float DEFAULT NULL COMMENT '手机原价',
  `phone_newprice` float DEFAULT NULL COMMENT '本站的价格',
  `phone_img` varchar(100) DEFAULT NULL COMMENT '手机产品图片路径',
  `phone_about` text COMMENT '商品介绍',
  `phone_directory` text COMMENT '图书目录',
  `phone_idnew` bit(1) DEFAULT NULL COMMENT '是否为新产品',
  `phone_issepprice` bit(1) DEFAULT NULL COMMENT '是否特价',
  `phone_ishost` bit(1) DEFAULT NULL COMMENT '是否热卖',
  `phone_ishave` bit(1) DEFAULT NULL COMMENT '是否有货',
  `phone_browsertime` int(11) DEFAULT NULL COMMENT '浏览次数',
  `phone_sell` int(11) DEFAULT '0' COMMENT '售量销'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tb_phones`
--

INSERT INTO `tb_phones` (`phone_id`, `phone_name`, `phone_company`, `phone_isbn`, `s_id`, `phone_addtime`, `phone_oldprice`, `phone_newprice`, `phone_img`, `phone_about`, `phone_directory`, `phone_idnew`, `phone_issepprice`, `phone_ishost`, `phone_ishave`, `phone_browsertime`, `phone_sell`) VALUES
(1, 'iPhone8强势来袭', 'Apple', '9787115253', 4, '2011-06-01 00:00:00', 5888, 5699, 'asp1.jpg', '《ASP.NET 4高级程序设计(第4版)》是ASP.NET领域的鸿篇巨制，全面讲解了ASP.NET4的各种特性及其背后的工作原理，并给出了许多针对如何构建复杂、可扩展的网站从实践中得出的建议。书中还深入讲述了其他ASP.NET图书遗漏的高级主题，如自定义控件的创建、图像处理、加密等。此外，《ASP.NET 4高级程序设计(第4版)》专门提供了两章的内容来教你如何用Ajax 技术制作快速响应的页面，以及如何使用微软的ASP.NETAJAX平台。另外，还专门介绍了ASP.NET4 新增的功能，如MVC 和动态数据等。\r\n　　《ASP.NET 4高级程序设计(第4版)》适合各层次的ASP.NET程序员阅读。', '第一部分　核心概念<br/>\r\n第1章　ASP.NET简介　2<br/>\r\n1.1　ASP.NET的7大要点　2<br/>\r\n1.1.1　要点1：ASP.NET是同.NETFramework集成在一起的　2<br/>\r\n1.1.2　要点2：ASP.NET是编译执行的，而不是解释执行的　3<br/>\r\n1.1.3　要点3：ASP.NET支持多语言　4<br/>\r\n1.1.4　要点4：ASP.NET运行在公共语言运行库内　6<br/>\r\n1.1.5　要点5：ASP.NET是面向对象的　7<br/>\r\n1.1.6　要点6：ASP.NET支持所有的浏览器　8<br/>\r\n1.1.7　要点7：ASP.NET易于部署和配置　8<br/>\r\n1.2　ASP.NET的演变　9<br/>\r\n1.2.1　ASP.NET1.0和ASP.NET1.1　9<br/>\r\n1.2.2　 ASP.NET2.0　9<br/>\r\n1.2.3　ASP.NET3.5　10<br/>\r\n1.2.4　ASP.NET4　12<br/>', NULL, b'0', NULL, b'1', NULL, 0),
(2, 'iPhone X', 'Apple', '9787121141', 5, NULL, 8999, 8388, 'cp20.jpg', 'iPhone X是Apple（苹果公司）于北京时间2017年9月13日凌晨1点，在Apple Park新总部的史蒂夫·乔布斯剧院会上发布的新机型。其中“X”是罗马数字“10”的意思，代表着苹果向iPhone问世十周年致敬。\r\niPhone X属于高端版机型，采用全新设计，搭载色彩锐利的OLED屏幕，配备升级后的相机，使用3D面部识别（Face ID）传感器解锁手机，支持AirPower(空中能量)无线充电。分为64GB、256GB两个版本，起售价999美元，2017年10月27日预售，11月3号正式开卖。', 'iPhone X显示屏是iPhone有史以来最为出色一块屏幕，支持3D Touch压感操作，支持HDR显示。iPhone X使用Face ID人脸识别。额头处除了传统的光线与距离传感器，集成了红外线等传感器，其前置摄像头也提升到了700万像素，支持背景虚化自拍。iPhone X加入了无线充电功能，支持IP67级别防水防尘。\r\niPhone X搭载的A11 Bionic处理器加入人工智能神经网络和AR方面的支持，搭载了提升拍照的苹果独立设计的ISP。截止发布iPhone X前苹果性能最为强劲的一款处理器。', b'1', b'0', NULL, b'1', NULL, 300),
(3, '三星 C9', '三星', '9787302282', 9, NULL, 4999, 4500, 'cp14.jpg', '《PHP开发实战权威指南》主要介绍了PHP 5编程的相关知识。主要内容包括PHP基础知识与XHTML、PHP环境搭建与工具、PHP的基本语法、PHP中的数组、PHP面向对象编程、字符串处理与正则表达式、PHP文件系统处理、MySQL数据库、数据库抽象层——PDO和ADOdb、Cookie和Session、PHP的模板技术Smarty、PHP图形处理及应用、PHP与XML、PHP与cURL、PHP功能模块的开发、项目开发与设计以及OA管理系统开发等。\r\n　　《PHP开发实战权威指南》既适合作为PHP初中级学者的参考书，也适合作为高等院校相关专业、软件学院的教材。\r\n　　《PHP开发实战权威指南》光盘提供如下内容：\r\n　　专业教学视频100集：PHP100中文网提供的专业教学视频100集。\r\n　　精致教学PPT 100讲：专业级教学PPT文件100讲。\r\n　　精选源码90套：含近年PHP100论坛资源和下载区精品源码90套。\r\n　　PHP开发必备手册14本：含PHP开发过程中常用手册14本，包括最新的PHP5.3手册等。', '第1章  PHP基础知识与XHTML<br/>\r\n　（教学视频、PPT、必备手册、开发工具、精选源码、相关素材）<br/>\r\n　1.1  PHP的发展与特点<br/>\r\n　　1.1.1  PHP语言的发展和特点<br/>\r\n　　1.1.2  PHP 5.3之后的新特性<br/>\r\n　　1.1.3  PHP程序员应具备的知识<br/>\r\n　　1.1.4  B/S结构软件开发特点<br/>\r\n　　1.1.5  PHP与其他脚本语言的比较<br/>\r\n　1.2  XHTML基础知识<br/>\r\n　　1.2.1  XHTML基础介绍<br/>\r\n　　1.2.2  XHTML语言的语法<br/>\r\n　　1.2.3  文件的主体结构<br/>\r\n　　1.2.4  XHTML文字、图像、视频、动画的处理<br/>\r\n　　1.2.5  XHTML中表单的处理<br/>\r\n　　1.2.6  XHTML中框架的处理<br/>', NULL, b'0', NULL, NULL, NULL, 3),
(5, 'Vivo X20（粉红）', 'vivo', NULL, 14, NULL, 3000, 2899, 'cp5.jpg', 'vivo X 系列发展至今，中间有两个重要的尝试点。第一个，出现在系列发布的开端。当时，vivo 打算在这个主打金属机身的轻薄系列中加入独立的音频模块。利用自家在影音技术上的积累，为这条产品打造出特有的卖点。确实，在那个厂商们都只是用音效来增强听感的年代，能在手机中整合独立的音频方案确实是一个亮点。再加上 vivo 的线下推广手段，X 系列也被迅速推了起来。', NULL, NULL, NULL, NULL, NULL, NULL, 8599),
(6, '坚果Pro2', '锤子科技', '23456689', 6, '2017-12-01 10:36:25', 3888, 3500, 'cp13.jpg', '坚果Pro 2，是锤子科技2017年11月7日在2017锤子科技秋季新品发布会上发布的新手机。在手机正面，锤子手机的最上方只有一个“洞”。因为采取了这样简单的设计，所以听筒隐藏在了这个”洞“中的缝隙中。这次，锤子手机也跟风做了全面屏。另外，在锤子手机有音量键的一面，还添加了一条金线。此外，锤子手机依然使用了闪念胶囊设计、隐藏式呼吸灯、隐藏式听筒、隐藏式光线及隐藏式双摄像头等设计。\r\n', '坚果Pro2采用了人脸识别和指纹识别两种功能。\r\n坚果Pro2推出了智能拖拽排序、应用内的一步拖拽、语义替换、语音改字 、共享胶囊等功能。', b'1', b'0', NULL, NULL, NULL, 100),
(7, '坚果Pro2（黑色）', '锤子科技', '23576586', 7, '2017-12-01 10:36:51', 3888, 3588, 'cp3.jpg', '坚果Pro 2，是锤子科技2017年11月7日在2017锤子科技秋季新品发布会上发布的新手机。在手机正面，锤子手机的最上方只有一个“洞”。因为采取了这样简单的设计，所以听筒隐藏在了这个”洞“中的缝隙中。这次，锤子手机也跟风做了全面屏。另外，在锤子手机有音量键的一面，还添加了一条金线。此外，锤子手机依然使用了闪念胶囊设计、隐藏式呼吸灯、隐藏式听筒、隐藏式光线及隐藏式双摄像头等设计。', '坚果Pro2采用了人脸识别和指纹识别两种功能。\r\n坚果Pro2推出了智能拖拽排序、应用内的一步拖拽、语义替换、语音改字 、共享胶囊等功能。', b'1', b'0', NULL, NULL, NULL, 200),
(8, 'iPhone7（红色版）', 'Apple', '43454647', 2, '2017-12-01 19:41:31', 5199, 5000, 'cp23.jpg', 'iPhone 7是Apple（苹果公司）第10代手机，北京时间2016年9月8日凌晨1点在美国旧金山比尔·格雷厄姆市政礼堂2016年苹果秋季新品发布会上发布。iPhone 7拥有金色、银色、玫瑰金色、黑色、亮黑色、红色(特别版，后增加)六种颜色。Home键有了全新的设计，添加了振动反馈。并且支持IP67防溅抗水防尘功能 ，前/后单摄像头，防抖功能，新增了速度更快的A10 Fusion处理器。iPhone 7取消了3.5mm耳机接口，推出新耳机Apple AirPods，采用W1芯片，有传感器，电池，都放在小小的耳机机身中。iPhone 7 Plus的电池容量只有2900mAh，相比iPhone 6 Plus上的2915mAh在容量上还小那么一点点，却能建立在更强悍的A10 Fusion处理器上多提供超过一个小时的续航时间,iPhone 7 Plus使用双摄像头。 新iPhone取消了16GB机型，最低存储容量为32GB，另外两个容量是128GB和256GB。2017年3月21日，2017苹果春季新品发布会发布，iPhone 7推出红色特别版提供128GB和256GB存储容量的机型，起售价为人民币6,188 元。', 'iPhone7Home键全新设计，添加了振动反馈。新iPhone的Home键不再是机械按键，而是力度感应键，能感知压力，可以提供触感反馈，响应度更高，不易被按坏。支持IP67防水防尘功能，双摄像头（限iPhone7 Plus)，防抖功能，新增了速度更快的处理器。相机的处理器ISP吞吐量是原来的两倍。Live photo更加强大，开发者还可以调用RAW相机的API。前置摄像头升级到700万像素，支持防抖功能。', b'1', b'1', b'1', b'1', NULL, 500),
(9, 'iPhone7', 'Apple', '22434868', 3, '2017-12-01 11:35:44', 5199, 5000, 'cp10.jpg', 'iPhone 7是Apple（苹果公司）第10代手机，北京时间2016年9月8日凌晨1点在美国旧金山比尔·格雷厄姆市政礼堂2016年苹果秋季新品发布会上发布。iPhone 7拥有金色、银色、玫瑰金色、黑色、亮黑色、红色(特别版，后增加)六种颜色。Home键有了全新的设计，添加了振动反馈。并且支持IP67防溅抗水防尘功能 ，前/后单摄像头，防抖功能，新增了速度更快的A10 Fusion处理器。iPhone 7取消了3.5mm耳机接口，推出新耳机Apple AirPods，采用W1芯片，有传感器，电池，都放在小小的耳机机身中。iPhone 7 Plus的电池容量只有2900mAh，相比iPhone 6 Plus上的2915mAh在容量上还小那么一点点，却能建立在更强悍的A10 Fusion处理器上多提供超过一个小时的续航时间,iPhone 7 Plus使用双摄像头。 新iPhone取消了16GB机型，最低存储容量为32GB，另外两个容量是128GB和256GB。2017年3月21日，2017苹果春季新品发布会发布，iPhone 7推出红色特别版提供128GB和256GB存储容量的机型，起售价为人民币6,188 元。', 'iPhone7Home键全新设计，添加了振动反馈。新iPhone的Home键不再是机械按键，而是力度感应键，能感知压力，可以提供触感反馈，响应度更高，不易被按坏。支持IP67防水防尘功能，双摄像头（限iPhone7 Plus)，防抖功能，新增了速度更快的处理器。相机的处理器ISP吞吐量是原来的两倍。Live photo更加强大，开发者还可以调用RAW相机的API。前置摄像头升级到700万像素，支持防抖功能。', b'1', b'0', b'0', b'1', NULL, 300),
(10, 'iPhone X（黑色）', 'Apple', '443546456', 1, '2017-12-01 13:35:00', 8999, 8388, 'cp1.jpg', 'iPhone X是Apple（苹果公司）于北京时间2017年9月13日凌晨1点，在Apple Park新总部的史蒂夫·乔布斯剧院会上发布的新机型。其中“X”是罗马数字“10”的意思，代表着苹果向iPhone问世十周年致敬。', 'iPhone X属于高端版机型，采用全新设计，搭载色彩锐利的OLED屏幕，配备升级后的相机，使用3D面部识别（Face ID）传感器解锁手机，支持AirPower(空中能量)无线充电。分为64GB、256GB两个版本，起售价999美元，2017年10月27日预售，11月3号正式开卖。', b'1', b'0', b'1', b'1', NULL, 324),
(11, '小米5x', '小米', '335436', 10, '2017-12-01 00:00:00', 3200, 3000, 'cp6.jpg', '小米5X搭载“一代神U”骁龙625处理器，采用14nm制程A53核心主频2.0GHz，仅有4GB RAM + 64GB ROM唯一组合版本。正面5.5英寸1080P分辨率屏幕，一体化金属机身采用U型天线带。机身厚度7.3mm重量163g，内置3080mAh电池支持5V/2A充电功率。', '手机毛重：0.6kg\r\n系统：MIUI8\r\n运行内存：4G\r\n前置摄像头像素：500万\r\n后置摄像头像素：双1200万\r\n电池容量：3000mAh-3999mAh\r\n机身内存：32G或64G', b'1', b'0', b'0', b'1', NULL, 423),
(12, '荣耀v10', '华为荣耀', '65464645', 11, '2017-12-01 00:00:00', 2699, 2799, 'cp12.jpg', '华为荣耀V10配备一块LCD材质18：9的全面屏，分辨率为2160*1080，同样有内屏圆角屏幕设计。机身在下边框尽可能窄的情况下保留了前置指纹，同时支持人脸识别，一体化金属后壳。搭载华为研发的麒麟970芯片及NPU专用硬件处理单元，Mali-G72 12核GPU芯片。支持双卡双4G双VoLET、有黑红蓝金四种颜色，6.97mm厚度，3750mAh电池容量。', '基于麒麟970AI芯片，荣耀V10继续承诺500天不卡顿，王者荣耀专门优化，采用 AI 游戏场景学习，能实时预判游戏场景，以达到智能调度。\r\n同时还配备了 1300 万像素 AI 自拍，支持图像识别分割，将人像和背景分别处理，可以替换照片背景，模拟“双胞胎”效果。荣耀V10 还可以通过预测运动轨迹，实现对高速运动物体更好的抓拍效果。\r\n最后，V10 支持 AI 高倍变焦，远距离也可以把文字拍得清，不是基于硬件的变焦，而是AI 会“脑补”图片细节，当你放大时呈现更好的显示效果。\r\n', b'1', b'0', b'0', b'1', NULL, 632),
(13, 'OPPO R11s', 'OPPO', '1334325', 12, '2017-12-01 00:00:00', 2333, 2000, 'cp21.jpg', 'OPPO', 'oppo', b'1', b'0', b'0', b'1', NULL, 200),
(14, '三星S8（粉红）', '三星', '45365845', 8, '2017-12-01 00:00:00', 5000, 5199, 'cp11.jpg', '三星Galaxy S8是韩国三星公司推出的新一代智能手机产品，在2017年2月MWC会展亮相。\r\n搭载10nm制程的骁龙835和Exynos 8895处理器，有5.8英寸和6.2英寸两个版本。全网通、指纹识别、双频WIFI、高通骁龙、GPS导航。\r\n北京时间2017年3月29日晚，三星在纽约发布了2017年旗舰手机Galaxy S8，于2017年3月30日开启预订。', '三星Galaxy S8/S8+采用了前所未有的全视曲面屏和无边框视觉设计，手机正反两面均采用第五代康宁大猩猩玻璃，标志性的Home键去掉后屏占比提高到了84%。此外，三星Galaxy S8/S8+拥有谜夜黑、耀星银、烟晶灰、雾屿蓝和绮梦金五种配色。两者均搭载顶尖的2K显示屏，屏幕尺寸分别为5.8英寸和6.2英寸。相比上代，拥有更大屏幕、更窄边框和宽度，配合无缝衔接的曲面玻璃机身+金属中框，带来了更好的握持感。手机屏幕的比例为18.5：9，四角为独特的圆弧形，观看视频时黑边效果更好。作为全球首台经超高清联盟（UHD Alliance）认证，符合MOBILE HDR PREMIUMTM规范的移动设备，三星Galaxy S8/S8+能够让用户在观看节目时，体验到如电影制作人要求级别的鲜艳色彩和对比度。', b'1', b'0', b'0', b'0', NULL, 432),
(15, '三星S8（蓝色）', '三星', '1221453', 8, '2017-12-01 00:00:00', 5000, 5199, 'cp18.jpg', '三星Galaxy S8/S8+采用了前所未有的全视曲面屏和无边框视觉设计，手机正反两面均采用第五代康宁大猩猩玻璃，标志性的Home键去掉后屏占比提高到了84%。此外，三星Galaxy S8/S8+拥有谜夜黑、耀星银、烟晶灰、雾屿蓝和绮梦金五种配色。两者均搭载顶尖的2K显示屏，屏幕尺寸分别为5.8英寸和6.2英寸。相比上代，拥有更大屏幕、更窄边框和宽度，配合无缝衔接的曲面玻璃机身+金属中框，带来了更好的握持感。手机屏幕的比例为18.5：9，四角为独特的圆弧形，观看视频时黑边效果更好。作为全球首台经超高清联盟（UHD Alliance）认证，符合MOBILE HDR PREMIUMTM规范的移动设备，三星Galaxy S8/S8+能够让用户在观看节目时，体验到如电影制作人要求级别的鲜艳色彩和对比度。', '三星Galaxy S8是韩国三星公司推出的新一代智能手机产品，在2017年2月MWC会展亮相。\r\n搭载10nm制程的骁龙835和Exynos 8895处理器，有5.8英寸和6.2英寸两个版本。全网通、指纹识别、双频WIFI、高通骁龙、GPS导航。\r\n北京时间2017年3月29日晚，三星在纽约发布了2017年旗舰手机Galaxy S8，于2017年3月30日开启预订。', b'1', b'0', b'0', NULL, NULL, 265),
(16, '魅蓝 note3', '魅族', '1231231', 13, '2017-12-01 00:00:00', 899, 878, 'cp9.jpg', '魅族青年良机', '魅族青年良机', b'1', b'0', b'0', b'0', NULL, 122);

-- --------------------------------------------------------

--
-- 表的结构 `tb_phonetype`
--

CREATE TABLE `tb_phonetype` (
  `b_id` int(11) NOT NULL COMMENT '大类别ID',
  `b_name` varchar(50) DEFAULT NULL COMMENT '类型名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tb_phonetype`
--

INSERT INTO `tb_phonetype` (`b_id`, `b_name`) VALUES
(1, 'Apple'),
(2, '三星'),
(3, '魅族'),
(4, '一加手机'),
(5, '华为荣耀'),
(6, '小米科技'),
(7, 'OPPO'),
(8, 'VIVO'),
(9, '锤子');

-- --------------------------------------------------------

--
-- 表的结构 `tb_smalltype`
--

CREATE TABLE `tb_smalltype` (
  `s_id` int(11) NOT NULL COMMENT '小类型Id',
  `s_name` varchar(50) DEFAULT NULL COMMENT '小类型名',
  `b_id` varchar(50) DEFAULT NULL COMMENT '大类型Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tb_smalltype`
--

INSERT INTO `tb_smalltype` (`s_id`, `s_name`, `b_id`) VALUES
(1, 'iPhone X黑色', '1'),
(2, 'iPhone7红色版', '1'),
(3, 'iPhone7', '1'),
(4, 'iPhone8', '1'),
(5, 'iPhone X白色', '1'),
(6, '坚果Pro2', '9'),
(7, '坚果系列', '9'),
(8, '三星S8', '2'),
(9, '三星C9', '2'),
(10, '小米5x', '6'),
(11, '荣耀v8', '5'),
(12, 'oppo R11s', '7'),
(13, '魅族', '3'),
(14, 'Vivo X20', '8');

-- --------------------------------------------------------

--
-- 表的结构 `tb_user`
--

CREATE TABLE `tb_user` (
  `user_id` int(11) NOT NULL COMMENT '用户Id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `user_truename` varchar(50) DEFAULT NULL COMMENT '真实名字',
  `user_pwd` char(50) DEFAULT NULL COMMENT '用户密码',
  `user_email` varchar(50) DEFAULT NULL COMMENT 'email',
  `user_sex` char(2) DEFAULT NULL COMMENT '性别',
  `user_tel` char(20) DEFAULT NULL COMMENT '联系电话',
  `user_qq` char(20) DEFAULT NULL COMMENT 'QQ',
  `user_address` varchar(100) DEFAULT NULL COMMENT '地址',
  `user_logintimes` int(11) DEFAULT NULL COMMENT '登陆次数',
  `user_ip` char(20) DEFAULT NULL COMMENT 'ip',
  `user_yb` char(20) DEFAULT NULL COMMENT '邮政编码',
  `user_type` tinyint(4) DEFAULT NULL COMMENT '用户类别标识',
  `user_question` varchar(200) DEFAULT NULL COMMENT '要回密码问题',
  `user_answer` varchar(200) DEFAULT NULL COMMENT '要回密码问题',
  `user_photo` varchar(50) DEFAULT NULL COMMENT '照片地址',
  `user_truepwd` char(50) DEFAULT NULL COMMENT '真实密码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tb_user`
--

INSERT INTO `tb_user` (`user_id`, `user_name`, `user_truename`, `user_pwd`, `user_email`, `user_sex`, `user_tel`, `user_qq`, `user_address`, `user_logintimes`, `user_ip`, `user_yb`, `user_type`, `user_question`, `user_answer`, `user_photo`, `user_truepwd`) VALUES
(1, 'a', NULL, '187ef4436122d1cc2f40dc2b92f0eba0', 'a@aa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'aa', NULL, '187ef4436122d1cc2f40dc2b92f0eba0', 'a@aa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'aaa', NULL, '187ef4436122d1cc2f40dc2b92f0eba0', 'a@aa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'aaaa', NULL, '187ef4436122d1cc2f40dc2b92f0eba0', 'a@aa.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '1234', '黄凯锋', '202cb962ac59075b964b07152d234b70', '117@qq.com', '男', '13456789088', '11111111', '广东', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'admin', '小红', '827ccb0eea8a706c4c34a16891f84e7b', '11111@qq.com', '男', '11111111111111', NULL, '广东机电职业技术学院', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_feedback`
--
ALTER TABLE `tb_feedback`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `tb_message`
--
ALTER TABLE `tb_message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `tb_phones`
--
ALTER TABLE `tb_phones`
  ADD PRIMARY KEY (`phone_id`);

--
-- Indexes for table `tb_phonetype`
--
ALTER TABLE `tb_phonetype`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `tb_smalltype`
--
ALTER TABLE `tb_smalltype`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tb_feedback`
--
ALTER TABLE `tb_feedback`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tb_message`
--
ALTER TABLE `tb_message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID';
--
-- 使用表AUTO_INCREMENT `tb_phones`
--
ALTER TABLE `tb_phones`
  MODIFY `phone_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '手机产品ID', AUTO_INCREMENT=17;
--
-- 使用表AUTO_INCREMENT `tb_phonetype`
--
ALTER TABLE `tb_phonetype`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '大类别ID', AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `tb_smalltype`
--
ALTER TABLE `tb_smalltype`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小类型Id', AUTO_INCREMENT=15;
--
-- 使用表AUTO_INCREMENT `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Id', AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
