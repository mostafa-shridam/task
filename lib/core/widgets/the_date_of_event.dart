import 'package:flutter/material.dart';
import 'package:task/core/constants/constants.dart';

class TheDateOfEvent extends StatelessWidget {
  const TheDateOfEvent({
    super.key,

    required this.date, this.onTap,
  });
  final String date;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
      final width = context.width;
    final height = context.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: width * 0.02),
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.014,
        ),
        decoration: const BoxDecoration(
          color: Color(0xffF1F5F9),
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        child: Text(date),
      ),
    );
  }
}

