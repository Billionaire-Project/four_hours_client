import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainWrapper(
      child: Column(children: [
        const Text('Login Page'),
        ElevatedButton(
            onPressed: () => ref.read(authProvider.notifier).signInWithGoogle(),
            child: const Text('Sign in with Google'))
      ]),
    );
  }
}
