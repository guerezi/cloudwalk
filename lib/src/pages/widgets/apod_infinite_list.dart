import 'package:cloudwalk/src/domain/bloc/apod_state.dart';
import 'package:cloudwalk/src/domain/extensions/datetime_extension.dart';
import 'package:cloudwalk/src/pages/utils.dart';
import 'package:cloudwalk/src/pages/widgets/apod_card.dart';
import 'package:cloudwalk/src/router/routes.dart';
import 'package:flutter/material.dart';

class ApodInfiniteList extends StatefulWidget {
  const ApodInfiniteList({
    super.key,
    required this.listController,
    required this.data,
    required this.onReachBottomCallback,
  });

  final ScrollController listController;
  final ApodState data;
  final Function(BuildContext) onReachBottomCallback;

  @override
  State<ApodInfiniteList> createState() => _ApodInfiniteListState();
}

class _ApodInfiniteListState extends State<ApodInfiniteList> {
  @override
  void initState() {
    super.initState();
    widget.listController.addListener(onScrollList);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.listController,
      itemCount: widget.data.images.length,
      itemBuilder: (context, i) {
        if (i >= widget.data.images.length) {
          return SizedBox(
            height: 24,
            width: MediaQuery.of(context).size.width,
            child: const CircularProgressIndicator.adaptive(),
          );
        }

        final apod = widget.data.images[i];

        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.all(defaultPageSpacing),
          padding: EdgeInsets.symmetric(vertical: defaultPagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: defaultPagePadding),
                child: Text(
                  "${widget.data.images[i].date.toDisplay}:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              ApodCard(
                title: apod.title,
                mediaType: apod.mediaType,
                media: apod.url,
                onClickCallback: () {
                  Navigator.of(context).pushNamed(
                    Routes.details,
                    arguments: apod,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.listController.removeListener(onScrollList);

    super.dispose();
  }

  void onScrollList() {
    if (isBottom) {
      widget.onReachBottomCallback(context);
    }
  }

  bool get isBottom {
    if (!widget.listController.hasClients) return false;

    final maxScroll = widget.listController.position.maxScrollExtent;
    final currentScroll = widget.listController.offset;

    return currentScroll >= (maxScroll - 300);
  }
}
