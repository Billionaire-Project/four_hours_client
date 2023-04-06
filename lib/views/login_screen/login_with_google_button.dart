import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class LoginWithGoogleButton extends ConsumerWidget {
  const LoginWithGoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authProvider, (previous, next) {
      if (next.isLoading) {
        showCommonLoadDialog(context);
      } else {
        closeCommonLoadDialog(context);
      }
    });

    void handlePressedSignWithGoogle() async {
      await ref.read(authProvider.notifier).signInWithGoogle();
    }

    return InkWell(
      onTap: handlePressedSignWithGoogle,
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
    );
  }
}
