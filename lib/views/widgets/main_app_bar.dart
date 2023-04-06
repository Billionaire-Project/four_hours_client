import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

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
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        semanticsLabel: 'Logo',
      ),
      leading: Row(
        children: const [
          Gap(8),
          CommonIconButton(icon: Icon(CustomIcons.heart_line, size: 24)),
        ],
      ),
      actions: [
        CommonIconButton(
            icon: const Icon(
              CustomIcons.settings_line,
              size: 24,
            ),
            onTap: () => Scaffold.of(context).openEndDrawer()),
        const Gap(8),
      ],
      bottom: bottom,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      centerTitle: true,
    );
  }
}
