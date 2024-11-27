import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CategoryList {
  static const List<String> categoryList = [
    'General',
    'Family',
    'Work',
    'Personal',
    "Metting",
    'Others',
  ];

  static const List<Color> colorList = [
    AppColors.primaryColor,
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
  ];
}

class RepeatList {
  static const List<String> repeatList = [
    'Never',
    'Daily',
    'Weekly',
    'Monthly',
  ];
}

class PriorityList {
  static const List<String> repeatList = [
    "Low",
    "Medium",
    "High",
  ];
}
