-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 16, 2022 at 12:18 AM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coordinate`
--

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` text,
  `primary_tag` varchar(16) DEFAULT NULL,
  `likes` int(11) DEFAULT '0',
  `views` int(11) DEFAULT '0',
  `status` varchar(9) DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `user_id`, `title`, `date`, `description`, `primary_tag`, `likes`, `views`, `status`) VALUES
(5, 101, 'Saje Beauty', '2022-04-07', 'Sajé Beauty est un design d\'application mobile pour un salon de beauté.', 'design', 0, 0, 'pending'),
(6, 87, 'Yummies ', '2021-09-15', 'Yummies est une application de livraison de nourriture à domicile.', 'design', 124, 200, 'approved'),
(7, 88, 'Audiozic', '2022-02-03', 'Audiozic est une application mobile pour une plateforme e-commerce.', 'design', 88, 96, 'approved'),
(8, 102, 'G-Trotter', '2022-01-17', 'Globe trotter,aventurier capricieux ou simplement à la recherche de nouvelles sensations, G-trotter est fait pour vous ! Discuter de vos voyages avec vos amis, plannifier le prochain et partager des petis conseils avec tout le monde.', 'design', 203, 210, 'approved'),
(9, 76, 'Potions', '2022-04-03', 'Potion est un outil de sécurisation de payement', 'development', 0, 0, 'pending'),
(10, 92, 'Likely Story', '2022-03-22', 'Likely Story est un projet collaboratif mettant en avant l\'aspect 3D ', 'development', 897, 975, 'approved'),
(11, 93, 'Bloggers', '2022-02-11', 'Bloggers est un design web d\'un réseau social', 'design', 17, 19, 'approved'),
(12, 87, 'Homely', '2022-04-03', 'Homely est un design de site immobilier', 'design', 0, 0, 'pending'),
(13, 95, 'Portfolio', '2022-04-01', 'Regroupement de projet fait depuis mes débuts', 'development', 150, 152, 'approved'),
(14, 90, 'Grow', '2022-02-25', 'Grow est une application de gestion de finance et porte-feuilles numériques', 'design', 129, 129, 'approved'),
(18, 97, 'Skillex', '2022-01-13', 'Skillez est un projet de site web pour du soutien scolaire.Le bout étant de mettre à la disposition des professeurs qualifiés à des jeunes étudiants dans le besoin.', 'management', 102, 111, 'approved'),
(19, 102, 'Taste', '2020-11-25', 'Taste est une application mobile pour un restaurant de sushi', 'design', 106, 120, 'approved'),
(20, 88, 'Comme à la maison', '2022-03-12', 'Comme à la maison est un site internet e-commerce de mobilier.', 'design', 156, 156, 'approved'),
(21, 89, 'Smart Home', '2022-03-08', 'Smart Home est une application domotique afin de contrôler les divers appareils de votre maison.Ce projet met l\'emphase sur le côté sécurité numérique afin d\'empêcher des personnes malintentionnées de prendre le contrôl de votre domicile', 'development', 203, 234, 'approved'),
(23, 90, 'Furni.shop', '2022-04-03', 'Furni.shop est un site internet pour du mobilier de maison de luxe.', 'design', 0, 0, 'pending'),
(24, 96, 'Unitech', '2022-04-24', 'Ce projet est une refonte d\'un site internet sur lequel j\'ai réalisé la partie front-end', 'development', 757, 897, 'approved'),
(25, 100, 'Start-up', '2022-02-16', 'Voici le site web de l\'agence digital que j\'ai créée et compte continué à développer.', 'management', 302, 302, 'approved'),
(26, 87, 'Refonte graphique', '2022-04-01', 'Voice une refonte graphique d\'une compagnie avec laquelle j\'ai eu le plaisir de travailler récemment.', 'design', 118, 121, 'approved'),
(27, 91, 'Projet freelance', '2022-03-10', 'Petit projet freelance réalisé en collaboration avec des élèves HETIC', 'development', 157, 157, 'approved'),
(28, 76, 'Kahf Tech', '2022-01-28', 'Petit projet freelance pour une plateforme B2B', 'development', 200, 234, 'approved'),
(29, 97, 'Fin Mango', '2022-02-10', 'Site internet pour un projet HETIC', 'design', 177, 179, 'approved'),
(30, 87, 'Wanderers', '2022-02-16', 'Daily challenge d\'un site internet de voyage', 'design', 167, 167, 'approved'),
(32, 101, 'Scootu', '2022-04-03', 'Dans une volonté de prôné des transports à émission réduite,j\'ai réalisé cette landing page lors d\'une projet HETIC', 'design', 0, 0, 'pending'),
(33, 94, 'Bag it up', '2022-02-19', 'Dans ce projet réalisé dans le cadre de mes études à HETIC, j\'ai pu mettre en avant mes compétences de modélisatrice 3D en réalisant les divers produits de la marque grâce à Blender', 'design', 234, 234, 'approved'),
(34, 97, 'Freelance page', '2022-04-01', 'Voulant me lancer dans le freelance, j\'ai créé mon site web afin de m\'aider à prospecter des clients.En outre, avec l\'aide de Kélia Siao, j\'ai pu illustré mon site avec des avatars 3D.', 'management', 885, 1104, 'approved'),
(35, 93, 'Medora', '2021-08-17', 'Durant mon été 21, j\'ai eu la chance de réalisé un stage en tant que UX/UI designer pour une marque de mobilier d\'intérieur.Durant cette période, une refonte graphique du site a été faite : un projet auquel j\'ai pu participer.', 'design', 301, 312, 'approved'),
(36, 100, 'Digitech', '2021-05-14', 'Digitech est un concept d\'app builder réalisé dans le cadre de projet Hetic', 'design', 405, 412, 'approved'),
(37, 93, 'Deliveright', '2021-10-16', 'Deliveright est un projet HETIC prônant une manière éthique de livraison de la nourriture à domicile.L\'idée a abouti à la création d\'une application mobile ', 'design', 329, 401, 'approved'),
(38, 87, 'VACANDA', '2021-07-09', 'Lors de mon stage de 1ere année, j\'ai pu travaillé avec une agence web. L\'un de nos projets fut la création d\'un site internet pour un marque de café.L\'esprit de la marque se retrouve à travers les couleurs utilisées.', 'design', 358, 389, 'approved'),
(39, 95, 'Dopestudio', '2020-01-08', 'Dans le cadre d\'un dailly challenge d\'une promotion antérieur, j\'ai réalisé le développement  web d\'un de leur projet précédent.', 'development', 312, 345, 'approved'),
(40, 92, 'Alpha', '2022-03-17', 'Passionné par l\'espace depuis petit, j\'ai décidé d\'allier mes deux passions lors d\'un projet réalisé en freelance pour une association à laquelle j\'appartiens avec l\'aide d\'un autre héticien pour la partie UI', 'development', 214, 124, 'approved'),
(41, 87, 'BuildCity', '2022-02-28', 'Dans le cadre d\'un projet freelance, j\'ai pu réalisé le design d\'un site internet pour une nouvelle agence d\'architecture basée à londres', 'design', 49, 56, 'approved'),
(42, 88, 'Branding', '2022-04-02', 'Concept de branding pour une agence digitale', 'design', 21, 24, 'approved'),
(43, 94, 'Abécédaire', '2022-03-29', 'Dans une volonté de mettre mes compétences de modélisatrice 3D, je me suis lancé un projet de créer un abécédaire 3D sur forme de logotype.', 'design', 123, 134, 'approved'),
(44, 93, 'Monculous', '2021-06-29', '1er branding concept d\'une série que je compte mettre en place', 'design', 401, 450, 'approved'),
(45, 87, 'The Book Den', '2020-11-07', 'Dans le cadre d\'un projet HETIC tournant autour d\'une librairie, j\'ai réalisé ce concept de site web', 'design', 535, 602, 'approved'),
(46, 97, 'Audio Book', '2022-02-16', 'Petit daily challenge sur le thème des livres audio', 'design', 378, 398, 'approved'),
(47, 102, 'Music Player', '2022-03-18', 'Premier daily challenge d\'une longue série ! Celui d\'aujourd\'hui porte sur le thème d\'une application de musique', 'design', 210, 231, 'approved'),
(48, 87, 'Music Player', '2022-01-09', 'Nouveau daily challenge, nouveau thème ! Cette fois le choix se tourne vers une application mobile de musique', 'design', 276, 289, 'approved'),
(49, 96, 'Bookly', '2022-04-04', 'Je me suis lancé le challenge de développer un concept de site web réalisé en 1ere année pour un projet HETIC', 'development', 0, 0, 'pending'),
(50, 94, 'Treasure hunter', '2022-01-06', 'Concept d\'un site d\'achat de denrées alimentaires dans lequel tous les produits ont été réalisé en 3D', 'design', 23, 110, 'approved'),
(51, 101, 'Foody', '2022-04-03', 'Foody est un projet de démarche UX ! Le but étant de créer un projet de vente de plats déjà cuisinés et leur livraisons à domicile.', 'management', 0, 0, 'pending'),
(52, 94, 'Kawaii', '2021-04-21', 'Passionné par la modélisation 3D, je me lance des petits challenges tels que celui-là.Un projet assez abouti que je souhaitais donc partager avec vous.', 'design', 504, 504, 'approved'),
(53, 99, 'Portfolio', '2021-04-06', 'Réalisation du portfolio d\'un couple de photgraphe', 'development', 129, 248, 'approved'),
(54, 91, 'Playflow', '2022-02-16', 'Voulant mettre mes compétences en modélisation à l\'épreuve, j\'ai réalisé un petit parc d\'attraction à l\'aide de Blender', 'design', 178, 201, 'approved'),
(55, 102, 'Movea', '2022-02-08', 'Lors d\'un stage chez une start up nommée Movea, j\'ai pu participé à la creation du design de la plateforme de streaming', 'design', 345, 403, 'approved'),
(56, 100, 'Exxmon', '2022-04-03', 'Création d\'une plateforme de streaming avec Synerg\'hetic', 'management', 0, 0, 'pending'),
(57, 87, 'Streaming App', '2022-04-03', '3e daily challenge de la série : cette fois on se tourne vers les applications de streaming avec design assez sombre', 'design', 0, 0, 'pending'),
(58, 92, 'Movie', '2022-01-25', 'Développement d\'une landing page provenant d\'un daily challenge réalisé par un autre héticien', 'development', 234, 243, 'approved'),
(59, 87, 'SnK', '2021-02-24', 'Ce projet est la concrétisation de mes études à HETIC. Une application e-commerce de ventes de chaussures afin d\'accompagner le bussiness florissant de revente de chaussures monté par mon frère.', 'design', 430, 430, 'approved'),
(60, 88, 'Ontagames', '2020-05-14', 'Lors de ce projet freelance, j\'ai pu réalisé la refonte graphique d\'un site de vente de jeux vidéo en ligne.', 'design', 309, 349, 'approved'),
(61, 93, 'Filtres', '2022-03-03', 'Dans une volonté de mettre mes compétences d\'UX designer, je me suis intéressé aux filtres utilisés sur une application de vente d\'appareils informatiques. Le but étant de s\'assurer que l\'expérience utilisateur soit la plus simple et fluide possible', 'management', 219, 236, 'approved'),
(62, 94, 'Super Nana', '2022-04-04', 'Encore un autre petit projet 3D que je souhaitais partager afin de stimuler mes compétences sur Blender', 'design', 0, 0, 'pending'),
(63, 90, 'Oshika', '2022-03-04', 'Création d\'une plateforme de prêt-à-porter haut de gamme avec son application mobile ', 'management', 575, 767, 'approved'),
(64, 98, 'StandForUkraine', '2022-04-04', 'Dans une période compliquée où un guerre que nous n\'aurions jamais cru possible éclate, il est important de montrer notre soutien aux personnes qui en ont besoin. C\'est pourquoi j\'ai crée ce petit projet.', 'development', 0, 0, 'pending'),
(66, 94, 'Sculpture', '2022-04-01', 'Nouvelle modélisation 3D pour faire travailler mes compétences', 'design', 123, 124, 'approved'),
(68, 102, 'Music player', '2022-04-04', 'Premier daily challengee ! A la suite d\'une recommendation, je me lance à mon tour dans le principe des daily challenge. La thématique du jour : une application de musique en streaming !', 'design ', 0, 0, 'pending'),
(71, 90, 'Nike', '2022-02-03', 'Lors de mon stage d\'été chez Nike, j\'ai eu la chance de participé à la refonte du site web de la marque', 'design', 145, 167, 'approved'),
(82, 92, 'Energy', '2021-02-04', 'Petit projet personnel dans lequel j\'ai développé une landing page pour un site de ventes de panneaux solaires', 'development', 234, 234, 'approved'),
(84, 93, 'Illustration', '2022-04-04', 'Travail graphique réalisé avec Adobe illustrator ', 'design', 0, 0, 'pending'),
(85, 87, 'FitBit', '2022-04-04', 'Refonte graphique du site de la salle de sport de mon quartier lors d\'un projet freelance ', 'development', 0, 0, 'pending'),
(86, 87, 'Alibi Creative', '2021-04-22', 'Création d\'une agence web dans le cadre d\'un projet HETIC', 'management', 401, 403, 'approved'),
(87, 88, 'Brightspeed', '2022-04-04', 'Idée de marque', 'design', 0, 0, 'approved'),
(88, 97, 'Kion', '2022-04-04', 'Idée de marque', 'design', 0, 0, 'approved'),
(103, 87, 'Lark Home', '2021-03-31', 'Projet personnel sur la thématique d\'une agence immobilière. Le but étant de me faire progresser sur la partie front end, j\'ai donc développé le site entièrement', 'development', 378, 402, 'approved'),
(104, 88, 'Luck', '2022-03-23', 'Petit projet freelance pour du merchandizing', 'design', 12, 40, 'approved'),
(105, 130, 'NFT', '2022-04-05', 'J\'ai créée cette application pour permettre aux utilisateurs de s\'intéresser aux NFTs, les projets qu\'il y a sous-jacent etc. ', NULL, 0, 0, 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `url` varchar(255) NOT NULL,
  `preview` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `resource`
--

INSERT INTO `resource` (`id`, `project_id`, `type`, `url`, `preview`) VALUES
(19, 5, 'image', 'https://dcassetcdn.com/design_img/923714/184280/184280_5247206_923714_image.jpg', 1),
(20, 6, 'image', 'https://miro.medium.com/max/1400/1*eWbNRY_UnGFJC5YqcqBSwA.jpeg', 1),
(21, 6, 'image', 'https://miro.medium.com/max/1400/1*S_ETYVT3lI-CmI50GVg_NQ.png', 0),
(22, 6, 'image', 'https://miro.medium.com/max/1400/0*niBTQNTaEI6iy6dQ', 0),
(23, 6, 'image', 'https://miro.medium.com/max/1400/1*TGR6RIw9QKP1lqJWlPY0bg.jpeg', 0),
(24, 6, 'image', 'https://miro.medium.com/max/1400/1*1hd9WFBam7wxesTR61Nh-Q.png', 0),
(25, 7, 'video', 'https://www.youtube.com/watch?v=c-6AaS7997w', 0),
(26, 7, 'image', 'https://i.ytimg.com/vi/c-6AaS7997w/maxresdefault.jpg', 1),
(27, 8, 'image', 'https://cdn5.f-cdn.com/files/download/87581499/f6f761.jpg', 1),
(28, 9, 'image', 'https://assets.awwwards.com/awards/sites_of_the_day/2022/03/potion-1.jpg', 1),
(29, 9, 'image', 'https://assets.awwwards.com/awards/sites_of_the_day/2022/03/potion-3.jpg', 0),
(30, 9, 'video', 'https://assets.awwwards.com/awards/element/2022/03/62447ef2a1f9c942011073.mp4', 0),
(31, 11, 'image', 'https://cdn.dribbble.com/users/1259559/screenshots/14007200/media/4e9620975080731746eeef515d8566c0.jpg?compress=1&resize=1200x900&vertical=top', 1),
(32, 10, 'image', 'https://assets.awwwards.com/awards/sites_of_the_day/2022/03/likely-stori-2022-1.jpg', 1),
(33, 10, 'image', 'https://assets.awwwards.com/awards/sites_of_the_day/2022/03/likely-stori-2022-2.jpg', 0),
(34, 10, 'image', 'https://assets.awwwards.com/awards/media/cache/thumb_834_598/element/2022/04/6246e37ecd09e464208312.jpg', 0),
(35, 10, 'video', 'https://assets.awwwards.com/awards/element/2022/04/6246e4fd88537006583891.mp4', 0),
(36, 12, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15871130/media/9a8ae8263ee90fce37cbd2f16feeb9ed.jpg?compress=1&resize=1200x900&vertical=top', 1),
(37, 12, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15871130/media/5f9facf36bb1986ad69e3a5a7c3ac467.jpg?compress=1&resize=1000x750&vertical=top', 0),
(38, 13, 'image', 'https://assets.awwwards.com/awards/sites_of_the_day/2022/03/visuals-brybry-1.jpg', 1),
(39, 13, 'image', 'https://assets.awwwards.com/awards/sites_of_the_day/2022/03/visuals-brybry-02.jpg', 0),
(40, 13, 'video', 'https://assets.awwwards.com/awards/element/2022/03/62432b54bc45d992152471.mp4', 0),
(41, 13, 'video', 'https://assets.awwwards.com/awards/element/2022/03/62432f64ce6c8944561993.mp4', 0),
(42, 14, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15252139/media/b8503388fa63a5d51be2a2d06c0be295.jpg?compress=1&resize=1200x900&vertical=top', 1),
(47, 18, 'image', 'https://cdn.dribbble.com/users/6234/screenshots/16358186/media/732fcbf94c177a0e7665b0b72fad0526.png?compress=1&resize=1200x900&vertical=top', 1),
(54, 19, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/14412386/media/3b19ecdaafa3ee875fbb4348a50c50e8.jpg?compress=1&resize=1000x750&vertical=top', 1),
(55, 20, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/14412386/media/3b19ecdaafa3ee875fbb4348a50c50e8.jpg?compress=1&resize=1000x750&vertical=top', 1),
(56, 20, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15405230/media/6f2243624a306b6c6bb8d7cb0554c77c.jpg?compress=1&resize=1200x900&vertical=top', 0),
(57, 21, 'image', 'https://cdn.dribbble.com/users/2253180/screenshots/16465396/media/ff66afe9cb3ecf50e12806b6984bd598.jpg?compress=1&resize=1000x750&vertical=top', 1),
(58, 21, 'image', 'https://cdn.dribbble.com/users/2253180/screenshots/16465396/media/1c5a46dedd6773ed61437d01437d5b8d.jpg?compress=1&resize=1200x900&vertical=top', 0),
(61, 23, 'image', 'https://cdn.dribbble.com/users/2253180/screenshots/16169012/media/246c89c5374796927d9fa5305aba6ab5.jpg?compress=1&resize=1000x750&vertical=top', 1),
(62, 23, 'image', 'https://cdn.dribbble.com/users/2253180/screenshots/16169012/media/063cda39008f691fd2ba6bd273fa0bb9.jpg?compress=1&resize=1200x900&vertical=top', 0),
(63, 24, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15096546/media/4fb252462972d488d1375c524c2f7b03.jpg?compress=1&resize=1000x750&vertical=top', 1),
(64, 25, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15016610/media/7b214fa3635c7727d860e6bfb55f282f.jpg?compress=1&resize=1200x900&vertical=top', 1),
(65, 25, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15016610/media/65e1efce1071f243ba5ac6173467649a.jpg?compress=1&resize=1000x750&vertical=top', 0),
(66, 26, 'image', 'https://cdn.dribbble.com/users/332776/screenshots/17025872/media/8f358ad559efb74dae2fecf3fa1ecf97.jpg?compress=1&resize=1000x750&vertical=top', 1),
(67, 26, 'video', 'https://cdn.dribbble.com/users/332776/screenshots/17025872/media/f2759ad07e1987d717ba84444d0996fb.mp4', 0),
(68, 27, 'image', 'https://cdn.dribbble.com/users/332776/screenshots/17203673/media/66cddec15bbecafd7ea609d5b2eaaafc.jpg?compress=1&resize=1000x750&vertical=top', 1),
(69, 27, 'image', 'https://cdn.dribbble.com/users/332776/screenshots/17203673/media/d28ed0c54efc16c2192ba334a31df8d7.jpg?compress=1&resize=1000x750&vertical=top', 0),
(70, 27, 'image', 'https://cdn.dribbble.com/users/332776/screenshots/17203673/media/575a53421f7b4d0e2f69dd87fae5fe18.jpg?compress=1&resize=1000x750&vertical=top', 0),
(71, 27, 'video', 'https://cdn.dribbble.com/users/332776/screenshots/17203673/media/6a21876ebd1d1ab42ad0b76f0afa2fa6.mp4', 0),
(72, 28, 'image', 'https://cdn.dribbble.com/users/1327459/screenshots/15793843/media/0b6101cebe1bd86281c8e83accd86824.png?compress=1&resize=1200x900&vertical=top', 1),
(73, 29, 'image', 'https://cdn.dribbble.com/users/1998175/screenshots/15646875/media/499bedf9c7a56c8f4ac28a813558b41b.png?compress=1&resize=1000x750&vertical=top', 1),
(74, 29, 'image', 'https://cdn.dribbble.com/users/1998175/screenshots/15646875/media/87a3e6d738a77f90030ca1f32faf1feb.png?compress=1&resize=1000x750&vertical=top', 0),
(75, 29, 'video', 'https://cdn.dribbble.com/users/1998175/screenshots/15646875/media/aa44110235a9055a42a2bc88170eb2fe.mp4', 0),
(76, 30, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/14267126/media/f620f6d53c73eea457078d41bdd16cc1.jpg?compress=1&resize=1200x900&vertical=top', 1),
(77, 30, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/14267126/media/a5ccc92fb99ed38fd802c46c9d416616.jpg?compress=1&resize=1000x750&vertical=top', 0),
(81, 32, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15314217/media/0da79ffcbd424dbdf50f14cae1496f6c.jpg?compress=1&resize=1000x750&vertical=top', 1),
(82, 32, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15314217/media/9d4bcc0726fd50b5d6f5920b82649bfc.jpg?compress=1&resize=1000x750&vertical=top', 0),
(83, 32, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15314217/media/4aaf13fd5ac269a68103bd39f915c547.jpg?compress=1&resize=1200x900&vertical=top', 0),
(84, 33, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15558478/media/0e181c7506d0591729b695631d2a9107.jpg?compress=1&resize=1000x750&vertical=top', 1),
(85, 33, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15558478/media/11bbc9aca60b0852943b56a4498932c7.jpg?compress=1&resize=1000x750&vertical=top', 0),
(86, 34, 'image', 'https://cdn.dribbble.com/users/6047818/screenshots/15705859/media/c4ef4b80d903318483b06ceabf26714e.png?compress=1&resize=1200x900&vertical=top', 1),
(87, 35, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15103214/media/190d9ca7811077d4947f1d33755456e0.jpg?compress=1&resize=1000x750&vertical=top', 1),
(88, 35, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15103214/media/589a92d085def53047730e29a5dbdc92.jpg?compress=1&resize=1000x750&vertical=top', 0),
(89, 35, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15103214/media/be86eb1affe8d9d252e2c88abbddfeba.jpg?compress=1&resize=1200x900&vertical=top', 0),
(90, 36, 'image', 'https://cdn.dribbble.com/users/1254731/screenshots/16322776/media/5d6c015d982407ee1b077730de765adb.png?compress=1&resize=1000x750&vertical=top', 1),
(91, 36, 'image', 'https://cdn.dribbble.com/users/1254731/screenshots/16322776/media/f5b91a7b51db002dd24afb587e3d275d.jpg?compress=1&resize=1200x900&vertical=top', 0),
(92, 37, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15266020/media/32b5b6916003ff9867f1649ed085ace3.jpg?compress=1&resize=1000x750&vertical=top', 1),
(93, 37, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15266020/media/6ba7600a6f120499eaf236fbb76670d0.jpg?compress=1&resize=1000x750&vertical=top', 0),
(94, 37, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15266020/media/48e0cc23ac8f475bdee252226e3b7bf2.jpg?compress=1&resize=1200x900&vertical=top', 0),
(95, 37, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15266020/media/bb2c727a482a71263989561c4a427518.jpg?compress=1&resize=1000x750&vertical=top', 0),
(96, 38, 'image', 'https://cdn.dribbble.com/users/1615584/screenshots/15266020/media/bb2c727a482a71263989561c4a427518.jpg?compress=1&resize=1000x750&vertical=top', 1),
(97, 38, 'image', 'https://cdn.dribbble.com/users/702789/screenshots/14339976/media/bb64eab884714f5710a1fe08255401ea.mp4', 0),
(98, 39, 'image', 'https://cdn.dribbble.com/users/2064121/screenshots/14859340/media/e677620311e982ee3b29c5cc2f2ffb40.png?compress=1&resize=1200x900&vertical=top', 1),
(99, 40, 'image', 'https://cdn.dribbble.com/users/702789/screenshots/15061198/media/b7178812614899f1165ad57bdd998d5e.png?compress=1&resize=1000x750&vertical=top', 1),
(100, 40, 'image', 'https://cdn.dribbble.com/users/702789/screenshots/15061198/media/861d81c3abaf631ef0964a40d38b54eb.mp4', 0),
(101, 41, 'image', 'https://cdn.dribbble.com/users/702789/screenshots/10834386/media/77b8ad82a7c4652d423928fa72dae7f4.png?compress=1&resize=1000x750&vertical=top', 1),
(102, 41, 'video', 'https://cdn.dribbble.com/users/702789/screenshots/10834386/media/173bc2e75ee1d653a51d05e2dc492b05.mp4', 0),
(103, 42, 'image', 'https://cdn.dribbble.com/users/2543315/screenshots/16765731/media/c390676e737d8ac3f298aed5af1d37ae.png?compress=1&resize=1200x900&vertical=top', 1),
(104, 43, 'image', 'https://cdn.dribbble.com/users/60166/screenshots/16953545/media/6046ed03ade41de8c2eac342c688a348.jpg?compress=1&resize=1200x900&vertical=top', 1),
(105, 43, 'image', 'https://cdn.dribbble.com/users/60166/screenshots/17221475/media/70b9b101a4cd3ebcb5fcb44ada6af1d4.jpg?compress=1&resize=1200x900&vertical=top', 0),
(106, 43, 'image', 'https://cdn.dribbble.com/users/60166/screenshots/17610068/media/4cbea5351f3f12a22dfb63c04658196d.jpg?compress=1&resize=1200x900&vertical=top', 0),
(107, 43, 'image', 'https://cdn.dribbble.com/users/60166/screenshots/17217488/media/02728f99e977931182d683b6792a17b1.jpg?compress=1&resize=1200x900&vertical=top', 0),
(108, 44, 'image', 'https://cdn.dribbble.com/users/6124866/screenshots/17649943/media/6f95dc11a9c180bca5913f96b0ef5db7.jpg?compress=1&resize=1200x900&vertical=top', 1),
(109, 45, 'image', 'https://cdn.dribbble.com/users/282315/screenshots/16279204/media/a67871945d09c4ca121e14aabbb14e4a.png?compress=1&resize=1000x750&vertical=top', 1),
(110, 45, 'image', 'https://cdn.dribbble.com/users/282315/screenshots/16279204/media/d37d6c7cf0f971675d23c18251377dda.png?compress=1&resize=1200x900&vertical=top', 0),
(111, 45, 'image', 'https://cdn.dribbble.com/users/282315/screenshots/16279204/media/b8b874fe51b7ca711ed0dfb9f83ea43c.png?compress=1&resize=1000x750&vertical=top', 0),
(112, 45, 'image', 'https://cdn.dribbble.com/users/282315/screenshots/16279204/media/d688a84c565e0915e916ddc082d3d008.png?compress=1&resize=1000x750&vertical=top', 0),
(113, 46, 'image', 'https://cdn.dribbble.com/users/2303657/screenshots/16897169/media/80e2bd8c039aa393edddc3a09f7c2714.png?compress=1&resize=1200x900&vertical=top', 1),
(114, 47, 'image', 'https://cdn.dribbble.com/users/2303657/screenshots/14141945/media/addb9723780048dea0c2c7d62533c388.png?compress=1&resize=1200x900&vertical=top', 1),
(115, 48, 'image', 'https://cdn.dribbble.com/users/1925207/screenshots/7272385/media/883d22e48296cf58fc4b8931ebb41a16.png?compress=1&resize=1200x900&vertical=top', 1),
(116, 49, 'image', 'https://cdn.dribbble.com/users/5031392/screenshots/16642619/media/de01f7b0606aed796366c52063a39f1d.png?compress=1&resize=1000x750&vertical=top', 1),
(117, 49, 'video', 'https://cdn.dribbble.com/users/5031392/screenshots/16642619/media/30b2396166a3deba4b5900940ab87a3b.mp4', 0),
(118, 49, 'image', 'https://cdn.dribbble.com/users/5031392/screenshots/16642619/media/4e8ea86b282c010dd7c5b4f53472a278.png?compress=1&resize=1000x750&vertical=top', 0),
(119, 50, 'image', 'https://cdn.dribbble.com/users/6047818/screenshots/17351286/media/62cc251971a3448ad7645bf39caf030a.png?compress=1&resize=1000x750&vertical=top', 1),
(120, 51, 'image', 'https://cdn.dribbble.com/users/6175319/screenshots/15856926/media/f8bbd8e466de3af9ea252bbed81c8e8f.jpg?compress=1&resize=1200x900&vertical=top', 1),
(121, 52, 'image', 'https://cdn.dribbble.com/userupload/2501677/file/original-15bcba0b46476e79b5a460c447167789.jpg?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 1),
(122, 53, 'video', 'https://cdn.dribbble.com/users/688456/screenshots/13846804/media/bd66931f438db478e29bcd10a8d80fde.mp4', 1),
(123, 54, 'image', 'https://cdn.dribbble.com/users/323673/screenshots/14212802/media/ba8d422f41dbd7f80e0305a54fbe0351.png?compress=1&resize=800x600&vertical=top', 0),
(124, 54, 'image', 'https://cdn.dribbble.com/users/323673/screenshots/14212802/media/2b3ad2ab68eecff3aa2fff0c73c0072e.png?compress=1&resize=1200x900&vertical=top', 1),
(125, 54, 'image', 'https://cdn.dribbble.com/users/323673/screenshots/14212802/media/c8aae23b6c9db65aee30253a0cbd094b.png?compress=1&resize=800x600&vertical=top', 0),
(126, 55, 'image', 'https://cdn.dribbble.com/users/6337227/screenshots/17230478/media/e4379e3065e4ba2bea8c4767a2dbf599.png?compress=1&resize=1200x900&vertical=top', 1),
(127, 56, 'image', 'https://cdn.dribbble.com/users/5902550/screenshots/15558638/media/53b3cf66d9114339eda79a30724aaf37.png?compress=1&resize=1200x900&vertical=top', 1),
(128, 57, 'image', 'https://cdn.dribbble.com/users/9684942/screenshots/17904556/media/a48e9d42649c6bcf1927c6644acc4f38.jpg?compress=1&resize=1000x750&vertical=top', 1),
(129, 57, 'image', 'https://cdn.dribbble.com/users/9684942/screenshots/17904556/media/f90bcd27da383bae42b72ef6bea33711.jpg?compress=1&resize=1200x900&vertical=top', 0),
(130, 57, 'image', 'https://cdn.dribbble.com/users/9684942/screenshots/17904556/media/040c280c21f3c25cf7cee0fdfc33f48d.jpg?compress=1&resize=1000x750&vertical=top', 0),
(131, 57, 'image', 'https://cdn.dribbble.com/users/9684942/screenshots/17904556/media/8a5cccf8b099c48075f11f5a168c21c4.jpg?compress=1&resize=1000x750&vertical=top', 0),
(132, 57, 'image', 'https://cdn.dribbble.com/users/9684942/screenshots/17904556/media/4d83600673b96faff461e120fd75d686.jpg?compress=1&resize=1000x750&vertical=top', 0),
(133, 57, 'image', 'https://cdn.dribbble.com/users/9684942/screenshots/17904556/media/7cd8d99f1e9b4fa2699ffd4433ffd6b5.jpg?compress=1&resize=1000x750&vertical=top', 0),
(134, 58, 'image', 'https://cdn.dribbble.com/users/1575908/screenshots/7481309/media/8c9c4b4ca4421234f98643199054813c.jpg?compress=1&resize=1200x900&vertical=top', 1),
(135, 59, 'image', 'https://cdn.dribbble.com/users/2725593/screenshots/17918855/media/031cc52f7cbfebcb8ec9d31476dfc808.png?compress=1&resize=1200x900&vertical=top', 1),
(136, 60, 'image', 'https://cdn.dribbble.com/users/6484210/screenshots/17919637/media/6dee72e3d53b9e324f0fc1d28b3b3245.png?compress=1&resize=1000x750&vertical=top', 1),
(137, 60, 'image', 'https://cdn.dribbble.com/users/6484210/screenshots/17919637/media/0f0255176eb786657d5880c165b4d6c5.png?compress=1&resize=1200x900&vertical=top', 0),
(138, 60, 'image', 'https://cdn.dribbble.com/users/6484210/screenshots/17919637/media/e914f1c48b3209907df08f1758d3c70b.png?compress=1&resize=1000x750&vertical=top', 0),
(139, 61, 'image', 'https://cdn.dribbble.com/users/4505805/screenshots/17920785/media/15b4adf5ca0332250a401135266ef020.png?compress=1&resize=1000x750&vertical=top', 1),
(140, 61, 'image', 'https://cdn.dribbble.com/users/4505805/screenshots/17920785/media/122376a289ca8eb1bc246ae9eae573ff.png?compress=1&resize=1000x750&vertical=top', 0),
(141, 61, 'image', 'https://cdn.dribbble.com/users/4505805/screenshots/17920785/media/94c58e8df72556d13b4b9a881cfc9319.png?compress=1&resize=1200x900&vertical=top', 0),
(142, 62, 'image', 'https://cdn.dribbble.com/users/2545690/screenshots/17915257/media/c673129f3e48b3bbd0cc4590c301190c.png?compress=1&resize=800x600&vertical=top', 1),
(143, 63, 'image', 'https://cdn.dribbble.com/users/5775830/screenshots/17912704/media/d90fd4d079be63ad2baa689246a63b2d.jpg?compress=1&resize=800x600&vertical=top', 1),
(144, 64, 'image', 'https://cdn.dribbble.com/userupload/2548535/file/original-357c3923c7712daada74f859a2babc6b.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 1),
(145, 66, 'image', 'https://cdn.dribbble.com/userupload/2545911/file/original-2cccfda357b2bff04aa2e251706cffb9.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1147', 1),
(146, 66, 'video', 'https://cdn.dribbble.com/userupload/2537470/file/original-78f93ae2f1ba8c7a0ca161fe951a0c30.mp4', 0),
(147, 68, 'image', 'https://cdn.dribbble.com/users/5590809/screenshots/17920365/media/7925142bdd2e55e9a14102b2312005cf.png?compress=1&resize=1000x750&vertical=top', 1),
(148, 68, 'video', 'https://cdn.dribbble.com/users/5590809/screenshots/17920365/media/90882846b3684ce000919f449c6c291b.mp4', 0),
(149, 68, 'image', 'https://cdn.dribbble.com/users/5590809/screenshots/17920365/media/4c69242f48bc5470367b4efb4afe1032.png?compress=1&resize=1000x750&vertical=top', 0),
(150, 68, 'image', 'https://cdn.dribbble.com/users/5590809/screenshots/17920365/media/88a51b85f641650bfe6fb977c772576f.png?compress=1&resize=1000x750&vertical=top', 0),
(151, 68, 'image', 'https://cdn.dribbble.com/users/5590809/screenshots/17920365/media/a6faef1a9a4b8775f5f31844f12d3439.png?compress=1&resize=1000x750&vertical=top', 0),
(152, 71, 'image', 'https://cdn.dribbble.com/userupload/2546873/file/original-67de6c822d7d743492d803cdd1f57631.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 1),
(153, 71, 'video', 'https://cdn.dribbble.com/userupload/2546869/file/original-390552d8ad3f1bb8d6824af947ed92f4.gif?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 0),
(154, 71, 'video', 'https://cdn.dribbble.com/userupload/2546870/file/original-9a37b6a6c0bcb898c333461579ff21e3.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 0),
(155, 71, 'image', 'https://cdn.dribbble.com/userupload/2546871/file/original-64c8e592345f1f5109cd46f156e7720e.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 0),
(156, 71, 'image', 'https://cdn.dribbble.com/userupload/2546872/file/original-2146933ad07041e0dc3c9f2504b7391e.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 0),
(173, 82, 'image', 'https://cdn.dribbble.com/users/2985163/screenshots/17918999/media/a8065d86d3de12f824332ce1c6541789.png?compress=1&resize=800x600&vertical=top', 1),
(174, 82, 'image', 'https://cdn.dribbble.com/users/2985163/screenshots/17918999/media/6ded1325207f7813ec8dd4de01716cdf.png?compress=1&resize=1200x900&vertical=top', 0),
(175, 84, 'image', 'https://cdn.dribbble.com/users/484320/screenshots/17922979/media/25ab70935c0b6b5df8c7e44a2489a110.jpg?compress=1&resize=1000x750&vertical=top', 0),
(176, 84, 'image', 'https://cdn.dribbble.com/users/484320/screenshots/17922979/media/e70e64a7ec825cf300acaea4151b5e87.jpg?compress=1&resize=1200x900&vertical=top', 1),
(177, 85, 'image', 'https://cdn.dribbble.com/userupload/2548569/file/original-20a1486fde422b0b7f7b0758385ad992.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 1),
(178, 85, 'image', 'https://cdn.dribbble.com/userupload/2548568/file/original-70b340717c3871e3fdd1e8683a80bfc5.png?filters:format(webp)?filters%3Aformat%28webp%29=&compress=1&resize=1600x1200', 0),
(179, 86, 'image', 'https://cdn.dribbble.com/users/4817709/screenshots/17918073/media/7d746686d7133a9bfc223cd97acf0cf8.png?compress=1&resize=1000x750&vertical=top', 1),
(180, 86, 'image', 'https://cdn.dribbble.com/users/4817709/screenshots/17918073/media/3fec16e27615a5b07815ef0be0b3fc26.png?compress=1&resize=1200x900&vertical=top', 0),
(181, 87, 'image', 'https://cdn.dribbble.com/users/1371492/screenshots/17023249/media/ec488176751a13436da6d80f1f0858f2.png?compress=1&resize=1200x900&vertical=top', 1),
(182, 88, 'image', 'https://cdn.dribbble.com/users/3827677/screenshots/16799866/media/a6890f9ef7216f1937f450ea553ea06b.png?compress=1&resize=1200x900&vertical=top', 1),
(183, 88, 'video', 'https://cdn.dribbble.com/users/3827677/screenshots/16799866/media/7a1376fe44b6ba05afcfe08e6fe20c60.mp4', 0),
(234, 103, 'image', 'https://cdn.dribbble.com/users/6487750/screenshots/17929753/media/5d51914d3e5e02ffc6775fd919bd058d.jpeg?compress=1&resize=1200x900&vertical=top', 1),
(235, 103, 'image', 'https://cdn.dribbble.com/users/6487750/screenshots/17929753/media/a2fbc1bb3fb66b1e4a0d3e2b5298fb3b.jpeg?compress=1&resize=1000x750&vertical=top', 0),
(236, 103, 'image', 'https://cdn.dribbble.com/users/6487750/screenshots/17929753/media/a4f12538c5222b84146636a8b50d316e.jpeg?compress=1&resize=1000x750&vertical=top', 0),
(237, 103, 'image', 'https://cdn.dribbble.com/users/6487750/screenshots/17929753/media/2ada9a10d1f52eef52d1b8318d824fca.jpeg?compress=1&resize=1000x750&vertical=top', 0),
(238, 103, 'image', 'https://cdn.dribbble.com/users/6487750/screenshots/17929753/media/ef16c6c2f9359bb00ae55e209a1bfee2.jpeg?compress=1&resize=1000x750&vertical=top', 0),
(239, 103, 'image', 'https://cdn.dribbble.com/users/6487750/screenshots/17929753/media/ad74cc1831334f2d4704c92db45d5485.jpeg?compress=1&resize=1000x750&vertical=top', 0),
(240, 105, 'image', 'https://cdn.dribbble.com/users/3840995/screenshots/17919390/media/b18114658f023bbe5e4fc2b103d07784.jpg?compress=1&resize=1200x900&vertical=top', 1),
(241, 105, 'image', 'https://cdn.dribbble.com/users/3840995/screenshots/17919390/media/bcbd4d44182ccb48a16de344dd09f202.jpg?compress=1&resize=1000x750&vertical=top', 0),
(242, 105, 'image', 'https://cdn.dribbble.com/users/3840995/screenshots/17919390/media/f75abff2e1b8d46ed4bec309559bfe01.jpg?compress=1&resize=1000x750&vertical=top', 0),
(243, 104, 'image', 'https://cdn.dribbble.com/users/58356/screenshots/17927765/media/137b7d275317f8c12e115958f5c6cc7d.png?compress=1&resize=1200x900&vertical=top', 1),
(244, 104, 'image', 'https://cdn.dribbble.com/users/58356/screenshots/17927765/media/dffbe5d5a8bc92c5a8922aa418468060.png?compress=1&resize=1000x750&vertical=top', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(7) DEFAULT 'student',
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `faculty` varchar(32) DEFAULT NULL,
  `year` int(1) DEFAULT NULL,
  `description` text,
  `phone_number` varchar(10) DEFAULT NULL,
  `profile_picture_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `password`, `role`, `firstname`, `lastname`, `faculty`, `year`, `description`, `phone_number`, `profile_picture_url`) VALUES
(76, 'thanh-long.pham@hetic.net', '$2y$10$/a8qeDhsClXCDFEZ4a1Ok.Eh7N3Q2SOEJTYjPee9h4uGU.wK7Yv56', 'admin', 'Thanh-Long', 'PHAM', 'H', 4, 'Développeur aguéri, j\'ai intégré Hetic dans le but de parfaire mes compétences en code. J\'appris particulièrement le react.', '0757130276', 'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(87, 'joakim.domngang@hetic.net', '$2y$10$M1nRi/6VkfM0eXXEj02hNurbk7KUrkPkym2/oB1zpjOATyJ.qlCXO', 'admin', 'Joakim', 'DOMNGANG', 'H', 2, 'Anciennement étudiant en ingénierie, j\'ai décidé de me réorienter pour découvrir un domaine qui me passionne.Avec un atrait pour le côté visuelle de la communication, j\'ai naturellement développé un intérêt pour le design web et le graphisme.', '0757130278', 'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(88, 'noe.meunier@hetic.net', '$2y$10$3f8w6WusXAsw.5D7JdwqouI0CWknhYbehyLFV736/SB3RdHeBRLF.', 'admin', 'Noé', 'MEUNIER', 'H', 2, 'Passionné par le design web depuis mon adolescence,j\'ai rejoins Hetic pour développer mes compétences en parallèle de mon activité de freelance ', '0757130279', 'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(89, 'antoine.schirr@hetic.net', '$2y$10$3mi/5XDYl3pceZ4BGlFfj.IvkBHz5IzIo5Mhc3/YCBumYtZH8WmnC', 'admin', 'Antoine', 'SCHIRR', 'Mastère cybersécurité', 1, 'Intéressé par le monde du digital, j\'ai opté pour une nouvelle aspect de ce domaine : la cybersécurité', '0757130275', 'https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(90, 'arnaud.thomas@hetic.net', '$2y$10$42fewfMoE/rj01PXi.qogeHzMSQU2tuYYDhOMRZImnhM8SYEY00uy', 'student', 'Arnaud', 'THOMAS', 'H', 3, 'Intéressé par le monde du digital,j\'ai rejoint Hetic pour en découvrir plus. Ici, j\'ai trouvé une passionné pour la communication dans le monde du luxe', '0757137307', 'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(91, 'louis.leveneur@hetic.net', '$2y$10$dFw1HlY3K35l7XWKbUYzL.UnzOKitKISvsNF8qOJsFtQy.2AJdgqi', 'student', 'Louis', 'LEVENEUR', 'WEB', 1, 'Passionné par le développement web, j\'ai appris à coder de mes propres moyens. Aujourd\'hui, je ne cesse d\'agrandir mes connaissances sur de nombreux langages tel que le three.js', '0757137308', 'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(92, 'romain.monfret@hetic.net', '$2y$10$qhIKp90mI2gjHlpSU1EfGu3e4q33Fvhy95rRuDsrk/l7Yd6l06gQy', 'student', 'Romain', 'MONFRET', 'Mastère CTO', 2, 'Intéressé par le code depuis longtemps, j\'ai rejoint le mastère CTO & Tech Lead pour accroître mes connaissances', '0757137306', 'https://images.pexels.com/photos/1681010/pexels-photo-1681010.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(93, 'lauraine.arnould@hetic.net', '$2y$10$lBGYMgzXbQtLImO8BB.fPeXf2Tl/ty2nLF08CT22jxpBssYDtpf2O', 'student', 'Lauraine', 'ARNOULD', 'Mastère UX', 2, 'Mon oeil prononcé pour le graphisme lié à mon intérêt pour les outils digitaux m\'ont mené vers le mastère UX & Marketing digital', '0757137305', 'https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(94, 'kelia.siao@hetic.net', '$2y$10$DsDxDOJv29IvqXuTpTmJAeZcVBt1Zl7kuj/bTlqnxBrhX3yvd6dnW', 'student', 'Kelia', 'SIAO', '3D', 1, 'Le monde de la technologie m\'a toujours intriguée : des possibilités infinies !', '0757137304', 'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(95, 'lucas.boucher@hetic.net', '$2y$10$3D/Efh0CQH5ouMVmTjZldOL8fX6r4vwy9QDS5MjxOOYFZGkwfQ0iq', 'student', 'Lucas', 'BOUCHER', 'Mastère CTO ', 1, 'Découvrir de nouvelles technologies est devenu une passion : faconner la technologie de demain commence par coder ingénieusement !', '0757137300', 'https://images.pexels.com/photos/846741/pexels-photo-846741.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(96, 'dany.leguy@hetic.net', '$2y$10$SENhk/RAUeO8ZAPH/kFFKOiw7JPo.aFg8pvCVij0tyjDhNEJte8sW', 'student', 'Dany', 'LEGUY', 'WEB', 4, 'Après être passer par la médecine et la biologie, j\'ai maintenant jeter mon dévolu sur le milieu de la technologie. A 24 ans, je suis fier de mon parcours et d\'avoir pu trouver une chose qui me passionne : le développement web.', '0757130742', 'https://images.pexels.com/photos/450214/pexels-photo-450214.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(97, 'alexandra.bernard@hetic.net', '$2y$10$kwQNPWzu1tSQF/exQ73I2OU7kCxcDQFW2x3oGAflYCe39q.E/RFEe', 'student', 'Alexandra', 'BERNARD', 'H', 3, '\"Marketeuse\" dans l\'âme,je compte me spécialiser dans le marketing digital plus tard!', '0757130741', 'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(98, 'alexandre.hoyau@hetic.net', '$2y$10$pWENxyOS1W6Rjsi4H/btIOvur3gQt6tluthHzMuQAijdbV9OtR2ki', 'student', 'Alexandre', 'HOYAU', 'Mastère data', 1, 'C\'est parce que les datas régissent le monde que j\'ai voulu faire partie de cet \"éco-système\" afin de mieux comprendre les enjeux du future.', '0757130740', 'https://images.pexels.com/photos/1680175/pexels-photo-1680175.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(99, 'christophe.francisco@hetic.net', '$2y$10$C7DYmpc4G7amsaSwSuaORelJtV/XCgPatcmqraWW.UqsEs3Bhgo1C', 'student', 'Christophe', 'FRANCISCO', 'WEB', 3, 'A l\'âge de 15 ans, j\'ai commencé à me demander comment était fait les sites internets. Et maintenant, j\'entame ma 3e année de bachelor WEB afin de pouvoir apprendre à construire des sites moi-même.', '0757131519', 'https://images.pexels.com/photos/868113/pexels-photo-868113.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(100, 'louis-christophe.thirion@hetic.net', '$2y$10$1KPNpWqgUS5b7rQXIVv62.TDGPZ0vEOhgZ3Z4pRZIN.9qp3kwCisW', 'student', 'Louis-Christophe', 'THIRION', 'H', 5, 'Poussé par une volonté entrepreneuriale, je compte monter ma start-up à ma sortie d\'Hetic', '0757131518', 'https://images.pexels.com/photos/1192609/pexels-photo-1192609.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(101, 'elise.vue@hetic.net', '$2y$10$ur25j1xKf0wTN/HQZ.8D.eyJVHOgBJ4KPgkaDy4uteMMhVDyRxdOe', 'student', 'Elise', 'VUE', 'Mastère product manager', 2, 'Construire un projet et le mener à bien est toujours satisfaisant : c\'est ce que je retrouve dans mes études à Hetic.', '0757131517', 'https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(102, 'ines.richard@hetic.net', '$2y$10$yo89dLsKHjyw48wJsaxy0esExEKs2ur5vCa5XrMSfRdrXYGUyT6Qy', 'student', 'Ines', 'RICHARD', 'Mastère UX', 2, 'La vision centrée utilisateur m\'a toujours intrigué : comment faire en sorte que l\'utilisateur et ses besoins soient au coeur d\'un projet, voilà ce que m\'a poussé à rejoindre le mastère UX & marketing digital', '0757131514', 'https://images.pexels.com/photos/1181690/pexels-photo-1181690.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(104, 'test@test', '$2y$10$t.IXP6er.oeMYs05Qa6F8uIPL/c2QIWJVs74jMzM.WHXL54o5ow5K', 'student', 'test', 'TEST', NULL, NULL, NULL, NULL, NULL),
(130, 'felix.gerard@hetic.net', '$2y$10$MWOZV1YA6p/N3BEF25lasuIhj7vdCWTB7KSuDCiVHyvFf/yG1ha.a', 'student', 'felix', 'GERARD', 'H', 4, 'Passionné par le monde de la monnaie numérique, je travaille en freelance sur de nombreux projets NFT!', '0752124546', 'https://images.pexels.com/photos/3184611/pexels-photo-3184611.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
(132, 'admin@admin', '$2y$10$WqaG3ENHpLTB5v8kBcdaLOSJld9fr2DaRcdcGJnMQlqkkml.45.YK', 'admin', 'admin', 'ADMIN', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_user_id_fk` (`user_id`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `resource_id_uindex` (`id`),
  ADD KEY `resource_ibfk_1` (`project_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email_uindex` (`email`),
  ADD UNIQUE KEY `user_id_uindex` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `resource`
--
ALTER TABLE `resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
