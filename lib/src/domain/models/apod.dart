import 'package:cloudwalk/src/domain/enums/media_type.dart';

class NasaApod {
  late DateTime date;
  late MediaType mediaType;
  late String explanation;
  late String serviceVersion;
  late String title;
  late Uri hdurl;
  late Uri url;

  NasaApod._();

  factory NasaApod.fromJson(Map<String, dynamic> json) => NasaApod._()
    ..date = DateTime.parse(json["date"] as String)
    ..explanation = json["explanation"] as String
    ..mediaType = MediaType.values.byName(json["media_type"] as String)
    ..serviceVersion = json["service_version"] as String
    ..title = json["title"] as String
    ..hdurl = Uri.parse(json["hdurl"] as String)
    ..url = Uri.parse(json["url"] as String);
}
