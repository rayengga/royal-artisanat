-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 01, 2026 at 03:19 PM
-- Server version: 11.4.9-MariaDB-cll-lve
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `royasudv_royart`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(10) NOT NULL,
  `img-url` varchar(100) NOT NULL,
  `titre_fr` varchar(100) NOT NULL DEFAULT '',
  `titre_en` varchar(100) NOT NULL DEFAULT '',
  `titre_ar` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`id`, `img-url`, `titre_fr`, `titre_en`, `titre_ar`) VALUES
(1, 'images/products/prod_1_68891a2b161e1.jpg', 'Couffin', 'Beach Basket	', 'سَلَّة شاطئ'),
(2, 'images/products/prod_24_6883c1f42b8e4.jpeg', 'Sac à droit', 'Round bag', 'حقيبة مستديرة'),
(3, 'images/products/prod_10_688584aa9b6e6.jpeg', 'Pochette / Trousse', 'Pouch', ' حقيبة صغيرة'),
(4, 'images/products/sac-a-main-porte-monaie-margoum-vert.jpg', 'Pack / Série', '	Pack / Set ', 'طقم / مجموعة');

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

CREATE TABLE `commandes` (
  `commande_id` int(11) NOT NULL,
  `nom_client` varchar(100) NOT NULL,
  `prenom_client` varchar(100) NOT NULL,
  `email_client` varchar(100) NOT NULL,
  `telephone_client` varchar(20) NOT NULL,
  `adresse_livraison` text NOT NULL,
  `ville` varchar(50) NOT NULL,
  `code_postal` varchar(20) NOT NULL,
  `pays` varchar(50) NOT NULL,
  `date_commande` datetime NOT NULL DEFAULT current_timestamp(),
  `date_livraison_prevue` date DEFAULT NULL,
  `statut` enum('en_attente','payée','en_preparation','expédiée','livrée','annulée','remboursée') NOT NULL DEFAULT 'en_attente',
  `montant_total` decimal(10,2) NOT NULL,
  `frais_livraison` decimal(10,2) NOT NULL DEFAULT 0.00,
  `methode_paiement` enum('carte','à_la_livraison') DEFAULT NULL,
  `reference_paiement` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `commandes`
--

INSERT INTO `commandes` (`commande_id`, `nom_client`, `prenom_client`, `email_client`, `telephone_client`, `adresse_livraison`, `ville`, `code_postal`, `pays`, `date_commande`, `date_livraison_prevue`, `statut`, `montant_total`, `frais_livraison`, `methode_paiement`, `reference_paiement`, `notes`) VALUES
(47, 'Dora Hajri', ' ', ' ', '+21692240719', '7050 menzel bourguiba', 'Bizerte', ' ', ' ', '2025-08-12 05:58:34', NULL, 'en_preparation', 66.00, 0.00, NULL, NULL, NULL),
(48, 'aziz salami', ' ', ' ', '22222222', 'mormo9', 'Béja', ' ', ' ', '2025-08-15 12:34:06', NULL, 'annulée', 40.00, 0.00, NULL, NULL, NULL),
(49, 'rawen slama', ' ', ' ', '27084706', 'avenue el habib bourguiba sahline 5012', 'Monastir', ' ', ' ', '2025-08-15 18:28:41', NULL, 'en_preparation', 66.00, 0.00, NULL, NULL, NULL),
(50, 'Asma lassoued', ' ', ' ', '28310122', 'Mnihla', 'Ariana', ' ', ' ', '2025-08-15 18:53:17', NULL, 'en_preparation', 40.00, 0.00, NULL, NULL, NULL),
(51, 'Asma lassoued', ' ', ' ', '28310122', 'Mnihla', 'Ariana', ' ', ' ', '2025-08-15 18:53:17', NULL, 'annulée', 40.00, 0.00, NULL, NULL, NULL),
(52, 'Asma lassoued', ' ', ' ', '28310122', 'Mnihla', 'Ariana', ' ', ' ', '2025-08-15 18:53:56', NULL, 'en_preparation', 40.00, 0.00, NULL, NULL, NULL),
(53, 'Besma gharbi ep esseghir', ' ', ' ', '25216733', '3 rue djughurta EZ-ZAHRA', 'Ben Arous', ' ', ' ', '2025-08-16 09:48:49', NULL, 'en_preparation', 66.00, 0.00, NULL, NULL, NULL),
(54, 'Wiem nasri', ' ', ' ', '95089379', 'Bousalem cite hedi khlil', 'Jendouba', ' ', ' ', '2025-08-17 12:27:56', NULL, 'en_attente', 40.00, 0.00, NULL, NULL, NULL),
(55, ' ', 'Hamadia Hajer', ' ', '96942306', 'Ariana cité ennozha', 'Ariana', ' ', 'tunisia', '2025-08-24 07:57:40', NULL, 'en_attente', 80.00, 7.00, 'à_la_livraison', NULL, ''),
(56, 'Obeidallah Hafaiedh', ' ', ' ', '27073759', 'A côté de l\'école privée City school à borj cedria', 'Ben Arous', ' ', ' ', '2025-08-30 18:12:08', NULL, 'en_attente', 66.00, 0.00, NULL, NULL, NULL),
(57, 'mohamed ali dridi', ' ', ' ', '22345645545', 'rte kalaa\r\n105', 'Bizerte', ' ', ' ', '2025-09-08 13:00:49', NULL, 'annulée', 66.00, 0.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `commande_items`
--

CREATE TABLE `commande_items` (
  `item_id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `nom_produit` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `commande_items`
--

INSERT INTO `commande_items` (`item_id`, `commande_id`, `produit_id`, `quantite`, `prix_unitaire`, `nom_produit`) VALUES
(47, 55, 22, 1, 40.00, ''),
(48, 55, 24, 1, 40.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `images_produits`
--

CREATE TABLE `images_produits` (
  `image_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `url_image` varchar(255) NOT NULL,
  `est_principale` tinyint(1) DEFAULT 0,
  `ordre_affichage` int(11) DEFAULT NULL,
  `hover` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `images_produits`
--

INSERT INTO `images_produits` (`image_id`, `produit_id`, `url_image`, `est_principale`, `ordre_affichage`, `hover`) VALUES
(22, 7, 'images/products/sac-martini-porte-monaie.jpg', 1, 1, ''),
(23, 7, 'images/products/sac-martini-porte-monaie.jpg', 0, 2, ''),
(24, 7, 'images/products/sac-martini-porte-monaie.jpg', 0, 3, ''),
(27, 8, 'images/products/sac-a-main-porte-monaie-margoum-vert.jpg', 1, 1, ''),
(28, 8, 'images/products/sac-a-main-porte-monaie-margoum-vert.jpg', 0, 2, ''),
(29, 8, 'images/products/sac-a-main-porte-monaie-margoum-vert.jpg', 0, 3, ''),
(53, 14, 'images/products/prod_14_6880cde899e43.jpeg', 0, NULL, '0'),
(54, 14, 'images/products/prod_14_6880ce07e7d15.jpeg', 0, NULL, '0'),
(55, 14, 'images/products/prod_14_6880ce2572232.jpeg', 0, NULL, '0'),
(56, 14, 'images/products/prod_14_6880ce7883d0e.jpeg', 1, NULL, '0'),
(57, 14, 'images/products/prod_14_6880cea224a10.jpeg', 0, NULL, '1'),
(58, 14, 'images/products/prod_14_6880ceceb6b7e.jpeg', 0, NULL, '0'),
(59, 15, 'images/products/prod_15_688394856f676.jpeg', 1, NULL, '0'),
(66, 17, 'images/products/prod_17_688396379b529.jpeg', 0, NULL, '0'),
(67, 17, 'images/products/prod_17_6883964a164eb.jpeg', 1, NULL, '0'),
(68, 17, 'images/products/prod_17_6883965b88c74.jpeg', 0, NULL, '1'),
(69, 18, 'images/products/prod_18_688399b868b11.jpeg', 0, NULL, '0'),
(70, 18, 'images/products/prod_18_688399cc25afa.jpeg', 0, NULL, '1'),
(71, 18, 'images/products/prod_18_688399e4387a2.jpeg', 1, NULL, '0'),
(72, 19, 'images/products/prod_19_68839a3c324f0.jpeg', 0, NULL, '0'),
(73, 19, 'images/products/prod_19_68839a5aed405.jpeg', 1, NULL, '0'),
(74, 19, 'images/products/prod_19_68839a7c6af69.jpeg', 0, NULL, '1'),
(75, 20, 'images/products/prod_20_68839ace532c4.jpeg', 0, NULL, '0'),
(76, 20, 'images/products/prod_20_68839ae235d8b.jpeg', 1, NULL, '0'),
(77, 20, 'images/products/prod_20_68839af91b024.jpeg', 0, NULL, '1'),
(78, 21, 'images/products/prod_21_6883b81ba5289.jpeg', 0, NULL, '1'),
(79, 21, 'images/products/prod_21_6883b88034d62.jpeg', 0, NULL, '0'),
(80, 21, 'images/products/prod_21_6883b8d2bb732.jpeg', 1, NULL, '0'),
(81, 22, 'images/products/prod_22_6883bb0ada239.jpeg', 0, NULL, '0'),
(82, 22, 'images/products/prod_22_6883bb3e113f5.jpeg', 0, NULL, '1'),
(83, 22, 'images/products/prod_22_6883bbe614075.jpeg', 1, NULL, '0'),
(87, 24, 'images/products/prod_24_6883c1f42b8e4.jpeg', 1, NULL, '0'),
(89, 24, 'images/products/prod_24_6884e8338f06c.jpeg', 0, NULL, '1'),
(90, 15, 'images/products/prod_15_68857d23aac3e.jpeg', 0, NULL, '0'),
(91, 15, 'images/products/prod_15_68857d46a44bb.jpeg', 0, NULL, '1'),
(92, 10, 'images/products/prod_10_688584aa9b6e6.jpeg', 1, NULL, '0'),
(93, 3, 'images/products/prod_3_688585a972a26.jpeg', 1, NULL, '0'),
(94, 9, 'images/products/prod_9_688586772ef39.jpeg', 1, NULL, '0'),
(96, 6, 'images/products/prod_6_688919cb471c4.jpg', 1, NULL, '1'),
(97, 4, 'images/products/prod_4_68891a00e18a0.jpg', 1, NULL, '1'),
(98, 1, 'images/products/prod_1_68891a2b161e1.jpg', 1, NULL, '1'),
(101, 2, 'images/products/prod_2_688b5f06453d1.jpg', 1, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `produits`
--

CREATE TABLE `produits` (
  `produit_id` int(11) NOT NULL,
  `categorie_id` int(10) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `prix_promotionnel` decimal(10,2) DEFAULT NULL,
  `quantite_stock` int(11) DEFAULT 0,
  `date_ajout` datetime DEFAULT current_timestamp(),
  `future` tinyint(1) NOT NULL,
  `nom_fr` varchar(100) NOT NULL DEFAULT '',
  `nom_en` varchar(100) NOT NULL DEFAULT '',
  `nom_ar` varchar(100) NOT NULL DEFAULT '',
  `description_fr` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `produits`
--

INSERT INTO `produits` (`produit_id`, `categorie_id`, `prix`, `prix_promotionnel`, `quantite_stock`, `date_ajout`, `future`, `nom_fr`, `nom_en`, `nom_ar`, `description_fr`, `description_en`, `description_ar`) VALUES
(1, 1, 45.00, NULL, 0, '2025-05-19 16:29:22', 0, 'Sac à main zebra	', 'Zebra Handbag', 'حقيبة يد زيبرا', 'Fait à la main entièrement en margoum tunisien, avec un design unique et une qualité exceptionnelle.', 'Entirely handmade in Tunisian margoum, featuring a unique design and exceptional quality.\n', 'مصنوع يدويًا بالكامل من المرقوم التونسي، بتصميم فريد وجودة استثنائية.\n\n'),
(2, 1, 59.00, NULL, 0, '2025-05-19 16:29:22', 0, 'Sac à main Nejma\r\n', 'Nejma Handbag\r\n', 'حقيبة يد نجمة\r\n\r\n', 'Sac à main Nejma, fait à la main en cuir et en feuille de palmier, avec un design unique et une qualité exceptionnelle.', 'Nejma handbag, handcrafted from leather and palm leaf, featuring a unique design and exceptional quality.\r\n', 'حقيبة يد نجمة، مصنوعة يدويًا من الجلد وأوراق النخيل، بتصميم فريد وجودة استثنائية.\r\n\r\n'),
(3, 3, 23.00, NULL, 100, '2025-05-19 16:29:22', 0, 'Pouchette juttin', 'Juttin Pouch\r\n', 'حقيبة جوتين ', 'Pouchette juttin, fait à la main en cuir et en feuille de palmier, avec un design unique et une qualité exceptionnelle.\r\n', 'Juttin pouch, handcrafted from leather and palm leaf, featuring a unique design and exceptional quality.\r\n', 'حقيبة جوتين، مصنوعة يدويًا من الجلد وأوراق النخيل، بتصميم فريد وجودة استثنائية.\r\n\r\n'),
(4, 1, 59.00, NULL, 0, '2025-05-19 16:29:22', 0, 'Sac à main Nejma\r\n', 'Nejma Handbag\r\n', 'حقيبة يد نجمة\r\n\r\n', 'Sac à main Nejma, fait à la main en cuir et en feuille de palmier, avec un design unique et une qualité exceptionnelle.\r\n', 'Nejma handbag, handcrafted from leather and palm leaf, featuring a unique design and exceptional quality.\r\n', 'حقيبة يد نجمة، مصنوعة يدويًا من الجلد وأوراق النخيل، بتصميم فريد وجودة استثنائية.\r\n\r\n'),
(6, 2, 35.00, NULL, 0, '2025-05-19 16:29:22', 0, 'Rond margoum', 'Margoum Round Bag\r\n', 'حقيبة دائرية من المرقوم', 'Fait à la main entièrement en margoum tunisien, avec un design unique et une qualité exceptionnelle', 'Entirely handmade in Tunisian margoum, featuring a unique design and exceptional quality.\r\n', 'مصنوع يدويًا بالكامل من المرقوم التونسي، بتصميم فريد وجودة استثنائية.\r\n\r\n'),
(7, 4, 66.00, NULL, 0, '2025-05-19 16:29:22', 0, 'Sac Martini + Pochette Martini', 'Martini Bag + Martini Pouch\r\n', 'حقيبة مارتيني + محفظة مارتيني\r\n\r\n', 'Sac Martini, fabriqué à la main en tisu unique, avec un design traditionnel et des poignées en bois . Un sac alliant authenticité, savoir-faire artisanal et élégance.', 'Martini bag, handmade from unique fabric, featuring a traditional design and wooden handles. A bag that combines authenticity, craftsmanship, and elegance.\r\n', 'حقيبة مارتيني، مصنوعة يدويًا من قماش فريد، بتصميم تقليدي ومقابض خشبية. حقيبة تجمع بين الأصالة والحرفية والأناقة.\r\n\r\n'),
(8, 4, 66.00, NULL, 0, '2025-05-19 16:29:22', 0, 'Couffin vero + pochette vero', 'Vero Basket + Vero Pouch\r\n', 'قفة فيرو + محفظة فيرو', 'Fait à la main entièrement en margoum tunisien, avec un design unique et une qualité exceptionnelle.', 'Entirely handmade in Tunisian margoum, featuring a unique design and exceptional quality.\r\n', 'مصنوع يدويًا بالكامل من المرقوم التونسي، بتصميم فريد وجودة استثنائية.\r\n\r\n'),
(9, 2, 35.00, NULL, 1000, '2025-05-19 16:29:22', 0, 'Rond marron', 'Brown Round Bag\r\n', 'حقيبة دائرية بنية\r\n', 'Sac a droit pour toujours \r\nDemonsion 25/25cm', 'Forever stylish round bag. Dimensions 25×25 cm.\r\n', 'حقيبة دائرية أنيقة إلى الأبد. الأبعاد: 25×25 سم.\r\n\r\n'),
(10, 3, 23.00, NULL, 100, '2025-05-19 16:29:22', 0, 'Pouchette cassé', 'Cracked White Pouch\r\n', 'محفظة بلون أبيض مكسور\r\n', 'Pouchette en blanc casse beige 20 cm', 'Beige cracked white pouch, 20 cm.\r\n', 'محفظة بلون أبيض مائل للبيج، 20 سم.\r\n\r\n'),
(14, 4, 66.00, NULL, 100, '2025-07-23 07:49:53', 1, 'Couffin juttin + pochette juttin', 'Juttin Basket + Juttin Pouch\r\n', 'قفة جوتين + محفظة جوتين\r\n', 'Couffin en jute et en bois naturelle colleur avec pouchette \r\nDemonsion : 35/45 cm\r\nDemonsion pouchette : 20 cm', 'Basket made of jute and colored natural wood with matching pouch. Size: 35×45 cm. Pouch size: 20 cm.\r\n', 'قفة مصنوعة من الجوت والخشب الطبيعي الملون مع محفظة متناسقة. الأبعاد: 35×45 سم. أبعاد المحفظة: 20 سم.\r\n\r\n'),
(15, 4, 66.00, NULL, 100, '2025-07-25 10:25:39', 1, 'Couffin cassé + pochette cassé', 'Cracked White Basket + Pouch\r\n', 'قفة بلون أبيض مكسور + محفظة\r\n\r\n', 'Couffin blanc casse beige avec pouchette\r\nDemonsion couffin : 35/45 cm\r\nDemonsion pouchette : 20 cm', 'Off-white beige basket with pouch. Basket size: 35×45 cm. Pouch size: 20 cm.\r\n', 'قفة باللون الأبيض المائل للبيج مع محفظة. أبعاد القفة: 35×45 سم. أبعاد المحفظة: 20 سم.\r\n\r\n'),
(17, 2, 40.00, NULL, 100, '2025-07-25 10:35:09', 1, 'SAC Bellini', 'Bellini Bag', 'حقيبة بيليني', 'Sac en coudre halfa noire', 'Bag made of black halfa weaving.', 'حقيبة مصنوعة من الحلفاء السوداء.'),
(18, 2, 40.00, NULL, 98, '2025-07-25 10:49:25', 1, 'SAC Bellini', 'Bellini Bag', 'حقيبة بيليني', 'Sac en coudre halfa orange', 'Bag made of orange halfa weaving.', 'حقيبة مصنوعة من الحلفاء البرتقالية.'),
(19, 2, 40.00, NULL, 100, '2025-07-25 10:52:18', 1, 'SAC Bellini', 'Bellini Bag', 'حقيبة بيليني', 'Sac en coudre halfa vert', 'Bag made of green halfa weaving.', 'حقيبة مصنوعة من الحلفاء الخضراء.'),
(20, 2, 40.00, NULL, 98, '2025-07-25 10:54:42', 1, 'SAC Bellini', 'Bellini Bag', 'حقيبة بيليني', 'Sac en coudre halfa blanc.', 'Bag made of white halfa weaving.', 'حقيبة مصنوعة من الحلفاء البيضاء.'),
(21, 2, 40.00, NULL, 99, '2025-07-25 12:58:59', 1, 'SAC Bellini', 'Bellini Bag', 'حقيبة بيليني', 'Sac en coudre beige en halfa naturelle.', 'Beige bag made of natural halfa weaving.', 'حقيبة بيج مصنوعة من الحلفاء الطبيعية.'),
(22, 2, 40.00, NULL, 31, '2025-07-25 13:10:37', 1, 'SAC Bellini', 'Bellini Bag', 'حقيبة بيليني', 'Sac en coudre halfa naturelle, beige et blanc.', 'Bag made of natural halfa weaving, beige and white.', 'حقيبة مصنوعة من الحلفاء الطبيعية، باللونين البيج والأبيض.'),
(24, 2, 40.00, NULL, 99, '2025-07-25 13:41:48', 1, 'Sac Bellini', 'Bellini Bag', 'حقيبة بيليني', 'sac beige et blanc', 'Beige and white bag.', 'حقيبة باللونين البيج والأبيض.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`commande_id`);

--
-- Indexes for table `commande_items`
--
ALTER TABLE `commande_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `commande_id` (`commande_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Indexes for table `images_produits`
--
ALTER TABLE `images_produits`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `produit_id` (`produit_id`);

--
-- Indexes for table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`produit_id`),
  ADD KEY `id` (`categorie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `commande_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `commande_items`
--
ALTER TABLE `commande_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `images_produits`
--
ALTER TABLE `images_produits`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `produits`
--
ALTER TABLE `produits`
  MODIFY `produit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande_items`
--
ALTER TABLE `commande_items`
  ADD CONSTRAINT `commande_items_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`commande_id`) ON DELETE CASCADE;

--
-- Constraints for table `images_produits`
--
ALTER TABLE `images_produits`
  ADD CONSTRAINT `images_produits_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`produit_id`) ON DELETE CASCADE;

--
-- Constraints for table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `fk_produits_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
