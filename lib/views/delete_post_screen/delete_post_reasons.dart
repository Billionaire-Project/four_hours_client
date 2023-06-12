import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/delete_post_controller.dart';
import 'package:four_hours_client/models/delete_reason_model.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/common_tile_with_radio.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class DeletePostReasons extends ConsumerStatefulWidget {
  final int postId;
  const DeletePostReasons({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  ConsumerState<DeletePostReasons> createState() => _DeletePostReasonsState();
}

class _DeletePostReasonsState extends ConsumerState<DeletePostReasons> {
  int isSelectedId = 1;

  void handlePressedReason(int reasonIndex) {
    setState(() {
      isSelectedId = reasonIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    final deletePostController = ref.watch(deletePostControllerProvider(
      postId: widget.postId,
    ));

    List<DeleteReasonModel> deleteReasons = [];

    deletePostController.whenData((value) {
      deleteReasons = value;
    });

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '왜 해당 게시글을 삭제하시나요?',
            style: customTextStyle.titleMedium,
          ),
          const Gap(16),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: () {
                  handlePressedReason(index);
                },
                child: CommonTileWithRadio(
                  title: deleteReasons[index].reason,
                  isSelected: isSelectedId == index + 1,
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox.fromSize(size: const Size(0, 8)),
            itemCount: deleteReasons.length,
          ),
        ],
      ),
    );
  }
}
