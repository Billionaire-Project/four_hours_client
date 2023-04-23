import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

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

    return CupertinoActionSheet(
      actions: actions,
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          '취소',
          style: customTextStyle.titleMedium,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
