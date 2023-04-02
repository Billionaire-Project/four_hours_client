import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/write_screen.dart/write_page.dart';
import 'package:go_router/go_router.dart';

class BottomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? tabController;
  const BottomTabBar({Key? key, this.tabController}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appBarBottomHeight);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Align(
        alignment: Alignment.center,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: [
            Text(
              'WRITE',
              style: CustomTextStyle(context).montTitleLarge.copyWith(
                  color: tabController?.index == 0
                      ? AppLightColors.gray900
                      : AppLightColors.gray300),
            ),
            Text(
              'SHARED',
              style: CustomTextStyle(context).montTitleLarge.copyWith(
                  color: tabController?.index == 1
                      ? AppLightColors.gray900
                      : AppLightColors.gray300),
            )
          ],
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppLightColors.gray900,
                width: 2.0,
              ),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          splashFactory: NoSplash.splashFactory,
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          unselectedLabelColor: AppLightColors.gray300,
          unselectedLabelStyle: CustomTextStyle(context)
              .montTitleLarge
              .copyWith(color: AppLightColors.gray300),
          onTap: (int index) {
            if (index == 0) {
              context.go(WritePage.path);
            } else {
              context.go(SharedPage.path);
            }
          },
        ),
      ),
    );
  }
}
