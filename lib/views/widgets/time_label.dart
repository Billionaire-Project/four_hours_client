import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/text_container.dart';

class TimeLabel extends ConsumerWidget {
  final String text;
  const TimeLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return TextContainer(
      text: text,
      textStyle: customTextStyle.montLabelSmall,
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      boxDecoration: BoxDecoration(
        color: CustomColors.light.gray100,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
