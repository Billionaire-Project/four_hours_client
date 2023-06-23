import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/controller/liked_posts_controller.dart';
import 'package:four_hours_client/providers/saved_controller.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_posts_page.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/saved_custom_painter.dart';
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

    bool isShown = ref.watch(savedControllerProvider);

    return AppBar(
      leadingWidth: 120,
      automaticallyImplyLeading: false,
      backgroundColor: customThemeColors.background,
      foregroundColor: customThemeColors.onBackground,
      centerTitle: true,
      shadowColor: null,
      elevation: 0,
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

//? 좋아요 목록에 들어가는 순간 write, shared, liked 리스트를 모두 다시 불러온다.
//? 이렇게 해서 liked에서 좋아요를 누르면 shared에서도 좋아요가 반영되도록 한다.
//? 근데 왜 이게 되는지 모르겠다.
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
          if (isShown)
            CustomPaint(
              size: const Size(60, 24),
              painter: SavedCustomPainter(),
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
    );
  }
}
