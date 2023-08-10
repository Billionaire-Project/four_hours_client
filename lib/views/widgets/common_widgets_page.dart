import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_skeleton_page.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:go_router/go_router.dart';

class CommonWidgetsPage extends ConsumerWidget {
  const CommonWidgetsPage({Key? key}) : super(key: key);
  static const String path = '/common-widgets';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return CommonWrapper(
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
                      onPressed: () {},
                      iconData: CustomIcons.copy_line,
                      text: '게시글 복사',
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
                showCommonLoader();
                Future.delayed(const Duration(seconds: 2), () {
                  closeRootNavigator();
                });
              },
              child: const Text('Loader'),
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
                showCommonToastWithAction(
                  context,
                  iconData: CustomIcons.heart_line,
                  text: '해당 글이 좋아요 해제되었어요',
                  action: CommonTextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      '실행 취소',
                      style: customTextStyle.titleMedium.copyWith(
                        color: customThemeColors.orange,
                      ),
                    ),
                    onPressed: () {
                      FToast().removeCustomToast();
                    },
                  ),
                );
              },
              child: const Text('Toast with Action'),
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
              child: const Text('Dialog with Two Buttons'),
            ),
            ElevatedButton(
              onPressed: () {
                showCommonDialog(
                  iconData: CustomIcons.time_line,
                  title: '해당 게시글을 신고하시겠어요?',
                  subtitle: '신고가 접수되면 즉시 사라집니다',
                );
              },
              child: const Text('Dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(CommonSkeletonPage.path);
              },
              child: const Text('Skeleton Page'),
            ),
            ElevatedButton(
              onPressed: () {
                context.push(ErrorPage.path);
              },
              child: const Text('Error Page'),
            ),
            ElevatedButton(
              onPressed: () async {
                final sharedPreferences = ref.watch(sharedPreferencesProvider);

                await sharedPreferences.setBool(
                  SharedPreferenceKey.onboarding,
                  false,
                );
              },
              child: const Text('Onboarding false'),
            ),
          ],
        ),
      ),
    );
  }
}
