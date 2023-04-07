import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:go_router/go_router.dart';

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(settingAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        '설정',
        style: CustomTextStyle(context).titleLarge,
      ),
      leading: CommonIconButton(
        onTap: () => context.pop(),
        icon: const Icon(
          CustomIcons.arrow_left_line,
          size: 24,
        ),
      ),
      //! endDrawer를 사용하니 메뉴 아이콘이 앱바 우측에 자동 생성 됨
      actions: const [SizedBox.shrink()],
      centerTitle: true,
    );
  }
}
