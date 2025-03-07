import 'dart:developer';

import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/common/widgets/CutomTextField.dart';

import 'package:dapper_user/common/widgets/custom_scaffold.dart';
import 'package:dapper_user/common/widgets/divider.dart';
import 'package:dapper_user/common/widgets/dontHave.dart';

import 'package:dapper_user/logic/auth/auth/user_auth_bloc.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_event.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_state.dart';
import 'package:dapper_user/router/router.dart';

import 'package:dapper_user/utils/constants/validator/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formSignupKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool agreePersonalData = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: screenHeight * 0.02,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.05, // 5% of the screen width
                screenHeight * 0.05, // 5% of the screen height
                screenWidth * 0.05, // 5% of the screen width
                screenHeight * 0.02, // 2% of the screen height
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                // get started form
                child: Form(
                  key: _formSignupKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: screenWidth * 0.08, // Adjust font size
                          fontWeight: FontWeight.w900,
                          color: Appcolor.blackColor,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      // full name
                      DTextFormField(
                          ispassword: false,
                          textInputType: TextInputType.name,
                          username: _usernameController,
                          validator: (value) =>
                              AppValidations.validateUsername(value),
                          label: "Full Name",
                          hint: "Full Name"),
                      SizedBox(height: screenHeight * 0.03),
                      // email
                      DTextFormField(
                          ispassword: false,
                          textInputType: TextInputType.emailAddress,
                          username: _emailController,
                          validator: (value) =>
                              AppValidations.validateEmail(value),
                          label: "Email",
                          hint: "Email"),
                      SizedBox(height: screenHeight * 0.03),
                      // password
                      DTextFormField(
                          ispassword: true,
                          textInputType: TextInputType.text,
                          username: _passwordController,
                          validator: (value) =>
                              AppValidations.validatePassword(value),
                          label: "Password",
                          hint: "Password"),
                      SizedBox(height: screenHeight * 0.03),
                      // I agree to the processing
                      // RemeberSecion(
                      //   rememberPassword: true,
                      //   isSignUp: false,
                      //   policys:
                      //       'By signing up, you agree to the Terms and Conditions',
                      // ),
                      SizedBox(height: screenHeight * 0.03),
                      // signup button
                      BlocBuilder<UserAuthBloc, UserAuthState>(
                        builder: (context, state) {
                          if (state is UserAuthLoading) {
                            return Center(child: CircularProgressIndicator());
                          }

                          return SizedBox(
                            width: double.infinity,
                            height: screenHeight * 0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formSignupKey.currentState!.validate()) {
                                    log("First block: Form is valid and agreePersonalData is true");

                                    context.read<UserAuthBloc>().add(
                                          SignUpRequested(
                                            _usernameController.text,
                                            _passwordController.text,
                                            _emailController.text,
                                          ),
                                        );

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Processing Data'),
                                      ),
                                    );
                                    Navigator.of(context).pushNamed(
                                        AppRouter.verification,
                                        arguments: {
                                          'email': _emailController.text,
                                          'password': _passwordController.text,
                                          'username': _usernameController.text
                                        });
                                  } else if (!agreePersonalData) {
                                    log("Second block: agreePersonalData is false");
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'You need to Agree with our Terms and Conditions'),
                                      ),
                                    );
                                  }
                                },
                                child: Text("Sign Up")),
                          );
                        },
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      // sign up divider
                      DividerSection(
                        text: '👖',
                      ),
                      SizedBox(height: screenHeight * 0.04),
                      // Already have an account
                      DontHaveAccount(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        singOrSignup: 'Sign In',
                        text: 'Already have an account? ',
                      ),
                      SizedBox(height: screenHeight * 0.02),
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
