import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/onboarding_screen/onboarding_texts.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Image.asset(
          'assets/images/onboarding/screen02.png',
        ),
        const Gap(24),
        const OnboardingTexts(
          pageIndex: 1,
        ),
      ],
    );
  }
}
