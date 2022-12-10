import 'package:ecommerce_app/src/features/products/domain/product.dart';

/// Test products to be used until a data source is implemented
const kTestProducts = [
  Product(
    id: '1',
    imageUrl: 'assets/products/wireless_mouse.jpg',
    title: 'Wireless Mouse',
    description:
        'Rechargeable Wireless Mouse, 2.4GHz Slim Silent Click Wireless Optical Mouse',
    price: 244.99,
    availableQuantity: 5,
    avgRating: 4.5,
    numRatings: 2,
  ),
  Product(
    id: '2',
    imageUrl: 'assets/products/Hikvision.jpg',
    title: 'Hikvision Flash Drive',
    description: 'Hikvision 64 GB USB Flash Drive',
    price: 160.45,
    availableQuantity: 10,
    avgRating: 5,
    numRatings: 2,
  ),
  Product(
    id: '3',
    imageUrl: 'assets/products/earpod.jpg',
    title: 'Bluetooth Wireless Headset',
    description:
        'JR-T03S PLUS TWS Bluetooth Wireless Headset, Dual-Core Chip wiith Ultra Long Time Battary - White',
    price: 878,
    availableQuantity: 5,
    avgRating: 5,
    numRatings: 2,
  ),
  Product(
    id: '4',
    imageUrl: 'assets/products/Power-Bank.jpg',
    title: 'Power Bank ',
    description:
        'Dual Ports Output Portable Power Bank External Battery Charger 10000mAh',
    price: 12,
    availableQuantity: 5,
  ),
  Product(
    id: '5',
    imageUrl: 'assets/products/Bosch_Screwdriver.jpg',
    title: 'Bosch Screwdriver Set',
    description: 'Bosch 2607017037 X-Pro Line Screwdriver Bit Set',
    price: 303.60,
    availableQuantity: 10,
  ),
];
