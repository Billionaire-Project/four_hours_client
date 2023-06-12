import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:shimmer/shimmer.dart';

const int _itemCount = 6;

class HomeWriteSkeleton extends ConsumerWidget {
  const HomeWriteSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return ListView.separated(
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (index == 0) const Gap(16),
            Container(
              width: 96,
              height: 32,
              margin: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                color: customThemeColors.backgroundLabel,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const Gap(8),
            const SkeletonCard(),
            if (index == _itemCount - 1) const Gap(16)
          ],
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox.fromSize(size: const Size(0, 32)),
      itemCount: _itemCount,
    );
  }
}

class SkeletonCard extends ConsumerWidget {
  const SkeletonCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: customThemeColors.backgroundElevated,
          boxShadow: CustomShadowColors.shadow3,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: customThemeColors.backgroundLabel,
                highlightColor: customThemeColors.backgroundElevated,
                child: CommonRowWithDivider(
                  header: Container(
                    width: 80,
                    height: 24,
                    decoration: BoxDecoration(
                      color: customThemeColors.backgroundLabel,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const Gap(8),
              const LetterBox(),
              const Gap(8),
              const LetterBox(),
              const Gap(8),
              const LetterBox(),
              const Gap(8),
              const LetterBox(
                width: 248,
              ),
              const Gap(8),
            ],
          ),
        ),
      ),
    );
  }
}

class LetterBox extends ConsumerWidget {
  final double? width;
  const LetterBox({
    Key? key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Shimmer.fromColors(
      baseColor: customThemeColors.backgroundLabel,
      highlightColor: customThemeColors.backgroundElevated,
      child: Container(
        width: width ?? double.infinity,
        height: 14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: customThemeColors.backgroundLabel,
        ),
      ),
    );
  }
}
