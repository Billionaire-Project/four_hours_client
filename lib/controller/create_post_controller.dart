import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/controller/home_write_controller.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_post_controller.g.dart';

@riverpod
class CreatePostController extends _$CreatePostController {
  SharedPreferences? sharedPreferences;
  AuthRepository? authRepository;
  PostsRepository? postsRepository;
  SavePostController? savePostController;

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
    _getTemporaryText();

    if (context.mounted) {
      if (_temporaryText.isNotEmpty &&
          !checkHasOnlyWhiteSpace(_temporaryText)) {
        showCommonDialogWithTwoButtons(
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
          onPressedLeftButton: () {
            _removeTemporaryText();
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

    showCommonDialogWithTwoButtons(
        iconData: CustomIcons.pencil_fill,
        title: '작성한 글을 게시하시겠어요?',
        subtitle: '게시된 글은 편집할 수 없어요',
        onPressedRightButton: () async {
          _removeTemporaryText();

          bool result = await _submitPost(context, content: state);

          if (result) {
            await ref
                .read(homeSharedControllerProvider.notifier)
                .getPostsInitial();

            await ref
                .read(homeWriteControllerProvider.notifier)
                .getMyPostsInitial();

            await ref.read(receiptControllerProvider.notifier).getReceipt();

            if (context.mounted) {
              context.pop(true);
            }
          } else {
            showCommonAlert(
              iconData: CustomIcons.warning_line,
              text: '게시가 제대로 이루어지지 않았습니다.\n나중에 다시 시도해주세요',
            );
            printDebug('CreatePostController', '게시가 이루어지지 않음');
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
    await savePostController!.cancelRequestToSave();

    _savingTimer?.cancel();
    _textEditingController.clear();
  }

  void _init() async {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    authRepository = ref.watch(authRepositoryProvider);
    postsRepository = ref.watch(postsRepositoryProvider);
    savePostController = ref.watch(savePostControllerProvider.notifier);

    state = _textEditingController.text;

    _getMyInformation();
    _getTemporaryText();
  }

  void _getMyInformation() async {
    try {
      _user = await authRepository!.getMyInformation();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _getTemporaryText() {
    _temporaryText = sharedPreferences!.getString('temporaryText') ?? '';
  }

  void _removeTemporaryText() {
    sharedPreferences!.remove(SharedPreferenceKey.temporaryText);
  }

  Future<bool> _submitPost(
    BuildContext context, {
    required String content,
  }) async {
    if (_user != null) {
      try {
        await postsRepository!.submitPosts(userId: _user!.id, content: content);

        return true;
      } on DioError catch (e) {
        throw throwExceptions(e);
      }
    } else {
      context.replace(LoginPage.path);
      showCommonAlert(iconData: CustomIcons.warning_line, text: '다시 로그인 해주세요');
      printDebug('CreatePostController', 'User is null');
      return false;
    }
  }

  Future<void> _requestToSave() async {
    await savePostController!.requestToSave(state);
    if (_isFirstPost) {
      _isFirstPost = false;
    }
  }
}

@riverpod
class SavePostController extends _$SavePostController {
  SharedPreferences? sharedPreferences;

  @override
  FutureOr build() {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
  }

  Future<bool> savePost(String text) async {
    await sharedPreferences!.setString(SharedPreferenceKey.temporaryText, text);
    return true;
  }

  Future<void> requestToSave(String text) async {
    state = const AsyncLoading();

    Timer(const Duration(seconds: 1), () async {
      bool result = await savePost(text);
      if (result) {
        state = const AsyncData(true);
      } else {
        state = AsyncValue.error('Error while saving post', StackTrace.current);
        printDebug('CreatePostController', 'Error while saving post');
      }
    });
  }

  Future<void> cancelRequestToSave() async {
    state = const AsyncData(false);
  }
}
