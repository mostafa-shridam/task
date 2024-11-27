import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/assets.dart';
import '../../model/event_entity.dart';

class EventData extends StatelessWidget {
  const EventData({
    super.key,
    required this.taskClose,
    required this.eventEntity,
  });

  final bool taskClose;
  final EventEntity eventEntity;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final date = DateTime.parse(eventEntity.startsAt.split(" ")[0]);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            eventEntity.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  overflow: TextOverflow.ellipsis,
                ),
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.assetsImagesCalendar2),
              SizedBox(width: width * 0.02),
              Text(
                DateFormat("MMM, yyyy dd hh:mm a").format(date),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(),
              ),
              SizedBox(width: width * 0.05),
              if (eventEntity.pinned)
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.task_alt_outlined,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text("1"),
                    SizedBox(width: 8),
                    Icon(
                      Icons.pin_invoke,
                      color: Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text("1"),
                    SizedBox(width: 8),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
