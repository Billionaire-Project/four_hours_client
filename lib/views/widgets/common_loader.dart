import 'package:flutter/material.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          width: 144,
          height: 144,
          decoration: BoxDecoration(
              color: CustomColors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 44,
                height: 44,
                child: CircularProgressIndicator(
                  strokeWidth: 6,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomThemeColor(context).onPrimary),
                  backgroundColor:
                      CustomThemeColor(context).onBackground.withOpacity(0.8),
                ),
              ),
              const Gap(8),
              Text(
                'Loading..',
                style: CustomTextStyle(context).labelMedium.copyWith(
                      color: CustomThemeColor(context).onPrimary,
                    ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
