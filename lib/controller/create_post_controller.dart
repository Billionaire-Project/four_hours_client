import 'dart:async';

import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/providers/test_saving_provider.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_post_controller.g.dart';

@riverpod
class CreatePostController extends _$CreatePostController {
  late final SharedPreferences sharedPreferences;
  late final TestSavingNotifier testSavingNotifier;

  @override
  String build() {
    _init();
    _getPreferences();
    return state;
  }

  final TextEditingController _textEditingController =
      TextEditingController(text: '');
  TextEditingController get textEditingController => _textEditingController;

  final FocusNode _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  Timer? _savingTimer;

  String _temporaryText = '';
  String get temporaryText => _temporaryText;

  bool _isFirstPost = true;
  bool get isFirstPost => _isFirstPost;

  final int _textLength = 0;
  int get textLength => _textLength;

  void submitPost({required int userId, required String content}) {
    final repository = ref.read(postsRepositoryProvider);
    repository.submitPosts(userId: userId, content: content);
  }

  void showDialogIfHasTemporaryText(BuildContext context) {
    if (temporaryText.isNotEmpty && !checkHasOnlyWhiteSpace(temporaryText)) {
      showCommonDialogWithTwoButtons(
        context,
        barrierDismissible: false,
        iconData: CustomIcons.report_fill,
        title: '작성중인 내용이 있어요',
        subtitle: '이어서 작성하시겠어요?',
        onPressedRightButton: () {
          _textEditingController.text =
              sharedPreferences.getString(SharedPreferenceKey.temporaryText)!;
          state = textEditingController.text;
          _focusNode.requestFocus();
        },
        rightButtonText: '네 이어서 작성할게요',
        onPressedLeftButton: () {
          sharedPreferences.remove(SharedPreferenceKey.temporaryText);
          _focusNode.requestFocus();
        },
        leftButtonText: '아니요',
      );
    }
  }

  void onChanged(String text) {
    state = text;
    _savingTimer?.cancel();

    if (text.length < postTextLimit && text.isNotEmpty) {
      _savingTimer = Timer(
        const Duration(seconds: autoSaveTime),
        () async {
          await testSavingNotifier.requestToSave(text);
          if (_isFirstPost) {
            _isFirstPost = false;
          }
        },
      );
    }
  }

  void _init() {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    testSavingNotifier = ref.watch(testSavingNotifierProvider.notifier);
    state = _textEditingController.text;
  }

  void _getPreferences() {
    _temporaryText =
        sharedPreferences.getString(SharedPreferenceKey.temporaryText) ?? '';
  }
}
