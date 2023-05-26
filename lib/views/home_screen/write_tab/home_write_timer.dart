import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/app_sizes.dart';
import 'package:four_hours_client/utils/custom_icons_icons.dart';
import 'package:four_hours_client/utils/custom_text_style.dart';
import 'package:four_hours_client/utils/custom_theme_colors.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_tab.dart';
import 'package:four_hours_client/views/widgets/common_full_width_text_button.dart';
import 'package:four_hours_client/views/widgets/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeWriteTimer extends ConsumerWidget {
  const HomeWriteTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final double timerRadius = getTimerSize(context).radius;

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          //* timer radius + timer top padding(16) + timer bottom padding(16) + gap(16) + button height(48)
          height: timerRadius + 32 + 16 + 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: customThemeColors.backgroundSurface,
            border: Border.all(
              width: 2,
              color: customThemeColors.strokeBorder,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        const Positioned(
          top: 16,
          left: 16,
          right: 16,
          child: _Timer(),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: CommonFullWidthTextButton(
            text: 'SHARED 보러가기',
            onPressed: () {
              context.go(HomeSharedTab.path);
            },
          ),
        ),
      ],
    );
  }
}

class _Timer extends ConsumerStatefulWidget {
  const _Timer({Key? key}) : super(key: key);

  @override
  ConsumerState<_Timer> createState() => _TimerState();
}

class _TimerState extends ConsumerState<_Timer> {
  //TODO: need time from server
  Timer? _timer;
  double time = 14400;
  double elapsedTime = 0;
  Duration _duration = const Duration(hours: 4);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      elapsedTime = elapsedTime + 1;
      _duration = _duration - const Duration(seconds: 1);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTextStyle = ref.watch(customTextStyleProvider);
    final customThemeColors = ref.watch(customThemeColorsProvider);

    final double timerDiameter = getTimerSize(context).diameter;
    final double timerRadius = getTimerSize(context).radius;

    String hours = _duration.inHours.toString().padLeft(2, '0');
    String minutes = (_duration.inMinutes % 60).toString().padLeft(2, '0');
    String seconds = (_duration.inSeconds % 60).toString().padLeft(2, '0');

    return SleekCircularSlider(
      innerWidget: (double value) {
        return Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: timerRadius,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(timerRadius * 0.15),
                  Icon(
                    CustomIcons.timer_fill,
                    size: timerRadius * 0.260,
                  ),
                  Gap(timerRadius * 0.04),
                  FittedBox(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      height: timerRadius * 0.290,
                      constraints: const BoxConstraints(
                        minHeight: 40,
                        maxHeight: 44,
                      ),
                      decoration: BoxDecoration(
                        color: customThemeColors.strokeBorder,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          '$hours : $minutes : $seconds',
                          style: customTextStyle.montDisplaySmall.copyWith(
                            color: customThemeColors.backgroundToggle,
                            fontFeatures: [const FontFeature.tabularFigures()],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(timerRadius * 0.04),
                  Container(
                    height: timerRadius * 0.220,
                    alignment: AlignmentDirectional.bottomCenter,
                    constraints: BoxConstraints(maxHeight: timerRadius * 0.260),
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        '4시간 후에 다시 글을 쓸 수 있어요. \n그동안 다른 사람들의 것을 읽고 공감해보세요!',
                        style: customTextStyle.labelSmall.copyWith(
                          color: customThemeColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      appearance: CircularSliderAppearance(
        startAngle: 180,
        angleRange: 180,
        size: timerDiameter,
        customWidths: CustomSliderWidths(
          handlerSize: 0,
          trackWidth: 12,
          progressBarWidth: 12,
        ),
        customColors: CustomSliderColors(
          progressBarColor: customThemeColors.orange,
          trackColor: customThemeColors.backgroundPath,
          hideShadow: true,
        ),
      ),
      min: 0,
      max: time,
      initialValue: elapsedTime,
    );
  }
}
