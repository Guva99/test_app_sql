import 'package:intl/intl.dart';

abstract class AppUtils{
  static String formatTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('HH:mm');
  return formatter.format(dateTime);
}
}