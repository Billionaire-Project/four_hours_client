import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gap extends SingleChildRenderObjectWidget {
  final double spacing;
  const Gap(this.spacing, {Key? key})
      : assert(spacing >= 0 && spacing <= double.infinity),
        super(key: key);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGap(spacing: spacing);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderGap renderObject) {
    renderObject.spacing = spacing;
  }
}

class _RenderGap extends RenderBox {
  _RenderGap({
    required double spacing,
  }) : _spacing = spacing;

  double get spacing => _spacing;
  double _spacing;
  set spacing(double value) {
    if (_spacing != value) {
      _spacing = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final flex = parent;
    if (flex is RenderFlex) {
      if (flex.direction == Axis.horizontal) {
        size = constraints.constrain(Size(spacing, 0));
      } else {
        size = constraints.constrain(Size(0, spacing));
      }
    } else {
      throw FlutterError(
        'A Gap widget must be placed directly inside a Flex widget',
      );
    }
  }
}
