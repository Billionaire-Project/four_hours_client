import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonWrapper extends ConsumerWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  const CommonWrapper({
    Key? key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.appBar,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Scaffold(
      appBar: appBar,
      backgroundColor: backgroundColor ?? customThemeColors.background,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
