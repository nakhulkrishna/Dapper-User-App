import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/common/widgets/custom_scaffold.dart';
import 'package:dapper_user/common/widgets/otp_text_feild.dart';
import 'package:dapper_user/logic/auth/auth/timer_of_resend_otp_bloc.dart';
import 'package:dapper_user/logic/auth/auth/timer_of_resend_otp_event.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_bloc.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_event.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_state.dart';
import 'package:dapper_user/router/router.dart';
import 'package:dapper_user/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class EmailVerification extends StatelessWidget {
  final String email;
  final String username;
  final String password;
  EmailVerification(
      {super.key,
      required this.email,
      required this.username,
      required this.password});

  final _formSignInKey = GlobalKey<FormState>();

  bool rememberPassword = true;

  //* otp texteditingcontroller
  TextEditingController otp1 = TextEditingController();

  TextEditingController otp2 = TextEditingController();

  TextEditingController otp3 = TextEditingController();

  TextEditingController otp4 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    context.read<TimerOfResendOtpBloc>().add(TimerStarted(duration: 60));
    // List<String> data = [widget.email, widget.password, widget.username];
    // print(data);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: screenHeight * 0.01, // Adjust height proportionally
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.07, // Adjust padding based on screen width
                screenHeight *
                    0.05, // Adjust top padding based on screen height
                screenWidth * 0.07,
                screenHeight * 0.02,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: screenHeight * 0.04, // Responsive font size
                          fontWeight: FontWeight.w900,
                          color: Appcolor.blackColor,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01, // Adjust spacing
                      ),
                      Text(
                        'Check your email for the OTP code.',
                        style: TextStyle(
                          fontSize: screenHeight * 0.02, // Responsive font size
                          color: Colors.grey, // Subtle hint color
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05, // Adjust spacing
                      ),
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OtpTextField(
                              controller: otp1,
                              currentFocus: focusNode1,
                              nextFocus: focusNode2,
                            ),
                            OtpTextField(
                              controller: otp2,
                              currentFocus: focusNode2,
                              nextFocus: focusNode3,
                            ),
                            OtpTextField(
                              controller: otp3,
                              currentFocus: focusNode3,
                              nextFocus: focusNode4,
                            ),
                            OtpTextField(
                              controller: otp4,
                              currentFocus: focusNode4,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),
                      BlocBuilder<TimerOfResendOtpBloc, TimerOfResendOtpState>(
                        builder: (context, state) {
                          if (state is TimerRunInProgress) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Resend in ${state.remainingTime}s'),
                              ],
                            );
                          } else if (state is TimerRunComplete) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<TimerOfResendOtpBloc>()
                                        .add(TimerStarted(duration: 60));
                                  },
                                  child: Text(
                                    'Resend OTP?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: lightColorScheme
                                          .primary, // Enable resend button
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Text(
                              'Please wait...',
                              style: TextStyle(color: Colors.grey),
                            ); // Fallback state
                          }
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),
                      BlocListener<UserAuthBloc, UserAuthState>(
                        listener: (context, state) {
                          if (state is UserAuthenticated) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            // Show success SnackBar when OTP verification is successful
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                content:
                                    Text("Your email verified sucssesfully"),
                                //* State contains success message
                                backgroundColor: Colors.green,
                                //* Success color
                              ),
                            );
                            Future.delayed(const Duration(seconds: 2), () {
                              Navigator.pushReplacementNamed(
                                  context, AppRouter.login);
                            });
                          }
                        },
                        child: SizedBox(
                          width: double.infinity,
                          height: screenHeight * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the corner radius
                              ),
                            ),
                            onPressed: () {
                              if (_formSignInKey.currentState!.validate()) {
                                final otp = otp1.text +
                                    otp2.text +
                                    otp3.text +
                                    otp4.text;
                                BlocProvider.of<UserAuthBloc>(context).add(
                                    OtpVerificationRequested(
                                        email, otp, username, password));

                                // Optionally show a loading SnackBar while processing
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Processing OTP verification...'),
                                  ),
                                );
                              }
                            },
                            child: const Text('Verify'),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.18),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
