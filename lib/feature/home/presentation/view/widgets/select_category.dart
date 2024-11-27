import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/core/constants/assets.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/widgets/category_list.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return Container(
      height: height * 0.06,
      width: width,
      color: AppColors.restEventColor,
      child: const CustomButton(),
    );
  }
}

class CustomButton extends ConsumerStatefulWidget {
  const CustomButton({
    super.key,
  });

  @override
  ConsumerState<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends ConsumerState<CustomButton> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Row(
        children: [
           CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(Assets.assetsImagesEdit3),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: const Text("All"),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() {
                        currentIndex = index;
                      }),
                  child: SelectedButton(
                    color: CategoryList.colorList[index],
                    isSelected: currentIndex == index,
                    height: height,
                    width: width,
                    title: CategoryList.categoryList[index],
                  )),
              itemCount: CategoryList.categoryList.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedButton extends StatelessWidget {
  const SelectedButton({
    super.key,
    required this.isSelected,
    required this.height,
    required this.width,
    required this.title,
    required this.color,
  });
  final bool isSelected;
  final double height, width;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.005, vertical: height * 0.007),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.004),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
        boxShadow: [
          if (isSelected)
            const BoxShadow(
              color:  Color(0x0A00000A),
              spreadRadius: 4,
              blurRadius: 16,
              offset: Offset(0, 2)
            ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 5,
          ),
          SizedBox(width: width * 0.018),
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
