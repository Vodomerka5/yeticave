-- Заполнение категорий
INSERT INTO `categories`(`id`,`title`, `alias`) VALUES 
(1,'Доски и лыжи','boards'),
(2,'Крепления','attachment'),
(3,'Ботинки','boots'),
(4,'Одежда','clothing'),
(5,'Инструменты','tools'),
(6,'Разное','other');

-- Заполнение юзеров
INSERT INTO `users`(`id`,`username`, `email`, `password`, `avatar`, `reg_date`, `contacts`) VALUES 
(1,'Zeryshka','zermaxim@gmail.com','123123qwerty','img/user.jpg','2020-03-27 13:58','89099251234'),
(2,'Adam','adam@gmail.com','adam2281337','img/user.jpg','2020-02-25 15:28','89099251234'),
(3,'Admin','admin@gmail.com','admin9045879032','img/user.jpg','2019-09-17 12:50','89099251234'),
(4,'Kleopatra','kleopatra@gmail.com','kleo07','img/user.jpg','2019-03-25 11:34','89099251234');

-- Заполнение лотов
INSERT INTO `lots`(`id`,`title`, `description`, `date_create`, `start_price`, `image_url`, `expire_date`, `bet_step`, `user_id`, `category_id`, `winner_id`, `bet_price`) VALUES 
(1,'2014 Rossignol District Snowboard','Описание к товару пока отсутствует','2020-03-27 15:43',10999,'img\lot-1.jpg','2020-04-27',1000,1,1,3,15000),
(2,'DC Ply Mens 2016/2017 Snowboard','Описание к товару пока отсутствует','2020-03-27 15:43',15999,'img\lot-2.jpg','2020-04-27',1000,2,1,3,19000),
(3,'Крепления Union Contact Pro 2015 года размер L/XL','Описание к товару пока отсутствует','2020-03-27 15:43',8000,'img\lot-3.jpg','2020-04-27',1000,1,2,null,null),
(4,'Ботинки для сноуборда DC Mutiny Charocal','Описание к товару пока отсутствует','2020-03-26 15:43',10999,'img\lot-4.jpg','2020-04-27',1000,2,4,3,13000),
(5,'Куртка для сноуборда DC Mutiny Charocal','Описание к товару пока отсутствует','2020-03-26 15:43',7500,'img\lot-5.jpg','2020-04-27',1000,2,4,null,null),
(6,'Маска Oakley Canopy','Описание к товару пока отсутствует','2020-03-26 15:43',5400,'img\lot-6.jpg','2020-04-26',1000,3,6,null,null);

INSERT INTO `bets`(`id`, `bet_date`, `bet_price`, `user_id`, `lot_id`) VALUES 
(1,'2020-03-28',13000,1,1),
(2,'2020-03-26',14000,2,1),
(3,'2020-03-25',15000,3,1);

-- Получить список из всех категорий
SELECT `title`,`alias` FROM `categories`;

-- Получить самые новые лоты. Выводит лоты за последние 6 часов (от реального времени)
SELECT * FROM `lots` WHERE `date_create` > (CURDATE() - INTERVAL 6 hour);

-- Получить лот по его id
SELECT * FROM `lots` WHERE `id` = 1;

-- Обновить по идентификатору
UPDATE `lots` SET `title`='2020 Rossignol District Snowboard' WHERE `id`=1;

-- Получить свежие ставки для лота по его идентификатору. Выводит ставки по лоту за последние 6 часов (от реального времени)
SELECT * FROM `bets` WHERE `bet_date` < (CURDATE() - INTERVAL 1 day) AND `lot_id` = 1;