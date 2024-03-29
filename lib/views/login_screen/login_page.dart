import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/login_screen/login_with_apple_button.dart';
import 'package:four_hours_client/views/login_screen/login_with_google_button.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String path = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);
    final isDarkMode = ref.watch(themeNotifierProvider);

    FlutterNativeSplash.remove();

    return CommonWrapper(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/images/logo_${isDarkMode ? 'dark' : 'light'}.svg',
                width: 176,
                height: 32,
                semanticsLabel: 'Logo',
              ),
            ),
            const LoginWithGoogleButton(),
            const Gap(16),
            if (!Platform.isAndroid) const LoginWithAppleButton(),
            const Gap(32),
            GestureDetector(
              onTap: () async {
                await openUrl(privacyPolicyUrl);
              },
              child: Text(
                '위의 “Apple/Google로 계속하기”를 클릭하면\n4hours의 이용약관 및 개인정보 보호정책을 읽고 이해했으며\n그에 동의하는 것으로 간주됩니다.',
                style: customTextStyle.caption
                    .copyWith(color: customThemeColors.textDisabled),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
