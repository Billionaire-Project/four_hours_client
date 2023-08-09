import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';

const List<List<String>> onboardingTexts = [
  ['Write & Memory', '소중한 순간을', '기록하고 기억하세요'],
  ['Auto Save', '지워질 걱정없이', '편하게 작성하세요'],
  ['Every 4 hours', '4시간에 한 번씩', '글을 쓰고 공유하세요'],
  ['Liked & Saved', '다시 읽고 싶다면', '공감하고 저장하세요'],
  ['Dark Mode', '다크모드와 함께', '밤에도 편안하게'],
];

class OnboardingTexts extends ConsumerWidget {
  final int pageIndex;
  const OnboardingTexts({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Column(
      children: [
        Text(
          onboardingTexts[pageIndex][0],
          style: customTextStyle.montDisplaySmall,
        ),
        Text(
          onboardingTexts[pageIndex][1],
          style: customTextStyle.headlineSmall,
        ),
        Text(
          onboardingTexts[pageIndex][2],
          style: customTextStyle.headlineSmall,
        ),
      ],
    );
  }
}
