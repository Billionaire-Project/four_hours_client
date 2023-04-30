import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/create_post_controller.dart';
import 'package:four_hours_client/providers/test_saving_provider.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CreatePostBottom extends ConsumerWidget {
  const CreatePostBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final isSavedProvider = ref.watch(testSavingNotifierProvider);

    final String content = ref.watch(createPostControllerProvider);

    bool isFirstPost =
        ref.watch(createPostControllerProvider.notifier).isFirstPost;
    int textLength = postTextLimit - content.length;
    bool isOverLimit = textLength < 0;

    Row saveRow = isSavedProvider.when(
      data: (data) {
        return Row(
          children: [
            Icon(
              CustomIcons.save_fill,
              size: 16,
              color: isFirstPost
                  ? customThemeColors.textDisabled
                  : customThemeColors.blue,
            ),
            const Gap(4),
            Text(
              'Saved',
              style: customTextStyle.montLabelSmall.copyWith(
                color: isFirstPost
                    ? customThemeColors.textDisabled
                    : customThemeColors.blue,
              ),
            ),
          ],
        );
      },
      error: (error, _) {
        return Row(
          children: [
            Icon(
              CustomIcons.warning_line,
              size: 16,
              color: customThemeColors.red,
            ),
            const Gap(4),
            Text(
              '{error.toString()}',
              style: customTextStyle.montLabelSmall
                  .copyWith(color: customThemeColors.blue),
            ),
          ],
        );
      },
      loading: () {
        return Row(
          children: [
            const CommonCircularProgressIndicator(size: 16, strokeWidth: 2),
            const Gap(4),
            Text(
              'Saving',
              style: customTextStyle.montLabelSmall.copyWith(
                color: customThemeColors.textSecondary,
              ),
            ),
          ],
        );
      },
    );

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: customThemeColors.strokeDivider,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            saveRow,
            const Spacer(),
            Text(
              '$textLength',
              style: customTextStyle.montLabelSmall.copyWith(
                  color: isOverLimit
                      ? customThemeColors.red
                      : customThemeColors.textDisabled),
            ),
            const Gap(16),
            CommonTextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 5),
              ),
              onPressed: isOverLimit || content.isEmpty
                  ? null
                  : () {
                      ref
                          .read(createPostControllerProvider.notifier)
                          .handlePressedSubmitButton(context);
                    },
              child: Text(
                '게시',
                style: customTextStyle.titleMedium
                    .copyWith(color: customThemeColors.textInvert),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
