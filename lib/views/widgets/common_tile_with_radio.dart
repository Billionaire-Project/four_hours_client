import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/views/widgets/common_radio_button.dart';

class CommonTileWithRadio extends ConsumerStatefulWidget {
  final String title;
  final bool isSelected;
  const CommonTileWithRadio({
    Key? key,
    required this.title,
    required this.isSelected,
  }) : super(key: key);

  @override
  ConsumerState<CommonTileWithRadio> createState() =>
      _CommonTileWithRadioState();
}

class _CommonTileWithRadioState extends ConsumerState<CommonTileWithRadio> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: customTextStyle.labelMedium,
          ),
          CommonRadioButton(isSelected: widget.isSelected),
        ],
      ),
    );
  }
}
