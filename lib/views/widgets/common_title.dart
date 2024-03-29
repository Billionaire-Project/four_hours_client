import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

class CommonTitle extends ConsumerWidget {
  final String title;
  const CommonTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Text(
      title,
      style: customTextStyle.montHeadlineMedium,
    );
  }
}
