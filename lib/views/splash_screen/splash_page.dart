import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Splash Page',
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontFamily: 'Mont',
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
