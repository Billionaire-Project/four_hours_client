import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/shared_page_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/views/shared_tab/shared_card.dart';

final Map fakeCardData = {
  'time': DateTime.now().hour,
  'content':
      '오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다.  언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다. 오늘은 예보와는 달리 비가 오지 않았고, 구름이 가득하며 하늘이 흐린 날씨였다. 그래도 나는 이런 흐린 날씨가 어색하게 느껴지지 않았다.  언젠가 창밖을 내다보며 세상을 감상하고 있을 때, 하늘이 완벽한 파란색으로 빛나고 나무들은 바람에 가볍게 흔들리며 모든 것이 살아있는 것 같아 마음이 설레였다. 이러한 순간들은 인생의 경이롭고 아름다움에 대해 깊은 감사를 느끼게 만들어준다.',
};

class SharedPage extends ConsumerWidget {
  const SharedPage({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PostModel> posts = ref.watch(sharedPageControllerProvider);

    return ListView.separated(
      itemBuilder: (context, index) {
        final DateTime updatedAt = DateTime.parse(posts[index].updatedAt);
        final DateTime now = DateTime.now();

        final String hours = now.difference(updatedAt).inHours.toString();

        return Column(
          children: [
            if (index == 0) const SizedBox(height: 16),
            SharedCard(
              id: posts[index].id,
              labelText: hours,
              content: posts[index].content,
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
