-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 06 2022 г., 17:41
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jetsaus`
--

-- --------------------------------------------------------

--
-- Структура таблицы `baskets`
--

CREATE TABLE `baskets` (
  `id` smallint(5) NOT NULL COMMENT 'id записи корзины',
  `userid` smallint(5) NOT NULL COMMENT 'id пользователя',
  `productid` smallint(5) NOT NULL COMMENT 'id продукта',
  `amount` smallint(5) NOT NULL COMMENT 'количество продукта',
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Корзина покупателя';

--
-- Дамп данных таблицы `baskets`
--

INSERT INTO `baskets` (`id`, `userid`, `productid`, `amount`, `last_action`) VALUES
(4, 7, 1, 1, '2022-02-04 15:20:36'),
(13, 3, 13, 3, '2022-02-11 13:25:32'),
(14, 3, 1, 2, '2022-02-24 13:13:39'),
(17, 3, 6, 2, '2022-02-11 13:48:27'),
(18, 8, 1, 1, '2022-02-21 13:34:19'),
(19, 8, 13, 1, '2022-02-11 15:17:09'),
(20, 8, 15, 3, '2022-02-26 12:58:52');

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` smallint(5) NOT NULL COMMENT 'id записи корзины',
  `userid` smallint(5) NOT NULL COMMENT 'id пользователя',
  `productid` smallint(5) NOT NULL COMMENT 'id продукта',
  `amount` smallint(5) NOT NULL COMMENT 'количество продукта',
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Корзина покупателя';

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `userid`, `productid`, `amount`, `last_action`) VALUES
(4, 7, 1, 1, '2022-02-04 15:20:36'),
(13, 3, 13, 3, '2022-02-11 13:25:32'),
(14, 3, 1, 2, '2022-02-24 13:13:39'),
(17, 3, 6, 2, '2022-02-11 13:48:27'),
(18, 8, 1, 1, '2022-02-21 13:34:19'),
(19, 8, 13, 1, '2022-02-11 15:17:09'),
(20, 8, 15, 3, '2022-02-26 12:58:52');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` smallint(5) UNSIGNED NOT NULL COMMENT 'id товара',
  `id_category` smallint(5) NOT NULL COMMENT 'id категории товара',
  `url` varchar(255) NOT NULL COMMENT 'Расположение фотографии животного',
  `size` int(10) UNSIGNED NOT NULL COMMENT 'Размер в байтах демонстрационной картинки',
  `name` varchar(255) NOT NULL COMMENT 'Наименование товара',
  `description` varchar(1024) DEFAULT NULL COMMENT 'Описание товара',
  `views` smallint(5) DEFAULT NULL COMMENT 'Количество просмотров',
  `price` decimal(5,2) UNSIGNED NOT NULL COMMENT 'Цена товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Товары (фото животных)';

--
-- Дамп данных таблицы `gallery`
--

INSERT INTO `gallery` (`id`, `id_category`, `url`, `size`, `name`, `description`, `views`, `price`) VALUES
(1, 0, 'img/product/1.jpg', 170934, 'Дельфин', 'Дельфины (др.-греч. δελφῖνος, δελφίς) — водные млекопитающие инфраотряда китообразных, принадлежащие либо к семейству дельфиновых (Delphinidae) — морские, либо к надсемейству речных дельфинов (Platanistoidea) — пресноводные.', 50, '127.00'),
(2, 0, 'img/product/2.jpg', 98882, 'Лисица', 'Лисица — общее название нескольких видов млекопитающих семейства псовые. Лишь 10 видов этой группы относят к роду собственно лисиц (лат. Vulpes). Наиболее известный и распространённый представитель — обыкновенная лисица (Vulpes vulpes).', 35, '19.50'),
(3, 0, 'img/product/3.jpg', 372746, 'Коала', 'Коала (лат. Phascolarctos cinereus) — вид сумчатых, обитающий в Австралии. Единственный современный представитель семейства коаловых (Phascolarctidae) из отряда двурезцовых сумчатых (Diprotodontia).', 28, '56.09'),
(4, 0, 'img/product/4.jpg', 339981, 'Лев', 'Лев (лат. Panthera leo) — вид хищных млекопитающих, один из четырёх представителей рода пантер (Panthera), относящегося к подсемейству больших кошек (Pantherinae) в составе семейства кошачьих (Felidae). Наряду с тигром — самая крупная из ныне живущих кошек, масса некоторых самцов может достигать 250 кг.', 39, '45.68'),
(5, 0, 'img/product/5.jpg', 442827, 'Рысь', 'Рысь (лат. Lynx) — род хищных млекопитающих семейства кошачьих, наиболее близкий к роду кошек (Felis).', 36, '67.12'),
(6, 0, 'img/product/6.jpg', 365881, 'Панда', 'Панда (лат. Ailuridae) — семейство млекопитающих из подотряда псообразные (Caniformia) отряда хищных. Включает семь вымерших и один современный род. Единственный современный вид — малая, или красная панда (Ailurus fulgens).', 40, '90.43'),
(7, 0, 'img/product/7.jpg', 254168, 'Белый медведь', '\'Белый медведь, или полярный медведь, северный медведь, ошкуй, нанук, умка (лат. Ursus maritimus — «медведь морской») — хищное млекопитающее семейства медвежьих, близкий родственник бурого медведя. Второй по величине сухопутный хищник планеты после гребнистого крокодила. Назван так из-за белой шерсти.', 34, '89.33'),
(8, 0, 'img/product/8.jpg', 225933, 'Пума', 'Пума (горный лев, кугуар) (лат. Puma concolor) — хищник рода Пумы семейства кошачьих. Обитает в Северной и Южной Америке. Самый крупный представитель рода пум. Длина тела животного составляет 100—180 см, при длине хвоста 60—75 см, высоте в холке 61—76 см при весе до 105 кг (самцы). Охотится преимущественно на оленей.', 28, '78.45'),
(9, 0, 'img/product/9.jpg', 359751, 'Тигр', 'Тигр (лат. Panthera tigris) — вид хищных млекопитающих семейства кошачьих, один из четырёх представителей рода пантера (лат. Panthera), который относится к подсемейству больших кошек. Слово «тигр» происходит от др.-греч. τίγρις, которое в свою очередь восходит к др.-перс. *tigri от корня «*taig» со значением «острый; быстрый».', 32, '110.00'),
(10, 0, 'img/product/10.jpg', 220331, 'Волки', 'Волк, или серый волк, или обыкновенный волк (лат. Canis lupus), — вид хищных млекопитающих из семейства псовых (Canidae). Наряду с койотом (Canis latrans), обыкновенным шакалом (Canis aureus) и ещё несколькими видами составляет род волков (Canis).Dолк — одно из самых крупных современных животных в своём семействе: длина его тела (без учёта хвоста) может достигать 160 см, длина хвоста — до 52 см, высота в холке — до 90 см; масса тела может доходить до 90—100 кг.', 51, '120.67'),
(11, 0, 'img/product/11.jpg', 134743, 'Скунс', 'Полосатые скунсы (лат. Mephitis) — род хищных млекопитающих семейства скунсовых, включающий в себя всего два вида: полосатого скунса и мексиканского скунса.\r\nПолосатый скунс (лат. Mephitis mephitis) — зверёк средней величины и крепкого сложения. Длина его тела 28—38 см, длина хвоста обычно 17—30 см (иногда достигает 43 см); масса взрослого животного лежит в диапазоне от 1,2 до 5,3 кг. Самцы обычно на 10—15 % крупнее самок. Лапы короткие, стопоходящие, со слабо изогнутыми когтями. Когти передних лап длинные, приспособленные для рытья; задние лапы — короче. Уши короткие, с широким основанием и закруглёнными верхушками.\r\nМех у скунса высокий, очень густой, но грубый. Хвост длинный и лохматый. Окраска — сочетание тёмного (чёрного) и белого цветов: на общем тёмном фоне выделяются широкие белые полосы, начинающиеся на голове и идущие вдоль хребта к хвосту, который обычно покрыт чёрными и белыми волосами вперемешку. Ширина и длина полос отличаются у каждой особи; иногда встречаются совершенно чёрные или, нап', 30, '12.50'),
(12, 0, 'img/product/12.jpeg', 119960, 'Обезьяна', 'Обезья́ны, или «сухоносые» приматы(лат. Haplorhini), — подотряд млекопитающих из отряда приматов.\r\nОбезьяны отличаются по ряду признаков от другого подотряда приматов — полуобезьян. У гаплориновых приматов сухой нос и менее развитое чувство обоняния. Среди обезьян преобладают виды, рождающие одного детёныша. В целом, этот подотряд считается более развитым в эволюционном отношении.\r\nОбезьяны обитают в тропических и субтропических регионах Америки, Африки (за исключением Мадагаскара), в Гибралтаре, а также в Южной и Юго-Восточной Азии вплоть до Японии. Человек населяет все континенты за исключением Антарктиды (где не живёт постоянно, но постоянно присутствует).\r\nУ большинства обезьян белки глаз обычно чёрные, как и зрачки (у людей — белые, что контрастирует со зрачками). Обезьяны отличаются от полуобезьян дневным образом жизни, сложным поведением, всеядностью с уклоном в растительноядность. С этим связаны их многие морфологические особенности, например, сложно устроенный мозг.', 29, '78.23'),
(13, 0, 'img/product/13.jpg', 106075, 'Кит', 'Киты́ (греч. κῆτος — «морское чудовище») — морские млекопитающие из инфраотряда китообразных, не относящиеся ни к дельфинам, ни к морским свиньям. Косатка и гринды имеют слово «кит» в своих неофициальных названиях («кит-убийца»), хотя по строгой классификации они являются дельфинами. В устаревшей классификации под китами подразумевали гладких китов (лат. Balaenidae).\r\nВ старину под словом «кит» иногда подразумевался левиафан.\r\nЛевиафа́н (др.-евр. לִוְיָתָן, совр. ивр. ‏לִװײָתָן‏‎, ливъята́н — «скрученный, свитый»; совр. значение — «кит») — морское чудовище, упоминаемое в Танахе (Ветхом Завете).', 35, '215.00'),
(14, 0, 'img/product/14.jpg', 372746, 'Хорёк', 'Лесной хорёк, или обыкновенный хорёк, или чёрный хорёк, или обыкновенный хорь, или тёмный хорь, или чёрный хорь(лат. Mustela putorius) — обитатель Евразийского континента. Имеет одомашненную форму — фретка (Mustela furo, иногда рассматривается как подвид Mustela putorius furo). Они свободно скрещиваются и дают разные цветовые вариации. Чёрный хорёк широко распространён по всей Западной Европе, хотя территория его обитания постепенно сокращается. Довольно большая популяция хорьков проживает в Англии (название в Британии — Polecat) и почти на всей территории Европейской части России, кроме Северной Карелии, Кавказа, Нижнего Поволжья. В конце XIX века его находили в районах Западной Сибири (на восток до левобережья Иртыша и низовий Тары). В последние десятилетия появилась информация о расселении чёрного хорька в леса Финляндии и Карелии. Также чёрный хорёк обитает в лесах северо-запада Африки.\r\nВ своё время чёрный хорёк вместе с с фретками и ласками был перевезён в Новую Зеландию для борьбы с мышами и крысами. О', 34, '12.24'),
(15, 0, 'img/product/15.jpeg', 159201, 'Енот', 'Енот-полоскун, или американский енот(лат. Procyon lotor), — хищное млекопитающее рода еноты семейства енотовых. Один из немногих видов, которые процветают в условиях усиления антропогенного воздействия, выражающегося в постепенном окультурировании угодий. Енот хорошо приживается в местах интродукции, хотя и является в целом теплолюбивым видом. На территории России вид хорошо освоил западные (причерноморские) и восточные (прикаспийские) регионы Северного Кавказа, где превратился в опасный инвазионный вид, угрожающий местной флоре и фауне. B Белоруссии хорошо прижился в Полесье. Енот легко приручается и подходит для разведения в неволе. Енот-полоскун ростом с кошку. Длина тела 45—60 см, хвоста 20—25 см; масса 5—9 кг. Лапы короткие, с настолько развитыми пальцами, что следы похожи на отпечаток человеческой ладони. Енот может передними лапами захватывать и удерживать предметы, в том числе и мыть еду. Высокая чувствительность лап заменяет дальнозоркому еноту зрение вблизи. Мех у енота густой, коричневато-серый.', 1, '127.33');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_category`
--

CREATE TABLE `gallery_category` (
  `id` smallint(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Категории товаров';

--
-- Дамп данных таблицы `gallery_category`
--

INSERT INTO `gallery_category` (`id`, `name`, `description`) VALUES
(1, 'Дельфиновые', 'Дельфи́новые, или дельфи́ны (лат. Delphinidae, от др.-греч. δελφίς, gen. δελφῖνος ‘дельфин’), — семейство морских млекопитающих из парвотряда зубатых китов инфраотряда китообразных.'),
(2, 'Псовые', 'Псо́вые, или соба́чьи, или во́лчьи, или соба́ки, или кани́ды (лат. Canidae), — семейство млекопитающих отряда хищных, включающее в себя ныне три подсемейства: волчьи (Caninae), собачьи (Simocyoninae) и большеухие лисицы (Otocyoninae). Длина тела от 18—22 см до 160 см. Насчитывают 14 родов и около 35 видов. Распространены на всех материках, за исключением Антарктиды[5]. Некоторые виды псовых являются объектами пушного промысла и звероводства.'),
(3, 'Коаловые', 'Коаловые (ранее — коалы, лат. Phascolarctidae) — семейство двурезцовых сумчатых, содержащее один современный вид — коалу (Phascolarctos cinereus). Название типового рода Phascolarctos происходит от лат. phasco — «сумка» и др.-греч. arctos — «медведь». К середине XX века это был единственный известный вид рода, который иногда относили к семейству кускусовых (Phalangeridae). Затем наступил период масштабных исследований ископаемых остатков в Южной Австралии и Квинсленде, в результате чего семейство коаловых пополнилось многими впервые описанными видами и несколькими родами. Некоторые из них ещё не имеют названия, а некоторые известны только по отдельным молярам.'),
(4, 'Кошачьи', 'Коша́чьи, или ко́шки, или фели́ды (лат. Felidae), — семейство млекопитающих отряда хищных. Наиболее специализированные из хищников, приспособленные к добыванию животной пищи путём подкрадывания, подкарауливания, реже — преследования.'),
(5, 'Медвежьи', 'Медве́жьи (лат. Ursidae) — семейство млекопитающих отряда хищных. Отличаются от других представителей псообразных более коренастым телосложением. Медведи всеядны, хорошо лазают и плавают, быстро бегают, могут стоять и проходить короткие расстояния на задних лапах. Имеют короткий хвост, длинную и густую шерсть, а также отличное обоняние. Охотятся вечером или на рассвете.  Обычно остерегаются человека, но могут быть опасными в тех местах, где они привыкли к людям, особенно белый медведь и медведь гризли. Мало восприимчивы к пчелиным укусам из-за своей густой шерсти, чувствительны для медведей укусы пчёл в нос. В природе естественных врагов почти не имеют (на юге Дальнего Востока России и в Маньчжурии на них могут нападать взрослые тигры).');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_news`
--

CREATE TABLE `gallery_news` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Новости сайта';

--
-- Дамп данных таблицы `gallery_news`
--

INSERT INTO `gallery_news` (`id`, `title`, `content`, `date`) VALUES
(1, 'Открытие фото-зоопарка', 'Произошло знаменательное событие - в сети открыт доступ для посещения нашего зоопарка', '2021-01-03 07:18:16'),
(2, 'Заселение животных', 'Уже первые девять животных уютно размещены в нашем зоопарке', '2021-01-19 07:18:16'),
(3, 'Поступление волков', 'Семейная парочка лесных хищников обосновалась в наших пенатах', '2021-01-21 07:18:16');

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_reviews`
--

CREATE TABLE `gallery_reviews` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `author` varchar(255) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Отзывы о сайте';

--
-- Дамп данных таблицы `gallery_reviews`
--

INSERT INTO `gallery_reviews` (`id`, `date`, `author`, `text`) VALUES
(1, '2021-01-20 07:18:16', 'Незнакомец', 'Классный зоопарк!'),
(2, '2021-01-21 07:18:16', 'Незнакомка', 'О, боже, как здесь восхитительно'),
(3, '2021-02-08 04:43:40', 'Хакер', 'Стрёмный зверинец. Счас всех выпущу из клеток!'),
(4, '2021-02-10 06:08:25', 'Иван', 'В общем-то ловкие картинки зверушек :)'),
(5, '2021-02-11 06:46:25', 'Петр Иванович', 'Хороший фото-зоопарк');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` smallint(5) NOT NULL COMMENT 'id пользователя',
  `login` varchar(50) NOT NULL COMMENT 'имя пользователя в системе',
  `password` varchar(255) NOT NULL COMMENT 'пароль',
  `description` varchar(255) NOT NULL COMMENT 'описание (полное имя)',
  `address` varchar(255) NOT NULL,
  `email` varchar(60) NOT NULL COMMENT 'e-mail пользователя',
  `role` smallint(5) NOT NULL COMMENT 'роль: 0-админ, 1-обычный юзер',
  `photo` varchar(255) NOT NULL,
  `last_action` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Зарегистрированные пользователи';

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `description`, `address`, `email`, `role`, `photo`, `last_action`) VALUES
(1, 'admin', '$2y$10$vGUe3hEtYt9MdXZc4Jiw1uXnmrtcgx/wMltQ7eASL4iQGZEWyvWxG', 'Администратор системы', 'Главный офис', 'admin@hw.loc', 0, 'img/users/1.jpg', '2022-02-21 07:20:31'),
(2, 'user', '$2y$10$5WQCYfxirR0XhOEIrjOmDO9L0ROGmzo6VeK1gHgrLNsxZVo.9wsNi', 'Покупатель', 'Подсобное помещение офиса', 'customer@hw.loc', 1, 'img/users/2.jpg', '2022-02-21 07:20:53'),
(3, 'ivanov', '$2y$10$x6XG8HiHgESaGS3fUgKKVeB/yWaQahcRO7CzS6X4AQhRQO4qtLZ7S', 'Иванов Иван Иванович', 'Республика Бурятия, с.Кабанск, ул.8 марта, д. 16', 'ivanov@hw.loc', 1, 'img/users/3.jpg', '2022-02-21 07:21:10'),
(4, 'petrov', '$2y$10$.a3D3ksgllG2a/1P97cBpOgFc5/DqmtZeEaR7Y2pt068E0MWLKeTi', 'Петров Петр Петрович', 'г.Нальчик, ул.Норильская 29-18', 'petrov@hw.loc', 1, 'img/users/4.jpeg', '2022-02-21 07:21:49'),
(5, 'sidorov', '$2y$10$i5k3DnUG3ylApzZPdX1INukFfHM6fc6vAwOkBggIKMWSOfsG2DzYm', 'Сидоров Сидор Сидорович', 'Московская обл., г.Пушкино, ул.Колотушкина 67-19', 'sidorov@hw.loc', 1, 'img/users/5.jpg', '2022-02-21 07:22:11'),
(6, 'dmitriev', '$2y$10$h3V9n69HNPrIEwGK8qxBsOCpJPbLoiY8LKG0sQKKiDXYvKSF8477C', 'Дмитриев Дмитрий Дмитриевич', 'г.Оренбург, ул.Н.Петрова 19', 'dmitriev@hw.loc', 1, 'img/users/6.jpg', '2022-02-21 07:22:31'),
(7, 'jetsaus', '$2y$10$E9DtNBXlsIuK.AeJou5kJO0/SIKPFUqarLa55u5AjpQTrA3eB7l2u', 'Колбасин Сергей Петрович.', 'г.Улан-Удэ, ул.Павлова 76-37', 'jetsaus@hw.loc', 0, 'img/users/7.jpg', '2022-02-21 07:22:47'),
(8, 'q', '$2y$10$p6SXRE1R25XzdkEhARv4GOkaUmuuIC8HUHAwu67COJOpHQI3ZqNaC', 'Тестовый юзер', 'Тестовый Адрес юзера', 'luser@hw.ru', 1, 'img/users/8.jpg', '2022-03-06 16:40:17'),
(9, 'z', '$2y$10$vacuKb4q6sDVFenz6FUob.5LHTH4vRlcLpdM01ZRo9b4RDs/jieJK', 'Тестовый админ', 'Адрес админа', 'minda@hw.ru', 0, 'img/users/9.jpg', '2022-03-06 16:40:42');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `baskets`
--
ALTER TABLE `baskets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`,`productid`);

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userid` (`userid`,`productid`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery_category`
--
ALTER TABLE `gallery_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery_news`
--
ALTER TABLE `gallery_news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gallery_reviews`
--
ALTER TABLE `gallery_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `baskets`
--
ALTER TABLE `baskets`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT 'id записи корзины', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT 'id записи корзины', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id товара', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `gallery_category`
--
ALTER TABLE `gallery_category`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gallery_news`
--
ALTER TABLE `gallery_news`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gallery_reviews`
--
ALTER TABLE `gallery_reviews`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT COMMENT 'id пользователя', AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
