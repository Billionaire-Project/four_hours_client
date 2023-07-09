import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:four_hours_client/network/dio_exceptions.dart';
import 'package:four_hours_client/network/endpoints.dart';
import 'package:four_hours_client/routes/app_router.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_alert.dart';
import 'package:four_hours_client/views/widgets/common_dialog.dart';
import 'package:four_hours_client/views/widgets/common_dialog_with_two_buttons.dart';
import 'package:four_hours_client/views/widgets/common_loader.dart';
import 'package:four_hours_client/views/widgets/common_toast.dart';
import 'package:four_hours_client/views/widgets/common_toast_with_action.dart';
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
  bool canPop =
      Navigator.of(navigatorKey.currentContext!, rootNavigator: true).canPop();
  if (canPop) {
    Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
  }
}

void showCommonActionSheet({required List<CommonActionSheetAction> actions}) {
  showCupertinoModalPopup(
      context: navigatorKey.currentContext!,
      barrierColor: CustomColors.black.withOpacity(0.8),
      builder: (context) {
        return CommonActionSheet(actions: actions);
      });
}

void showCommonToast(
  BuildContext context, {
  required IconData iconData,
  required String text,
  double? bottom,
  int? duration,
}) {
  final fToast = FToast();
  fToast.removeCustomToast();

  fToast.init(context);
  fToast.showToast(
    child: CommonToast(iconData: iconData, text: text),
    toastDuration: Duration(seconds: duration ?? 1),
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

void showCommonToastWithAction(
  BuildContext context, {
  required IconData iconData,
  required String text,
  required Widget action,
  double? bottom,
  int? duration,
}) {
  final fToast = FToast();
  fToast.removeCustomToast();

  fToast.init(context);
  fToast.showToast(
    child: CommonToastWithAction(
      iconData: iconData,
      text: text,
      action: action,
    ),
    toastDuration: Duration(seconds: duration ?? 3),
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

Future<void> showCommonDialog({
  required IconData iconData,
  required String title,
  VoidCallback? onPressedButton,
  String? buttonText,
  String? subtitle,
  bool barrierDismissible = true,
}) async {
  showDialog(
    barrierDismissible: barrierDismissible,
    barrierColor: CustomColors.black.withOpacity(0.8),
    context: navigatorKey.currentContext!,
    builder: (context) => CommonDialog(
      iconData: iconData,
      title: title,
      subtitle: subtitle,
      onPressedButton: onPressedButton,
      buttonText: buttonText,
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
  final DateTime dateTime = DateTime.parse(date).toLocal();
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(dateTime);

  final String hoursWithMins = DateFormat.jm().format(dateTime);

  if (difference.inMinutes <= 0) {
    return 'Just now';
  } else if (difference.inHours <= 0) {
    return '${difference.inMinutes}mins';
  } else if (difference.inHours <= 24) {
    return '${difference.inHours}hours';
  } else {
    return hoursWithMins;
  }
}

String throwExceptions(DioError e) {
  final errorMessage = DioExceptions.fromDioError(e).toString();
  return errorMessage;
}

Future<void> saveTextToClipboard(
  BuildContext context, {
  required String text,
}) async {
  await Clipboard.setData(ClipboardData(text: text));

  if (context.mounted) {
    if (!Platform.isAndroid) {
      showCommonToast(
        context,
        iconData: CustomIcons.check_line,
        text: '클립보드에 복사되었어요!',
      );
    }
  }
}

String printDebug(String currentLocation, String text) {
  debugPrint(
    'Location: $currentLocation --- $text',
  );

  return text;
}

bool checkIsProductionServer(BuildContext context) {
  final bool isProductionServer =
      Endpoints.of(context).baseUrl.contains('4444');

  return isProductionServer;
}
