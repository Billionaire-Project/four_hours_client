import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:intl/intl.dart';

class PostDetailBottom extends ConsumerWidget {
  const PostDetailBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: customThemeColors.strokeDivider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _Timer(),
          _PostDetailActions(),
        ],
      ),
    );
  }
}

class _Timer extends ConsumerWidget {
  const _Timer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      decoration: BoxDecoration(
        color: customThemeColors.backgroundLabel,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Text(
          DateFormat('hh:mm:ss').format(DateTime.now()).toString(),
          style: customTextStyle.montHeadlineSmall,
        ),
      ),
    );
  }
}

class _PostDetailActions extends ConsumerWidget {
  const _PostDetailActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: const [
        _PostDetailAction(iconData: CustomIcons.fontsize_line),
        Gap(16),
        _PostDetailAction(iconData: CustomIcons.share_line),
        Gap(16),
        _PostDetailAction(iconData: CustomIcons.heart_line),
      ],
    );
  }
}

class _PostDetailAction extends ConsumerWidget {
  final IconData iconData;
  const _PostDetailAction({Key? key, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      decoration: BoxDecoration(
        color: customThemeColors.backgroundLabel,
        shape: BoxShape.circle,
      ),
      child: CommonIconButton(
        icon: Icon(
          iconData,
        ),
      ),
    );
  }
}
