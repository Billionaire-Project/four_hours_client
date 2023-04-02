import 'package:flutter/material.dart';

class CommonButtonFill extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const CommonButtonFill(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
