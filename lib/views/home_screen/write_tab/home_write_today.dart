import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/models/receipt_model.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_post_card.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_timer.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class Today extends ConsumerWidget {
  final AsyncValue<ReceiptModel?> asyncReceipt;

  const Today({
    Key? key,
    required this.asyncReceipt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPostsNotifier = ref.read(homeWriteControllerProvider.notifier);

    final List<PostModel> todayPosts = myPostsNotifier.todayPosts;

    return asyncReceipt.when(
      data: (receipt) {
        bool isPostable = false;

        if (receipt != null) {
          isPostable = receipt.isPostable && receipt.postableAt == null;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16),
              child: CommonTitle('Today'),
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: isPostable ? const _TodaysTopic() : const HomeWriteTimer(),
            ),
            const Gap(8),
            _TodayList(todayPosts: todayPosts),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (error, __) => ErrorPage(error: error),
    );
  }
}

class _TodaysTopic extends ConsumerStatefulWidget {
  const _TodaysTopic({Key? key}) : super(key: key);

  @override
  ConsumerState<_TodaysTopic> createState() => _TodaysTopicState();
}

class _TodaysTopicState extends ConsumerState<_TodaysTopic> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final myPostsNotifier = ref.read(homeWriteControllerProvider.notifier);

    final topicModel = myPostsNotifier.topicModel;

    final String topic = topicModel?.topic ?? '';
    final String content = topicModel?.content ?? '';

    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: customThemeColors.backgroundElevated,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: CustomShadowColors.shadow3,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonRowWithDivider(
              leading: Center(
                child: Text(
                  '오늘의 주제: $topic',
                  style: customTextStyle.titleMedium,
                ),
              ),
            ),
            const Gap(10),
            Text(
              content,
              style: customTextStyle.bodyMedium
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
        ));
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
            time: createdTime,
            postingDate: 'Today',
          );
        },
      ),
    );
  }
}
