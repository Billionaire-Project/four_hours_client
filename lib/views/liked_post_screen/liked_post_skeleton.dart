import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:shimmer/shimmer.dart';

const int _itemCount = 6;

class LikedPostSkeleton extends ConsumerWidget {
  const LikedPostSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0) const SizedBox(height: 16),
            const SkeletonCard(),
            if (index == _itemCount - 1) const SizedBox(height: 16)
          ],
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox.fromSize(size: const Size(0, 0)),
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
      padding: const EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      child: Container(
        height: 176,
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
                Shimmer.fromColors(
                  baseColor: customThemeColors.backgroundLabel,
                  highlightColor: customThemeColors.backgroundElevated,
                  child: CommonRowWithDivider(
                    tail: Icon(
                      CustomIcons.heart_fill,
                      color: customThemeColors.backgroundLabel,
                    ),
                  ),
                ),
              ],
            )),
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
