import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/views/home_screen/home_page.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:four_hours_client/views/widgets/loading_page.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);
  static const String path = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (user) {
          if (user != null) return const HomePage(child: WritePage());
          return const LoginPage();
        },
        error: (_, __) => const LoginPage(),
        loading: () => const LoadingPage());
  }
}
