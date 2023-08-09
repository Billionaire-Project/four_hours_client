import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/onboarding_controller.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_circle.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class OnboardingBottom extends ConsumerStatefulWidget {
  final PageController pageController;
  final int currentPage;
  const OnboardingBottom({
    Key? key,
    required this.pageController,
    required this.currentPage,
  }) : super(key: key);

  @override
  ConsumerState<OnboardingBottom> createState() => _OnboardingBottomState();
}

class _OnboardingBottomState extends ConsumerState<OnboardingBottom> {
  @override
  Widget build(BuildContext context) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 8,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CommonCircle(
                  size: 8,
                  color: index == widget.currentPage
                      ? customThemeColors.orange
                      : customThemeColors.backgroundPath,
                );
              },
              separatorBuilder: (context, index) {
                return const CommonCircle(size: 8);
              },
              itemCount: onboardingBottomTexts.length,
            ),
          ),
          const Gap(16),
          CommonFullWidthTextButton(
            text: '다음',
            onPressed: () {
              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ],
      ),
    );
  }
}
