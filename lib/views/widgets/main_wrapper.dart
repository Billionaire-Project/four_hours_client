import 'package:flutter/material.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
      endDrawer: const SettingDrawer(),
    );
  }
}
