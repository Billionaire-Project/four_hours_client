import 'dart:async';

import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/controller/receipt_controller.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'home_write_timer_controller.g.dart';

@riverpod
class HomeWriteTimerController extends _$HomeWriteTimerController {
  @override
  double build() {
    state = 0;

    getElapsedTime();
    return _updateElapsedTime();
  }

  final double _totalSeconds = writeTimerTotalSeconds;

  Duration _duration = const Duration(hours: 4);
  Duration get duration => _duration;

  Timer? _timer;

  void getElapsedTime() {
    final asyncReceipt = ref.read(receiptControllerProvider);

    asyncReceipt.whenData((receipt) {
      if (receipt == null) {
        printDebug('HomeWriteTimerController', 'Receipt is null');
        state = 0;
        _duration = const Duration(hours: 4);
      } else {
        DateTime postableAt = DateTime.parse(receipt.postableAt!);

        double diff =
            postableAt.difference(DateTime.now()).inSeconds.toDouble();

        state = _totalSeconds - diff;

        _duration = Duration(seconds: (_totalSeconds - state).toInt());
      }
    });
  }

  double _updateElapsedTime() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);

    return state;
  }

  void _updateTimer(Timer timer) async {
    state = state + 1;
    _duration = _duration - const Duration(seconds: 1);

    if (duration <= Duration.zero) {
      state = writeTimerTotalSeconds - 1;
      _duration = Duration.zero;
      _timer?.cancel();
      timer.cancel();
      Future.delayed(const Duration(seconds: 1), () async {
        await ref.read(receiptControllerProvider.notifier).getReceipt();
      });
    }
  }
}
