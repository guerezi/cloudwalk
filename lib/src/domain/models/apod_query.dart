class NasaApodQueryParams {
  final DateTime? date;
  final DateTime? startDate;
  final DateTime? endDate;
  final int? count;
  final bool? thumbs;
  final String apiKey;

  NasaApodQueryParams({
    this.date,
    this.startDate,
    this.endDate,
    this.count,
    this.thumbs,
    required this.apiKey,
  });

  //TODO: Remover a hora do toString();
  Map<String, dynamic> get toMap => {
        if (date != null) 'date': date.toString(),
        if (startDate != null) 'start_date': startDate.toString(),
        if (endDate != null) 'end_date': endDate.toString(),
        if (count != null) 'count': count,
        if (thumbs != null) 'thumbs': thumbs,
        'api_key': apiKey,
      };
}
