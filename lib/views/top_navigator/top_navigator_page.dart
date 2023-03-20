import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/views/shared_screen/shared_page.dart';
import 'package:four_hours_client/views/widgets/main_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:four_hours_client/views/write_screen/write_page.dart';
import 'package:go_router/go_router.dart';

class TopNavigatorPage extends StatefulWidget {
  final Widget child;

  const TopNavigatorPage({Key? key, required this.child}) : super(key: key);

  @override
  State<TopNavigatorPage> createState() => _TopNavigatorPageState();
}

class _TopNavigatorPageState extends State<TopNavigatorPage>
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
          preferredSize: const Size.fromHeight(appBarHeight),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: 200,
              child: TabBar(
                controller: _tabController,
                tabs: const [Text('WRITE'), Text('SHARED')],
                indicator: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                overlayColor: MaterialStateColor.resolveWith(
                    (states) => Colors.transparent),
                splashFactory: NoSplash.splashFactory,
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
