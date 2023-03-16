import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final Icon icon;
  final EdgeInsetsGeometry padding;
  const CommonIconButton({
    Key? key,
    required this.icon,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: icon,
    );
  }
}
