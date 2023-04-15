import 'package:flutter/material.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class CreateWritingPage extends StatelessWidget {
  const CreateWritingPage({Key? key}) : super(key: key);
  static const String path = 'create-writing';

  @override
  Widget build(BuildContext context) {
    return const MainWrapper(
      appBar: CommonAppBar(title: '새 게시글'),
      child: Center(child: Text('CreateWritingPage')),
    );
  }
}
