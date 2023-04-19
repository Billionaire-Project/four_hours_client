import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';
import 'package:go_router/go_router.dart';

class BottomTabBar extends ConsumerWidget implements PreferredSizeWidget {
  final TabController? tabController;
  const BottomTabBar({Key? key, this.tabController}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appBarBottomHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
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
              style: customTextStyle.montTitleLarge.copyWith(
                color: tabController?.index == 0
                    ? CustomColors.light.gray900
                    : CustomColors.light.gray300,
              ),
            ),
            Text(
              'SHARED',
              style: customTextStyle.montTitleLarge.copyWith(
                color: tabController?.index == 1
                    ? CustomColors.light.gray900
                    : CustomColors.light.gray300,
              ),
            )
          ],
          indicator: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: CustomColors.light.gray900,
                width: 2.0,
              ),
            ),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          splashFactory: NoSplash.splashFactory,
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          unselectedLabelColor: CustomColors.light.gray300,
          unselectedLabelStyle: customTextStyle.montTitleLarge
              .copyWith(color: CustomColors.light.gray300),
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
