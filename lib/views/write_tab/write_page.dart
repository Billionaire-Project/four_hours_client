import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/app_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class WritePage extends ConsumerWidget {
  const WritePage({Key? key}) : super(key: key);
  static const String path = '/write';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainWrapper(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                showCommonActionSheet(context, actions: [
                  CommonActionSheetAction(
                    color: Colors.red,
                    backgroundColor: CustomThemeColor(context).background,
                    onPressed: () {},
                    iconData: CustomIcons.delete_bin_line,
                    text: '게시글 삭제',
                  ),
                  CommonActionSheetAction(
                    backgroundColor: CustomThemeColor(context).background,
                    onPressed: () {},
                    iconData: CustomIcons.copy_line,
                    text: '게시글 삭제',
                  ),
                ]);
              },
              child: const Text('ActionSheet'),
            ),
            ElevatedButton(
                onPressed: () {
                  showCommonAlert(context,
                      iconData: CustomIcons.check_line, text: '삭제 되었어요!');
                },
                child: const Text('Dialog')),
            ElevatedButton(
                onPressed: () {
                  showCommonToast(context,
                      iconData: CustomIcons.copy_line, text: '클립보드에 복사되었어요!');
                },
                child: const Text('Toast')),
            CommonTitle('Today'),
            const Gap(8),
            const Card(),
            const Gap(16),
            const TryYourFirstWritingCard()
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: CustomShadowColors.shadow1),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: Text(
                      '오늘의 주제: 변화',
                      style: CustomTextStyle(context).titleSmall,
                    ),
                  ),
                  const Gap(16),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                '날씨가 점점 봄으로 바뀌고 있다.\n 그 변화를 느끼며, 기분도 따뜻해지고 있다.',
                style: CustomTextStyle(context)
                    .bodySmall
                    .copyWith(color: CustomColors.light.gray400),
              ),
              const Gap(16),
              CommonFullWidthTextButton(onPressed: () {}, text: '글 쓰기')
            ],
          )),
    );
  }
}

class TryYourFirstWritingCard extends StatelessWidget {
  const TryYourFirstWritingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      decoration: BoxDecoration(
        color: CustomColors.light.gray100,
        border: Border.all(width: 2, color: CustomColors.light.gray900),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: CustomShadowColors.shadow3,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CustomIcons.pencil_fill,
                size: 32, color: CustomColors.light.gray900),
            const Gap(8),
            Text(
              '첫 게시글을 작성해보세요!',
              style: CustomTextStyle(context).titleLarge,
              textAlign: TextAlign.center,
            ),
            const Gap(4),
            Text(
              '순간의 일과 감정들을 글로 적어보면,\n 그것들을 더 잘 이해하고 조절할 수 있어요.',
              style: CustomTextStyle(context)
                  .bodySmall
                  .copyWith(color: CustomColors.light.gray600),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
