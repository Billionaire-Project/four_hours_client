import 'package:flutter/material.dart';

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
      body: SafeArea(child: child),
    );
  }
}
