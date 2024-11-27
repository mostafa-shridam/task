import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/assets.dart';
import 'package:task/core/constants/constants.dart';
import '../constants/app_colors.dart';
import '../constants/custom_dates.dart';

// default app bar
AppBar customAppBar({required String title}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
  );
}

// details app bar
AppBar detailsAppBar({required void Function() onTap}) {
  return AppBar(
    actions: [
      Row(
        children: [
          IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.add_circle_outlined,
              color: AppColors.primaryColor,
            ),
          ),
          const Text(
            "Add to calendar",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 12,
          )
        ],
      ),
    ],
  );
}

// event app bar for add and edit
AppBar eventAppBar(
    {required String title,
    required BuildContext context,
    required String textButton,
    required void Function() onTap}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    leading: TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.red),
      child: const Text("Cancel"),
      onPressed: () => Navigator.pop(context),
    ),
    leadingWidth: 80,
    actions: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsetsDirectional.only(end: 12),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                12,
              ),
            ),
          ),
          child: Text(
            textButton,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  );
}

// home app bar
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return Container(
      margin: EdgeInsetsDirectional.only(
        top: height * 0.06,
        start: width * 0.03,
        end: width * 0.03,
      ),
      width: width,
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/person.png",
                ),
                radius: 32,
              ),
              Text(
                "Home",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          Row(children: [
            Text(
              formattedDate(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.assetsImagesExport),
            ),
          ])
        ],
      ),
    );
  }
}
