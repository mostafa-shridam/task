import 'package:flutter/material.dart';
import 'package:task/core/constants/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: context.height * 0.01,
      indent: context.width * 0.05,
      color: const Color(0xffF1F5F9),
    );
  }
}
