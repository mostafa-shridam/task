import 'package:flutter/material.dart';
import 'package:task/core/constants/constants.dart';

import 'the_date_of_event.dart';

class ListTileDateOfEvent extends StatelessWidget {
  const ListTileDateOfEvent({
    super.key,
    required this.nameDate,
    required this.date,
    required this.time,
    this.onTap,
    this.onTapDate,
    this.onTapTime,
  });
  final String date, time;
  final String nameDate;
  final void Function()? onTapDate, onTapTime, onTap;
  @override
  Widget build(BuildContext context) {
    final width = context.width;
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: width * 0.05),
      tileColor: Colors.white,
      leading: Text(
        nameDate.toString(),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TheDateOfEvent(
            onTap: onTapDate,
            date: date,
          ),
          TheDateOfEvent(
            onTap: onTapTime,
            date: time,
          ),
        ],
      ),
    );
  }
}
