import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_post_detail_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';

part 'liked_post_card_controller.g.dart';

@riverpod
class LikedPostCardController extends _$LikedPostCardController {
  PostsRepository? postsRepository;

  @override
  FutureOr build({required int postId}) {
    _init();
  }

  void handlePressedCard(
    BuildContext context, {
    required PostModel post,
    required String time,
    String? postingDate,
  }) async {
    context.pushNamed(
      LikedPostDetailPage.name,
      params: {
        'postId': post.id.toString(),
      },
      extra: PostDetailExtraModel(
        post: post,
        time: time,
        postingDate: postingDate,
      ),
    );
  }

  void _init() {
    postsRepository ??= ref.read(postsRepositoryProvider);
  }
}
