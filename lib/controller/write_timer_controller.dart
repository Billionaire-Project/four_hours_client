import 'dart:async';

import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/models/receipt_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'write_timer_controller.g.dart';

@riverpod
class WriteTimerController extends _$WriteTimerController {
  @override
  double build({required AsyncValue<ReceiptModel> asyncReceipt}) {
    state = 1;

    _getElapsedTime();
    return _updateElapsedTime();
  }

  final double _totalSeconds = writeTimerTotalSeconds;

  Duration _duration = const Duration(hours: 4);
  Duration get duration => _duration;

  void _getElapsedTime() {
    asyncReceipt.whenData((receipt) {
      DateTime postableAt = DateTime.parse(receipt.postableAt!);

      double diff = postableAt.difference(DateTime.now()).inSeconds.toDouble();

      state = _totalSeconds - diff;

      _duration = Duration(seconds: (_totalSeconds - state).toInt());
    });
  }

  double _updateElapsedTime() {
    Timer.periodic(const Duration(seconds: 1), _updateTimer);

    return state;
  }

  void _updateTimer(Timer timer) {
    state = state - 1;
    _duration = _duration - const Duration(seconds: 1);
  }
}
