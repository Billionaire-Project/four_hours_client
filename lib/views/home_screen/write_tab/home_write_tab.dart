import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/create_post_screen/create_post_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_card.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_timer.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

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
    final myPostsNotifier = ref.watch(homeWriteControllerProvider.notifier);

    List<String>? dateList = myPostsNotifier.dateList;
    if (dateList == null) {
      return const Center(
        child: CommonCircularProgressIndicator(size: 32, strokeWidth: 2),
      );
    }
    return SingleChildScrollView(
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
          if (myPosts.isEmpty) ...[
            const Gap(8),
            const CommonCardCover(
              iconData: CustomIcons.pencil_fill,
              title: '첫 게시글을 작성해보세요!',
              subtitle: '순간의 일과 감정들을 글로 적어보면,\n그것들을 더 잘 이해하고 조절할 수 있어요.',
            ),
          ],
          //TODO: Today가 없을 수도 있음..

          if (dateList[0] == 'Today') const _TodaysList(),
          const _MyPostList()
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
            onPressed: () async {
              bool? isCreatedPost = await context
                  .push<bool?>('${HomeWriteTab.path}/${CreatePostPage.path}');
              if (isCreatedPost ?? false) {
                if (context.mounted) {
                  Future.delayed(
                    const Duration(milliseconds: 100),
                    () {
                      showCommonAlert(
                        context,
                        iconData: CustomIcons.check_line,
                        text: '게시 되었어요!',
                      );
                    },
                  );
                }
              }
            },
            text: '글 쓰기',
          )
        ],
      ),
    );
  }
}

class _TodaysList extends ConsumerWidget {
  const _TodaysList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPosts = ref.watch(homeWriteControllerProvider);
    final myPostsNotifier = ref.watch(homeWriteControllerProvider.notifier);

    List<String>? dateList = myPostsNotifier.dateList;

    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: myPosts[dateList![0]]!.length,
        itemBuilder: (BuildContext context, int postIndex) {
          PostModel post = myPosts[dateList[0]]![postIndex];
          final String createdTime = getCreatePostTime(date: post.updatedAt);
          return HomeWriteCard(
            post: post,
            labelText: createdTime,
          );
        },
      ),
    );
  }
}

class _MyPostList extends ConsumerWidget {
  const _MyPostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPosts = ref.watch(homeWriteControllerProvider);
    final myPostsNotifier = ref.watch(homeWriteControllerProvider.notifier);

    List<String>? dateList = myPostsNotifier.dateList;

    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int dateIndex) {
          //TODO: Today가 없을 수도 있음..
          if (dateList[dateIndex] != 'Today') {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CommonTitle(dateList[dateIndex]),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    //TODO: null value
                    itemCount: myPosts[dateList[dateIndex]]!.length,
                    itemBuilder: (BuildContext context, int postIndex) {
                      PostModel post = myPosts[dateList[dateIndex]]![postIndex];
                      final String createdTime =
                          getCreatePostTime(date: post.updatedAt);
                      return HomeWriteCard(
                        post: post,
                        //TODO: 내가 작성한 시간 표시
                        labelText: createdTime,
                      );
                    },
                  ),
                )
              ],
            );
          }
          return const SizedBox.shrink();
        },
        separatorBuilder: (context, index) => SizedBox.fromSize(
          size: const Size(0, 24),
        ),
        itemCount: dateList!.length,
      ),
    );
  }
}
