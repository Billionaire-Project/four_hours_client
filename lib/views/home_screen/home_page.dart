import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/mont_text_style.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/widgets/main_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({Key? key, required this.child}) : super(key: key);
  static const String path = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: MainAppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(appBarBottomHeight),
          child: DefaultTabController(
            length: 2,
            child: Align(
              alignment: Alignment.center,
              child: TabBar(
                isScrollable: true,
                controller: _tabController,
                tabs: [
                  Text(
                    'WRITE',
                    style: MontTextStyle.titleLarge
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    'SHARED',
                    style: MontTextStyle.titleLarge
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
                ],
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2.0,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                splashFactory: NoSplash.splashFactory,
                padding: EdgeInsets.zero,
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                onTap: (int index) {
                  if (index == 0) {
                    context.go(WritePage.path);
                  } else {
                    context.go(SharedPage.path);
                  }
                },
              ),
            ),
          ),
        ),
      ),
      child: Scaffold(
        body: widget.child,
      ),
    );
  }
}
