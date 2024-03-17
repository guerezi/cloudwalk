import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApodMedia extends StatelessWidget {
  const ApodMedia({super.key, required this.media, required this.type});

  final Uri media;
  final MediaType type;

  @override
  Widget build(BuildContext context) {
    if (type == MediaType.image) {
      return Image.network(media.toString());
    }

    return WebViewWidget(
      controller: WebViewController()..loadRequest(media),
    );
  }
}
