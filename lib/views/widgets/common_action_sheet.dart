import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonActionSheet extends ConsumerWidget {
  final List<Widget>? actions;
  final ScrollController? actionScrollController;
  const CommonActionSheet({
    Key? key,
    required this.actions,
    this.actionScrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return CupertinoActionSheet(
      actions: actions,
      cancelButton: DecoratedBox(
        decoration: BoxDecoration(
          color: customThemeColors.backgroundElevated,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CupertinoActionSheetAction(
          child: Text(
            '취소',
            style: customTextStyle.titleMedium,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
