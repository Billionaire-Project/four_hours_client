import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_post_card.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeSharedTab extends ConsumerWidget {
  const HomeSharedTab({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(homeSharedControllerProvider);
    final sharedNotifier = ref.watch(homeSharedControllerProvider.notifier);

    if (posts.isEmpty) {
      return const Center(
          child: CommonCircularProgressIndicator(
        size: 32,
        strokeWidth: 2,
      ));
    }

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: sharedNotifier.refreshController,
      scrollController: sharedNotifier.scrollController,
      onRefresh: sharedNotifier.getPostsInitial,
      footer: const CustomRefresherFooter(),
      //TODO: if need custom header
      // header:
      //     CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {
      //   Widget body;
      //   if (mode == RefreshStatus.idle) {
      //     body = const Text("pull up load");
      //   } else if (mode == RefreshStatus.refreshing) {
      //     body = const CupertinoActivityIndicator();
      //   } else if (mode == RefreshStatus.completed) {
      //     body = const Text("done");
      //   } else if (mode == RefreshStatus.failed) {
      //     body = const Text("failed");
      //   } else if (mode == RefreshStatus.canRefresh) {
      //     body = const Text("release to refresh");
      //   } else {
      //     body = const Text("pull down refresh");
      //   }
      //   return SizedBox(
      //     height: 55.0,
      //     child: Center(child: body),
      //   );
      // }),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final String leftTime =
              getPostElapsedTime(date: posts[index].createdAt);

          return Column(
            children: [
              if (index == 0) const SizedBox(height: 16),
              HomeSharedPostCard(
                post: posts[index],
                labelText: leftTime,
              ),
              if (index == posts.length - 1) const SizedBox(height: 16)
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox.fromSize(
          size: const Size(0, 0),
        ),
        itemCount: posts.length,
      ),
    );
  }
}
