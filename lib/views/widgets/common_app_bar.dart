import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:go_router/go_router.dart';

class CommonAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const CommonAppBar({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(commonAppBarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: customTextStyle.titleLarge,
      ),
      leading: CommonIconButton(
        onTap: () => context.pop(),
        icon: const Icon(
          CustomIcons.arrow_left_line,
          size: 24,
        ),
      ),
      //! endDrawer를 사용하니 메뉴 아이콘이 앱바 우측에 자동 생성 됨
      actions: actions ??
          [
            const SizedBox.shrink(),
          ],
      centerTitle: true,
      backgroundColor: customThemeColors.background,
    );
  }
}
