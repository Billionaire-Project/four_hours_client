import 'package:flutter/material.dart';

class SharedPage extends StatelessWidget {
  const SharedPage({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Shared Page',
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
