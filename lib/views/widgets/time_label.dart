import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/text_container.dart';

class TimeLabel extends StatelessWidget {
  final String text;
  const TimeLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextContainer(
        text: text,
        textStyle: CustomTextStyle(context).montLabelSmall,
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        boxDecoration: BoxDecoration(
            color: AppLightColors.gray100,
            borderRadius: BorderRadius.circular(4.0)));
  }
}
