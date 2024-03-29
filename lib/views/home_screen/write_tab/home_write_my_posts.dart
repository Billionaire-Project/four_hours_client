import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_post_card.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class MyPosts extends ConsumerWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myPosts = ref.watch(homeWriteControllerProvider);
    final myPostsNotifier = ref.read(homeWriteControllerProvider.notifier);

    final List<String> postingDates =
        myPostsNotifier.postingDates.where((date) => date != 'Today').toList();

    return myPosts.when(
      data: (posts) {
        if (posts.isEmpty) {
          return const Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gap(8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CommonCardCover(
                    iconData: CustomIcons.pencil_fill,
                    title: '첫 게시글을 작성해보세요!',
                    subtitle: '순간의 일과 감정들을 글로 적어보면,\n그것들을 더 잘 이해하고 조절할 수 있어요.',
                  ),
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
              final List<PostModel>? nowPosts = posts[postingDates[dateIndex]];
              final String postingDate =
                  postingDates[dateIndex].replaceAll('-', '.');

              if (nowPosts == null) {
                return const SizedBox.shrink();
              }
              if (postingDate == 'Today') {
                return const SizedBox.shrink();
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: CommonTitle(postingDate),
                  ),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: nowPosts.length,
                      itemBuilder: (BuildContext context, int postIndex) {
                        PostModel post = nowPosts[postIndex];

                        final String createdTime =
                            getCreatePostTime(date: post.updatedAt);

                        return HomeWritePostCard(
                          post: post,
                          time: createdTime,
                          postingDate: postingDate,
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
      loading: () => const SizedBox.shrink(),
      error: (error, __) => ErrorPage(error: error),
    );
  }
}
