import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class LoginWithAppleButton extends ConsumerWidget {
  const LoginWithAppleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.isLoading) {
        showCommonLoader(context);
      } else {
        closeRootNavigator(context);
      }
    });

    void handlePressedSignWithApple() async {
      await ref.read(authProvider.notifier).signInWithApple();
    }

    return InkWell(
      onTap: handlePressedSignWithApple,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: customThemeColors.buttonPrimary,
          border: Border.all(
            width: 1,
            color: customThemeColors.buttonSecondary,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo-apple-fill.svg',
              width: 18,
              height: 18,
              semanticsLabel: 'Apple logo',
            ),
            const Gap(6),
            Text(
              'Apple로 시작하기',
              style: customTextStyle.titleMedium
                  .copyWith(color: customThemeColors.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
