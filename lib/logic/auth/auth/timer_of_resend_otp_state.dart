part of 'timer_of_resend_otp_bloc.dart';

abstract class TimerOfResendOtpState {}

class TimerInitial extends TimerOfResendOtpState {
  final int duration;

  TimerInitial({required this.duration});
}

class TimerRunInProgress extends TimerOfResendOtpState {
  final int remainingTime;

  TimerRunInProgress({required this.remainingTime});
}

class TimerRunComplete extends TimerOfResendOtpState {}
