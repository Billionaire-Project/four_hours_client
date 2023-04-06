import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SvgPicture.asset(
          'assets/images/logo.svg',
          width: 176,
          height: 32,
          semanticsLabel: 'Logo',
        ),
      ),
    );
  }
}
