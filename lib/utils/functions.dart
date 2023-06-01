import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/network/dio_exceptions.dart';
import 'package:four_hours_client/routes/app_router.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_alert.dart';
import 'package:four_hours_client/views/widgets/common_dialog_with_two_buttons.dart';
import 'package:four_hours_client/views/widgets/common_loader.dart';
import 'package:four_hours_client/views/widgets/common_toast.dart';
import 'package:intl/intl.dart';

void showCommonAlert({
  required IconData iconData,
  required String text,
  bool autoDismiss = true,
}) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: navigatorKey.currentContext!,
    builder: (context) => CommonAlert(
      iconData: iconData,
      text: text,
    ),
  );
  if (autoDismiss) {
    Timer(const Duration(seconds: 1), () {
      closeRootNavigator();
    });
  }
}

void showCommonLoader() {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    context: navigatorKey.currentContext!,
    builder: (context) => const CommonLoader(),
  );
}

void closeRootNavigator() {
  Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
}

void showCommonActionSheet({required List<CommonActionSheetAction> actions}) {
  showCupertinoModalPopup(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return CommonActionSheet(actions: actions);
      });
}

void showCommonToast(
  BuildContext context, {
  required IconData iconData,
  required String text,
  double? bottom,
}) {
  final fToast = FToast();
  fToast.removeCustomToast();

  fToast.init(context);
  fToast.showToast(
    child: CommonToast(iconData: iconData, text: text),
    toastDuration: const Duration(seconds: 1),
    positionedToastBuilder: (context, child) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: bottom ?? 0,
            child: child,
          ),
        ],
      );
    },
  );
}

void showCommonDialogWithTwoButtons({
  required IconData iconData,
  required String title,
  required VoidCallback onPressedRightButton,
  required String rightButtonText,
  String? subtitle,
  VoidCallback? onPressedLeftButton,
  String? leftButtonText,
  bool barrierDismissible = true,
  bool isDestructiveAction = false,
}) {
  showDialog(
    barrierDismissible: barrierDismissible,
    barrierColor: CustomColors.black.withOpacity(0.8),
    context: navigatorKey.currentContext!,
    builder: (context) => CommonDialogWithTwoButtons(
      iconData: iconData,
      title: title,
      subtitle: subtitle,
      onPressedRightButton: onPressedRightButton,
      rightButtonText: rightButtonText,
      onPressedLeftButton: onPressedLeftButton,
      leftButtonText: leftButtonText,
      isDestructiveAction: isDestructiveAction,
    ),
  );
}

bool checkHasOnlyWhiteSpace(String text) {
  return text.trim().isEmpty;
}

String getPostElapsedTime({required String date}) {
  final DateTime dateTime = DateTime.parse(date);
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(dateTime);

  if (difference.inMinutes <= 0) {
    return 'Just now';
  } else if (difference.inHours <= 0) {
    return '${difference.inMinutes}mins';
  } else {
    return '${difference.inHours}hours';
  }
}

String getCreatePostTime({required String date}) {
  final DateTime dateTime = DateTime.parse(date);
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(dateTime);

  final String hoursWithMins = DateFormat.jm().format(dateTime);

  if (difference.inMinutes <= 0) {
    return 'Just now';
  } else {
    return hoursWithMins;
  }
}

String throwExceptions(DioError e) {
  final errorMessage = DioExceptions.fromDioError(e).toString();
  return errorMessage;
}

Future<void> saveToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
}
