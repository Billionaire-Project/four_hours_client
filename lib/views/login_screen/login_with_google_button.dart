import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_hours_client/controller/auth_controller.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class LoginWithGoogleButton extends ConsumerWidget {
  const LoginWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (next.isLoading) {
        showCommonLoader();
      } else {
        closeRootNavigator();
      }
    });

    void handlePressedSignWithGoogle() async {
      await ref.read(authControllerProvider.notifier).signInWithGoogle();
    }

    return GestureDetector(
      onTap: handlePressedSignWithGoogle,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(width: 1, color: customThemeColors.buttonPrimary),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo-google-fill.svg',
              width: 18,
              height: 18,
              semanticsLabel: 'Google logo',
            ),
            const Gap(6),
            Text(
              'Google로 시작하기',
              style: customTextStyle.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
