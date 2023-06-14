import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/liked_posts_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_post_card.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_post_skeleton.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LikedPostsPage extends ConsumerStatefulWidget {
  const LikedPostsPage({Key? key}) : super(key: key);
  static const String path = '/liked-post';

  @override
  ConsumerState<LikedPostsPage> createState() => _LikedPostsPageState();
}

class _LikedPostsPageState extends ConsumerState<LikedPostsPage> {
  @override
  Widget build(BuildContext context) {
    final likedPosts = ref.watch(likedPostsControllerProvider);

    return MainWrapper(
      appBar: CommonAppBar(
        title: '내가 좋아한 글',
        leadingOnTapHandler: likedPosts.hasValue
            ? () {
                closeRootNavigator();
              }
            : null,
        leadingAutomaticallyPop: false,
      ),
      child: likedPosts.when(
        data: (posts) {
          return posts.isEmpty
              ? const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CommonCardCover(
                    iconData: CustomIcons.heart_line,
                    title: '좋아한 글이 없어요 :(',
                    subtitle: '순간의 일과 감정들을 글로 적어보면,\n그것들을 더 잘 이해하고 조절할 수 있어요.',
                  ),
                )
              : Consumer(
                  builder: (context, ref, child) {
                    final likedPostsNotifier =
                        ref.read(likedPostsControllerProvider.notifier);

                    return SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      controller: likedPostsNotifier.refreshController,
                      onRefresh: likedPostsNotifier.refreshLiked,
                      onLoading: likedPostsNotifier.getMoreLikedPosts,
                      footer: const CustomRefresherFooter(),
                      child: child,
                    );
                  },
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      final String leftTime =
                          getPostElapsedTime(date: posts[index].createdAt);

                      return Column(
                        children: [
                          if (index == 0) const Gap(16),
                          LikedPostCard(
                            post: posts[index],
                            labelText: leftTime,
                          ),
                          if (index == posts.length - 1) const Gap(16)
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox.fromSize(size: const Size(0, 0)),
                    itemCount: posts.length,
                  ),
                );
        },
        error: (error, __) => ErrorPage(error: error),
        loading: () => const CommonPostSkeleton(),
      ),
    );
  }
}
