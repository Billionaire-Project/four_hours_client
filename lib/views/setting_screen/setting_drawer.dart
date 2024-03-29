import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/auth_controller.dart';
import 'package:four_hours_client/providers/package_info_provider.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/setting_screen/setting_button.dart';
import 'package:four_hours_client/views/setting_screen/setting_tile_with_chevron.dart';
import 'package:four_hours_client/views/setting_screen/setting_tile_with_switch.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_widgets_page.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

class SettingDrawer extends ConsumerWidget {
  const SettingDrawer({Key? key}) : super(key: key);
  static const String path = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? version = ref.watch(packageInfoProvider).value?.version;
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final customTextStyle = ref.watch(customTextStyleProvider);

    return CommonWrapper(
      padding: const EdgeInsets.all(16),
      appBar: const CommonAppBar(
        title: '설정',
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Gap(16),
              const SettingTileWithSwitch(
                iconData: CustomIcons.notif_fill,
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
              //TODO: 스토어 리뷰로 연결
              // const Gap(40),
              // SettingTileWithChevron(
              //   iconData: CustomIcons.star_fill,
              //   text: '4hours 평가하기',
              //   onTap: () {},
              // ),
              const Gap(40),
              SettingTileWithChevron(
                iconData: CustomIcons.save_fill,
                text: '개인정보처리방침',
                onTap: () {
                  openUrl(privacyPolicyUrl);
                },
              ),
              const Gap(40),
              SettingTileWithChevron(
                iconData: CustomIcons.save_fill,
                text: '이용약관',
                onTap: () {
                  openUrl(termsOfUseUrl);
                },
              ),
              const Gap(40),
              if (!checkIsProductionServer(context))
                SettingTileWithChevron(
                  iconData: CustomIcons.warning_line,
                  color: CustomColors.light.blue,
                  text: 'Widgets',
                  onTap: () => context.push(CommonWidgetsPage.path),
                ),
            ],
          ),
          Column(
            children: [
              SettingButton(
                text: '로그아웃',
                iconData: CustomIcons.logout_line,
                onPressed: () {
                  showCommonDialogWithTwoButtons(
                    isDestructiveAction: true,
                    iconData: CustomIcons.logout_line,
                    title: '로그아웃 하시겠어요?',
                    onPressedRightButton: () =>
                        ref.read(authControllerProvider.notifier).signOut(),
                    rightButtonText: '로그아웃',
                  );
                },
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showCommonDialogWithTwoButtons(
                        isDestructiveAction: true,
                        iconData: CustomIcons.logout_line,
                        title: '정말 계정을 삭제하시겠어요?',
                        subtitle:
                            '계정을 삭제하면 기존에 작성하신 글을 포함한\n모든 데이터가 제거되며 다시 복구될 수 없어요',
                        onPressedRightButton: () async {
                          await ref
                              .read(authControllerProvider.notifier)
                              .deleteAccount();
                        },
                        rightButtonText: '계정 삭제',
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          CustomIcons.delete_bin_line,
                          size: 16,
                          color: customThemeColors.textDisabled,
                        ),
                        const Gap(4),
                        Text(
                          '계정 삭제',
                          style: customTextStyle.caption.copyWith(
                            color: customThemeColors.textDisabled,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '앱 버전: ${version ?? 'Beta'}',
                    style: customTextStyle.caption.copyWith(
                      color: customThemeColors.textDisabled,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
