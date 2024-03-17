// ignore_for_file: must_be_immutable

import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:equatable/equatable.dart';

class NasaApod extends Equatable {
  late DateTime date;
  late MediaType mediaType;
  late String explanation;
  late String title;
  late Uri? hdurl;
  late Uri url;

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
