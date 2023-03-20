import 'package:flutter/material.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  static const path = '/loading';

  @override
  Widget build(BuildContext context) {
    return const MainWrapper(
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}