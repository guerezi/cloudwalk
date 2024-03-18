import 'package:cloudwalk/src/domain/enums/media_type.dart';
import 'package:cloudwalk/src/pages/utils.dart';
import 'package:cloudwalk/src/pages/widgets/apod_media.dart';
import 'package:flutter/material.dart';

class ApodCard extends StatelessWidget {
  const ApodCard({
    super.key,
    required this.title,
    required this.mediaType,
    required this.media,
    required this.onClickCallback,
  });

  final String title;
  final MediaType mediaType;
  final Uri media;
  final VoidCallback onClickCallback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClickCallback,
      child: Ink(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
          vertical: defaultPageSpacing,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox.square(dimension: defaultPageSpacing),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ApodMedia(
                media: media,
                type: mediaType,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
