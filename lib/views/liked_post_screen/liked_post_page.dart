import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/liked_post_controller.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/liked_post_screen/liked_post_card.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LikedPostPage extends ConsumerStatefulWidget {
  const LikedPostPage({Key? key}) : super(key: key);
  static const String path = '/liked-post';

  @override
  ConsumerState<LikedPostPage> createState() => _LikedPostPageState();
}

class _LikedPostPageState extends ConsumerState<LikedPostPage> {
  @override
  Widget build(BuildContext context) {
    final likedPosts = ref.watch(likedPostControllerProvider);

    return MainWrapper(
      appBar: const CommonAppBar(title: '내가 좋아한 글'),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller:
            ref.read(likedPostControllerProvider.notifier).refreshController,
        onRefresh:
            ref.read(likedPostControllerProvider.notifier).refreshLikedList,
        onLoading:
            ref.read(likedPostControllerProvider.notifier).getMoreLikedPosts,
        footer: const CustomRefresherFooter(),
        child: likedPosts.isEmpty
            ? const Center(
                child: CommonCircularProgressIndicator(
                  size: 32,
                  strokeWidth: 2,
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  final String leftTime =
                      getPostElapsedTime(date: likedPosts[index].createdAt);

                  return Column(
                    children: [
                      if (index == 0) const SizedBox(height: 16),
                      LikedPostCard(
                        post: likedPosts[index],
                        labelText: leftTime,
                      ),
                      if (index == likedPosts.length - 1)
                        const SizedBox(height: 16)
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox.fromSize(size: const Size(0, 0)),
                itemCount: likedPosts.length,
              ),
      ),
    );
  }
}
