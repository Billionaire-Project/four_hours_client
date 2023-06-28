import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/liked_and_saved_controller.dart';
import 'package:four_hours_client/controller/liked_posts_controller.dart';
import 'package:four_hours_client/controller/saved_controller.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_posts_page.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/saved_custom_painter.dart';
import 'package:go_router/go_router.dart';

class MainAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  final PreferredSizeWidget? bottom;
  const MainAppBar({
    Key? key,
    this.bottom,
  }) : super(key: key);
  @override
  ConsumerState<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(appBarHeight);
}

class _MainAppBarState extends ConsumerState<MainAppBar>
    with TickerProviderStateMixin {
  bool isFirst = true;

  late final AnimationController _controller = AnimationController(
    duration: likeAnimationDuration,
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutBack,
  );

  void _upScale() {
    _controller.forward();
  }

  void _downScale() {
    _controller.reverse();
  }

  void _resetScale() {
    _controller.reset();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final isDarkMode = ref.watch(themeNotifierProvider);

    bool shouldShowSaved = ref.watch(savedControllerProvider);
    bool shouldResetSaved =
        ref.watch(savedControllerProvider.notifier).shouldReset;

    if (shouldShowSaved && isFirst) {
      _upScale();
      isFirst = false;
    } else if (shouldShowSaved && !isFirst) {
      _resetScale();
      _upScale();
    } else if (!shouldShowSaved) {
      _downScale();
      isFirst = true;
    }

    if (shouldResetSaved) {
      _resetScale();
    }

    return AppBar(
      leadingWidth: 120,
      automaticallyImplyLeading: false,
      backgroundColor: customThemeColors.background,
      foregroundColor: customThemeColors.onBackground,
      centerTitle: true,
      shadowColor: null,
      elevation: 0,
      title: SvgPicture.asset(
        'assets/images/logo_${isDarkMode ? 'dark' : 'light'}.svg',
        semanticsLabel: 'Logo',
      ),
      leading: Row(
        children: [
          const Gap(8),
          CommonIconButton(
            onTap: () async {
              context.push(LikedPostsPage.path);
              ref.read(savedControllerProvider.notifier).resetSavedAnimation();
              ref
                  .read(likedAndSavedControllerProvider.notifier)
                  .resetLikedAndSavedAnimation();

              await ref
                  .read(likedPostsControllerProvider.notifier)
                  .getLikedPostsInitial();
            },
            icon: const Icon(
              CustomIcons.heart_line,
              size: 24,
            ),
          ),
          ScaleTransition(
            scale: _animation,
            child: CustomPaint(
              size: const Size(60, 24),
              painter: SavedCustomPainter(color: customThemeColors.orange),
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
      bottom: widget.bottom,
    );
  }
}
