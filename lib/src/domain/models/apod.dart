// ignore_for_file: must_be_immutable

import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:equatable/equatable.dart';

/// Model class for Nasa Apod
/// Holds the data for the Nasa Apod
/// [date] - The date of the Apod
/// [mediaType] - The media type of the Apod
/// [explanation] - The explanation of the Apod
/// [title] - The title of the Apod
/// [hdurl] - The high definition url of the Apod
/// [url] - The url of the Apod
class NasaApod extends Equatable {
  late DateTime date;
  late MediaType mediaType;
  late String explanation;
  late String title;
  late Uri? hdurl;
  late Uri url;

  /// Private constructor, to avoid creating a NasaApod without a factory method
  NasaApod._();

  factory NasaApod.fromJson(Map<String, dynamic> json) => NasaApod._()
    ..date = DateTime.parse(json["date"] as String)
    ..explanation = json["explanation"] as String
    ..mediaType = MediaType.values.byName(json["media_type"] as String)
    ..title = json["title"] as String
    ..hdurl = Uri.tryParse(json["hdurl"] ?? '')
    ..url = Uri.parse(json["url"] as String);

  @override
  List<Object?> get props => [date, mediaType, explanation, title, hdurl, url];
}
