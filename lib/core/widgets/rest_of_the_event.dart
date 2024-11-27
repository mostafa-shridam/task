import 'package:flutter/material.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/constants/constants.dart';

class RestOfTheEvent extends StatelessWidget {
  const RestOfTheEvent(
      {super.key, required this.textNumber, required this.date});

  final String textNumber, date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.restEventColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      margin: const EdgeInsets.all(6),
      width: context.width * 0.2,
      height: context.height * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textNumber,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                ),
          ),
          Text(
            date,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
