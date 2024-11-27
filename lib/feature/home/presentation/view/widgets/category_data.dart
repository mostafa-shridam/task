import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/assets.dart';
import 'package:task/core/constants/constants.dart';

import '../../../../../core/constants/app_colors.dart';

class CategoryFilterData extends StatelessWidget {
  const CategoryFilterData({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.01, horizontal: width * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "All",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.black),
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.filterColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                height: height * 0.05,
                width: width * 0.26,
                child: const CustomGridButton(),
              ),
              Container(
                color: const Color(0xffE2E8F0),
                width: 1,
                height: 16,
              )
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.import_export_sharp),
          ),
        ],
      ),
    );
  }
}

class CustomButtonIsSelected extends StatelessWidget {
  const CustomButtonIsSelected({
    super.key,
    required this.isSelected,
    required this.icon,
  });
  final bool isSelected;
  final String icon;
  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return Container(
      width: width * 0.09,
      height: height * 0.04,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
            isSelected ? const Color(0xff6B7DCF) : const Color(0xff64748B),
            BlendMode.srcIn),
        fit: BoxFit.fill,
      ),
    );
  }
}

class CustomGridButton extends StatefulWidget {
  const CustomGridButton({
    super.key,
  });

  @override
  State<CustomGridButton> createState() => _CustomGridButtonState();
}

class _CustomGridButtonState extends State<CustomGridButton> {
  int currentIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(2, (index) {
        return GestureDetector(
          onTap: () => setState(() => currentIndex = index),
          child: CustomButtonIsSelected(
            icon: index == 0
                ? Assets.assetsImagesCalendar1
                : Assets.assetsImagesRowVertical,
            isSelected: currentIndex == index,
          ),
        );
      }),
    );
  }
}
