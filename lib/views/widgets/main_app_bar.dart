import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const MainAppBar({
    Key? key,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('4hours'),
      actions: const [
        CommonIconButton(icon: Icon(Icons.heart_broken)),
        Gap(8),
        CommonIconButton(icon: Icon(Icons.settings))
      ],
      bottom: bottom,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
    );
  }
}
