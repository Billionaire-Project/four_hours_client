import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_post_card.dart';
import 'package:four_hours_client/views/widgets/common_post_skeleton.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeSharedTab extends ConsumerWidget {
  const HomeSharedTab({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(homeSharedControllerProvider);
    final sharedNotifier = ref.read(homeSharedControllerProvider.notifier);

    return posts.when(
      data: (posts) {
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: sharedNotifier.refreshController,
          scrollController: sharedNotifier.scrollController,
          onRefresh: sharedNotifier.refreshTab,
          footer: const CustomRefresherFooter(),
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
      },
      error: (error, __) => throw ('error: $error'),
      loading: () => const CommonPostSkeleton(),
    );
  }
}
