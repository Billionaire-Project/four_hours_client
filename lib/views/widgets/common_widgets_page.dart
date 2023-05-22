import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';

class CommonWidgetsPage extends ConsumerWidget {
  const CommonWidgetsPage({Key? key}) : super(key: key);
  static const String path = '/common-widgets';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return MainWrapper(
      appBar: const CommonAppBar(title: 'Common Widgets'),
      child: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showCommonActionSheet(
                actions: [
                  CommonActionSheetAction(
                    isDestructiveAction: true,
                    onPressed: () {},
                    iconData: CustomIcons.delete_bin_line,
                    text: '게시글 삭제',
                  ),
                  CommonActionSheetAction(
                    backgroundColor: customThemeColors.background,
                    onPressed: () {},
                    iconData: CustomIcons.copy_line,
                    text: '게시글 삭제',
                  ),
                ],
              );
            },
            child: const Text('ActionSheet'),
          ),
          ElevatedButton(
            onPressed: () {
              showCommonAlert(
                iconData: CustomIcons.check_line,
                text: '삭제 되었어요!',
              );
            },
            child: const Text('Alert'),
          ),
          ElevatedButton(
            onPressed: () {
              showCommonToast(
                context,
                iconData: CustomIcons.copy_line,
                text: '클립보드에 복사되었어요!',
              );
            },
            child: const Text('Toast'),
          ),
          ElevatedButton(
            onPressed: () {
              showCommonDialogWithTwoButtons(
                iconData: CustomIcons.report_fill,
                title: '해당 게시글을 신고하시겠어요?',
                subtitle: '신고가 접수되면 즉시 사라집니다',
                onPressedRightButton: () {},
                rightButtonText: '신고',
              );
            },
            child: const Text('Dialog'),
          ),
        ],
      )),
    );
  }
}
