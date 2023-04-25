import 'dart:async';

import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/providers/test_saving_provider.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateWritingNotifier extends AutoDisposeNotifier<String> {
  late final SharedPreferences sharedPreferences;
  late final TestSavingNotifier testSavingNotifier;

  @override
  String build() {
    init();
    getPreferences();
    state = textEditingController.text;
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

  bool _isFirstWriting = true;
  bool get isFirstWriting => _isFirstWriting;

  void init() {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    testSavingNotifier = ref.watch(testSavingNotifierProvider.notifier);
  }

  void getPreferences() {
    _temporaryText =
        sharedPreferences.getString(LocalStorageKey.temporaryText) ?? '';
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
          textEditingController.text =
              sharedPreferences.getString(LocalStorageKey.temporaryText)!;
          state = textEditingController.text;
          _focusNode.requestFocus();
        },
        rightButtonText: '네 이어서 작성할게요',
        onPressedLeftButton: () {
          sharedPreferences.remove(LocalStorageKey.temporaryText);
          _focusNode.requestFocus();
        },
        leftButtonText: '아니요',
      );
    }
  }

  void onChanged(String text) {
    state = text;
    _savingTimer?.cancel();

    if (text.length < writingTextLimit && text.isNotEmpty) {
      _savingTimer = Timer(
        const Duration(seconds: autoSaveTime),
        () {
          testSavingNotifier.requestToSave(text);
          if (_isFirstWriting) {
            _isFirstWriting = false;
          }
        },
      );
    }
  }
}

final createWritingProvider =
    AutoDisposeNotifierProvider<CreateWritingNotifier, String>(
        CreateWritingNotifier.new);
