import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_shadow_colors.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/shared_tab/shared_page_provider.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/widgets/common_card_cover.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class SharedCard extends ConsumerWidget {
  final String labelText;
  final String content;
  const SharedCard({
    Key? key,
    required this.labelText,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final isReported = ref.watch(sharedReportNotifierProvider);

    if (isReported) {
      return const CommonCardCover(
        iconData: CustomIcons.report_fill,
        title: '신고가 정상적으로 접수되었어요',
        subtitle: '해당 글은 숨긴처리 됐습니다',
      );
    }

    return Container(
      padding:
          const EdgeInsets.only(top: 8.0, left: 16.0, right: 8.0, bottom: 8.0),
      constraints: const BoxConstraints(maxHeight: 232),
      decoration: BoxDecoration(
        color: customThemeColors.background,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: CustomShadowColors.shadow3,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonRowWithDivider(
            header: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
              decoration: BoxDecoration(
                color: customThemeColors.backgroundLabel,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                labelText,
                style: customTextStyle.montLabelSmall,
              ),
            ),
            rightGap: 8,
            tail: CommonIconButton(
              icon: const Icon(
                CustomIcons.more_line,
              ),
              onTap: () {
                showCommonActionSheet(
                  context,
                  actions: [
                    CommonActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        closeRootNavigator(context);
                        showCommonDialogWithTwoButtons(
                          context,
                          iconData: CustomIcons.report_fill,
                          title: '해당 게시글을 신고하시겠어요?',
                          subtitle: '신고가 접수되면 즉시 사라집니다',
                          onPressedRightButton: () {
                            ref
                                .read(sharedReportNotifierProvider.notifier)
                                .reportWriting();
                            closeRootNavigator(context);
                          },
                          rightButtonText: '신고',
                        );
                      },
                      iconData: CustomIcons.report_line,
                      text: '게시글 신고',
                    )
                  ],
                );
              },
            ),
          ),
          const Gap(8),
          Expanded(
            child: RichText(
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: content,
                    style: customTextStyle.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const CommonRowWithDivider(
            tail: CommonIconButton(
                icon: Icon(
              CustomIcons.heart_line,
            )),
          )
        ],
      ),
    );
  }
}
