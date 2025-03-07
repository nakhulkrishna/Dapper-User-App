abstract class TimerOfResendOtpEvent {}

class TimerStarted extends TimerOfResendOtpEvent {
  final int duration;

  TimerStarted({required this.duration});
}

class TimerTicked extends TimerOfResendOtpEvent {
  final int remainingTime;

  TimerTicked({required this.remainingTime});
}

class TimerCompleted extends TimerOfResendOtpEvent {}
