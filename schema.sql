-- Cоздание таблицы bets
CREATE TABLE `bets` (
  `id` int(11) NOT NULL,
  `bet_date` datetime NOT NULL,
  `bet_price` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Cоздание таблицы categories
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `alias` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Cоздание таблицы lots
CREATE TABLE `lots` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NULL,
  `date_create` datetime NOT NULL,
  `start_price` decimal(10,0) NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `expire_date` datetime NOT NULL,
  `bet_step` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `winner_id` int(11),
  `bet_price` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Cоздание таблицы users
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(100) NULL,
  `reg_date` datetime NOT NULL,
  `contacts` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Индексы таблицы bets
ALTER TABLE `bets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lot_id` (`lot_id`),
  ADD KEY `user_id` (`user_id`);

-- Индексы таблицы categories
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`,`title`,`alias`);

-- Индексы таблицы lots
ALTER TABLE `lots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `winner_id` (`winner_id`),
  ADD KEY `[category_id]` (`category_id`),
  ADD KEY `[user_id]` (`user_id`);

-- Индексы таблицы users
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`,`username`,`email`);

-- Ограничения FK таблицы bets
ALTER TABLE `bets`
  ADD CONSTRAINT `bets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bets_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- Ограничения FK таблицы lots
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_ibfk_3` FOREIGN KEY (`winner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


