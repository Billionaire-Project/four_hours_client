import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/liked_post_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/liked_post_screen/liked_post_card.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_post_skeleton.dart';
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
    final likedPostNotifier = ref.watch(likedPostControllerProvider.notifier);

    return MainWrapper(
      appBar: const CommonAppBar(
        title: '내가 좋아한 글',
      ),
      child: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: likedPostNotifier.refreshController,
        onRefresh: likedPostNotifier.getLikedPostsInitial,
        onLoading: likedPostNotifier.getMoreLikedPosts,
        footer: const CustomRefresherFooter(),
        child: likedPosts.when(
          data: (posts) {
            return posts.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CommonCardCover(
                      iconData: CustomIcons.heart_line,
                      title: '좋아한 글이 없어요 :(',
                      subtitle:
                          '순간의 일과 감정들을 글로 적어보면,\n그것들을 더 잘 이해하고 조절할 수 있어요.',
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final String leftTime =
                          getPostElapsedTime(date: posts[index].createdAt);

                      return Column(
                        children: [
                          if (index == 0) const SizedBox(height: 16),
                          LikedPostCard(
                            post: posts[index],
                            labelText: leftTime,
                          ),
                          if (index == posts.length - 1)
                            const SizedBox(height: 16)
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox.fromSize(size: const Size(0, 0)),
                    itemCount: posts.length,
                  );
          },
          error: (error, __) => throw ('error: $error'),
          loading: () => const CommonPostSkeleton(),
        ),
      ),
    );
  }
}
