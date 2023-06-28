import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonRadioButton extends ConsumerStatefulWidget {
  final bool isSelected;
  final double size;
  final double selectedCircleSize;
  final double unSelectedCircleSize;
  final Color? selectedColor;
  final Color? unSelectedColor;
  final Color? unSelectedBorderColor;
  const CommonRadioButton({
    Key? key,
    required this.isSelected,
    this.size = 24,
    this.selectedCircleSize = 12,
    this.unSelectedCircleSize = 20,
    this.selectedColor,
    this.unSelectedColor,
    this.unSelectedBorderColor,
  }) : super(key: key);

  @override
  ConsumerState<CommonRadioButton> createState() => _CommonRadioButtonState();
}

class _CommonRadioButtonState extends ConsumerState<CommonRadioButton> {
  @override
  Widget build(BuildContext context) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final double selectedBorderWidth =
        (widget.size - widget.selectedCircleSize) / 2;
    final double unSelectedBorderWidth =
        (widget.size - widget.unSelectedCircleSize) / 2;

    return SizedBox.square(
      dimension: widget.size,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: widget.unSelectedColor ?? Colors.transparent,
          shape: const CircleBorder(),
          side: BorderSide(
            width:
                widget.isSelected ? selectedBorderWidth : unSelectedBorderWidth,
            color: widget.isSelected
                ? widget.selectedColor ?? customThemeColors.orange
                : widget.unSelectedBorderColor ??
                    customThemeColors.backgroundPath,
          ),
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: null,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
