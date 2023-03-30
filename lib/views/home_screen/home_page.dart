import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/widgets/main_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  const HomePage({Key? key, required this.child}) : super(key: key);
  static const String path = '/';
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
