import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/home_screen/home_tab_bar.dart';
import 'package:four_hours_client/views/widgets/main_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class HomePage extends ConsumerStatefulWidget {
  final Widget child;

  const HomePage({Key? key, required this.child}) : super(key: key);
  static const String path = '/home';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
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
        bottom: HomeTabBar(
          tabController: _tabController!,
        ),
      ),
      child: widget.child,
    );
  }
}
