import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_circle.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class HomeSharedObscuredBottom extends ConsumerWidget {
  const HomeSharedObscuredBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: customThemeColors.backgroundElevated,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 8),
            blurRadius: 20,
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonCircle(
              size: 36,
              color: customThemeColors.backgroundLabel,
              child: Icon(
                CustomIcons.view_false_fill,
                size: 20,
                color: customThemeColors.textPrimary,
              ),
            ),
            const Gap(8),
            Expanded(
              child: Text(
                '글 작성 후 24시간 동안만\nSHARED 항목을 볼 수 있어요',
                style: customTextStyle.caption,
              ),
            ),
            const Gap(8),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 96,
              ),
              child: CommonFullWidthTextButton(
                text: '글 쓰기',
                onPressed: () {
                  ref
                      .read(homeWriteControllerProvider.notifier)
                      .handlePressedWritePost(context);
                },
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
