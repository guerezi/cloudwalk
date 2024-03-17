extension DateTimeFormat on DateTime {
  String get toSimple => '$year-$month-$day';
  String get toDisplay => '$year/$month/$day';
}
