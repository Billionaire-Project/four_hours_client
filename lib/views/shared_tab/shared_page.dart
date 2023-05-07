import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/shared_page_controller.dart';
import 'package:four_hours_client/views/shared_tab/shared_card.dart';
import 'package:four_hours_client/views/widgets/common_circular_progress_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

//TODO: pull down refresh
class SharedPage extends ConsumerWidget {
  const SharedPage({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(sharedPageControllerProvider);
    return SmartRefresher(
      enablePullDown: true,
      onRefresh:
          ref.read(sharedPageControllerProvider.notifier).refreshSharedList,
      controller:
          ref.read(sharedPageControllerProvider.notifier).refreshController,
      //TODO: if need custom header
      // header:
      //     CustomHeader(builder: (BuildContext context, RefreshStatus? mode) {
      //   Widget body;
      //   if (mode == RefreshStatus.idle) {
      //     body = const Text("pull up load");
      //   } else if (mode == RefreshStatus.refreshing) {
      //     body = const CupertinoActivityIndicator();
      //   } else if (mode == RefreshStatus.completed) {
      //     body = const Text("done");
      //   } else if (mode == RefreshStatus.failed) {
      //     body = const Text("failed");
      //   } else if (mode == RefreshStatus.canRefresh) {
      //     body = const Text("release to refresh");
      //   } else {
      //     body = const Text("pull down refresh");
      //   }
      //   return SizedBox(
      //     height: 55.0,
      //     child: Center(child: body),
      //   );
      // }),
      child: posts.when(
        data: (posts) {
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
        },
        //TODO: show error page
        error: (_, __) => const Text('error'),
        loading: () => const Center(
          child: CommonCircularProgressIndicator(
            size: 32,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
