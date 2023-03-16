import 'package:flutter/material.dart';

class MainWrapper extends StatelessWidget {
  final Widget child;
  const MainWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: child),
    );
  }
}
