import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';

class MainAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const MainAppBar({
    Key? key,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('4hours'),
      actions: [
        CommonIconButton(
            icon: const Icon(Icons.heart_broken),
            onTap: () => ref.read(authProvider.notifier).signOut()),
        const CommonIconButton(icon: Icon(Icons.settings))
      ],
      bottom: bottom,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
    );
  }
}
