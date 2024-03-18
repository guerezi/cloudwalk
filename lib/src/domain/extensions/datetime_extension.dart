extension DateTimeFormat on DateTime {
  /// Convert DateTime to simple format: yyyy-MM-dd (used for API requests)
  String get toSimple =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

  /// Convert DateTime to display format: yyyy/MM/dd (used for display)
  String get toDisplay => '$year/$month/$day';
}
