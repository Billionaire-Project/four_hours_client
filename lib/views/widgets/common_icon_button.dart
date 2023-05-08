import 'package:flutter/material.dart';

class CommonIconButton extends StatelessWidget {
  final Icon icon;
  final EdgeInsetsGeometry padding;
  final void Function()? onTap;
  const CommonIconButton({
    Key? key,
    required this.icon,
    this.padding = const EdgeInsets.all(8),
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: icon,
      ),
    );
  }
}
