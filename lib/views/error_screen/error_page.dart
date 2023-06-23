import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:four_hours_client/views/widgets/main_wrapper.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends ConsumerWidget {
  final Object? error;
  const ErrorPage({Key? key, required this.error}) : super(key: key);
  static const String path = '/error';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return MainWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    CustomIcons.ghost_line,
                    size: 48,
                  ),
                  const Gap(8),
                  Text(
                    '알 수 없는 오류가 발생했어요',
                    style: customTextStyle.headlineSmall,
                  ),
                  const Gap(4),
                  Text(
                    'Error: ${error ?? 'Unknown Error'}',
                    style: customTextStyle.bodyMedium,
                  ),
                ],
              ),
            ),
            CommonFullWidthTextButton(
              text: '홈으로 돌아가기',
              onPressed: () {
                context.go(HomeWriteTab.path);
              },
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
