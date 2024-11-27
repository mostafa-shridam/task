import 'package:flutter/material.dart';
import 'package:task/core/widgets/custom_app_bar.dart';

import '../../../../core/constants/app_colors.dart';
import 'widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = "Main";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          currentIndex == 0 ? null : customAppBar(title: title[currentIndex]),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primaryColor,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 18,
        onTap: (value) => setState(() => currentIndex = value),
        items: items,
      ),
      
    );
  }
}
