import 'package:flutter/material.dart';

class Endpoints extends InheritedWidget {
  final String baseUrl;

  const Endpoints({
    Key? key,
    required this.baseUrl,
    required Widget child,
  }) : super(key: key, child: child);

  static Endpoints of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Endpoints>() as Endpoints;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
