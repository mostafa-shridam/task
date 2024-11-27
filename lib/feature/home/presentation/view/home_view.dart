import 'package:flutter/material.dart';
import 'package:task/feature/add_event/presentation/view/add_event_view.dart';

import '../../../../core/constants/app_colors.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeViewBody(),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddEventView.routeName,
          );
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
