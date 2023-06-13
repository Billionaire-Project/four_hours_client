import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/post_detail_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/post_detail_screen/post_detail_bottom.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class PostDetailPage extends ConsumerStatefulWidget {
  final String postId;
  final PostModel post;
  final bool isFromMyPost;

  const PostDetailPage({
    Key? key,
    required this.postId,
    required this.post,
    required this.isFromMyPost,
  }) : super(key: key);
  static String path = '/post-detail/:postId';
  static String name = 'PostDetailPage';

  @override
  ConsumerState<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends ConsumerState<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final postDetail =
        ref.watch(postDetailControllerProvider(post: widget.post));
    final postDetailNotifier =
        ref.read(postDetailControllerProvider(post: widget.post).notifier);

    return MainWrapper(
      appBar: CommonAppBar(
        actions: [
          CommonIconButton(
            onTap: () {
              postDetailNotifier.handlePressedMoreButton(
                context,
                isFromMyPost: widget.isFromMyPost,
              );
            },
            icon: const Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          postDetail.when(
              data: (postModel) {
                if (postModel == null) {
                  return const ErrorPage(error: '해당 게시글을 찾을 수 없습니다');
                }
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonRowWithDivider(
                          leading: CommonTitle(
                            getPostElapsedTime(
                              date: postModel.updatedAt,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Text(
                          postModel.content,
                          style: customTextStyle.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
              loading: () {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonRowWithDivider(
                          trailing: CommonTitle(
                            getPostElapsedTime(
                              date: widget.post.updatedAt,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Text(
                          widget.post.content,
                          style: customTextStyle.bodySmall,
                        ),
                      ],
                    ),
                  ),
                );
              },
              error: (error, _) => ErrorPage(error: error)),
          widget.isFromMyPost
              ? const SizedBox.shrink()
              : PostDetailBottom(post: widget.post)
        ],
      ),
    );
  }
}
