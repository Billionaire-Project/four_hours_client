import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

class CommonTitle extends StatelessWidget {
  String data;
  CommonTitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: CustomTextStyle(context).montHeadlineMedium,
    );
  }
}
