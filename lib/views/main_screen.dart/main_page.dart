import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/views/shared_screen.dart/shared_page.dart';
import 'package:four_hours_client/views/widgets/main_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:four_hours_client/views/write_screen.dart/write_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainWrapper(
      appBar: MainAppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(appBarHeight),
          child: Align(
            alignment: Alignment.center,
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
                onTap: (int index) {},
              ),
            ),
          ),
        ),
      ),
      child: TabBarView(
          controller: _tabController,
          children: const [WritePage(), SharedPage()]),
    );
  }
}
