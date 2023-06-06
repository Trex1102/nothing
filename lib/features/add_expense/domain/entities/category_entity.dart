import 'package:flutter/material.dart';

class CategoryEntity {
  final String id;
  final String name;
  final String color;
  final IconData icon;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
  });
}

List<CategoryEntity> predefinedCategories = [
  CategoryEntity(
    id: '1',
    name: 'Food',
    color: '#FF6F00',
    icon: Icons.fastfood,
  ),
  CategoryEntity(
    id: '2',
    name: 'Transportation',
    color: '#00B0FF',
    icon: Icons.directions_car,
  ),
  CategoryEntity(
    id: '3',
    name: 'Shopping',
    color: '#FF1744',
    icon: Icons.shopping_bag,
  ),
  CategoryEntity(
    id: '4',
    name: 'Entertainment',
    color: '#E040FB',
    icon: Icons.movie,
  ),
  CategoryEntity(
    id: '5',
    name: 'Utilities',
    color: '#64DD17',
    icon: Icons.lightbulb,
  ),
  CategoryEntity(
    id: '6',
    name: 'Health',
    color: '#FF4081',
    icon: Icons.favorite,
  ),
  CategoryEntity(
    id: '7',
    name: 'Education',
    color: '#FFC107',
    icon: Icons.school,
  ),
  CategoryEntity(
    id: '8',
    name: 'Travel',
    color: '#009688',
    icon: Icons.flight,
  ),
  CategoryEntity(
    id: '9',
    name: 'Hobbies',
    color: '#7B1FA2',
    icon: Icons.brush,
  ),
  CategoryEntity(
    id: '10',
    name: 'Gifts',
    color: '#C51162',
    icon: Icons.card_giftcard,
  ),
  CategoryEntity(
    id: '11',
    name: 'Groceries',
    color: '#4CAF50',
    icon: Icons.shopping_cart,
  ),
  CategoryEntity(
    id: '12',
    name: 'Fitness',
    color: '#00BCD4',
    icon: Icons.fitness_center,
  ),
  CategoryEntity(
    id: '13',
    name: 'Home',
    color: '#FF9800',
    icon: Icons.home,
  ),
  CategoryEntity(
    id: '14',
    name: 'Bills',
    color: '#3F51B5',
    icon: Icons.receipt,
  ),
  CategoryEntity(
    id: '15',
    name: 'Pets',
    color: '#FF5722',
    icon: Icons.pets,
  ),
  CategoryEntity(
    id: '16',
    name: 'Investments',
    color: '#795548',
    icon: Icons.show_chart,
  ),
  CategoryEntity(
    id: '17',
    name: 'Charity',
    color: '#D50000',
    icon: Icons.favorite_border,
  ),
  CategoryEntity(
    id: '18',
    name: 'Vacation',
    color: '#8BC34A',
    icon: Icons.beach_access,
  ),
  CategoryEntity(
    id: '19',
    name: 'Books',
    color: '#673AB7',
    icon: Icons.menu_book,
  ),
  CategoryEntity(
    id: '20',
    name: 'Tech',
    color: '#0097A7',
    icon: Icons.computer,
  ),
  CategoryEntity(
    id: '21',
    name: 'Rent',
    color: '#FFEB3B',
    icon: Icons.business,
  ),
  CategoryEntity(
    id: '22',
    name: 'Subscriptions',
    color: '#9C27B0',
    icon: Icons.subscriptions,
  ),
  CategoryEntity(
    id: '23',
    name: 'Car',
    color: '#FF5722',
    icon: Icons.directions_car,
  ),
  CategoryEntity(
    id: '24',
    name: 'Gadgets',
    color: '#795548',
    icon: Icons.devices,
  ),
  CategoryEntity(
    id: '25',
    name: 'Shopping',
    color: '#2196F3',
    icon: Icons.shopping_bag,
  ),
  CategoryEntity(
    id: '26',
    name: 'Cigarettes',
    color: '#757575',
    icon: Icons.smoking_rooms,
  ),
];
