-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 21 2014 г., 15:15
-- Версия сервера: 5.1.73
-- Версия PHP: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `feeling`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `image_id` bigint(20) DEFAULT NULL,
  `sort` bigint(20) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `category_id` bigint(20) DEFAULT NULL,
  `is_on_main` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_category_id_idx` (`category_id`),
  KEY `category_image_id_idx` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`, `description`, `image_id`, `sort`, `is_active`, `category_id`, `is_on_main`) VALUES
(1, 'sfghnsgh', 'sfghsfghsg sgh sgh sfgh sgh sgh sghsgfhsgh', 6, 1, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `dm_area`
--

CREATE TABLE IF NOT EXISTS `dm_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  `dm_page_view_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'content',
  PRIMARY KEY (`id`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  KEY `dm_page_view_id_idx` (`dm_page_view_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `dm_area`
--

INSERT INTO `dm_area` (`id`, `dm_layout_id`, `dm_page_view_id`, `type`) VALUES
(1, 1, NULL, 'top'),
(2, 1, NULL, 'bottom'),
(3, 1, NULL, 'left'),
(4, 1, NULL, 'right'),
(5, NULL, 1, 'content'),
(6, NULL, 2, 'content'),
(7, NULL, 3, 'content'),
(8, NULL, 4, 'content'),
(9, NULL, 5, 'content'),
(10, NULL, 6, 'content'),
(11, NULL, 7, 'content'),
(12, NULL, 8, 'content');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_auto_seo`
--

CREATE TABLE IF NOT EXISTS `dm_auto_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmAutoSeoModuleAction_idx` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `dm_auto_seo`
--

INSERT INTO `dm_auto_seo` (`id`, `module`, `action`, `created_at`, `updated_at`) VALUES
(1, 'category', 'show', '2014-05-21 13:22:29', '2014-05-21 13:22:29');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_auto_seo_translation`
--

CREATE TABLE IF NOT EXISTS `dm_auto_seo_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strip_words` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `dm_auto_seo_translation`
--

INSERT INTO `dm_auto_seo_translation` (`id`, `slug`, `name`, `title`, `h1`, `description`, `keywords`, `strip_words`, `lang`) VALUES
(1, '%category.title%', '%category.title%', '%category.title%', NULL, '%category.description%', NULL, NULL, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_catalogue`
--

CREATE TABLE IF NOT EXISTS `dm_catalogue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `dm_catalogue`
--

INSERT INTO `dm_catalogue` (`id`, `name`, `source_lang`, `target_lang`) VALUES
(1, 'messages.ru', 'en', 'ru'),
(2, 'dm.ru', 'en', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_error`
--

CREATE TABLE IF NOT EXISTS `dm_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `klass` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `module` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `env` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `dm_error`
--

INSERT INTO `dm_error` (`id`, `klass`, `name`, `description`, `module`, `action`, `uri`, `env`, `created_at`) VALUES
(1, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''field list''. Failing Query: "SELECT s.id AS s__id, s.image_id AS s__image_id, s.is_active AS s__is_active, d.id AS d__id, d.dm_media_folder_id AS d__dm_media_folder_id, d.file AS d__', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''field list''. Failing Query: "SELECT s.id AS s__id, s.image_id AS s__image_id, s.is_active AS s__is_active, d.id AS d__id, d.dm_media_folder_id AS d__dm_media_folder_id, d.file AS d__file, d.legend AS d__legend, d.author AS d__author, d.license AS d__license, d.mime AS d__mime, d.size AS d__size, d.dimensions AS d__dimensions, d.created_at AS d__created_at, d.updated_at AS d__updated_at, d2.id AS d2__id, d2.rel_path AS d2__rel_path, d2.lft AS d2__lft, d2.rgt AS d2__rgt, d2.level AS d2__level FROM slider s LEFT JOIN dm_media d ON s.image_id = d.id LEFT JOIN dm_media_folder d2 ON d.dm_media_folder_id = d2.id ORDER BY s.id asc LIMIT 10"\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), ''SELECT s.id AS ...'')\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(''SELECT s.id AS ...'', Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(186): Doctrine_Query_Abstract->execute(Array, NULL)\n#4 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#5 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoSlider/templates/_list.php(19): dmDoctrinePager->getResults()\n#6 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#7 /var/www/winder84/data/www/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(''/var/www/winder...'')\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(''slider/list'', Array)\n#10 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoSlider/templates/indexSuccess.php(47): include_partial(''slider/list'', Array)\n#11 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#12 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3866): sfPHPView->renderFile(''/var/www/winder...'')\n#13 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(973): sfPHPView->render()\n#14 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(960): sfExecutionFilter->executeView(''slider'', ''index'', ''Success'', Array)\n#15 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleView(Object(sfFilterChain), Object(sliderActions), ''Success'')\n#16 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfExecutionFilter->execute(Object(sfFilterChain))\n#17 /var/www/winder84/data/www/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#18 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfCacheFilter->execute(Object(sfFilterChain))\n#19 /var/www/winder84/data/www/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /var/www/winder84/data/www/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(989): sfFilterChain->execute()\n#26 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(659): sfFilterChain->execute()\n#28 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(2341): sfController->forward(''slider'', ''index'')\n#29 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /var/www/winder84/data/www/feeling-style.ru/www/admin.php(7): dmContext->dispatch()\n#31 {main}', 'slider', 'index', 'http://feeling-style.ru/admin.php/content/global/sliders/index', 'prod', '2014-05-21 09:55:22'),
(2, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''field list''. Failing Query: "SELECT s.id AS s__id, s.image_id AS s__image_id, s.is_active AS s__is_active, d.id AS d__id, d.dm_media_folder_id AS d__dm_media_folder_id, d.file AS d__', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''field list''. Failing Query: "SELECT s.id AS s__id, s.image_id AS s__image_id, s.is_active AS s__is_active, d.id AS d__id, d.dm_media_folder_id AS d__dm_media_folder_id, d.file AS d__file, d.legend AS d__legend, d.author AS d__author, d.license AS d__license, d.mime AS d__mime, d.size AS d__size, d.dimensions AS d__dimensions, d.created_at AS d__created_at, d.updated_at AS d__updated_at, d2.id AS d2__id, d2.rel_path AS d2__rel_path, d2.lft AS d2__lft, d2.rgt AS d2__rgt, d2.level AS d2__level FROM slider s LEFT JOIN dm_media d ON s.image_id = d.id LEFT JOIN dm_media_folder d2 ON d.dm_media_folder_id = d2.id ORDER BY s.id asc LIMIT 10"\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), ''SELECT s.id AS ...'')\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(''SELECT s.id AS ...'', Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(186): Doctrine_Query_Abstract->execute(Array, NULL)\n#4 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#5 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoSlider/templates/_list.php(19): dmDoctrinePager->getResults()\n#6 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#7 /var/www/winder84/data/www/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(''/var/www/winder...'')\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(''slider/list'', Array)\n#10 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoSlider/templates/indexSuccess.php(47): include_partial(''slider/list'', Array)\n#11 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#12 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3866): sfPHPView->renderFile(''/var/www/winder...'')\n#13 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(973): sfPHPView->render()\n#14 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(960): sfExecutionFilter->executeView(''slider'', ''index'', ''Success'', Array)\n#15 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleView(Object(sfFilterChain), Object(sliderActions), ''Success'')\n#16 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfExecutionFilter->execute(Object(sfFilterChain))\n#17 /var/www/winder84/data/www/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#18 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfCacheFilter->execute(Object(sfFilterChain))\n#19 /var/www/winder84/data/www/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /var/www/winder84/data/www/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(989): sfFilterChain->execute()\n#26 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(659): sfFilterChain->execute()\n#28 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(2341): sfController->forward(''slider'', ''index'')\n#29 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /var/www/winder84/data/www/feeling-style.ru/www/admin.php(7): dmContext->dispatch()\n#31 {main}', 'slider', 'index', 'http://feeling-style.ru/admin.php/content/global/sliders/index', 'prod', '2014-05-21 09:55:35'),
(3, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''field list''. Failing Query: "SELECT s.id AS s__id, s.image_id AS s__image_id, s.is_active AS s__is_active, d.id AS d__id, d.dm_media_folder_id AS d__dm_media_folder_id, d.file AS d__', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''field list''. Failing Query: "SELECT s.id AS s__id, s.image_id AS s__image_id, s.is_active AS s__is_active, d.id AS d__id, d.dm_media_folder_id AS d__dm_media_folder_id, d.file AS d__file, d.legend AS d__legend, d.author AS d__author, d.license AS d__license, d.mime AS d__mime, d.size AS d__size, d.dimensions AS d__dimensions, d.created_at AS d__created_at, d.updated_at AS d__updated_at, d2.id AS d2__id, d2.rel_path AS d2__rel_path, d2.lft AS d2__lft, d2.rgt AS d2__rgt, d2.level AS d2__level FROM slider s LEFT JOIN dm_media d ON s.image_id = d.id LEFT JOIN dm_media_folder d2 ON d.dm_media_folder_id = d2.id ORDER BY s.id asc LIMIT 10"\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), ''SELECT s.id AS ...'')\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(''SELECT s.id AS ...'', Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(186): Doctrine_Query_Abstract->execute(Array, NULL)\n#4 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#5 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoSlider/templates/_list.php(19): dmDoctrinePager->getResults()\n#6 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#7 /var/www/winder84/data/www/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(''/var/www/winder...'')\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(''slider/list'', Array)\n#10 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoSlider/templates/indexSuccess.php(47): include_partial(''slider/list'', Array)\n#11 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#12 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3866): sfPHPView->renderFile(''/var/www/winder...'')\n#13 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(973): sfPHPView->render()\n#14 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(960): sfExecutionFilter->executeView(''slider'', ''index'', ''Success'', Array)\n#15 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleView(Object(sfFilterChain), Object(sliderActions), ''Success'')\n#16 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfExecutionFilter->execute(Object(sfFilterChain))\n#17 /var/www/winder84/data/www/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#18 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfCacheFilter->execute(Object(sfFilterChain))\n#19 /var/www/winder84/data/www/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /var/www/winder84/data/www/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(989): sfFilterChain->execute()\n#26 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(659): sfFilterChain->execute()\n#28 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(2341): sfController->forward(''slider'', ''index'')\n#29 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /var/www/winder84/data/www/feeling-style.ru/www/admin.php(7): dmContext->dispatch()\n#31 {main}', 'slider', 'index', 'http://feeling-style.ru/admin.php/content/global/sliders/index', 'prod', '2014-05-21 09:55:45'),
(4, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''m.is_active'' in ''field list''. Failing Query: "SELECT m.id AS m__id, m.title AS m__title, m.description AS m__description, m.is_active AS m__is_active FROM maincentertexts m ORDER BY m.title asc LIMIT', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''m.is_active'' in ''field list''. Failing Query: "SELECT m.id AS m__id, m.title AS m__title, m.description AS m__description, m.is_active AS m__is_active FROM maincentertexts m ORDER BY m.title asc LIMIT 10"\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), ''SELECT m.id AS ...'')\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(''SELECT m.id AS ...'', Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(186): Doctrine_Query_Abstract->execute(Array, NULL)\n#4 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#5 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoMaincentertexts/templates/_list.php(19): dmDoctrinePager->getResults()\n#6 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#7 /var/www/winder84/data/www/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(''/var/www/winder...'')\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(''maincentertexts...'', Array)\n#10 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoMaincentertexts/templates/indexSuccess.php(47): include_partial(''maincentertexts...'', Array)\n#11 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#12 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3866): sfPHPView->renderFile(''/var/www/winder...'')\n#13 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(973): sfPHPView->render()\n#14 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(960): sfExecutionFilter->executeView(''maincentertexts'', ''index'', ''Success'', Array)\n#15 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleView(Object(sfFilterChain), Object(maincentertextsActions), ''Success'')\n#16 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfExecutionFilter->execute(Object(sfFilterChain))\n#17 /var/www/winder84/data/www/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#18 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfCacheFilter->execute(Object(sfFilterChain))\n#19 /var/www/winder84/data/www/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /var/www/winder84/data/www/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(989): sfFilterChain->execute()\n#26 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(659): sfFilterChain->execute()\n#28 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(2341): sfController->forward(''maincentertexts'', ''index'')\n#29 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /var/www/winder84/data/www/feeling-style.ru/www/admin.php(7): dmContext->dispatch()\n#31 {main}', 'maincentertexts', 'index', 'http://feeling-style.ru/admin.php/content/global/tekstyi-v-tsentre-na-glavnoy/index', 'prod', '2014-05-21 10:27:18'),
(5, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''where clause''', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''s.is_active'' in ''where clause''\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection/Statement.php(269): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Statement))\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1006): Doctrine_Connection_Statement->execute(Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(800): Doctrine_Connection->execute(''SELECT COUNT(*)...'', Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query.php(2112): Doctrine_Connection->fetchAll(''SELECT COUNT(*)...'', Array)\n#4 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(99): Doctrine_Query->count()\n#5 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(43): sfDoctrinePager->init()\n#6 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/action/base/dmFrontModuleComponents.php(134): dmDoctrinePager->init()\n#7 /var/www/winder84/data/www/feeling-style.ru/apps/front/modules/slider/actions/components.class.php(22): dmFrontModuleComponents->getPager(Object(myDoctrineQuery))\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(386): sliderComponents->executeList(Object(dmWebRequest))\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(148): _call_component(''slider'', ''list'', Array)\n#10 /var/www/winder84/data/www/diem/dmCorePlugin/lib/view/dmHelper.php(52): get_component(''slider'', ''list'', Array)\n#11 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/dmWidget/base/dmWidgetBaseView.php(150): dmHelper->renderComponent(''slider'', ''list'', Array)\n#12 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/dmWidget/base/dmWidgetBaseView.php(141): dmWidgetBaseView->doRenderPartial(Array)\n#13 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/dmWidget/base/dmWidgetBaseView.php(120): dmWidgetBaseView->renderPartial(Array)\n#14 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/dmWidget/base/dmWidgetBaseView.php(108): dmWidgetBaseView->doRender()\n#15 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/widget/dmFrontWidgetRenderer.php(71): dmWidgetBaseView->render()\n#16 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/widget/dmFrontWidgetRenderer.php(43): dmFrontWidgetRenderer->doRender()\n#17 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/page/dmFrontPageBaseHelper.php(301): dmFrontWidgetRenderer->getHtml()\n#18 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/page/dmFrontPageEditHelper.php(129): dmFrontPageBaseHelper->renderWidgetInner(Array)\n#19 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/page/dmFrontPageBaseHelper.php(254): dmFrontPageEditHelper->renderWidget(Array)\n#20 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/page/dmFrontPageEditHelper.php(36): dmFrontPageBaseHelper->renderZoneInner(Array)\n#21 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/page/dmFrontPageBaseHelper.php(197): dmFrontPageEditHelper->renderZone(Array)\n#22 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/view/html/page/dmFrontPageBaseHelper.php(172): dmFrontPageBaseHelper->renderAreaInner(Array)\n#23 /var/www/winder84/data/www/feeling-style.ru/apps/front/modules/dmFront/templates/pageSuccess.php(20): dmFrontPageBaseHelper->renderArea(''content'')\n#24 /var/www/winder84/data/www/diem/symfony/lib/view/sfPHPView.class.php(75): require(''/var/www/winder...'')\n#25 /var/www/winder84/data/www/diem/symfony/lib/view/sfPHPView.class.php(179): sfPHPView->renderFile(''/var/www/winder...'')\n#26 /var/www/winder84/data/www/diem/symfony/lib/filter/sfExecutionFilter.class.php(155): sfPHPView->render()\n#27 /var/www/winder84/data/www/diem/symfony/lib/filter/sfExecutionFilter.class.php(116): sfExecutionFilter->executeView(''dmFront'', ''page'', ''Success'', Array)\n#28 /var/www/winder84/data/www/diem/symfony/lib/filter/sfExecutionFilter.class.php(47): sfExecutionFilter->handleView(Object(sfFilterChain), Object(dmFrontActions), ''Success'')\n#29 /var/www/winder84/data/www/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfExecutionFilter->execute(Object(sfFilterChain))\n#30 /var/www/winder84/data/www/diem/dmFrontPlugin/lib/filter/dmFrontInitFilter.php(34): sfFilterChain->execute()\n#31 /var/www/winder84/data/www/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmFrontInitFilter->execute(Object(sfFilterChain))\n#32 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#33 /var/www/winder84/data/www/diem/symfony/lib/filter/sfFilterChain.class.php(53): dmRememberMeFilter->execute(Object(sfFilterChain))\n#34 /var/www/winder84/data/www/diem/symfony/lib/filter/sfRenderingFilter.class.php(33): sfFilterChain->execute()\n#35 /var/www/winder84/data/www/diem/symfony/lib/filter/sfFilterChain.class.php(53): sfRenderingFilter->execute(Object(sfFilterChain))\n#36 /var/www/winder84/data/www/diem/symfony/lib/controller/sfController.class.php(230): sfFilterChain->execute()\n#37 /var/www/winder84/data/www/diem/symfony/lib/controller/sfFrontWebController.class.php(48): sfController->forward(''dmFront'', ''page'')\n#38 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#39 /var/www/winder84/data/www/feeling-style.ru/www/dev.php(7): dmContext->dispatch()\n#40 {main}', 'dmFront', 'page', 'http://feeling-style.ru/dev.php?dm_debug=1', 'dev', '2014-05-21 10:29:05'),
(6, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''m.description'' in ''field list''. Failing Query: "SELECT m.id AS m__id, m.title AS m__title, m.description AS m__description FROM maincentertexts m ORDER BY m.title asc LIMIT 10"', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''m.description'' in ''field list''. Failing Query: "SELECT m.id AS m__id, m.title AS m__title, m.description AS m__description FROM maincentertexts m ORDER BY m.title asc LIMIT 10"\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), ''SELECT m.id AS ...'')\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(''SELECT m.id AS ...'', Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(186): Doctrine_Query_Abstract->execute(Array, NULL)\n#4 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#5 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoMaincentertexts/templates/_list.php(19): dmDoctrinePager->getResults()\n#6 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#7 /var/www/winder84/data/www/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(''/var/www/winder...'')\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(''maincentertexts...'', Array)\n#10 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoMaincentertexts/templates/indexSuccess.php(47): include_partial(''maincentertexts...'', Array)\n#11 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#12 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3866): sfPHPView->renderFile(''/var/www/winder...'')\n#13 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(973): sfPHPView->render()\n#14 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(960): sfExecutionFilter->executeView(''maincentertexts'', ''index'', ''Success'', Array)\n#15 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleView(Object(sfFilterChain), Object(maincentertextsActions), ''Success'')\n#16 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfExecutionFilter->execute(Object(sfFilterChain))\n#17 /var/www/winder84/data/www/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#18 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfCacheFilter->execute(Object(sfFilterChain))\n#19 /var/www/winder84/data/www/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /var/www/winder84/data/www/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(989): sfFilterChain->execute()\n#26 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(659): sfFilterChain->execute()\n#28 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(2341): sfController->forward(''maincentertexts'', ''index'')\n#29 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /var/www/winder84/data/www/feeling-style.ru/www/admin.php(7): dmContext->dispatch()\n#31 {main}', 'maincentertexts', 'index', 'http://feeling-style.ru/admin.php/content/global/tekstyi-v-tsentre-na-glavnoy/index', 'prod', '2014-05-21 10:30:42'),
(7, 'Doctrine_Connection_Mysql_Exception', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''m.description'' in ''field list''. Failing Query: "SELECT m.id AS m__id, m.title AS m__title, m.description AS m__description FROM maincentertexts m ORDER BY m.title asc LIMIT 10"', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''m.description'' in ''field list''. Failing Query: "SELECT m.id AS m__id, m.title AS m__title, m.description AS m__description FROM maincentertexts m ORDER BY m.title asc LIMIT 10"\n#0 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Connection.php(1025): Doctrine_Connection->rethrowException(Object(PDOException), Object(Doctrine_Connection_Mysql), ''SELECT m.id AS ...'')\n#1 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(976): Doctrine_Connection->execute(''SELECT m.id AS ...'', Array)\n#2 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/vendor/doctrine/Doctrine/Query/Abstract.php(1026): Doctrine_Query_Abstract->_execute(Array)\n#3 /var/www/winder84/data/www/diem/symfony/lib/plugins/sfDoctrinePlugin/lib/pager/sfDoctrinePager.class.php(186): Doctrine_Query_Abstract->execute(Array, NULL)\n#4 /var/www/winder84/data/www/diem/dmCorePlugin/lib/doctrine/pager/dmDoctrinePager.php(59): sfDoctrinePager->getResults(NULL)\n#5 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoMaincentertexts/templates/_list.php(19): dmDoctrinePager->getResults()\n#6 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#7 /var/www/winder84/data/www/diem/symfony/lib/view/sfPartialView.class.php(110): sfPHPView->renderFile(''/var/www/winder...'')\n#8 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(218): sfPartialView->render()\n#9 /var/www/winder84/data/www/diem/symfony/lib/helper/PartialHelper.php(180): get_partial(''maincentertexts...'', Array)\n#10 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/modules/autoMaincentertexts/templates/indexSuccess.php(47): include_partial(''maincentertexts...'', Array)\n#11 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3811): require(''/var/www/winder...'')\n#12 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(3866): sfPHPView->renderFile(''/var/www/winder...'')\n#13 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(973): sfPHPView->render()\n#14 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(960): sfExecutionFilter->executeView(''maincentertexts'', ''index'', ''Success'', Array)\n#15 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(928): sfExecutionFilter->handleView(Object(sfFilterChain), Object(maincentertextsActions), ''Success'')\n#16 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfExecutionFilter->execute(Object(sfFilterChain))\n#17 /var/www/winder84/data/www/diem/symfony/lib/filter/sfCacheFilter.class.php(65): sfFilterChain->execute()\n#18 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfCacheFilter->execute(Object(sfFilterChain))\n#19 /var/www/winder84/data/www/diem/dmAdminPlugin/lib/filter/dmAdminInitFilter.php(32): sfFilterChain->execute()\n#20 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmAdminInitFilter->execute(Object(sfFilterChain))\n#21 /var/www/winder84/data/www/diem/symfony/lib/filter/sfBasicSecurityFilter.class.php(72): sfFilterChain->execute()\n#22 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfBasicSecurityFilter->execute(Object(sfFilterChain))\n#23 /var/www/winder84/data/www/diem/dmCorePlugin/plugins/dmUserPlugin/lib/dmRememberMeFilter.class.php(56): sfFilterChain->execute()\n#24 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): dmRememberMeFilter->execute(Object(sfFilterChain))\n#25 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(989): sfFilterChain->execute()\n#26 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(1022): sfRenderingFilter->execute(Object(sfFilterChain))\n#27 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(659): sfFilterChain->execute()\n#28 /var/www/winder84/data/www/feeling-style.ru/cache/admin/prod/config/config_core_compile.yml.php(2341): sfController->forward(''maincentertexts'', ''index'')\n#29 /var/www/winder84/data/www/diem/dmCorePlugin/lib/context/dmContext.php(280): sfFrontWebController->dispatch()\n#30 /var/www/winder84/data/www/feeling-style.ru/www/admin.php(7): dmContext->dispatch()\n#31 {main}', 'maincentertexts', 'index', 'http://feeling-style.ru/admin.php/content/global/tekstyi-v-tsentre-na-glavnoy/index', 'prod', '2014-05-21 10:30:48');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_group`
--

CREATE TABLE IF NOT EXISTS `dm_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `dm_group`
--

INSERT INTO `dm_group` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'developer', 'Able to read and update source code', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(2, 'seo', 'Seo knowledge', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(3, 'integrator', 'Integrator', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(4, 'webmaster 1', 'Webmaster level 1', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(5, 'writer', 'Writer', '2014-05-20 09:39:39', '2014-05-20 09:39:39'),
(6, 'front_editor', 'Can fast edit front widgets', '2014-05-20 09:39:39', '2014-05-20 09:39:39');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_group_permission`
--

CREATE TABLE IF NOT EXISTS `dm_group_permission` (
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_group_id`,`dm_permission_id`),
  KEY `dm_group_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `dm_group_permission`
--

INSERT INTO `dm_group_permission` (`dm_group_id`, `dm_permission_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(3, 5),
(3, 9),
(4, 9),
(5, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 20),
(6, 21),
(6, 22),
(3, 23),
(3, 24),
(3, 25),
(2, 26),
(3, 26),
(4, 26),
(5, 26),
(3, 27),
(4, 27),
(5, 27),
(3, 28),
(2, 29),
(3, 29),
(4, 29),
(5, 29),
(2, 30),
(3, 30),
(4, 30),
(3, 31),
(4, 31),
(2, 32),
(3, 32),
(4, 32),
(2, 33),
(3, 33),
(4, 33),
(5, 33),
(3, 34),
(3, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(4, 46),
(2, 47),
(3, 47),
(4, 47),
(5, 47),
(2, 48),
(3, 48),
(4, 48),
(5, 48),
(2, 51),
(3, 51),
(4, 51),
(3, 52),
(4, 52),
(3, 53),
(3, 57);

-- --------------------------------------------------------

--
-- Структура таблицы `dm_layout`
--

CREATE TABLE IF NOT EXISTS `dm_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'page',
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `dm_layout`
--

INSERT INTO `dm_layout` (`id`, `name`, `template`, `css_class`) VALUES
(1, 'Global', 'page', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `dm_lock`
--

CREATE TABLE IF NOT EXISTS `dm_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `time` bigint(20) NOT NULL,
  `app` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `culture` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmLockIndex_idx` (`user_id`,`module`,`action`,`record_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=60 ;

--
-- Дамп данных таблицы `dm_lock`
--

INSERT INTO `dm_lock` (`id`, `user_id`, `user_name`, `module`, `action`, `record_id`, `time`, `app`, `url`, `culture`) VALUES
(55, 1, 'admin', 'dmAdmin', 'index', 0, 1400670913, 'admin', '/admin.php/', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_mail_template`
--

CREATE TABLE IF NOT EXISTS `dm_mail_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vars` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `dm_mail_template_translation`
--

CREATE TABLE IF NOT EXISTS `dm_mail_template_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `title` text COLLATE utf8_unicode_ci,
  `body` longtext COLLATE utf8_unicode_ci,
  `from_email` text COLLATE utf8_unicode_ci,
  `to_email` text COLLATE utf8_unicode_ci,
  `is_html` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dm_media`
--

CREATE TABLE IF NOT EXISTS `dm_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_media_folder_id` bigint(20) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `legend` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `dimensions` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folderFile_idx` (`dm_media_folder_id`,`file`),
  KEY `dm_media_folder_id_idx` (`dm_media_folder_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `dm_media`
--

INSERT INTO `dm_media` (`id`, `dm_media_folder_id`, `file`, `legend`, `author`, `license`, `mime`, `size`, `dimensions`, `created_at`, `updated_at`) VALUES
(1, 3, 'slider1.png', '', '', '', 'image/png', 821327, '959x432', '2014-05-20 19:44:20', '2014-05-20 19:44:20'),
(2, 3, 'slider1_1.png', '', '', '', 'image/png', 821327, '959x432', '2014-05-20 20:17:09', '2014-05-20 20:17:09'),
(3, 3, 'slider1_2.png', '', '', '', 'image/png', 821327, '959x432', '2014-05-20 23:25:45', '2014-05-20 23:26:00'),
(4, 3, 'slider1_3.png', '', '', '', 'image/png', 821327, '959x432', '2014-05-20 23:25:53', '2014-05-20 23:26:00'),
(5, 3, 'slider1_4.png', '', '', '', 'image/png', 821327, '959x432', '2014-05-20 23:26:00', '2014-05-20 23:26:00'),
(6, 4, 'dDHFtJOFTtg.jpg', '', '', '', 'image/jpeg', 39442, '415x604', '2014-05-21 13:25:44', '2014-05-21 13:25:44');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_media_folder`
--

CREATE TABLE IF NOT EXISTS `dm_media_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rel_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel_path` (`rel_path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `dm_media_folder`
--

INSERT INTO `dm_media_folder` (`id`, `rel_path`, `lft`, `rgt`, `level`) VALUES
(1, '', 1, 8, 0),
(2, 'assets', 2, 3, 1),
(3, 'slider', 4, 5, 1),
(4, 'category', 6, 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dm_page`
--

CREATE TABLE IF NOT EXISTS `dm_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordModuleAction_idx` (`module`,`action`,`record_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `dm_page`
--

INSERT INTO `dm_page` (`id`, `module`, `action`, `record_id`, `credentials`, `lft`, `rgt`, `level`) VALUES
(1, 'main', 'root', 0, '', 1, 16, 0),
(2, 'main', 'error404', 0, NULL, 4, 5, 1),
(3, 'main', 'signin', 0, NULL, 2, 3, 1),
(4, 'main', 'portfolio', 0, NULL, 6, 7, 1),
(5, 'main', 'materialyi', 0, NULL, 8, 9, 1),
(6, 'main', 'kontaktyi', 0, NULL, 10, 11, 1),
(7, 'category', 'list', 0, NULL, 12, 15, 1),
(8, 'category', 'show', 1, NULL, 13, 14, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `dm_page_translation`
--

CREATE TABLE IF NOT EXISTS `dm_page_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_mod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'snthdk',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_indexable` tinyint(1) NOT NULL DEFAULT '1',
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `dm_page_translation`
--

INSERT INTO `dm_page_translation` (`id`, `slug`, `name`, `title`, `h1`, `description`, `keywords`, `auto_mod`, `is_active`, `is_secure`, `is_indexable`, `lang`) VALUES
(1, '', 'Home', 'О нас', '', '', '', 'snthdk', 1, 0, 1, 'ru'),
(2, 'error404', 'Page not found', 'Page not found', NULL, NULL, NULL, 'snthdk', 1, 0, 1, 'ru'),
(3, 'security/signin', 'Signin', 'Signin', NULL, NULL, NULL, 'snthdk', 1, 0, 1, 'ru'),
(4, 'portfolio', 'Портфолио', 'Портфолио', NULL, NULL, NULL, 'snthdk', 1, 0, 1, 'ru'),
(5, 'materialyi', 'Материалы', 'Материалы', NULL, NULL, NULL, 'snthdk', 1, 0, 1, 'ru'),
(6, 'kontaktyi', 'Контакты', 'Контакты', NULL, NULL, NULL, 'snthdk', 1, 0, 1, 'ru'),
(7, 'kategorii', 'Категории', 'Категории', NULL, 'Категории', NULL, 'snthdk', 1, 0, 1, 'ru'),
(8, 'kategorii/sfghnsgh', 'sfghnsgh', 'Sfghnsgh', NULL, 'sfghsfghsg sgh sgh sfgh sgh sgh sghsgfhsgh', NULL, 'snthdk', 1, 0, 1, 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_page_view`
--

CREATE TABLE IF NOT EXISTS `dm_page_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmPageViewModuleAction_idx` (`module`,`action`),
  KEY `dm_layout_id_idx` (`dm_layout_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `dm_page_view`
--

INSERT INTO `dm_page_view` (`id`, `module`, `action`, `dm_layout_id`) VALUES
(1, 'main', 'root', 1),
(2, 'main', 'error404', 1),
(3, 'main', 'signin', 1),
(4, 'main', 'portfolio', 1),
(5, 'main', 'materialyi', 1),
(6, 'main', 'kontaktyi', 1),
(7, 'category', 'list', 1),
(8, 'category', 'show', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `dm_permission`
--

CREATE TABLE IF NOT EXISTS `dm_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=58 ;

--
-- Дамп данных таблицы `dm_permission`
--

INSERT INTO `dm_permission` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'system', 'System administrator', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(2, 'admin', 'Log into administration', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(3, 'clear_cache', 'Clear the cache', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(4, 'log', 'Manage logs', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(5, 'code_editor', 'Use admin and front code editors', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(6, 'security_user', 'Manage security users', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(7, 'security_permission', 'Manage security permissions', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(8, 'security_group', 'Manage security groups', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(9, 'content', 'CRUD dynamic content in admin', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(10, 'zone_add', 'Add zones', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(11, 'zone_edit', 'Edit zones', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(12, 'zone_delete', 'Delete zones', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(13, 'widget_add', 'Add widgets', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(14, 'widget_edit', 'Edit widgets', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(15, 'widget_delete', 'Delete widgets', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(16, 'widget_edit_fast', 'Can fast edit widgets', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(17, 'widget_edit_fast_record', 'Fast edit widget record', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(18, 'widget_edit_fast_content_title', 'Fast edit widget content title', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(19, 'widget_edit_fast_content_link', 'Fast edit widget content link', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(20, 'widget_edit_fast_content_image', 'Fast edit widget content image', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(21, 'widget_edit_fast_content_text', 'Fast edit widget content text', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(22, 'widget_edit_fast_navigation_menu', 'Fast edit widget navigation menu', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(23, 'page_add', 'Add pages', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(24, 'page_edit', 'Edit pages', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(25, 'page_delete', 'Delete pages', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(26, 'page_bar_admin', 'See page bar in admin', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(27, 'media_bar_admin', 'See media bar in admin', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(28, 'media_library', 'Use media library in admin', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(29, 'tool_bar_admin', 'See toolbar in admin', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(30, 'page_bar_front', 'See page bar in front', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(31, 'media_bar_front', 'See media bar in front', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(32, 'tool_bar_front', 'See toolbar in front', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(33, 'site_view', 'See non-public website and inactive pages', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(34, 'loremize', 'Create automatic random content', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(35, 'export_table', 'Export table contents', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(36, 'sitemap', 'Regenerate sitemap', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(37, 'automatic_metas', 'Configure automatic pages metas', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(38, 'manual_metas', 'Configure manually pages metas', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(39, 'manage_pages', 'Move and sort pages', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(40, 'url_redirection', 'Configure url redirections', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(41, 'use_google_analytics', 'Use google analytics', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(42, 'google_analytics', 'Configure google analytics', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(43, 'use_google_webmaster_tools', 'Use google webmaster tools', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(44, 'google_webmaster_tools', 'Configure google webmaster tools', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(45, 'xiti', 'Configure Xiti', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(46, 'search_engine', 'Manage internal search engine', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(47, 'see_log', 'See the logs', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(48, 'see_chart', 'See the charts', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(49, 'see_diagrams', 'See the developer diagrams', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(50, 'see_server', 'See the server infos', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(51, 'config_panel', 'Use the configuration panel', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(52, 'translation', 'Use the translation interface', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(53, 'layout', 'Use the layout interface', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(54, 'sent_mail', 'See mails sent by server', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(55, 'mail_template', 'Configure mail templates', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(56, 'error_log', 'See error log', '2014-05-20 09:39:38', '2014-05-20 09:39:38'),
(57, 'interface_settings', 'Manage interface settings like default image resize method', '2014-05-20 09:39:38', '2014-05-20 09:39:38');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_redirect`
--

CREATE TABLE IF NOT EXISTS `dm_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dest` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `dm_remember_key`
--

CREATE TABLE IF NOT EXISTS `dm_remember_key` (
  `dm_user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`ip_address`),
  KEY `dm_user_id_idx` (`dm_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `dm_remember_key`
--

INSERT INTO `dm_remember_key` (`dm_user_id`, `remember_key`, `ip_address`, `created_at`) VALUES
(1, 'feab9ae37ee3a96218c433053bd0ca2a', '89.249.20.142', '2014-05-21 14:15:33');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_sent_mail`
--

CREATE TABLE IF NOT EXISTS `dm_sent_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `dm_setting`
--

CREATE TABLE IF NOT EXISTS `dm_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `params` text COLLATE utf8_unicode_ci,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `dm_setting`
--

INSERT INTO `dm_setting` (`id`, `name`, `type`, `params`, `group_name`, `credentials`) VALUES
(1, 'site_name', 'text', NULL, 'site', NULL),
(2, 'site_active', 'boolean', NULL, 'site', NULL),
(3, 'site_indexable', 'boolean', '', 'site', ''),
(4, 'site_working_copy', 'boolean', NULL, 'site', NULL),
(5, 'ga_key', 'text', NULL, 'tracking', 'google_analytics'),
(6, 'ga_token', 'text', NULL, 'internal', 'google_analytics'),
(7, 'gwt_key', 'text', NULL, 'tracking', 'google_webmaster_tools'),
(8, 'xiti_code', 'textarea', NULL, 'tracking', 'xiti'),
(9, 'search_stop_words', 'textarea', NULL, 'search engine', 'search_engine'),
(10, 'base_urls', 'textarea', NULL, 'internal', 'system'),
(11, 'image_resize_method', 'select', 'fit=Fit scale=Scale inflate=Inflate top=Top right=Right left=Left bottom=Bottom center=Center', 'interface', 'interface_settings'),
(12, 'image_resize_quality', 'number', NULL, 'interface', 'interface_settings'),
(13, 'link_external_blank', 'boolean', NULL, 'interface', 'interface_settings'),
(14, 'link_current_span', 'boolean', NULL, 'interface', 'interface_settings'),
(15, 'link_use_page_title', 'boolean', NULL, 'interface', 'interface_settings'),
(16, 'title_prefix', 'text', NULL, 'seo', 'manual_metas'),
(17, 'title_suffix', 'text', NULL, 'seo', 'manual_metas'),
(18, 'smart_404', 'boolean', NULL, 'seo', 'url_redirection');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_setting_translation`
--

CREATE TABLE IF NOT EXISTS `dm_setting_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `default_value` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `dm_setting_translation`
--

INSERT INTO `dm_setting_translation` (`id`, `description`, `value`, `default_value`, `lang`) VALUES
(1, 'The site name', 'Feeling-style.ru', 'Feeling-style.ru', 'ru'),
(2, 'Is the site ready for visitors ?', '1', '1', 'ru'),
(3, 'Is the site ready for search engine crawlers ?', '1', '0', 'ru'),
(4, 'Is this site the current working copy ?', '1', '1', 'ru'),
(5, 'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )', NULL, '', 'ru'),
(6, 'Auth token gor Google Analytics, computed from password', NULL, '', 'ru'),
(7, 'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )', NULL, '', 'ru'),
(8, 'The xiti html code', NULL, '', 'ru'),
(9, 'Words to exclude from searches (e.g. the, a, to )', NULL, '', 'ru'),
(10, 'Diem base urls for different applications/environments/cultures', '{"front-prod":"http:\\/\\/feeling-style.ru\\/index.php","admin-prod":"http:\\/\\/feeling-style.ru\\/admin.php","front-dev":"http:\\/\\/feeling-style.ru\\/dev.php"}', '', 'ru'),
(11, 'Default method when an image needs to be resized', 'center', 'center', 'ru'),
(12, 'Jpeg default quality when generating thumbnails', '95', '95', 'ru'),
(13, 'Links to other domain get automatically a _blank target', NULL, '0', 'ru'),
(14, 'Links to current page are changed from <a> to <span>', '1', '1', 'ru'),
(15, 'Add an automatic title on link based on the target page title', '1', '1', 'ru'),
(16, 'Append something at the beginning of all pages title', NULL, '', 'ru'),
(17, 'Append something at the end of all pages title', ' | Feeling-style.ru', ' | Feeling-style.ru', 'ru'),
(18, 'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.', '1', '1', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_trans_unit`
--

CREATE TABLE IF NOT EXISTS `dm_trans_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_catalogue_id` bigint(20) NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `target` text COLLATE utf8_unicode_ci NOT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_catalogue_id_idx` (`dm_catalogue_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=403 ;

--
-- Дамп данных таблицы `dm_trans_unit`
--

INSERT INTO `dm_trans_unit` (`id`, `dm_catalogue_id`, `source`, `target`, `meta`, `created_at`, `updated_at`) VALUES
(1, 2, 'Open', 'Открыть', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(2, 2, 'Delete', 'Удалить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(3, 2, 'Add', 'Добавить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(4, 2, 'Add a %1%', 'Добавить %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(5, 2, 'Cancel', 'Отмена', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(6, 2, 'Are you sure?', 'Вы уверены?', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(7, 2, 'Unassociated', 'Несвязанные', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(8, 2, 'Associated', 'Связанные', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(9, 2, 'Forgot your password?', 'Забыли пароль?', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(10, 2, 'yes', 'Да', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(11, 2, 'no', 'Нет', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(12, 2, 'yes or no', 'Да или нет', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(13, 2, 'Next', 'Следующий', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(14, 2, 'Previous', 'Предыдущий', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(15, 2, 'First', 'Первый', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(16, 2, 'Last', 'Последний', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(17, 2, 'Is active', 'Активен', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(18, 2, 'Is active:', 'Активен:', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(19, 2, 'Updated at', 'Обновлено в', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(20, 2, 'Updated at:', 'Обновлено в:', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(21, 2, 'Created at', 'Создано в', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(22, 2, 'Created at:', 'Обновлено в:', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(23, 2, 'Created by', 'Создано', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(24, 2, 'Updated by', 'Обновлено', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(25, 2, 'Query', 'Запрос', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(26, 2, 'Image alt', 'Image Alt', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(27, 2, 'Image alt:', 'Image Alt:', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(28, 2, 'Your modifications have been saved', 'Ваши изменения были сохранены', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(29, 2, 'Required', 'Обязательное поле', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(30, 2, 'Content', 'Контент', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(31, 2, 'Home', 'Домой', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(32, 2, 'Tools', 'Инструменты', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(33, 2, 'System', 'Система', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(34, 2, 'Update project', 'Обновить проект', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(35, 2, 'Project successfully updated', 'Проект успешно обновлен', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(36, 2, 'Search', 'Поиск', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(37, 2, 'Search in %1%', 'Искать в %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(38, 2, 'Cancel search', 'Отменить поиск', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(39, 2, 'Active search', 'Активный поиск', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(40, 2, 'is empty', 'пуст', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(41, 2, 'from', 'от', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(42, 2, 'to', 'до', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(43, 2, '[0] no result|[1] 1 result|(1,+Inf] %1% results', '[0] no result|[1] 1 result|(1,+Inf] %1% results', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(44, 2, 'Choose an action', 'Выберите действие', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(45, 2, 'Edit', 'Редактировать', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(46, 2, 'New', 'Создать', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(47, 2, 'You must at least select one item.', 'Вы должны выбрать по крайней мере одно значение.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(48, 2, 'Filter', 'Фильтр', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(49, 2, 'Reset', 'Сбросить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(50, 2, 'Add a', 'Добавить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(51, 2, 'The item was updated successfully.', 'Элемент был успешно обновлен.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(52, 2, 'The item has not been saved due to some errors.', 'Этот элемент не был сохранен из-за некоторых ошибок.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(53, 2, 'Invalid.', 'Неверно.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(54, 2, 'Required.', 'Обязательный элемент.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(55, 2, 'The item was updated successfully. You can add another one below.', 'Этот пункт был успешно обновлен. Вы можете добавить еще одно ниже.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(56, 2, 'Translation', 'Перевод', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(57, 2, 'Sentences', 'Предложения (Sentences)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(58, 2, 'Loremize', 'Наполнение случайным текстом (Loremize)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(59, 2, 'does not match the date format', 'Неверный формат даты', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(60, 2, 'The date must be before', 'Дата должна быть раньше', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(61, 2, 'The date must be after', 'Дата должна быть после', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(62, 2, '[0]no element|[1]1 element|(1,+Inf]%1% elements', '[0]нет элемента|[1]1 элемент|(1,+inf]%1% элементов', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(63, 2, 'You must select an action to execute on the selected items.', 'Вы должны выбрать действие, которое нужно выполнить с выбранными элементами.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(64, 2, 'No result', 'Результатов не найдено', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(65, 2, 'The selected items have been deleted successfully.', 'Выбранные элементы были успешно удалены.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(66, 2, 'The selected items have been modified successfully', 'Выбранные элементы были успешно изменены', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(67, 2, 'A problem occurs when modifying the selected items', 'Возникла проблема при попытке изменить выбранные элементы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(68, 2, 'Root', 'Корень', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(69, 2, 'Page not found', 'Страница не найдена', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(70, 2, 'Media library', 'Медиатека', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(71, 2, 'UML Model Diagram', 'UML-диаграммы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(72, 2, 'The item was deleted successfully.', 'Элемент был успешно удален.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(73, 2, 'element', 'Элемент', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(74, 2, 'elements', 'Элементы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(75, 2, 'Add a folder here', 'Добавить папку здесь', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(76, 2, 'Import from a zip', 'Импорт из Zip', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(77, 2, 'Add some files here', 'Добавить несколько файлов здесь', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(78, 2, 'Add a file here', 'Добавить файл здесь', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(79, 2, 'Clear cache', 'Очистить кэш', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(80, 2, 'Clear media cache', 'Очистить кэш медиа', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(81, 2, 'Name', 'Имя', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(82, 2, 'Rename this folder', 'Переименовать эту папку', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(83, 2, 'Move this folder', 'Переместить эту папку', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(84, 2, 'Delete this folder', 'Удалить эту папку', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(85, 2, 'Already exists in this folder', 'Уже существует в этой папке', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(86, 2, 'This is a bad name', 'Некорректное имя', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(87, 2, 'File', 'Файл', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(88, 2, 'Thumbnails can not be created in %1%', 'Мини-копии (thumbnails) не могут быть созданы в %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(89, 2, 'Folder %1% is not writable', 'Папка %1% не доступна для записи', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(90, 2, 'File %1% is not writable', 'Файл %1% не доступен для записи', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(91, 2, 'This folder is not writable', 'Эта папка не доступна для записи', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(92, 2, 'This file is not writable', 'Этот файл не доступен для записи', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(93, 2, 'Size', 'Размер', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(94, 2, 'Legend', 'Обозначения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(95, 2, 'Author', 'Автор', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(96, 2, 'License', 'Лицензия', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(97, 2, 'Validate', 'Проверить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(98, 2, 'Save', 'Сохранить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(99, 2, 'Save and Add', 'Сохранить и добавить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(100, 2, 'Save and Next', 'Сохранить и перейти к следующему', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(101, 2, 'Save and Back to list', 'Сохранить и вернуться к списку', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(102, 2, 'Save modifications', 'Сохранить изменения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(103, 2, 'Delete this file', 'Удалить этот файл', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(104, 2, 'Close', 'Закрыть', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(105, 2, 'Delete this %1%', 'Удалить %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(106, 2, 'Delete this page', 'Удалить эту страницу', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(107, 2, 'Active', 'Активно', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(108, 2, 'Referers', 'Источники (Referers)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(109, 2, 'Administration login', 'Вход для администратора', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(110, 2, 'Login', 'Войти', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(111, 2, 'Username', 'Имя пользователя', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(112, 2, 'Password', 'Пароль', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(113, 2, 'Password (again)', 'Пароль (снова)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(114, 2, 'Remember', 'Запомнить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(115, 2, 'The username and/or password is invalid.', 'Имя пользователя и / или пароль неверны.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(116, 2, 'Profiles', 'Профили (Profiles)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(117, 2, 'Profile', 'Профиль (Profile)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(118, 2, 'User', 'Пользователь', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(119, 2, 'Users', 'Пользователи', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(120, 2, 'Metas', 'Мета тэги (Metas)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(121, 2, 'Automatic Page', 'Автоматическая страница', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(122, 2, 'Automatic Pages', 'Автоматические страницы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(123, 2, 'Site tree', 'Карта сайта (Site tree)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(124, 2, 'Some SEO improvements should be applied', 'Рекомендуемые SEO-улучшения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(125, 2, 'Some page have the same url', 'Некоторые страницы имеют одинаковый URL', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(126, 2, 'Click here to see them', 'Нажмите здесь, чтобы увидеть их', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(127, 2, 'Seo improvements', 'SEO улучшения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(128, 2, 'Duplicated %1%', 'Дублировано %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(129, 2, 'Automatic page', 'Автоматическая страница', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(130, 2, 'Manual page', 'Страница, созданная вручную', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(131, 2, 'Modify object', 'Изменить объект', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(132, 2, 'Configure automatic seo for %1% pages', 'Настройка автоматического SEO для %1% страниц', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(133, 2, 'View page on website', 'Открыть страницу на сайте', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(134, 2, 'Edit image', 'Изменить изображение', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(135, 2, 'Loading...', 'Загрузка ...', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(136, 2, 'Preview', 'Превью', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(137, 2, 'Back to list', 'Вернуться к списку', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(138, 2, 'The form submission cannot be processed. It probably means that you have uploaded a file that is too big.', 'Форма не может быть обработана. Возможно вы загрузили слишком большой файл.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(139, 2, 'A problem occurs when deleting the selected items.', 'Возникла проблема при удалении выбранных объектов.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(140, 2, 'elements per page', 'элементов на странице', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(141, 2, 'Sort', 'Сортировка', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(142, 2, 'Sort %1%', 'Сортировать %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(143, 2, 'Sort %1% for %2%', 'Сортировать %1% до %2%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(144, 2, 'Drag & drop elements, then', 'Перетащить элементы, затем', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(145, 2, 'A problem occured when sorting the items', 'Возникла проблема при сортировке объектов', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(146, 2, 'The items have been sorted successfully', 'Объекты успешно отсортированы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(147, 2, 'Add a zone', 'Добавить зону', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(148, 2, 'Add a widget', 'Добавить виджет', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(149, 2, 'Go to site', 'Перейти на сайт', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(150, 2, 'You don''t have the required permission to access this page.', 'У вас недостаточно прав для доступа к этой странице.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(151, 2, 'Edit this zone', 'Редактировать эту зону', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(152, 2, 'Delete this zone', 'Удалить эту зону', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(153, 2, 'CSS class', 'Класс CSS', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(154, 2, 'Width', 'Ширина', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(155, 2, 'Height', 'Высота', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(156, 2, 'Edit this %1%', 'Изменить эту %1%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(157, 2, 'Delete this widget', 'Удалить этот виджет', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(158, 2, 'Title', 'Название', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(159, 2, 'Link', 'Ссылка', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(160, 2, 'Text', 'Текст (анкор, видимо)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(161, 2, 'Advanced', 'Расширенный', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(162, 2, 'Bread crumb', 'Хлебные крошки (Bread crumb)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(163, 2, 'Search form', 'Форма поиска', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(164, 2, 'Search results', 'Результаты поиска', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(165, 2, 'Go to content', 'Перейти к содержимому', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(166, 2, 'New widget', 'Создать виджет', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(167, 2, 'Use media', 'Использовать медиа', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(168, 2, 'Or upload a file', 'Или загрузить файл', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(169, 2, 'Drag & drop a media here', 'Перетащить медиа сюда', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(170, 2, 'Media', 'Медиа', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(171, 2, 'You must use a media or upload a file', 'Вы должны использовать медиа или загрузить файл', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(172, 2, 'Try', 'Попробовать', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(173, 2, 'Change file', 'Изменить файлов', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(174, 2, 'Method', 'Методы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(175, 2, 'Center', 'Центр', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(176, 2, 'Scale', 'Масштаб (Scale)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(177, 2, 'Inflate', 'Inflate', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(178, 2, 'Fit', 'Fit', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(179, 2, 'Save and close', 'Сохранить и закрыть', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(180, 2, 'This size is not valid.', 'Некорректный размер.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(181, 2, 'This color is not valid.', 'Некорректный цвет.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(182, 2, 'Per page', 'На страницу', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(183, 2, 'First page', 'Первая страница', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(184, 2, 'Previous page', 'Предыдущая страница', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(185, 2, 'Next page', 'Следующая страница', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(186, 2, 'Last page', 'Последняя страница', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(187, 2, 'Top', 'Верх', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(188, 2, 'Bottom', 'Низ', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(189, 2, 'View', 'Просмотр', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(190, 2, 'Order by', 'Сортировать по', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(191, 2, 'Random', 'Случайно', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(192, 2, 'automatic', 'автоматически', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(193, 2, 'Add new page', 'Добавить новую страницу', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(194, 2, 'Seo', 'SEO', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(195, 2, 'Integration', 'Интеграция', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(196, 2, 'Edit page', 'Редактировать страницу', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(197, 2, 'Logout', 'Выйти', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(198, 2, 'Available', 'Доступный', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(199, 2, 'Requires authentication', 'Требуется аутентификация', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(200, 2, 'Search engine crawlers', 'Поисковые роботы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(201, 2, 'Show page structure', 'Показать структуру страницы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(202, 2, 'Generate sitemap', 'Создание карты сайта', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(203, 2, 'Links', 'Ссылки', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(204, 2, 'Act on selection', 'Выполнить с выбранными:', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(205, 2, 'Activate', 'Активировать', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(206, 2, 'Deactivate', 'Деактивировать', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(207, 2, 'Remove', 'Удалить', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(208, 2, 'Sorry, but you can not access administration with your current browser', 'Извините, но Вы не можете получить доступ к админинстративной части с вашим текущим браузером', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(209, 2, 'Select all', 'Выделить все', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(210, 2, 'Unselect all', 'Снять выделение', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(211, 2, 'Configuration panel', 'Панель настройки', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(212, 2, 'This is not a valid hexadecimal color', 'Значение не является шестнадцатеричным цветом', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(213, 2, '%1% - %2% of %3%', ' %1% - %2% из %3%', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(214, 2, 'Display', 'Отображать (Display)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(215, 2, 'User logged in', 'Пользователь вошел в систему', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(216, 2, 'User logged out', 'Пользователь вышел из системы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(217, 2, 'Cache cleared', 'Кэш очищен', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(218, 2, 'This Week', 'На этой неделе', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(219, 2, 'This Year', 'В этом году', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(220, 2, 'Activity', 'Активность', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(221, 2, 'Server', 'Сервер', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(222, 2, 'Browser', 'Браузер', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(223, 2, 'Browsers', 'Браузеры', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(224, 2, 'Location', 'Местонахождение', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(225, 2, 'Events', 'События', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(226, 2, 'Requests', 'Запросы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(227, 2, 'Subject', 'Тема', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(228, 2, 'Expanded view', 'Расширенный просмотр (Expanded view)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(229, 2, 'Show', 'Показать', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(230, 2, 'Gallery', 'Галерея', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(231, 2, 'Edit medias', 'Изменить медиа', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(232, 2, 'Remove this media', 'Удалить медиа', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(233, 2, 'Preferences', 'Настройки', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(234, 2, 'Mail templates', 'Шаблоны писем', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(235, 2, 'Layouts', 'Лэйауты', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(236, 2, 'Zone', 'Зона', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(237, 2, 'Navigation', 'Навигация', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(238, 2, 'Configuration', 'Конфигурация', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(239, 2, 'Chart', 'Таблица', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(240, 2, 'Log', 'Лог (Log)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(241, 2, 'Monitoring', 'Мониторинг', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(242, 2, 'Manage index', 'Управление индексом', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(243, 2, 'Search engine', 'Поисковая система', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(244, 2, 'Google analytics', 'Google Analytics', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(245, 2, 'Google webmaster tools', 'Инструменты Google для веб-мастеров', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(246, 2, 'Services', 'Сервисы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(247, 2, 'Sitemap', 'Карта сайта', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(248, 2, 'Url Redirections', 'Редиректы URL', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(249, 2, 'Redirections', 'Редиректы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(250, 2, 'Settings', 'Настройки', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(251, 2, 'Sent mails', 'Отправленные письма', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(252, 2, 'Errors', 'Ошибки', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(253, 2, 'Permissions', 'Разрешения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(254, 2, 'Groups', 'Группы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(255, 2, 'Security', 'Безопасность', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(256, 2, 'See diagrams', 'См. диаграммы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(257, 2, 'Code Editor', 'Редактор кода', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(258, 2, 'Diem Console', 'Консоль Diem', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(259, 2, 'Dev', 'Режим разработки (Dev)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(260, 2, 'Exception', 'Исключение', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(261, 2, 'Cache', 'Кэш', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(262, 2, 'This chart is not available.', 'Эта таблица не доступна.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(263, 2, 'Dm gallery', 'Dm-галерея', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(264, 2, 'Email', 'Электронная почта', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(265, 2, 'Last login', 'Последниий вход', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(266, 2, 'Visible', 'Видимый', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(267, 2, 'External services', 'Внешние сервисы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(268, 2, 'Interface', 'Интерфейс', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(269, 2, 'Site', 'Сайт', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(270, 2, 'Tracking', 'Отслеживание', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(271, 2, 'Gmap key', 'Ключ Gmap', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(272, 2, 'The google map key ( e.g. ABQIAAAARcvUUsf4RP8fmjHaFYFYQxRhf7uCiJccoEylUqtC2qy_Rw3WKhSEa96 )', 'Ключ GMap API (например ABQIAAAARcvUUsf4RP8fmjHaFYFYQxRhf7uCiJccoEylUqtC2qy_Rw3WKhSEa96)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(273, 2, 'Right', 'Правый', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(274, 2, 'Left', 'Левый', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(275, 2, 'Image resize method', 'Способ ресайза изображения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(276, 2, 'Default method when an image needs to be resized', 'Способ по умолчанию ресайза (по необходимости) изображения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(277, 2, 'Image resize quality', 'Качество ресайза изображения', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(278, 2, 'Jpeg default quality when generating thumbnails', 'Качество jpeg по умолчанию при создании эскизов', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(279, 2, 'Link external blank', 'Внешняя ссылка (новое окно) (blank)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(280, 2, 'Links to other domain get automatically a _blank target', 'Ссылки на другой домен в новом окне (_blank)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(281, 2, 'Link current span', 'Link current span', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(282, 2, 'Links to current page are changed from <a> to <span>', 'Ссылки на текущую страницу изменены с <a> на <span>', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(283, 2, 'Link use page title', 'Ссылка использует заголовок страницы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(284, 2, 'Add an automatic title on link based on the target page title', 'Автоматически добавлять анкор на основе тайтла целевой страницы', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(285, 2, 'Search stop words', 'Поиск стоп-слов', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(286, 2, 'Words to exclude from searches (e.g. the, a, to )', 'Слова, исключаемые из поиска (например, в, на, от, до)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(287, 2, 'Title prefix', 'Префикс тайтла', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(288, 2, 'Append something at the beginning of all pages title', 'Присоединить в начало тайтлов всех страниц', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(289, 2, 'Title suffix', 'Суффикс тайтла', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(290, 2, 'Append something at the end of all pages title', 'Присоединить в конец тайтлов всех страниц', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(291, 2, 'Smart 404', 'Умная страница 404', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(292, 2, 'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.', 'Если страница не найдена, то перенаправлять пользователю на похожую страницу. Для определения такой страницы используется внутренний поисковый индекс.', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(293, 2, 'Site name', 'Название сайта', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(294, 2, 'The site name', 'Название сайта', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(295, 2, 'Site active', 'Сайт активен', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(296, 2, 'Is the site ready for visitors ?', 'Сайт готов для посетителей?', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(297, 2, 'Site indexable', 'Сайт разрешен к индексации', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(298, 2, 'Is the site ready for search engine crawlers ?', 'Сайт подготовлен для поисковых роботов?', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(299, 2, 'Site working copy', 'Рабочая копия сайта', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(300, 2, 'Is this site the current working copy ?', 'Является ли этот сайт текущей рабочей копией?', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(301, 2, 'Ga key', 'Ключ GA', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(302, 2, 'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )', 'Ключ Google Analytics без JavaScript (например, UA-9876614-1)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(303, 2, 'Gwt key', 'Ключ GWT', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(304, 2, 'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )', 'Имя файла (без google и .html) для службы инструменты Google для веб-мастеров (например a913b555ba9b4f13)', NULL, '2014-05-20 09:39:41', '2014-05-20 09:39:41'),
(305, 2, 'Xiti code', 'Код Xiti', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(306, 2, 'The xiti html code', 'HTML-код Xiti', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(307, 2, 'Ga email', 'email GA', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(308, 2, 'Required to display google analytics data into Diem', 'Требуется для отображения данных Google Analytics в Diem', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(309, 2, 'Ga password', 'пароль GA', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(310, 2, 'Diem mail support is <strong>-NOT-</strong> completed. Please use the symfony 1.4 mail service instead', 'На данный момент в Diem работа с почтой <strong>реализована не полностью</strong>. Используйте возможности symfony 1.4', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(311, 2, 'Duplicate', 'Копия', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(312, 2, 'Source', 'Источник', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(313, 2, 'Target', 'Цель', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(314, 2, 'Dm catalogue', 'Dm каталог', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(315, 2, 'Meta', 'Meta', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(316, 2, 'Menu', 'Меню', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(317, 2, 'Internal search engine', 'Внутренняя поисковая система', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(318, 2, 'Reload index', 'Перезагрузить индекс', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(319, 2, 'Configure Google Analytics', 'Настройка Google Analytics', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(320, 2, 'Configure Google Webmaster Tools', 'Настройка Google Webmaster Tools', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(321, 2, 'Position', 'Позиция', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(322, 2, 'Urls', 'Urls', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(323, 2, 'Old url', 'Старый URL', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(324, 2, 'New url', 'Новый URL', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(325, 2, 'Group', 'Группа', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(326, 2, 'Value', 'Значение', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(327, 2, 'Credentials', 'Полномочия', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(328, 2, 'Class', 'Класс', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(329, 2, 'Module', 'Модуль', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(330, 2, 'Action', 'Действие (action)', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(331, 2, 'Uri', 'URI', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(332, 2, 'Env', 'Окружение (Env)', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(333, 2, 'Super admin', 'Super Admin', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(334, 2, 'The admin code editor is <strong>-NOT-</strong> completed yet an may not work', 'The admin code editor is <strong>-NOT-</strong> completed yet an may not work', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(335, 2, 'List', 'Список', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(336, 2, 'Form', 'Форма', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(337, 2, 'Administration', 'Администрирование', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(338, 2, 'text', 'текст', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(339, 2, 'Index state', 'Состояние индекса', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(340, 2, 'Index maintenance', 'Обслуживание индекса', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(341, 2, 'Search completed in %1% ms', 'Поиск выполнен за %1% мс', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(342, 2, 'No results', 'Нет результатов', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(343, 2, 'Edit template code', 'Изменить код шаблона', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(344, 2, 'Edit component code', 'Изменение код компонента', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(345, 2, 'Drag & Drop a media here', 'Перетащите сюда медиа', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(346, 2, 'Add a link to the text title', 'Добавить ссылку к текстовому заголовку', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(347, 2, 'Add a link to the text media', 'Add a link to the text media', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(348, 2, 'Drag & Drop a page or enter an url', 'Перетащите страницу или введите URL', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(349, 2, 'Drag & drop a page here from the PAGES panel, or write an url', 'Перетащите сюда страницу с панели PAGES либо введите URL', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(350, 2, 'Title position', 'Положение заголовка', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(351, 2, 'Outside', 'Снаружи', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(352, 2, 'Inside', 'Внутри', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(353, 2, 'JPG quality', 'Качество JPG', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(354, 2, 'Dimensions', 'Размеры', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(355, 2, 'Leave empty to use default quality', 'Оставьте поле пустым, чтобы использовать качество по умолчанию', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(356, 2, 'Separator', 'Разделитель', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(357, 2, 'Include current page', 'Включить текущую страницу', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(358, 2, 'This CSS class is applied to the body tag', 'Этот класс CSS применяется к тэгу body', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(359, 2, 'Revision history of %1%', 'История изменений %1%', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(360, 2, 'Revision history', 'История изменений', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(361, 2, 'Field', 'Поле', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(362, 2, 'Difference', 'Различие', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(363, 2, 'No revision for %1% with culture "%2%"', 'Нет изменений для %1% с языком " %2%"', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(364, 2, 'Body', 'Тело', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(365, 2, 'Others', 'Другие', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(366, 2, 'Description', 'Описание', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(367, 2, 'Vars', 'Переменные', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(368, 2, 'From email', 'Отправитель', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(369, 2, 'To email', 'Получатель', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(370, 2, 'Updating project', 'Обновление проекта', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(371, 2, 'Cache clearing', 'Очистка кэша', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(372, 2, 'Page synchronization', 'Синхронизация страниц', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(373, 2, 'SEO synchronization', 'SEO синхронизация', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(374, 2, 'Interface regeneration', 'Регенерация интерфейса', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(375, 2, 'Something went wrong when updating project', 'Произошел сбой при обновлении проекта', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(376, 2, 'Send reports', 'Отправка отчетов', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(377, 2, 'Receive reports', 'Получение отчетов', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(378, 2, 'Open Google Analytics page', 'Открыть Google Analytics', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(379, 2, 'Open Google Webmaster Tools page', 'Открыть инструменты Google для вебмастеров', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(380, 2, 'Revert to revision %1%', 'Вернуться к версии %1%', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(381, 2, '%1% has been reverted to version %2%', ' %1% вернули к версии %2%', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(382, 2, 'Results %1% to %2% of %3%', 'Результаты c %1% по %2% из %3%', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(383, 2, 'To enable it, provide a google analytics access', 'Чтобы включить, предоставьте доступ к Google Analytics', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(384, 2, 'This chart is currently not available', 'Эта таблица сейчас не доступна', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(385, 2, 'Generate %1% random %2%', 'Генерировать %1% случайно %2%', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(386, 2, 'Options', 'Параметры', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(387, 2, 'Drag & Drop an image here', 'Перетащите изображения сюда', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(388, 2, '"%value%" is not a valid link.', '"%value%" не является корректной ссылкой.', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(389, 2, '"%value%" is not a valid directory name.', '"%value%" не является допустимым именем директории.', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(390, 2, 'History', 'История', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(391, 2, 'Set up a cron to update the search index', 'Настройка планировщика для обновления поискового индекса', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(392, 2, 'Set up a cron to update the sitemap', 'Настройка планировщика для обновления Sitemap', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(393, 2, 'Most UNIX and GNU/Linux systems allows for task planning through a mechanism known as cron. The cron checks a configuration file (a crontab) for commands to run at a certain time.', 'Большинство UNIX и GNU/Linux систем позволяет задания с помощью механизма, известного как cron. Cron ищет в конфигурационном файле (crontab) команды для запуска в определенное время.', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(394, 2, 'For more information on the crontab configuration file format, type man 5 crontab in a terminal.', 'Подробнее с форматом файла crontab можно ознакомиться, выполнив в терминале ''man 5 crontab''', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(395, 2, 'Open %1% and add the line:', 'Открыть %1% и добавить строку:', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(396, 2, 'Cut', 'Вырезать', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(397, 2, 'Copy', 'Копировать', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(398, 2, 'Paste', 'Вставить', NULL, '2014-05-20 09:39:42', '2014-05-20 09:39:42'),
(399, 1, 'Sliders', 'Слайдеры', '', '2014-05-21 09:43:12', '2014-05-21 09:43:12'),
(400, 1, 'On main', 'На главной', '', '2014-05-21 13:23:05', '2014-05-21 13:23:05'),
(401, 1, 'Category', 'Категория', '', '2014-05-21 13:26:04', '2014-05-21 13:26:04'),
(402, 1, 'Image', 'Изображение', '', '2014-05-21 13:26:37', '2014-05-21 13:26:37');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_user`
--

CREATE TABLE IF NOT EXISTS `dm_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `dm_user`
--

INSERT INTO `dm_user` (`id`, `username`, `email`, `algorithm`, `salt`, `password`, `is_active`, `is_super_admin`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@feeling-style.ru.com', 'sha1', '4a7cabc6b697e9cd42bdc42f0218b5a0', 'bbfe011257c534fce2f210c08b49eaba0ef08de5', 1, 1, '2014-05-21 14:15:33', '2014-05-20 09:39:39', '2014-05-20 09:39:39');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_user_group`
--

CREATE TABLE IF NOT EXISTS `dm_user_group` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_group_id`),
  KEY `dm_user_group_dm_group_id_dm_group_id` (`dm_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dm_user_permission`
--

CREATE TABLE IF NOT EXISTS `dm_user_permission` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_permission_id`),
  KEY `dm_user_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dm_widget`
--

CREATE TABLE IF NOT EXISTS `dm_widget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_zone_id` bigint(20) NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_zone_id_idx` (`dm_zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `dm_widget`
--

INSERT INTO `dm_widget` (`id`, `dm_zone_id`, `module`, `action`, `css_class`, `position`, `updated_at`) VALUES
(1, 6, 'dmWidgetContent', 'title', NULL, -1, '2014-05-20 09:39:39'),
(2, 7, 'dmUser', 'signin', NULL, -2, '2014-05-20 09:39:39'),
(3, 8, 'dmWidgetContent', 'title', 'header_line header_title', 1, '2014-05-20 19:28:00'),
(4, 9, 'dmWidgetContent', 'text', 'header_logo', 1, '2014-05-20 19:28:25'),
(5, 10, 'dmWidgetNavigation', 'menu', 'menu_4s', 1, '2014-05-20 19:28:43'),
(6, 1, 'main', 'header', '', 1, '2014-05-20 19:30:44'),
(8, 14, 'slider', 'list', '', 1, '2014-05-20 19:56:24'),
(9, 2, 'main', 'footer', NULL, 1, '2014-05-21 00:40:01'),
(11, 5, 'maincentertexts', 'list', '', 1, '2014-05-21 01:37:27'),
(12, 12, 'dmWidgetContent', 'text', '', 1, '2014-05-21 01:52:50'),
(13, 13, 'dmWidgetContent', 'text', '', 1, '2014-05-21 01:54:56'),
(14, 11, 'dmWidgetContent', 'text', '', 1, '2014-05-21 01:55:06');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_widget_translation`
--

CREATE TABLE IF NOT EXISTS `dm_widget_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  `lang` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `dm_widget_translation`
--

INSERT INTO `dm_widget_translation` (`id`, `value`, `lang`) VALUES
(1, '{"text":"Page not found","tag":"h1"}', 'ru'),
(2, '[]', 'ru'),
(3, '{"text":"\\u0427\\u0443\\u0432\\u0441\\u0442\\u0432\\u043e \\u0441\\u0442\\u0438\\u043b\\u044f","tag":"p","href":"page:1 Home"}', 'ru'),
(4, '{"title":"","text":"","mediaId":null,"titleLink":"","mediaLink":"","titlePosition":"outside","width":"","height":"","legend":"","method":"center","background":"FFFFFF","quality":null}', 'ru'),
(5, '{"ulClass":"","liClass":"","menuClass":"","items":[{"link":"page:1","text":"\\u041e \\u043d\\u0430\\u0441","depth":"0"},{"link":"page:4","text":"\\u041f\\u043e\\u0440\\u0442\\u0444\\u043e\\u043b\\u0438\\u043e","depth":"0"},{"link":"page:5","text":"\\u041c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b","depth":"0"},{"link":"page:6","text":"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b","depth":"0"}]}', 'ru'),
(6, '[]', 'ru'),
(8, '{"orderField":"id","orderType":"asc","maxPerPage":0,"navTop":false,"navBottom":false}', 'ru'),
(9, '{"cssClass":null}', 'ru'),
(11, '{"orderField":"id","orderType":"asc","maxPerPage":0,"navTop":false,"navBottom":false}', 'ru'),
(12, '{"title":"","text":".\\n.\\n.\\n.\\n## \\u0412 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0439 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430 \\u043d\\u0430\\u0445\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u0432 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0435! \\n## \\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u0412\\u0430\\u0448\\u0435 \\u0442\\u0435\\u0440\\u043f\\u0435\\u043d\\u0438\\u0435 \\u0438 \\u043f\\u043e\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435!\\n.\\n.\\n.\\n.\\n.","mediaId":null,"titleLink":"","mediaLink":"","titlePosition":"outside","width":"","height":"","legend":"","method":"center","background":"FFFFFF","quality":null}', 'ru'),
(13, '{"title":"","text":".\\n.\\n.\\n.\\n## \\u0412 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0439 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430 \\u043d\\u0430\\u0445\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u0432 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0435! \\n## \\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u0412\\u0430\\u0448\\u0435 \\u0442\\u0435\\u0440\\u043f\\u0435\\u043d\\u0438\\u0435 \\u0438 \\u043f\\u043e\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435!\\n.\\n.\\n.\\n.\\n.","mediaId":null,"titleLink":"","mediaLink":"","titlePosition":"outside","width":"","height":"","legend":"","method":"center","background":"FFFFFF","quality":null}', 'ru'),
(14, '{"title":"","text":".\\n.\\n.\\n.\\n## \\u0412 \\u0434\\u0430\\u043d\\u043d\\u044b\\u0439 \\u043c\\u043e\\u043c\\u0435\\u043d\\u0442 \\u0441\\u0442\\u0440\\u0430\\u043d\\u0438\\u0446\\u0430 \\u043d\\u0430\\u0445\\u043e\\u0434\\u0438\\u0442\\u0441\\u044f \\u0432 \\u0440\\u0430\\u0437\\u0440\\u0430\\u0431\\u043e\\u0442\\u043a\\u0435! \\n## \\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u0412\\u0430\\u0448\\u0435 \\u0442\\u0435\\u0440\\u043f\\u0435\\u043d\\u0438\\u0435 \\u0438 \\u043f\\u043e\\u043d\\u0438\\u043c\\u0430\\u043d\\u0438\\u0435!\\n.\\n.\\n.\\n.\\n.","mediaId":null,"titleLink":"","mediaLink":"","titlePosition":"outside","width":"","height":"","legend":"","method":"center","background":"FFFFFF","quality":null}', 'ru');

-- --------------------------------------------------------

--
-- Структура таблицы `dm_zone`
--

CREATE TABLE IF NOT EXISTS `dm_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_area_id` bigint(20) NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_area_id_idx` (`dm_area_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `dm_zone`
--

INSERT INTO `dm_zone` (`id`, `dm_area_id`, `css_class`, `width`, `position`) VALUES
(1, 1, NULL, NULL, 1),
(2, 2, NULL, NULL, -2),
(3, 3, NULL, NULL, -3),
(4, 4, NULL, NULL, -4),
(5, 5, NULL, NULL, 2),
(6, 6, NULL, NULL, -6),
(7, 7, NULL, NULL, -7),
(8, 1, 'header_line header_line_title', '', 2),
(9, 1, 'header_line header_line_logo', '', 3),
(10, 1, 'header_line header_line_menu', '', 4),
(11, 8, NULL, NULL, -8),
(12, 9, NULL, NULL, -9),
(13, 10, NULL, NULL, -10),
(14, 5, NULL, NULL, 1),
(15, 11, NULL, NULL, -11),
(16, 12, NULL, NULL, -12);

-- --------------------------------------------------------

--
-- Структура таблицы `maincentertexts`
--

CREATE TABLE IF NOT EXISTS `maincentertexts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `maincentertexts`
--

INSERT INTO `maincentertexts` (`id`, `title`, `description`, `is_active`) VALUES
(1, 'Чувство стиля', NULL, 1),
(2, 'Наши услуги', NULL, 1),
(3, 'Качество', NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `migration_version`
--

CREATE TABLE IF NOT EXISTS `migration_version` (
  `version` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `migration_version`
--

INSERT INTO `migration_version` (`version`) VALUES
(11);

-- --------------------------------------------------------

--
-- Структура таблицы `slider`
--

CREATE TABLE IF NOT EXISTS `slider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slider_image_id_idx` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `slider`
--

INSERT INTO `slider` (`id`, `image_id`) VALUES
(1, 1),
(3, 3),
(4, 4),
(5, 5);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_category_id_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `category_image_id_dm_media_id` FOREIGN KEY (`image_id`) REFERENCES `dm_media` (`id`);

--
-- Ограничения внешнего ключа таблицы `dm_area`
--
ALTER TABLE `dm_area`
  ADD CONSTRAINT `dm_area_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dm_area_dm_page_view_id_dm_page_view_id` FOREIGN KEY (`dm_page_view_id`) REFERENCES `dm_page_view` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_auto_seo_translation`
--
ALTER TABLE `dm_auto_seo_translation`
  ADD CONSTRAINT `dm_auto_seo_translation_id_dm_auto_seo_id` FOREIGN KEY (`id`) REFERENCES `dm_auto_seo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_group_permission`
--
ALTER TABLE `dm_group_permission`
  ADD CONSTRAINT `dm_group_permission_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dm_group_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_lock`
--
ALTER TABLE `dm_lock`
  ADD CONSTRAINT `dm_lock_user_id_dm_user_id` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_mail_template_translation`
--
ALTER TABLE `dm_mail_template_translation`
  ADD CONSTRAINT `dm_mail_template_translation_id_dm_mail_template_id` FOREIGN KEY (`id`) REFERENCES `dm_mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_media`
--
ALTER TABLE `dm_media`
  ADD CONSTRAINT `dm_media_dm_media_folder_id_dm_media_folder_id` FOREIGN KEY (`dm_media_folder_id`) REFERENCES `dm_media_folder` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_page_translation`
--
ALTER TABLE `dm_page_translation`
  ADD CONSTRAINT `dm_page_translation_id_dm_page_id` FOREIGN KEY (`id`) REFERENCES `dm_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_page_view`
--
ALTER TABLE `dm_page_view`
  ADD CONSTRAINT `dm_page_view_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE SET NULL;

--
-- Ограничения внешнего ключа таблицы `dm_remember_key`
--
ALTER TABLE `dm_remember_key`
  ADD CONSTRAINT `dm_remember_key_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_setting_translation`
--
ALTER TABLE `dm_setting_translation`
  ADD CONSTRAINT `dm_setting_translation_id_dm_setting_id` FOREIGN KEY (`id`) REFERENCES `dm_setting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_trans_unit`
--
ALTER TABLE `dm_trans_unit`
  ADD CONSTRAINT `dm_trans_unit_dm_catalogue_id_dm_catalogue_id` FOREIGN KEY (`dm_catalogue_id`) REFERENCES `dm_catalogue` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_user_group`
--
ALTER TABLE `dm_user_group`
  ADD CONSTRAINT `dm_user_group_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dm_user_group_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_user_permission`
--
ALTER TABLE `dm_user_permission`
  ADD CONSTRAINT `dm_user_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dm_user_permission_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_widget`
--
ALTER TABLE `dm_widget`
  ADD CONSTRAINT `dm_widget_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_widget_translation`
--
ALTER TABLE `dm_widget_translation`
  ADD CONSTRAINT `dm_widget_translation_id_dm_widget_id` FOREIGN KEY (`id`) REFERENCES `dm_widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `dm_zone`
--
ALTER TABLE `dm_zone`
  ADD CONSTRAINT `dm_zone_dm_area_id_dm_area_id` FOREIGN KEY (`dm_area_id`) REFERENCES `dm_area` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `slider`
--
ALTER TABLE `slider`
  ADD CONSTRAINT `slider_image_id_dm_media_id` FOREIGN KEY (`image_id`) REFERENCES `dm_media` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
