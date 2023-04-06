import 'package:flutter/material.dart';
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
