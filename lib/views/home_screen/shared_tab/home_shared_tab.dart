import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/controller/home_shared_controller.dart';
import 'package:four_hours_client/controller/home_shared_obscured_controller.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_obscured_bottom.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_obscured_post_card.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_post_card.dart';
import 'package:four_hours_client/views/widgets/common_post_skeleton.dart';
import 'package:four_hours_client/views/widgets/custom_refresh_header.dart';
import 'package:four_hours_client/views/widgets/custom_refresher_footer.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeSharedTab extends ConsumerWidget {
  const HomeSharedTab({Key? key}) : super(key: key);
  static const String path = '/shared';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncReceipt = ref.watch(receiptControllerProvider);
    bool isReadable = false;

    asyncReceipt.whenData((receipt) {
      isReadable = receipt?.isReadable ?? false;
    });

    if (isReadable) {
      return Consumer(
        builder: (context, ref, child) {
          final posts = ref.watch(homeSharedControllerProvider);
          final sharedNotifier =
              ref.read(homeSharedControllerProvider.notifier);
          return posts.when(
            data: (posts) {
              //! controller에서 postModel 리스트가 중복되지 않는데 UI단에서 중복되는 현상 발생
              final List<PostModel> setPosts = posts.toSet().toList();

              return SmartRefresher(
                physics: const BouncingScrollPhysics(),
                enablePullDown: true,
                enablePullUp: true,
                controller: sharedNotifier.refreshController,
                scrollController: sharedNotifier.scrollController,
                onRefresh: sharedNotifier.refreshTab,
                header: const CustomRefresherHeader(),
                footer: const CustomRefresherFooter(),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final String leftTime =
                        getPostElapsedTime(date: setPosts[index].createdAt);

                    return Column(
                      children: [
                        if (index == 0) const Gap(16),
                        HomeSharedPostCard(
                          post: setPosts[index],
                          time: leftTime,
                        ),
                        if (index == setPosts.length - 1) const Gap(16)
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox.fromSize(
                    size: const Size(0, 0),
                  ),
                  itemCount: setPosts.length,
                ),
              );
            },
            error: (error, __) => ErrorPage(error: error),
            loading: () => const CommonPostSkeleton(),
          );
        },
      );
    } else {
      return Consumer(
        builder: (context, ref, child) {
          final obscuredPosts = ref.watch(homeSharedObscuredControllerProvider);
          final sharedObscuredNotifier =
              ref.read(homeSharedObscuredControllerProvider.notifier);

          return obscuredPosts.when(
            data: (posts) {
              //! controller에서 postModel 리스트가 중복되지 않는데 UI단에서 중복되는 현상 발생
              final List<PostModel> setPosts = posts.toSet().toList();

              return Column(
                children: [
                  Expanded(
                    child: SmartRefresher(
                      physics: const BouncingScrollPhysics(),
                      enablePullDown: true,
                      enablePullUp: true,
                      controller: sharedObscuredNotifier.refreshController,
                      scrollController: sharedObscuredNotifier.scrollController,
                      onRefresh: sharedObscuredNotifier.refreshTab,
                      header: const CustomRefresherHeader(),
                      footer: const CustomRefresherFooter(),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final String leftTime = getPostElapsedTime(
                              date: setPosts[index].createdAt);

                          return Column(
                            children: [
                              if (index == 0) const Gap(16),
                              HomeSharedObscuredPostCard(
                                post: setPosts[index],
                                time: leftTime,
                              ),
                              if (index == setPosts.length - 1) const Gap(16)
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox.fromSize(
                          size: const Size(0, 0),
                        ),
                        itemCount: setPosts.length,
                      ),
                    ),
                  ),
                  const HomeSharedObscuredBottom()
                ],
              );
            },
            error: (error, __) => ErrorPage(error: error),
            loading: () => const CommonPostSkeleton(),
          );
        },
      );
    }
  }
}
