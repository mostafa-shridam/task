import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:task/core/constants/custom_dates.dart';

import '../../../../../core/widgets/list_tile_date_of_event.dart';
import 'select_event_date.dart';

class DateWidget extends ConsumerStatefulWidget {
  const DateWidget({
    super.key,
    required this.nameDate,
    required this.startsAt,
    this.date,
    this.time,
  });

  final ValueChanged<String> startsAt;
  final String nameDate;
  final String? date, time;

  @override
  ConsumerState<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends ConsumerState<DateWidget> {
  DateTime? dateSelected;
  TimeOfDay? timeSelected;

  @override
  Widget build(BuildContext context) {
    return ListTileDateOfEvent(
      onTapDate: () async {
        final date = await selectDate(context, dateSelected);
        if (date != null) {
          setState(() {
            dateSelected = date;
          });
          updateDateAndTime();
        }
      },
      onTapTime: () async {
        final time =
            await selectTime(context: context, isSelectedTime: timeSelected);
        if (time != null) {
          setState(() {
            timeSelected = time;
          });
          updateDateAndTime();
        }
      },
      nameDate: widget.nameDate,
      date: dateSelected != null
          ? customFormatSelectedDate(dateSelected!)
          : widget.date == null
              ? "Selete date"
              : widget.date ?? "",
      time: timeSelected != null
          ? timeSelected!.format(context)
          : widget.time == null
              ? "Selete time"
              : widget.time ?? "",
    );
  }

  void updateDateAndTime() {
    if (dateSelected != null && timeSelected != null) {
      final formatterDate = DateTime(
        dateSelected!.year,
        dateSelected!.month,
        dateSelected!.day,
        timeSelected!.hour,
        timeSelected!.minute,
      );
      widget.startsAt(DateFormat("yyyy-MM-dd hh:mm a").format(formatterDate));
    }
  }
}
