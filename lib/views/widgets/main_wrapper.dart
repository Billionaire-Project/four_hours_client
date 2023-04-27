import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/setting_screen/setting_drawer.dart';

class MainWrapper extends ConsumerWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry padding;
  const MainWrapper({
    Key? key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Scaffold(
      appBar: appBar,
      backgroundColor: customThemeColors.background,
      body: SafeArea(
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
      endDrawer: const SettingDrawer(),
    );
  }
}
