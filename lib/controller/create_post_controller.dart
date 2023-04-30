import 'dart:async';

import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/providers/test_saving_provider.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_post_controller.g.dart';

@riverpod
class CreatePostController extends _$CreatePostController {
  late final SharedPreferences sharedPreferences;
  late final AuthRepository authRepository;
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

  UserModel? _user;

  void showDialogIfHasTemporaryText(BuildContext context) {
    if (temporaryText.isNotEmpty && !checkHasOnlyWhiteSpace(temporaryText)) {
      showCommonDialogWithTwoButtons(
        context,
        barrierDismissible: false,
        iconData: CustomIcons.report_fill,
        title: '작성중인 내용이 있어요',
        subtitle: '이어서 작성하시겠어요?',
        onPressedRightButton: () {
          _textEditingController.text = _getTemporaryText();
          state = textEditingController.text;
          _focusNode.requestFocus();
        },
        rightButtonText: '네, 이어서 작성할게요',
        onPressedLeftButton: () {
          _removeTemporaryText();
          _focusNode.requestFocus();
        },
        leftButtonText: '아니요',
      );
    }
  }

  void handlePressedSubmitButton(BuildContext context) {
    showCommonDialogWithTwoButtons(
      context,
      iconData: CustomIcons.pencil_fill,
      title: '작성한 글을 게시하시겠어요?',
      subtitle: '게시된 글은 편집할 수 없어요',
      onPressedRightButton: () async {
        await _submitPost(content: state);
        _removeTemporaryText();
        _textEditingController.clear();

        if (context.mounted) context.pop();
        //TODO: 게시 완료 후 home-write에서 어떻게 완료되었는지 알려줘야함
      },
      rightButtonText: '네, 게시할게요',
    );
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

  void _init() async {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    authRepository = ref.watch(authRepositoryProvider);
    testSavingNotifier = ref.watch(testSavingNotifierProvider.notifier);
    state = _textEditingController.text;
    _user = await authRepository.getMyInformation();
  }

  void _getPreferences() {
    _temporaryText =
        sharedPreferences.getString(SharedPreferenceKey.temporaryText) ?? '';
  }

  String _getTemporaryText() {
    return sharedPreferences.getString(SharedPreferenceKey.temporaryText)!;
  }

  void _removeTemporaryText() {
    sharedPreferences.remove(SharedPreferenceKey.temporaryText);
  }

  Future<void> _submitPost({required String content}) async {
    if (_user != null) {
      final repository = ref.read(postsRepositoryProvider);
      await repository.submitPosts(userId: _user!.id, content: content);
    } else {
      throw ('User is null');
    }
  }
}
