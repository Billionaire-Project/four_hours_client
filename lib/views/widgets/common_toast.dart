import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonToast extends StatelessWidget {
  final IconData iconData;
  final String text;
  const CommonToast({Key? key, required this.iconData, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - pagePadding * 2,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: CustomColors.light.gray50, size: 16),
            const Gap(8),
            Text(
              text,
              style: CustomTextStyle(context)
                  .labelSmall
                  .copyWith(color: CustomColors.light.gray50),
            ),
          ],
        ),
      ),
    );
  }
}