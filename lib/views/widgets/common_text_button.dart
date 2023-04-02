import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const CommonTextButton({Key? key, this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
