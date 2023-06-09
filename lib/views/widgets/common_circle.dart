import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonCircle extends ConsumerWidget {
  final double? size;
  final Color? color;
  final Widget? child;
  const CommonCircle({
    Key? key,
    required this.size,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
