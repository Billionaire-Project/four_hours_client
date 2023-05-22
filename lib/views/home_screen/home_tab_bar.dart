import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_tab.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:go_router/go_router.dart';

class HomeTabBar extends ConsumerWidget implements PreferredSizeWidget {
  final TabController? tabController;
  const HomeTabBar({Key? key, this.tabController}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(appBarBottomHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final currentLocation = GoRouter.of(context).location;

    if (currentLocation == HomeWriteTab.path) {
      tabController?.animateTo(0);
    } else if (currentLocation == HomeSharedTab.path) {
      tabController?.animateTo(1);
    }

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
                color: currentLocation == HomeWriteTab.path
                    ? CustomColors.light.gray900
                    : CustomColors.light.gray300,
              ),
            ),
            Text(
              'SHARED',
              style: customTextStyle.montTitleLarge.copyWith(
                color: currentLocation == HomeSharedTab.path
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
          onTap: (int index) {
            if (currentLocation == HomeWriteTab.path && index == 1) {
              context.go(HomeSharedTab.path);
            } else if (currentLocation == HomeSharedTab.path && index == 0) {
              context.go(HomeWriteTab.path);
            }
          },
        ),
      ),
    );
  }
}
