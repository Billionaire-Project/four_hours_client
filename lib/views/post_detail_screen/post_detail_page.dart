import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/post_detail_screen/post_detail_bottom.dart';

import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_icon_button.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';

class PostDetailPage extends ConsumerWidget {
  final String postId;
  const PostDetailPage({
    Key? key,
    required this.postId,
  }) : super(key: key);
  static String path = 'post-detail/:postId';
  static String name = 'PostDetailPage';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      appBar: const CommonAppBar(
        actions: [
          CommonIconButton(
            icon: Icon(
              CustomIcons.more_line,
            ),
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const CommonRowWithDivider(
                    header: CommonTitle('8hours'),
                  ),
                  const Gap(8),
                  Text(
                    '오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다. ',
                    style: customTextStyle.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const PostDetailBottom(),
        ],
      ),
    );
  }
}
