import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

class CommonTitle extends ConsumerWidget {
  String data;
  CommonTitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Text(
      data,
      style: customTextStyle.montHeadlineMedium,
    );
  }
}
