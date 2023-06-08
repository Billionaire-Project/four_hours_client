import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_post_card.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_timer.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_post_skeleton.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeWriteTab extends ConsumerStatefulWidget {
  const HomeWriteTab({Key? key}) : super(key: key);
  static const String path = '/write';

  @override
  ConsumerState<HomeWriteTab> createState() => _HomeWriteTabState();
}

class _HomeWriteTabState extends ConsumerState<HomeWriteTab> {
  @override
  Widget build(BuildContext context) {
    final myPosts = ref.watch(homeWriteControllerProvider);
    final myPostsNotifier = ref.read(homeWriteControllerProvider.notifier);

    final List<PostModel> todayPosts = myPostsNotifier.todayPosts;
    final List<String> postingDates = myPostsNotifier.postingDates;

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: myPostsNotifier.refreshController,
      scrollController: myPostsNotifier.scrollController,
      onRefresh: myPostsNotifier.refreshTab,
      footer: const CustomRefresherFooter(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: CommonTitle('Today'),
          ),
          const Gap(8),
          //TODO: 글을 이미 작성해서 타이머가 돌고있다면 타이머 표시
          //그렇지 않다면 글 작성 표시
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: HomeWriteTimer(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _TodaysTopic(),
          ),
          const Gap(8),

          _TodayList(todayPosts: todayPosts),

          myPosts.when(
            data: (posts) {
              if (posts.isEmpty) {
                return const Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(8),
                      CommonCardCover(
                        iconData: CustomIcons.pencil_fill,
                        title: '첫 게시글을 작성해보세요!',
                        subtitle:
                            '순간의 일과 감정들을 글로 적어보면,\n그것들을 더 잘 이해하고 조절할 수 있어요.',
                      ),
                    ],
                  ),
                );
              }
              return Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int dateIndex) {
                    if (posts[postingDates[dateIndex]] == null) {
                      return const SizedBox.shrink();
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: CommonTitle(postingDates[dateIndex]),
                        ),
                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: posts[postingDates[dateIndex]]!.length,
                            itemBuilder: (BuildContext context, int postIndex) {
                              PostModel post =
                                  posts[postingDates[dateIndex]]![postIndex];
                              final String createdTime =
                                  getCreatePostTime(date: post.updatedAt);
                              return HomeWritePostCard(
                                post: post,
                                labelText: createdTime,
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox.fromSize(
                    size: const Size(0, 24),
                  ),
                  itemCount: postingDates.length,
                ),
              );
            },
            error: (error, __) => Center(child: Text('error: $error')),
            loading: () => const Expanded(child: CommonPostSkeleton()),
          )
        ],
      ),
    );
  }
}

class _TodaysTopic extends ConsumerWidget {
  const _TodaysTopic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final myPostsNotifier = ref.watch(homeWriteControllerProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: CustomShadowColors.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonRowWithDivider(
            header: Center(
              child: Text(
                '오늘의 주제: 변화',
                style: customTextStyle.titleSmall,
              ),
            ),
          ),
          const Gap(10),
          Text(
            '날씨가 점점 봄으로 바뀌고 있다.\n 그 변화를 느끼며, 기분도 따뜻해지고 있다.',
            style: customTextStyle.bodySmall
                .copyWith(color: CustomColors.light.gray400),
          ),
          const Gap(16),
          CommonFullWidthTextButton(
            onPressed: () {
              myPostsNotifier.handlePressedWritePost(context);
            },
            text: '글 쓰기',
          )
        ],
      ),
    );
  }
}

class _TodayList extends ConsumerWidget {
  final List<PostModel> todayPosts;
  const _TodayList({
    Key? key,
    required this.todayPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (todayPosts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: todayPosts.length,
        itemBuilder: (BuildContext context, int postIndex) {
          PostModel post = todayPosts[postIndex];
          final String createdTime = getCreatePostTime(date: post.updatedAt);
          return HomeWritePostCard(
            post: post,
            labelText: createdTime,
          );
        },
      ),
    );
  }
}
