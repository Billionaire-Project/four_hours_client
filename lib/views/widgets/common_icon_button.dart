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
    return DecoratedBox(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          hoverColor: Colors.white.withOpacity(0.05),
          splashColor: Colors.white.withOpacity(0.15),
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: padding,
            child: icon,
          ),
        ),
      ),
    );
  }
}
