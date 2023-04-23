import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonDivider extends ConsumerWidget {
  final Color? color;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;

  const CommonDivider({
    Key? key,
    this.color,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Divider(
      thickness: thickness ?? 1,
      color: color ?? customThemeColors.strokeDivider,
      height: height,
      indent: indent,
      endIndent: endIndent,
    );
  }
}
