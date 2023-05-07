import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/shared_page_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/views/shared_tab/shared_card.dart';

//TODO: pull down refresh
class SharedPage extends ConsumerWidget {
  const SharedPage({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PostModel> posts = ref.watch(sharedPageControllerProvider);

    return ListView.separated(
      itemBuilder: (context, index) {
        //TODO: 몇시간 전인진, 몇분 전인지 계산하는 함수 따로 파기
        final DateTime updatedAt = DateTime.parse(posts[index].updatedAt);
        final DateTime now = DateTime.now();

        final String hours = now.difference(updatedAt).inHours.toString();

        return Column(
          children: [
            if (index == 0) const SizedBox(height: 16),
            SharedCard(
              post: posts[index],
              labelText: hours,
            ),
            if (index == posts.length - 1) const SizedBox(height: 16)
          ],
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox.fromSize(size: const Size(0, 0)),
      itemCount: posts.length,
    );
  }
}
