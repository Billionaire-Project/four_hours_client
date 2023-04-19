import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonCircularProgressIndicator extends ConsumerWidget {
  final double size;
  final double strokeWidth;
  const CommonCircularProgressIndicator({
    Key? key,
    required this.size,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(customThemeColors.onPrimary),
        backgroundColor: customThemeColors.onBackground.withOpacity(0.8),
      ),
    );
  }
}
