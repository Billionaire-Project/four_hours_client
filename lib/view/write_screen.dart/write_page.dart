import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/provider/theme_provider.dart';

class WritePage extends ConsumerWidget {
  const WritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider);
    return Scaffold(
      body: SafeArea(
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
                style: Theme.of(context).textTheme.headlineLarge),
          )
        ],
      )),
    );
  }
}
