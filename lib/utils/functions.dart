import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_alert.dart';
import 'package:four_hours_client/views/widgets/common_loader.dart';
import 'package:four_hours_client/views/widgets/common_toast.dart';

void showCommonAlert(BuildContext context,
    {required IconData iconData,
    required String text,
    bool autoDismiss = true}) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => CommonAlert(
      iconData: iconData,
      text: text,
    ),
  );
  if (autoDismiss) {
    Timer(const Duration(seconds: 1), () {
      closeRootNavigator(context);
    });
  }
}

void showCommonLoader(BuildContext context) {
  showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) => const CommonLoader(),
  );
}

void closeRootNavigator(BuildContext context) {
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

void showCommonToast(BuildContext context,
    {required IconData iconData, required String text}) {
  final fToast = FToast();
  fToast.removeCustomToast();

  fToast.init(context);
  fToast.showToast(
      child: CommonToast(iconData: iconData, text: text),
      toastDuration: const Duration(seconds: 1),
      // gravity: ToastGravity.NONE,
      positionedToastBuilder: (context, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              bottom: 0,
              child: child,
            ),
          ],
        );
      });
}
