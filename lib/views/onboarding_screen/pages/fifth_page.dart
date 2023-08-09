import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/onboarding_screen/onboarding_texts.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class FifthPage extends ConsumerWidget {
  const FifthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Image.asset(
          'assets/images/onboarding/screen05.png',
        ),
        const Gap(24),
        const OnboardingTexts(
          pageIndex: 4,
        ),
      ],
    );
  }
}
