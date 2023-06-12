import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/delete_post_controller.dart';
import 'package:four_hours_client/models/delete_reason_model.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_tile_with_radio.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:go_router/go_router.dart';

class DeletePostPage extends ConsumerStatefulWidget {
  final int postId;
  final bool? isDetailPage;

  const DeletePostPage({
    Key? key,
    required this.postId,
    required this.isDetailPage,
  }) : super(key: key);
  static String path = '/delete-post/:postId';
  static String name = 'DeletePostPage';

  @override
  ConsumerState<DeletePostPage> createState() => _DeletePostPageState();
}

class _DeletePostPageState extends ConsumerState<DeletePostPage> {
  int selectedId = 1;
  List<DeleteReasonModel> deleteReasons = [];

  void handlePressedReason(int reasonIndex) {
    setState(() {
      selectedId = reasonIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '왜 해당 게시글을 삭제하시나요?',
                  style: customTextStyle.titleMedium,
                ),
                const Gap(16),
                Consumer(
                  builder: (context, ref, child) {
                    final deletePostController = ref.watch(
                      deletePostControllerProvider(
                        postId: widget.postId,
                        reasonId: selectedId,
                      ),
                    );

                    if (deleteReasons.isEmpty) {
                      deleteReasons = deletePostController.value ?? [];
                    }

                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return InkWell(
                          splashFactory: NoSplash.splashFactory,
                          onTap: () {
                            handlePressedReason(index);
                          },
                          child: CommonTileWithRadio(
                            title: deleteReasons[index].reason,
                            isSelected: selectedId == index + 1,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox.fromSize(size: const Size(0, 8)),
                      itemCount: deleteReasons.length,
                    );
                  },
                ),
              ],
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
                        postId: widget.postId,
                        reasonId: selectedId,
                      ).notifier)
                      .handlePressedDeleteButton(
                        context,
                        isDetailPage: widget.isDetailPage ?? false,
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
