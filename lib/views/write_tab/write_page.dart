import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_text_button.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:four_hours_client/views/widgets/time_label.dart';

class WritePage extends ConsumerWidget {
  const WritePage({Key? key}) : super(key: key);
  static const String path = '/write';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainWrapper(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextButton(
              onPressed: () =>
                  ref.read(themeNotifierProvider.notifier).changeTheme(),
              child: const Text('change theme mode'),
            ),
            CommonFullWidthTextButton(
                onPressed: () {
                  print('jay --- full width button');
                },
                text: 'Full width button'),
            const TimeLabel(text: '8 hours')
          ],
        ),
      ),
    );
  }
}
