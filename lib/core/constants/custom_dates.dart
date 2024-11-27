import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

String formattedDate() {
  final DateTime now = DateTime.now();
  final HijriCalendar hijriDate = HijriCalendar.fromDate(now);

  final String formattedHijriDate =
      '${hijriDate.hDay} ${hijriDate.longMonthName} ${hijriDate.hYear}';
  final dates = "${DateFormat("dd MMM yyyy").format(now)} - $formattedHijriDate";

  return dates.toString();
}

String customFormatDate(DateTime date) {
  final String formattedDate = DateFormat("dd MMM yyyy hh:mm a").format(date);
  return formattedDate;
}

String customFormatSelectedDate(DateTime date) {
  final String formattedDate = DateFormat("dd MMM yyyy").format(date);
  return formattedDate;
}

String customFormatSelectedTime(DateTime date) {
  final String formattedDate = DateFormat("hh:mm a").format(date);
  return formattedDate;
}

class CustomDates {
  DateTime now = DateTime.now();
  dateInDayes(String date) {
    var eventDate = DateTime.parse(date.split(
      " ",
    )[0]);

    final int days = eventDate.difference(now).inDays;
    if (days < 0) {
      return "Ends";
    }
    return days.toString();
  }

  dateInHours(String date) {
    var eventDate = DateTime.parse(date.split(" ")[0]);

    final int hours = eventDate.difference(now).inHours % 24;
    if (hours < 0) {
      return "Ends";
    }
    return hours.toString();
  }

  dateInMinutes(String date) {
    var eventDate = DateTime.parse(date.split(" ")[0]);

    final int minutes = eventDate.difference(now).inMinutes % 60;
    if (minutes < 0) {
      return "Ends";
    }
    return minutes.toString();
  }

  dateInSeconds(String date) {
    var eventDate = DateTime.parse(date.split(" ")[0]);

    final int seconds = eventDate.difference(now).inSeconds % 60;
    if (seconds < 0) {
      return "Ends";
    }
    return seconds.toString();
  }
}
