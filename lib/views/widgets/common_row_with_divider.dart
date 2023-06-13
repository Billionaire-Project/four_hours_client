import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/widgets/common_divider.dart';
import 'package:four_hours_client/views/widgets/gap.dart';

class CommonRowWithDivider extends ConsumerWidget {
  final Widget? leading;
  final Widget? trailing;
  final double leftGap;
  final double rightGap;
  const CommonRowWithDivider({
    Key? key,
    this.leading,
    this.trailing,
    this.leftGap = 16,
    this.rightGap = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> renderLeading() {
      return leading != null
          ? [leading!, Gap(leftGap)]
          : [const SizedBox.shrink()];
    }

    List<Widget> renderTrailing() {
      return trailing != null
          ? [Gap(rightGap), trailing!]
          : [const SizedBox.shrink()];
    }

    return Row(
      children: [
        ...renderLeading(),
        const Expanded(child: CommonDivider()),
        ...renderTrailing(),
      ],
    );
  }
}
