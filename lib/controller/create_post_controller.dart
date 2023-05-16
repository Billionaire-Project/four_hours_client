import 'dart:async';

import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
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
  late final SavePostController savePostController;

  @override
  String build() {
    _init();
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

  void showDialogIfHasTemporaryText(BuildContext context) async {
    await _getTemporaryText();

    if (context.mounted) {
      if (_temporaryText.isNotEmpty &&
          !checkHasOnlyWhiteSpace(_temporaryText)) {
        showCommonDialogWithTwoButtons(
          context,
          barrierDismissible: false,
          iconData: CustomIcons.report_fill,
          title: '작성중인 내용이 있어요',
          subtitle: '이어서 작성하시겠어요?',
          onPressedRightButton: () {
            _textEditingController.text = _temporaryText;
            state = textEditingController.text;
            _focusNode.requestFocus();
          },
          rightButtonText: '네, 이어서 작성할게요',
          onPressedLeftButton: () async {
            await _removeTemporaryText();
            _focusNode.requestFocus();
          },
          leftButtonText: '아니요',
        );
      }
    }
  }

  void handlePressedSubmitButton(BuildContext context) {
    _savingTimer?.cancel();
    _focusNode.unfocus();

    showCommonDialogWithTwoButtons(context,
        iconData: CustomIcons.pencil_fill,
        title: '작성한 글을 게시하시겠어요?',
        subtitle: '게시된 글은 편집할 수 없어요',
        onPressedRightButton: () async {
          _textEditingController.clear();

          await _removeTemporaryText();

          bool result = await _submitPost(content: state);

          await ref
              .read(homeSharedControllerProvider.notifier)
              .refreshSharedList();

          await ref
              .read(homeWriteControllerProvider.notifier)
              .refreshWriteList();

          if (result) {
            if (context.mounted) {
              context.pop(true);
            }
          } else {
            //TODO: 게시가 제대로 되지 않았을 경우 처리 필요
          }
        },
        rightButtonText: '네, 게시할게요',
        onPressedLeftButton: () async {
          await _requestToSave();
        });
  }

  void onChanged(String text) {
    state = text;
    _savingTimer?.cancel();

    if (text.length < postTextLimit && text.isNotEmpty) {
      _savingTimer = Timer(
        const Duration(seconds: autoSaveTime),
        () async {
          await _requestToSave();
        },
      );
    }
  }

  Future<void> cancelCreatePost() async {
    await savePostController.cancelRequestToSave();

    _savingTimer?.cancel();
    _textEditingController.clear();
  }

  void _init() async {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    authRepository = ref.watch(authRepositoryProvider);
    savePostController = ref.watch(savePostControllerProvider.notifier);

    state = _textEditingController.text;
    _user = await authRepository.getMyInformation();

    _getTemporaryText();
  }

  _getTemporaryText() {
    _temporaryText = sharedPreferences.getString('temporaryText') ?? '';
  }

  Future<void> _removeTemporaryText() async {
    sharedPreferences.remove(SharedPreferenceKey.temporaryText);
  }

  Future<bool> _submitPost({required String content}) async {
    if (_user != null) {
      final repository = ref.read(postsRepositoryProvider);
      await repository.submitPosts(userId: _user!.id, content: content);

      return true;
    } else {
      throw ('User is null');
    }
  }

  Future<void> _requestToSave() async {
    await savePostController.requestToSave(state);
    if (_isFirstPost) {
      _isFirstPost = false;
    }
  }
}

@riverpod
class SavePostController extends _$SavePostController {
  late SharedPreferences sharedPreferences;

  @override
  FutureOr build() {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
  }

  Future<bool> savePost(String text) async {
    await sharedPreferences.setString(SharedPreferenceKey.temporaryText, text);
    return true;
  }

  Future<void> requestToSave(String text) async {
    state = const AsyncValue.loading();

    Timer(const Duration(seconds: 1), () async {
      bool result = await savePost(text);
      if (result) {
        state = const AsyncValue.data(true);
      } else {
        state = AsyncValue.error('Error', StackTrace.current);
      }
    });
  }

  Future<void> cancelRequestToSave() async {
    state = const AsyncValue.data(false);
  }
}
