import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/auth_controller.dart';
import 'package:four_hours_client/providers/package_info_provider.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/setting_screen/setting_tile_with_chevron.dart';
import 'package:four_hours_client/views/setting_screen/setting_tile_with_switch.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_widgets_page.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:go_router/go_router.dart';

class SettingDrawer extends ConsumerWidget {
  const SettingDrawer({Key? key}) : super(key: key);
  static const String path = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? version = ref.watch(packageInfoProvider).value?.version;
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      padding: const EdgeInsets.all(16),
      appBar: const CommonAppBar(
        title: '설정',
      ),
      child: Column(
        children: [
          const Gap(16),
          const SettingTileWithSwitch(
            iconData: CustomIcons.moon_fill,
            text: '푸시 알림 ON',
            value: false,
          ),
          const Gap(48),
          SettingTileWithSwitch(
            iconData: CustomIcons.moon_fill,
            text: '다크 모드 ON',
            value: ref.watch(themeNotifierProvider),
            onChanged: (value) {
              ref.read(themeNotifierProvider.notifier).changeTheme();
            },
          ),
          const Gap(48),
          SettingTileWithChevron(
            iconData: CustomIcons.star_fill,
            text: '4hours 평가하기',
            onTap: () {},
          ),
          const Gap(48),
          SettingTileWithChevron(
            iconData: CustomIcons.logout_line,
            color: CustomColors.light.red,
            text: '로그아웃',
            onTap: () => ref.read(authControllerProvider.notifier).signOut(),
          ),
          const Gap(48),

          //TODO: if develop
          SettingTileWithChevron(
            iconData: CustomIcons.warning_line,
            color: CustomColors.light.blue,
            text: 'Widgets',
            onTap: () => context.push(CommonWidgetsPage.path),
          ),

          const Spacer(),
          Text(
            '앱 버젼: ${version ?? 'Beta'}',
            style: customTextStyle.caption.copyWith(
              color: customThemeColors.textDisabled,
            ),
          ),
        ],
      ),
    );
  }
}
