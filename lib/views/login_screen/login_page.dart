import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
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
        const Text('Login Page'),
        ElevatedButton(
            onPressed: () => ref.read(authProvider.notifier).signInWithGoogle(),
            child: const Text('Sign in with Google')),
        ElevatedButton(
            onPressed: () => ref.read(authProvider.notifier).signInWithApple(),
            child: const Text('Sign in with Apple')),
        if (authState is AsyncLoading) const CircularProgressIndicator(),
      ]),
    ));
  }
}
