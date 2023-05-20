import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeWriteTimer extends ConsumerStatefulWidget {
  const HomeWriteTimer({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeWriteTimer> createState() => _HomeWriteTimerState();
}

class _HomeWriteTimerState extends ConsumerState<HomeWriteTimer> {
  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    return Container(
      height: 255,
      decoration: BoxDecoration(
        color: customThemeColors.backgroundSurface,
        border: Border.all(
          width: 2,
          color: customThemeColors.strokeBorder,
        ),
      ),
      child: Stack(children: [
        Center(
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                  showLabels: false,
                  showTicks: false,
                  startAngle: 180,
                  endAngle: 0,
                  radiusFactor: 0.7,
                  canScaleToFit: true,
                  minimum: 0,
                  maximum: 100,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    color: customThemeColors.orange,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: const <GaugePointer>[
                    RangePointer(
                        // value: progressValue,
                        width: 0.1,
                        sizeUnit: GaugeSizeUnit.factor,
                        cornerStyle: CornerStyle.bothCurve)
                  ])
            ],
          ),
        )
      ]),
    );
  }
}
