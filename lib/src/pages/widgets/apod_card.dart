import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:cloudwalk/src/pages/utils.dart';
import 'package:cloudwalk/src/pages/widgets/apod_media.dart';
import 'package:flutter/material.dart';

class ApodCard extends StatelessWidget {
  const ApodCard({
    super.key,
    required this.date,
    required this.title,
    required this.mediaType,
    required this.media,
    required this.onClickCallback,
  });

  final DateTime date;
  final String title;
  final MediaType mediaType;
  final Uri media;
  final VoidCallback onClickCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickCallback,
      child: Ink(
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
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: defaultPageSpacing),
              ApodMedia(
                media: media,
                type: mediaType,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
