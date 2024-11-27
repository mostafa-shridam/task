
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task/core/constants/assets.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/constants/custom_dates.dart';
import 'package:task/core/widgets/custom_divider.dart';
import 'package:task/core/widgets/custom_list_tile_category_items.dart';
import 'package:task/feature/home/presentation/model/event_entity.dart';

import '../../../../../core/widgets/rest_of_the_event.dart';
import '../../../../../core/services/event_riverpod_service.dart';

class DetailsEventViewBody extends ConsumerWidget {
  const DetailsEventViewBody({super.key,required this.eventEntity});
  final EventEntity eventEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SizedBox sizedBox = SizedBox(height: context.height * 0.02);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 0.03),
            child: Column(
              children: [
                const CustomDivider(),
                Text(
                  eventEntity.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.black),
                ),
                sizedBox,
                Text(
                  formattedDate(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                sizedBox,
                Text(
                  customFormatDate(
                      DateTime.parse(eventEntity.startsAt.split(" ")[0])),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                sizedBox,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RestOfTheEvent(
                      textNumber: CustomDates().dateInDayes(eventEntity.startsAt),
                      date: "Day",
                    ),
                    RestOfTheEvent(
                      textNumber: CustomDates().dateInHours(eventEntity.startsAt),
                      date: "Hours",
                    ),
                    RestOfTheEvent(
                      textNumber:
                          CustomDates().dateInMinutes(eventEntity.startsAt),
                      date: "Min",
                    ),
                  ],
                ),
              ],
            ),
          ),
          sizedBox,
          const CustomDivider(),
          sizedBox,
          CustomListTileCategoryItems(
            alert: (value) => eventEntity.eventDate,
            repeat: (value) => eventEntity.eventDay,
            priority: (value) => eventEntity.eventDate,
          ),
          ListTile(
            leading: SvgPicture.asset(Assets.assetsImagesNote2),
            title: Text(
              "Standup team meeting on zoom",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
          TextButton(
              onPressed: () {
                eventEntity.delete();
                ref.read(eventProvider.notifier).getEvent();
                Navigator.pop(context);
              },
              child: const Text("Delete event")),
        ],
      ),
    );
  }
}
