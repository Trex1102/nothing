import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;
  final Color color;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      icon: IconData(json['icon'], fontFamily: 'MaterialIcons'),
      color: Color(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon.codePoint,
      'color': color.value,
    };
  }
}
