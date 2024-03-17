import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:cloudwalk/src/pages/utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApodCard extends StatelessWidget {
  const ApodCard({
    super.key,
    required this.date,
    required this.title,
    required this.mediaType,
    required this.media,
    required this.clickCallback,
  });

  final DateTime date;
  final String title;
  final MediaType mediaType;
  final Uri media;
  final VoidCallback clickCallback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.6),
            Theme.of(context).colorScheme.secondary.withOpacity(0.6),
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: defaultPagePadding, vertical: defaultPageSpacing),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Colors.transparent,
            ],
            stops: const [0.7, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: defaultPageSpacing),
            _mediaWidget(),
          ],
        ),
      ),
    );
  }

  Widget _mediaWidget() {
    if (mediaType == MediaType.image) {
      return Image.network(media.toString());
    }

    return WebViewWidget(
      controller: WebViewController()..loadRequest(media),
    );
  }
}
