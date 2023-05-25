import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:four_hours_client/models/my_posts_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/widgets/common_action_sheet_action.dart';
import 'package:four_hours_client/views/write_post_detail_screen/write_post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_write_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeWriteController extends _$HomeWriteController {
  late final PostsRepository postsRepository;

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  RefreshController get refreshController => _refreshController;

  @override
  Map<String, List<PostModel>> build() {
    _init();
    return state;
  }

  String _start = '0';
  String _offset = '10';

  MyPostsModel? _myPosts;
  MyPostsModel? get posts => _myPosts;

  List<String>? _dateList;
  List<String>? get dateList => _dateList;

  Future<void> getMyPostsInitial() async {
    _start = '0';
    _offset = '10';

    try {
      _myPosts =
          await postsRepository.getMyPosts(start: _start, offset: _offset);

      state = _myPosts!.posts;

      if (_myPosts!.next != null) {
        _start = _myPosts!.next!;
      }

      _dateList = _myPosts!.posts.keys.map((e) => e).toList();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> getMoreMyPosts() async {
    try {
      //TODO: 내 포스트 리스트를 날짜별로 내려주는데 이걸 자연스럽게 페이지네이션하도록 구현이 필요함
      _myPosts =
          await postsRepository.getMyPosts(start: _start, offset: _offset);

      if (_myPosts!.next == null) {
        _refreshController.loadComplete();
        return;
      }
      // final newDateList = _myPosts!.posts.keys.map((e) => e).toList();

      // for (int i = 0; i < newDateList.length; i++) {
      //   if (_dateList!.contains(newDateList[i])) {
      //     print('jay --- contain new ${newDateList[i]}');
      //     state[newDateList[i]] = [
      //       ...state[newDateList[i]]!,
      //       ..._myPosts!.posts[newDateList[i]]!
      //     ];

      //     // state = {...state};
      //     print(
      //         'jay --- state[newDateList[i]] ${state[newDateList[i]]!.length}');
      //   } else {
      //     print('jay --- not contain new ${newDateList[i]}');
      //     // print('jay --- state[newDateList[i]] ${state[newDateList[i - 1]]}');

      //     _dateList!.add(newDateList[i]);
      //     print('jay --- state $state');
      //     // state[newDateList[i]] = _myPosts!.posts[newDateList[i]]!;
      //     state = {...state, ..._myPosts!.posts};
      //   }
      // }

      _start = _myPosts!.next!;
      // _dateList = [..._dateList!, ..._myPosts!.posts.keys.map((e) => e).toList()];
      // _dateList = _dateList!.toSet().toList();
      state = {...state};
      print('jay --- durldhsiu');
      _refreshController.loadComplete();
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<bool> refreshWriteList() async {
    _start = '0';
    _offset = '10';

    try {
      _myPosts =
          await postsRepository.getMyPosts(start: _start, offset: _offset);

      _dateList = _myPosts!.posts.keys.map((e) => e).toList();
      state = _myPosts!.posts;

      return true;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void handlePressedCard(
    BuildContext context, {
    required PostModel post,
  }) {
    context.pushNamed(
      WritePostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: post,
    );
  }

  void handlePressedMoreButton(BuildContext context, int postId) {
    showCommonActionSheet(
      actions: [
        CommonActionSheetAction(
          isDestructiveAction: true,
          onPressed: () async {
            closeRootNavigator();

            await context.pushNamed(
              DeletePostPage.name,
              params: {
                'postId': postId.toString(),
              },
            );
          },
          iconData: CustomIcons.delete_bin_line,
          text: '게시글 삭제',
        ),
        CommonActionSheetAction(
          onPressed: () {
            //TODO: 글 내용 복사
          },
          iconData: CustomIcons.copy_line,
          text: '글 내용 복사',
        ),
      ],
    );
  }

  void _init() async {
    state = {};

    postsRepository = ref.watch(postsRepositoryProvider);
    getMyPostsInitial();
  }
}
