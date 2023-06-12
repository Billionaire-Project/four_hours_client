import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/delete_post_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_reasons.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:go_router/go_router.dart';

class DeletePostPage extends ConsumerWidget {
  final String postId;
  final bool? isDetailPage;
  const DeletePostPage({
    Key? key,
    required this.postId,
    required this.isDetailPage,
  }) : super(key: key);
  static String path = '/delete-post/:postId';
  static String name = 'DeletePostPage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
        top: 32,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CustomIcons.delete_bin_fill,
            size: 32,
          ),
          const Gap(8),
          Text(
            '해당 게시글을 삭제하시겠어요?',
            style: customTextStyle.headlineSmall,
          ),
          const Gap(4),
          Text(
            '다음 글 작성 전까지 SHARED 목록을 볼 수 없어요',
            style: customTextStyle.bodyMedium,
          ),
          const Gap(40),
          DeletePostReasons(
            postId: int.parse(
              postId,
            ),
          ),
          const Spacer(),
          Column(
            children: [
              CommonFullWidthTextButton(
                isDestructiveAction: true,
                text: '네, 삭제할래요',
                onPressed: () {
                  ref
                      .read(deletePostControllerProvider(
                        postId: int.parse(
                          postId,
                        ),
                      ).notifier)
                      .handlePressedDeleteButton(
                        context,
                        isDetailPage: isDetailPage ?? false,
                      );
                },
              ),
              const Gap(8),
              CommonFullWidthTextButton(
                isCancelingAction: true,
                text: '아니요, 유지할래요',
                onPressed: () {
                  context.pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
