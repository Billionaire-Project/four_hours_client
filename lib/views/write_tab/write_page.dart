import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_colors.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/create_writing_screen/create_writing_page.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';

class WritePage extends ConsumerWidget {
  const WritePage({Key? key}) : super(key: key);
  static const String path = '/write';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CommonTitle('Today'),
            Gap(8),
            BeforeWritingCard(),
            Gap(16),
            CommonCardCover(
              iconData: CustomIcons.pencil_fill,
              title: '첫 게시글을 작성해보세요!',
              subtitle: '순간의 일과 감정들을 글로 적어보면,\n그것들을 더 잘 이해하고 조절할 수 있어요.',
            )
          ],
        ),
      ),
    );
  }
}

class BeforeWritingCard extends ConsumerWidget {
  const BeforeWritingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: CustomShadowColors.shadow1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonRowWithDivider(
            header: Center(
              child: Text(
                '오늘의 주제: 변화',
                style: customTextStyle.titleSmall,
              ),
            ),
          ),
          const Gap(10),
          Text(
            '날씨가 점점 봄으로 바뀌고 있다.\n 그 변화를 느끼며, 기분도 따뜻해지고 있다.',
            style: customTextStyle.bodySmall
                .copyWith(color: CustomColors.light.gray400),
          ),
          const Gap(16),
          CommonFullWidthTextButton(
            onPressed: () {
              context.push('${WritePage.path}/${CreateWritingPage.path}');
            },
            text: '글 쓰기',
          )
        ],
      ),
    );
  }
}

class TryYourFirstWritingCard extends ConsumerWidget {
  const TryYourFirstWritingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

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
              style: customTextStyle.titleLarge,
              textAlign: TextAlign.center,
            ),
            const Gap(4),
            Text(
              '순간의 일과 감정들을 글로 적어보면,\n 그것들을 더 잘 이해하고 조절할 수 있어요.',
              style: customTextStyle.bodySmall
                  .copyWith(color: CustomColors.light.gray600),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
