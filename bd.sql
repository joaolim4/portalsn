-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.28-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para portalsn
CREATE DATABASE IF NOT EXISTS `portalsn` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `portalsn`;

-- Copiando estrutura para tabela portalsn.portalsn_admin
CREATE TABLE IF NOT EXISTS `portalsn_admin` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_login` varchar(255) DEFAULT NULL,
  `user_password` text DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela portalsn.portalsn_admin: ~1 rows (aproximadamente)
INSERT INTO `portalsn_admin` (`user_id`, `user_login`, `user_password`) VALUES
	(2, 'Admin', '$2b$10$tFmcRb5b8mDDsdrmO57SE.G5PaX.sCpBLkW6V2/WFlQj..dr6A0uC');

-- Copiando estrutura para tabela portalsn.portalsn_posts
CREATE TABLE IF NOT EXISTS `portalsn_posts` (
  `post_id` int(20) NOT NULL AUTO_INCREMENT,
  `post_title` text DEFAULT NULL,
  `post_image` text DEFAULT NULL,
  `post_subtitle` text DEFAULT NULL,
  `post_tags` text DEFAULT NULL,
  `post_body` text DEFAULT NULL,
  `post_date` text DEFAULT NULL,
  `post_views` int(20) DEFAULT 0,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela portalsn.portalsn_posts: ~3 rows (aproximadamente)
INSERT INTO `portalsn_posts` (`post_id`, `post_title`, `post_image`, `post_subtitle`, `post_tags`, `post_body`, `post_date`, `post_views`) VALUES
	(1, 'Peixe cobiçado por traficantes, totoaba é apelidado de \'cocaína do mar\' e pode ser extinto', 'https://s2.glbimg.com/FMWubDduDNry8JqXC2MR9pCXBlM=/0x0:980x551/1008x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/w/D/GQz2OCQsKqnxhgaEYiGg/f5asd.png', 'Diante do declínio da população da espécie, que só existe no Golfo da Califórnia, pesca da totoaba foi completamente proibida em 1975. Desde então, atividade se tornou um negócio lucrativo para uma rede mafiosa, o chamado Cartel do Mar.', 'pesca peixe traficantes cocaína do mar pode ser extinto', '<p>\nO Mar de Cortez, no norte do México, é um paraíso de biodiversidade. Mas a pesca ilegal da totoaba, um peixe muito procurado na China, está colocando em risco essa espécie, assim como a vaquinha do mar, um mamífero marinho do mesmo tamanho. Do outro lado do Pacífico, clientes asiáticos ricos desembolsam milhares de dólares para comer a bexiga da totoaba por suas propriedades supostamente curativas, mas nunca comprovadas. Um comércio clandestino que segue impune e ameaça a fauna local.\n</p>\n\n<p> \nNo mercado negro, o preço da colheita da totoaba excede até mesmo o da cocaína, tornando-a um produto de luxo no comércio ilícito internacional. Os chineses, os principais clientes desse mercado clandestino e devastador, atribuem qualidades mágicas à bexiga desse peixe, e também ostentam o produto como um marcador social de riqueza.\n</p>', '20230428165539', 1),
	(3, 'Caminhoneiro transporta casas inteiras há 45 anos no interior do Paraná: \'Já puxei mais de mil casas\'', 'https://s2.glbimg.com/3Krme2ihyRyQZPHjzUFjqxOh-4c=/0x439:1200x1232/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/O/A/p2SryGTX2rGaNnSytzug/whatsapp-image-2023-05-01-at-11.04.52.jpeg', 'José Ferraz, de 74 anos, mora em Quarto Centenário e é pioneiro na função. Cena chama atenção de quem encontra o motorista na estrada. Lei permite transporte de carga do tipo com autorização prévia.', 'caminhoneiro casa transporta ', '<p>\r\nJosé Ferraz, de 74 anos, mora em Quarto Centenário e é pioneiro na função. Cena chama atenção de quem encontra o motorista na estrada. Lei permite transporte de carga do tipo com autorização prévia.\r\n</p>\r\n\r\n<h3>\r\n"É o que aprendi a fazer na vida, é o que sei fazer. Amo o meu trabalho. Já puxei mais de mil casas", revelou ao g1.\r\n\r\n</h3>\r\n\r\n<img src="https://s2.glbimg.com/3Krme2ihyRyQZPHjzUFjqxOh-4c=/0x439:1200x1232/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/O/A/p2SryGTX2rGaNnSytzug/whatsapp-image-2023-05-01-at-11.04.52.jpeg">', '20230502080653', 0),
	(4, 'PL das Fake News: como outros países lidam com crimes nas redes sociais', 'https://s2.glbimg.com/F3pOwy9jIEoQ0oT5fQwm31MbYBI=/0x0:5505x3097/810x456/smart/filters:max_age(3600)/https://i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2023/W/q/zqWPInRYOoqe5VvAUbyw/2.jpg', 'União Europeia, por exemplo, criou recentemente uma série de obrigações inéditas às plataformas, como expor algoritmos a reguladores.', 'pl fake-news outro países lidam com crimes nas redes sociais países news  fake pl outro ', '<p>\r\n\r\nO PL das Fake News cria regras para para criminalizar a divulgação de conteúdo falso e responsabilizar as redes por irregularidades cometidas em seus ambientes virtuais.\r\n\r\n</p>', '20230502082920', 19);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
