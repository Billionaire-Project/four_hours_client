import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/controller/liked_posts_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_posts_page.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

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
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        'assets/images/logo.svg',
        semanticsLabel: 'Logo',
      ),
      leading: Row(
        children: [
          const Gap(8),
          CommonIconButton(
            onTap: () async {
              context.push(LikedPostsPage.path);

              await ref
                  .read(likedPostsControllerProvider.notifier)
                  .getLikedPostsInitial();
              await ref
                  .read(homeSharedControllerProvider.notifier)
                  .getPostsInitial();
              await ref
                  .read(homeWriteControllerProvider.notifier)
                  .getMyPostsInitial();
            },
            icon: const Icon(
              CustomIcons.heart_line,
              size: 24,
            ),
          ),
        ],
      ),
      actions: [
        CommonIconButton(
          icon: const Icon(
            CustomIcons.settings_line,
            size: 24,
          ),
          onTap: () => Scaffold.of(context).openEndDrawer(),
        ),
        const Gap(8),
      ],
      bottom: bottom,
      backgroundColor: customThemeColors.background,
      foregroundColor: customThemeColors.onBackground,
      centerTitle: true,
      shadowColor: null,
      elevation: 0,
    );
  }
}
