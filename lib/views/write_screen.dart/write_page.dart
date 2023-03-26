import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
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
          Center(
            child: Text(isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontFamily: 'Mont')),
          ),
          Center(
            child: Text(isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontFamily: 'Mont')),
          ),
          Center(
            child: Text(isDarkMode ? 'Dark Mode' : 'Light Mode',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontFamily: 'Mont')),
          ),
          Center(
            child: Text(isDarkMode ? '다크 모드' : '라이트 모드',
                style: Theme.of(context).textTheme.headlineSmall),
          ),
          Center(
            child: Text(isDarkMode ? '다크 모드' : '라이트 모드',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Center(
            child: Text(isDarkMode ? '다크 모드' : '라이트 모드',
                style: Theme.of(context).textTheme.bodyMedium),
          )
        ],
      ),
    );
  }
}
