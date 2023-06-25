import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/widgets/common_app_bar.dart';
import 'package:four_hours_client/views/widgets/common_post_skeleton.dart';
import 'package:four_hours_client/views/widgets/common_wrapper.dart';

class CommonSkeletonPage extends ConsumerWidget {
  const CommonSkeletonPage({Key? key}) : super(key: key);
  static const String path = '/common-skeleton';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const CommonWrapper(
      appBar: CommonAppBar(),
      child: CommonPostSkeleton(),
    );
  }
}
