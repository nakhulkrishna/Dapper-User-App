import 'dart:async';

import 'package:dapper_user/logic/auth/auth/timer_of_resend_otp_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_of_resend_otp_state.dart';

class TimerOfResendOtpBloc
    extends Bloc<TimerOfResendOtpEvent, TimerOfResendOtpState> {
  Timer? _timer;
  final int initialDuration;

  TimerOfResendOtpBloc(this.initialDuration)
      : super(TimerInitial(duration: initialDuration)) {
    on<TimerStarted>(_onTimerStarted);
    on<TimerTicked>(_onTimerTicked); // Corrected event name
    on<TimerCompleted>(_onTimerCompleted);
  }

  void _onTimerStarted(
      TimerStarted event, Emitter<TimerOfResendOtpState> emit) {
    emit(TimerRunInProgress(remainingTime: event.duration));
    _timer?.cancel(); // Ensure previous timer is canceled
    _startTimer(event.duration);
  }

  void _onTimerTicked(TimerTicked event, Emitter<TimerOfResendOtpState> emit) {
    // Emit progress with updated remaining time
    emit(TimerRunInProgress(remainingTime: event.remainingTime));
  }

  void _onTimerCompleted(
      TimerCompleted event, Emitter<TimerOfResendOtpState> emit) {
    emit(TimerRunComplete());
  }

  void _startTimer(int duration) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final remainingTime = duration - timer.tick;
      if (remainingTime > 0) {
        // Add a tick event with the correct remaining time
        add(TimerTicked(remainingTime: remainingTime));
      } else {
        _timer?.cancel(); // Stop the timer when time is up
        add(TimerCompleted()); // Add the completion event
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Ensure the timer is canceled on close
    return super.close();
  }
}
