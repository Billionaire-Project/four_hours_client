import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/widgets/common_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonRowWithDivider extends ConsumerWidget {
  final Widget? header;
  final Widget? tail;
  final double leftGap;
  final double rightGap;
  const CommonRowWithDivider({
    Key? key,
    this.header,
    this.tail,
    this.leftGap = 16,
    this.rightGap = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> renderHeader() {
      return header != null
          ? [header!, Gap(leftGap)]
          : [const SizedBox.shrink()];
    }

    List<Widget> renderTail() {
      return tail != null ? [Gap(rightGap), tail!] : [const SizedBox.shrink()];
    }

    return Row(
      children: [
        ...renderHeader(),
        const Expanded(child: CommonDivider()),
        ...renderTail(),
      ],
    );
  }
}
