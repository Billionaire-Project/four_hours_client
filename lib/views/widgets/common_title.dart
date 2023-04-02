import 'package:flutter/material.dart';

class CommonTitle extends StatelessWidget {
  String data;
  CommonTitle(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontFamily: 'Mont'),
    );
  }
}
