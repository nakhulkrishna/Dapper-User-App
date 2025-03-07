import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/common/widgets/CutomTextField.dart';
import 'package:dapper_user/common/widgets/custom_scaffold.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_bloc.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_state.dart';
import 'package:dapper_user/router/router.dart';
import 'package:dapper_user/utils/constants/validator/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  final _formSignInKey = GlobalKey<FormState>();

  final TextEditingController _Email = TextEditingController();

  bool rememberPassword = true;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: screenHeight * 0.01,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.07,
                screenHeight * 0.05,
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
                        'Reset Password',
                        style: TextStyle(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Appcolor.blackColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'First, we need to verify your email. Once verified, we will send you a OTP to your Email ✉️.',
                        style: TextStyle(
                          fontSize: screenHeight * 0.018,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      //* Login Form Section
                      Column(
                        children: [
                          DTextFormField(
                            ispassword: false,
                            textInputType: TextInputType.name,
                            username: _Email,
                            hint: "Email",
                            label: "Email",
                            validator: (value) =>
                                AppValidations.validateUsername(value ?? ""),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),

                      BlocBuilder<UserAuthBloc, UserAuthState>(
                        builder: (context, state) {
                          if (state is UserAuthLoading) {
                            return CircularProgressIndicator();
                          }
                          return SizedBox(
                            width: double.infinity,
                            height: screenHeight * 0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed(AppRouter.verification);
                                },
                                child: Text("Verify Email")),
                          );
                        },
                      ),

                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),
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
