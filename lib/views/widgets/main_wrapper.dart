import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/setting_screen/setting_drawer.dart';

class MainWrapper extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  const MainWrapper({
    Key? key,
    required this.child,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: CustomThemeColor(context).background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(pagePadding),
          child: child,
        ),
      ),
      endDrawer: const SettingDrawer(),
    );
  }
}
