CREATE TABLE `orders` (
  `order_id` varchar(20) NOT NULL,
  `order_date` date DEFAULT NULL,
  `region` varchar(20) DEFAULT NULL,
  `customer_type` varchar(20) DEFAULT NULL,
  `product` varchar(50) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(4,2) DEFAULT NULL,
  `total_price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `product` (`product`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product`) REFERENCES `products` (`product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `products` (
  `product` varchar(50) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
