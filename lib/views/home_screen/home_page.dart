import 'package:flutter/material.dart';
import 'package:four_hours_client/views/home_screen/bottom_tab_bar.dart';
import 'package:four_hours_client/views/widgets/main_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

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
          bottom: BottomTabBar(
        tabController: _tabController,
      )),
      child: widget.child,
    );
  }
}
