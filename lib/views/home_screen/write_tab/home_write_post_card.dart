import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/post_card_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

class HomeWritePostCard extends ConsumerWidget {
  final PostModel post;
  final String labelText;
  const HomeWritePostCard({
    Key? key,
    required this.post,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPost = ref.watch(postCardControllerProvider(postId: post.id));

    return asyncPost.when(
      data: (postData) {
        return PostCard(post: postData, labelText: labelText);
      },
      loading: () {
        return PostCard(post: post, labelText: labelText);
      },
      error: (e, __) => Center(
        child: Text('error $e'),
      ),
    );
  }
}

class PostCard extends ConsumerStatefulWidget {
  final PostModel post;
  final String labelText;
  const PostCard({
    Key? key,
    required this.post,
    required this.labelText,
  }) : super(key: key);

  @override
  ConsumerState<PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard> {
  Size childSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final postNotifier =
        ref.read(postCardControllerProvider(postId: widget.post.id).notifier);

    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: InkWell(
        onTap: () {
          postNotifier.handlePressedCard(
            context,
            post: widget.post,
            isNeedBottom: false,
          );
        },
        child: Container(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 8.0,
            right: 8.0,
            bottom: 8.0,
          ),
          constraints: const BoxConstraints(
            maxHeight: cardWithOneDividerMaxHeight,
            minHeight: cardWithOneDividerMinHeight,
          ),
          decoration: BoxDecoration(
            color: customThemeColors.background,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: CustomShadowColors.shadow3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonRowWithDivider(
                header: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2.0,
                  ),
                  decoration: BoxDecoration(
                    color: customThemeColors.backgroundLabel,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    widget.labelText,
                    style: customTextStyle.montLabelSmall,
                  ),
                ),
                rightGap: 8,
                tail: CommonIconButton(
                  icon: const Icon(
                    CustomIcons.more_line,
                  ),
                  onTap: () {
                    postNotifier.handlePressedMoreButton(
                      actions: [
                        CommonActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () async {
                            closeRootNavigator();

                            await context.pushNamed(
                              DeletePostPage.name,
                              params: {
                                'postId': widget.post.id.toString(),
                              },
                            );
                          },
                          iconData: CustomIcons.delete_bin_line,
                          text: '게시글 삭제',
                        ),
                        CommonActionSheetAction(
                          onPressed: () async {
                            await saveToClipboard(widget.post.content);
                            if (context.mounted) {
                              closeRootNavigator();

                              showCommonToast(
                                context,
                                iconData: CustomIcons.check_line,
                                text: '클립보드에 복사되었어요!',
                                bottom: 40,
                              );
                            }
                          },
                          iconData: CustomIcons.copy_line,
                          text: '글 내용 복사',
                        ),
                      ],
                    );
                  },
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.post.content,
                          style: customTextStyle.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(8),
            ],
          ),
        ),
      ),
    );
  }
}
