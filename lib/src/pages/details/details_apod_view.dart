import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';
import 'package:cloudwalk/src/domain/models/apod.dart';
import 'package:cloudwalk/src/pages/utils.dart';
import 'package:cloudwalk/src/pages/widgets/apod_media.dart';
import 'package:flutter/material.dart';

class DetailsApod extends StatelessWidget {
  const DetailsApod({super.key, required this.apod});

  final NasaApod apod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(defaultPagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApodMedia(
                media: apod.hdurl,
                type: apod.mediaType,
              ),
              const SizedBox(height: 16.0),
              Text(
                apod.explanation,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16.0),
              Text(
                "Date: ${apod.date.toDisplay}\n"
                "Media Type: ${apod.mediaType.toString().split('.').last}\n",
                style: const TextStyle(fontSize: 14.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
