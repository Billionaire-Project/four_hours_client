import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:four_hours_client/views/widgets/common_circle.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

class OnboardingBottom extends ConsumerStatefulWidget {
  final VoidCallback nextPage;
  final int currentPage;
  const OnboardingBottom({
    Key? key,
    required this.nextPage,
    required this.currentPage,
  }) : super(key: key);

  @override
  ConsumerState<OnboardingBottom> createState() => _OnboardingBottomState();
}

class _OnboardingBottomState extends ConsumerState<OnboardingBottom> {
  @override
  Widget build(BuildContext context) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);

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
              itemCount: onboardingPageCount,
            ),
          ),
          const Gap(16),
          CommonFullWidthTextButton(
            text: onboardingPageCount == widget.currentPage + 1 ? '시작하기' : '다음',
            onPressed: () async {
              if (onboardingPageCount == widget.currentPage + 1) {
                await sharedPreferences.setBool(
                  SharedPreferenceKey.onboarding,
                  true,
                );

                if (context.mounted) {
                  context.go(HomeWriteTab.path);
                }
              } else {
                widget.nextPage();
              }
            },
          ),
        ],
      ),
    );
  }
}
