import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A generic lazy‑loading list that fetches more items when the user scrolls
/// near the bottom. The [onLoadMore] callback should return a Future that
/// completes when the next page of data has been added to the supplied
/// observable list.
class LazyLoadList<T> extends StatelessWidget {
  final RxList<T> items;
  final Widget Function(BuildContext, T) itemBuilder;
  final Future<void> Function() onLoadMore;
  final bool hasMore;
  final double scrollThreshold;

  const LazyLoadList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.hasMore,
    this.scrollThreshold = 200.0,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    controller.addListener(() async {
      if (!hasMore) return;
      if (controller.position.maxScrollExtent - controller.offset <= scrollThreshold) {
        await onLoadMore();
      }
    });
    return Obx(() {
      return ListView.builder(
        controller: controller,
        itemCount: items.length + (hasMore ? 1 : 0),
        itemBuilder: (ctx, index) {
          if (index < items.length) {
            return itemBuilder(ctx, items[index]);
          } else {
            // loading indicator
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      );
    });
  }
}
