import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_my_posts.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_skeleton.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_today.dart';
import 'package:four_hours_client/views/widgets/custom_refresh_header.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeWriteTab extends ConsumerWidget {
  const HomeWriteTab({Key? key}) : super(key: key);
  static const String path = '/write';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPosts = ref.watch(homeWriteControllerProvider);
    final myPostsNotifier = ref.read(homeWriteControllerProvider.notifier);
    final asyncReceipt = ref.watch(receiptControllerProvider);

    return myPosts.when(
      data: (posts) {
        return SmartRefresher(
          physics: const BouncingScrollPhysics(),
          enablePullDown: true,
          enablePullUp: true,
          controller: myPostsNotifier.refreshController,
          scrollController: myPostsNotifier.scrollController,
          onRefresh: myPostsNotifier.refreshTab,
          header: const CustomRefresherHeader(),
          footer: const CustomRefresherFooter(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Today(asyncReceipt: asyncReceipt),
              const Gap(16),
              const MyPosts(),
            ],
          ),
        );
      },
      loading: () => const HomeWriteSkeleton(),
      error: (error, _) => ErrorPage(error: error),
    );
  }
}
