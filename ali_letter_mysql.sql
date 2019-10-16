-- 创建数据库
create database ali_letter;
-- 切换到数据库
use ali_letter;
-- 创建用户表users
create table users (
    id int unsigned auto_increment primary key not null comment '用户 id',
    phone char(11) not null comment '用户 手机号',
    password varchar(32) not null comment '用户 密码',
    username char(10) not null comment '用户 呢称',
    avatar varchar(255) not null default "/assets/images/users/avatar_default.png" comment '头像 路径',
    book_coin decimal(10) not null default '0' comment '书豆余额'
);
insert into users(phone, password, username) values('17851831895', '123456789', '书友12345678');
insert into users(phone, password, username) values('18851831895', '223456789', '书友22345678');
-- 创建书架bookrack
create table bookrack (
    id int unsigned auto_increment primary key not null comment '书架 id',
    users_id int unsigned not null comment '用户 id',
    novel_id int unsigned not null comment '小说 id'
);
insert into bookrack(users_id, novel_id) values(1, 1);
insert into bookrack(users_id, novel_id) values(1, 2);
insert into bookrack(users_id, novel_id) values(1, 3);
insert into bookrack(users_id, novel_id) values(2, 1);
insert into bookrack(users_id, novel_id) values(3, 2);
-- 查询某用户加入到书架的小说id select * from novels where id in (select novel_id from bookrack where users_id = 1);

-- 创建小说表novels
create table novels (
    id int unsigned auto_increment primary key not null comment '小说 id',
    novel_title varchar(255) not null comment '小说 标题',
    novel_desc varchar(900) not null comment '小说 简介',
    novel_author char(10) not null comment '小说 作者',
    novel_url varchar(2083) not null comment '小说 图片'
);
insert into novels values(null, '大神求翻牌子', '人怂志气大的苏以乔在游戏中守了那么长时间的男神居然是个渣男！一时间苏以乔看破红尘一雪前耻。 前夫太渣怎么办?离婚打脸。 绿茶戏太多怎么办?鼓掌叫好。 魔教教主缺个夫人怎么办? 嗯?这教主长得好生俊俏，小女子决定“弃暗投明”！ 看鬼畜活泼人还怂的貌美学妹×腹黑腹黑非常腹黑的学校男神，游戏里游戏外的绚烂火花。 “男神，你好像一颗大白兔，又白又甜又可爱！”', '一剑如故', '/assets/images/book/1173497923371.jpg');
insert into novels values(null, '秘宋', '正经版本介绍：主角穿越回大宋年间，炼不了钢铁烧不了玻璃，可怜的文科生挣扎在北宋年间。只是一腔热血偏生不冷，凭借着信息大爆炸年代对于间谍行当的了解，硬要为这天下苍生，重铸华夏锋刃！简洁流介绍：大宋版24小时爽文流介绍：收美女？过时了。主角有点品味行不行？后宫团怎么也得名门贵女，才对得起咱们主角！不是大宋宰执的女儿，不是名满天下的才女，好意思跟主角拉扯？主角君很有节操的！', '荆洚晓','/assets/images/book/201710161627176409.jpg');
insert into novels values(null, '天上掉下个小二宝', '李嘉颜，一个老公宠爱儿子喜爱的幸福女人，生活的还算悠闲惬意，可忽然有一天，咣叽，一个忽如其来的二宝从天而降，打破了她现有的生活，她乱了，平静的生活也随之波澜起伏。', '糖炒咖啡', '/assets/images/book/1190107797021.jpg');
-- novel_detail 中间表
create table novel_detail (
    novel_id int unsigned not null comment '小说 id',
    detail_id int unsigned not null comment '详情 id',
    click_ratio int unsigned not null default 0 comment '点击率',
    collect_ratio int unsigned not null default 0 comment '收藏率',
    subscribe_ratio int unsigned not null default 0 comment '订阅率',
    hot_vals int unsigned not null default 0 comment '人气值',
    last_update int unsigned not null comment '最近更新时间'
);
insert into novel_detail(novel_id, detail_id, last_update) values(1, 1, 1571128622);
insert into novel_detail(novel_id, detail_id, last_update) values(2, 2, 1557909422);
insert into novel_detail(novel_id, detail_id, last_update) values(3, 3, 1557650222);

-- detail 详情表
create table detail (
    id int unsigned auto_increment primary key not null comment '详情 id',
    novel_type tinyint(2) not null comment '0 女频，1 男频',
    novel_classify char(2) not null comment '都市 玄幻 仙侠 灵异 历史 游戏 科幻 武侠奇幻 竞技 其他 现言 古言 幻言',
    novel_status tinyint(2) not null comment '0连载 1完结',
    word_nums float(10, 2) unsigned not null comment '字数',
    novel_tags char(10) not null comment '标签',
    novel_paths varchar(255) not null comment '路径'
);
insert into detail(novel_type, novel_classify, novel_status, word_nums, novel_tags, novel_paths) values(0, '游戏', 0, 67.18, '爽文,腹黑,竞技', 'https://www.aliwx.com.cn/reader?bid=7923371&cid=1175017');
insert into detail(novel_type, novel_classify, novel_status, word_nums, novel_tags, novel_paths) values(1, '历史', 0, 187.95, '热血,穿越,极品', 'https://www.aliwx.com.cn/reader?spm=aliwx.cover.0.0.24435837WKh1rx&bid=7152276');
insert into detail(novel_type, novel_classify, novel_status, word_nums, novel_tags, novel_paths) values(0, '现言', 0, 39.36, '轻松,宝宝,萌文', 'https://www.aliwx.com.cn/reader?bid=7923371&cid=1175017');