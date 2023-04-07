import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_load_dialog.dart';

void showCommonLoadDialog(BuildContext context) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => const CommonLoadDialog(),
  );
}

void closeCommonLoadDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}

void showCommonActionSheet(BuildContext context,
    {required List<CommonActionSheetAction> actions}) {
  showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CommonActionSheet(actions: actions);
      });
}
