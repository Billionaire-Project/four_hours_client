import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresherHeader extends ConsumerWidget {
  const CustomRefresherHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return CustomHeader(
      builder: (BuildContext context, RefreshStatus? mode) {
        Widget body;
        if (mode == RefreshStatus.idle) {
          body = Column(
            children: [
              const Icon(
                CustomIcons.arrow_down_line,
                size: 24,
              ),
              Text(
                "당겨서 새로고침",
                style: customTextStyle.caption,
              ),
            ],
          );
        } else if (mode == RefreshStatus.refreshing) {
          body = Column(
            children: [
              const CommonCircularProgressIndicator(
                size: 16,
                strokeWidth: 2,
              ),
              const Gap(4),
              Text(
                "놓아서 새로고침",
                style: customTextStyle.caption,
              ),
            ],
          );
        } else if (mode == RefreshStatus.failed) {
          body = Text(
            "새로고침 실패",
            style: customTextStyle.caption.copyWith(
              color: customThemeColors.red,
            ),
          );
        } else if (mode == RefreshStatus.canRefresh) {
          body = Column(
            children: [
              const Icon(
                CustomIcons.arrow_up_line,
                size: 24,
              ),
              Text(
                "놓아서 새로고침",
                style: customTextStyle.caption,
              ),
            ],
          );
        } else if (mode == RefreshStatus.completed) {
          body = Column(
            children: [
              const CommonCircularProgressIndicator(
                size: 16,
                strokeWidth: 2,
              ),
              const Gap(4),
              Text(
                "놓아서 새로고침",
                style: customTextStyle.caption,
              ),
            ],
          );
        } else {
          body = const SizedBox.shrink();
        }

        return Center(child: body);
      },
    );
  }
}
