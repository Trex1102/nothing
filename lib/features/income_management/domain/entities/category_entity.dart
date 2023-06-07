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

List<CategoryEntity> predefinedIncomeCategories = [
  CategoryEntity(
    id: 'salary',
    name: 'Salary',
    color: '#009688',
    icon: Icons.attach_money,
  ),
  CategoryEntity(
    id: 'freelance',
    name: 'Freelance',
    color: '#FF9800',
    icon: Icons.work,
  ),
  CategoryEntity(
    id: 'business',
    name: 'Business',
    color: '#673AB7',
    icon: Icons.business,
  ),
  CategoryEntity(
    id: 'bonus',
    name: 'Bonus',
    color: '#4CAF50',
    icon: Icons.trending_up,
  ),
  CategoryEntity(
    id: 'gifts',
    name: 'Gifts',
    color: '#E91E63',
    icon: Icons.card_giftcard,
  ),
  CategoryEntity(
    id: 'rental_income',
    name: 'Rental Income',
    color: '#FFC107',
    icon: Icons.home,
  ),
  CategoryEntity(
    id: 'other',
    name: 'Other',
    color: '#9E9E9E',
    icon: Icons.category,
  ),
];
