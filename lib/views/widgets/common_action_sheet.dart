import 'package:flutter/cupertino.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

class CommonActionSheet extends StatelessWidget {
  final List<Widget>? actions;
  final ScrollController? actionScrollController;
  const CommonActionSheet(
      {Key? key, required this.actions, this.actionScrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: actions,
      cancelButton: CupertinoActionSheetAction(
        child: Text(
          '취소',
          style: CustomTextStyle(context).titleMedium,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
