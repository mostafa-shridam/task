import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task/core/constants/constants.dart';
import 'package:task/core/constants/custom_dates.dart';
import '../../../../../core/notifications/local_notifications_service.dart';
import '../../../../details_event/presentation/view/details_event_view.dart';
import '../../model/event_entity.dart';
import 'event_data.dart';
import '../../../../../core/widgets/rest_of_the_event.dart';

class CustomEventWidget extends StatefulWidget {
  const CustomEventWidget({
    super.key,
    required this.eventEntity,
  });

  final EventEntity eventEntity;

  @override
  State<CustomEventWidget> createState() => _CustomEventWidgetState();
}

class _CustomEventWidgetState extends State<CustomEventWidget> {
  final bool taskClose = false;

  @override
  void initState() {
    super.initState();
    notification(widget.eventEntity);
  }

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    final width = context.width;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        DetailsEventView.routeName,
        arguments: widget.eventEntity,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.006,
          horizontal: width * 0.03,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: width,
              height: height * 0.11,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffE2E8F0),
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.7,
                    child: EventData(
                      taskClose: taskClose,
                      eventEntity: widget.eventEntity,
                    ),
                  ),
                  const Spacer(),
                  RestOfTheEvent(
                    textNumber:
                        CustomDates().dateInDayes(widget.eventEntity.startsAt),
                    date: "Day",
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(widget.eventEntity.color),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              width: 3,
              height: height * 0.054,
            ),
          ],
        ),
      ),
    );
  }

  void notification(EventEntity event) async {
    await LocalNotificationsService.scheduleNotification(
      id: event.id,
      title: event.title,
      body: event.details ?? "No Dtails",
      scheduledTime:
          DateFormat("yyyy-MM-dd hh:mm a").tryParse(event.startsAt) ??
              DateTime.tryParse(event.startsAt.split(" ")[0]) ??
              DateTime.now(),
    );
  }
}
