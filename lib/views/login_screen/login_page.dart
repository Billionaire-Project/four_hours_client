import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String path = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return MainWrapper(
        child: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: SvgPicture.asset(
            'assets/images/logo.svg',
            width: 176,
            height: 32,
            semanticsLabel: 'Logo',
          ),
        ),
        InkWell(
          onTap: () => ref.read(authProvider.notifier).signInWithGoogle(),
          child: Container(
            height: 48,
            decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                    width: 1, color: CustomThemeColor(context).buttonSecondary),
                borderRadius: BorderRadius.circular(4)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                'assets/images/logo-google-fill.svg',
                width: 18,
                height: 18,
                semanticsLabel: 'Google logo',
              ),
              const Gap(6),
              Text(
                'Google로 시작하기',
                style: CustomTextStyle(context).titleMedium,
              ),
            ]),
          ),
        ),
        const Gap(16),
        InkWell(
            onTap: () => ref.read(authProvider.notifier).signInWithApple(),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  color: CustomThemeColor(context).buttonPrimary,
                  border: Border.all(
                      width: 1,
                      color: CustomThemeColor(context).buttonSecondary),
                  borderRadius: BorderRadius.circular(4)),
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
                    style: CustomTextStyle(context).titleMedium.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              ),
            )),
        const Gap(32),
        Text(
          '위의 “Apple/Google로 계속하기”를 클릭하면\n4hours의 이용약관 및 개인정보 보호정책을 읽고 이해했으며\n그에 동의하는 것으로 간주됩니다.',
          style: CustomTextStyle(context)
              .caption
              .copyWith(color: CustomThemeColor(context).textDisabled),
          textAlign: TextAlign.center,
        )
        // if (authState is AsyncLoading) const CircularProgressIndicator(),
      ]),
    ));
  }
}
