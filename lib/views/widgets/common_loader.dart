import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonLoader extends ConsumerWidget {
  const CommonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: 144,
          height: 144,
          decoration: BoxDecoration(
              color: customThemeColors.buttonPrimary.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CommonCircularProgressIndicator(size: 44, strokeWidth: 6),
              const Gap(8),
              Text(
                'Loading..',
                style: customTextStyle.labelMedium.copyWith(
                  color: customThemeColors.textInvert,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
