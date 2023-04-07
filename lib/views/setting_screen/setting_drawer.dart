import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/auth_provider.dart';
import 'package:four_hours_client/providers/package_info_provider.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/setting_screen/setting_app_bar.dart';
import 'package:four_hours_client/views/setting_screen/setting_tile_with_chevron.dart';
import 'package:four_hours_client/views/setting_screen/setting_tile_with_switch.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class SettingDrawer extends ConsumerWidget {
  const SettingDrawer({Key? key}) : super(key: key);
  static const String path = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? version = ref.watch(packageInfoProvider).value?.version;
    return MainWrapper(
      appBar: const SettingAppBar(),
      child: Column(
        children: [
          const SettingTileWithSwitch(
            iconData: CustomIcons.moon_fill,
            text: '푸시 알림 ON',
            value: true,
          ),
          const Gap(48),
          const SettingTileWithSwitch(
            iconData: CustomIcons.moon_fill,
            text: '다크 모드 ON',
            value: false,
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
            onTap: () => ref.read(authProvider.notifier).signOut(),
          ),
          const Spacer(),
          Text(
            '앱 버젼: ${version ?? 'Beta'}',
            style: CustomTextStyle(context).caption.copyWith(
                  color: CustomThemeColor(context).textDisabled,
                ),
          )
        ],
      ),
    );
  }
}