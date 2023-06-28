import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/create_post_controller.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/create_post_screen/create_post_bottom.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_row_with_divider.dart';
import 'package:four_hours_client/views/widgets/common_title.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';
import 'package:go_router/go_router.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);
  static const String path = 'create-post';

  @override
  ConsumerState<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;
  late Timer? savingTimer;
  late final String temporaryText;

  DateTime now = DateTime.now();
  late DateTime date = DateTime(now.year, now.month, now.day);

  @override
  void initState() {
    super.initState();
    final controllerNotifier = ref.read(createPostControllerProvider.notifier);

    textEditingController = controllerNotifier.textEditingController;
    focusNode = controllerNotifier.focusNode;
    temporaryText = controllerNotifier.temporaryText;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controllerNotifier.showDialogIfHasTemporaryText(context);
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);
    final controllerNotifier = ref.watch(createPostControllerProvider.notifier);

    return CommonWrapper(
      backgroundColor: customThemeColors.backgroundElevated,
      appBar: CommonAppBar(
        backgroundColor: customThemeColors.backgroundElevated,
        title: '새 게시글',
        leadingAutomaticallyPop: false,
        leadingOnTapHandler: () async {
          await controllerNotifier.cancelCreatePost();
          if (context.mounted) {
            context.pop();
          }
        },
      ),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 16,
                        ),
                        child: Column(
                          children: [
                            CommonRowWithDivider(
                              leading: CommonTitle(
                                  '${date.year}. ${date.month}. ${date.day}'),
                            ),
                            //* IntrinsicHeight를 사용하여 Gap이 실질적인 높이에 영향을 주지 않아 SizedBox사용
                            const SizedBox(height: 8),
                            Expanded(
                              child: TextField(
                                scrollPhysics:
                                    const NeverScrollableScrollPhysics(),
                                autofocus: temporaryText.isEmpty ? true : false,
                                keyboardType: TextInputType.multiline,
                                expands: true,
                                controller: textEditingController,
                                style: customTextStyle.bodyMedium,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '오늘 느꼈던 것들을 자유롭게 적어주세요!',
                                ),
                                maxLines: null,
                                focusNode: focusNode,
                                onChanged: controllerNotifier.onChanged,
                                onTap: () {
                                  if (focusNode.hasFocus) {
                                    focusNode.unfocus();
                                  } else {
                                    focusNode.requestFocus();
                                  }
                                },
                              ),
                            ),
                            //* IntrinsicHeight를 사용하여 Gap이 실질적인 높이에 영향을 주지 않아 SizedBox사용
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const CreatePostBottom(),
        ],
      ),
    );
  }
}
