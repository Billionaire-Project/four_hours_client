import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresherFooter extends StatelessWidget {
  const CustomRefresherFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFooter(
      height: 0,
      builder: (BuildContext context, LoadStatus? mode) {
        return const SizedBox.shrink();
      },
      loadStyle: LoadStyle.HideAlways,
    );
  }
}
