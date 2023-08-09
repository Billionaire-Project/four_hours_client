import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/onboarding_controller.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

class OnboardingTexts extends ConsumerWidget {
  final int pageIndex;
  const OnboardingTexts({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Column(
      children: [
        Text(
          onboardingBottomTexts[pageIndex][0],
          style: customTextStyle.montDisplaySmall,
        ),
        Text(
          onboardingBottomTexts[pageIndex][1],
          style: customTextStyle.headlineSmall,
        ),
        Text(
          onboardingBottomTexts[pageIndex][2],
          style: customTextStyle.headlineSmall,
        ),
      ],
    );
  }
}
