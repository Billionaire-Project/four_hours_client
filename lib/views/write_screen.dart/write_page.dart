import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/custom_icons.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class WritePage extends ConsumerWidget {
  const WritePage({Key? key}) : super(key: key);
  static const String path = '/write';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    return MainWrapper(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () =>
                ref.read(themeNotifierProvider.notifier).changeTheme(),
            child: const Text('change theme mode'),
          ),
          const Icon(
            CustomIcons.arrow_left_line,
            size: 20,
            color: Colors.black,
          ),
          const Icon(
            CustomIcons.check_line,
            size: 20,
            color: Colors.black,
          ),
          const Icon(
            CustomIcons.heart_line,
            size: 20,
            color: Colors.black,
          ),
          const Icon(
            CustomIcons.settings_line,
            size: 20,
            color: Colors.black,
          ),
          const Icon(
            CustomIcons.time_line,
            size: 20,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
