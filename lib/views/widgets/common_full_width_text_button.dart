import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';

class CommonFullWidthTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const CommonFullWidthTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
          color: CustomThemeColor(context).primary,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: CustomThemeColor(context).onPrimary,
                ),
          ),
        ),
      ),
    );
  }
}
