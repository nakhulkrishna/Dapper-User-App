import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/common/widgets/CutomTextField.dart';
import 'package:dapper_user/common/widgets/custom_scaffold.dart';
import 'package:dapper_user/common/widgets/divider.dart';
import 'package:dapper_user/common/widgets/dontHave.dart';
import 'package:dapper_user/common/widgets/remember.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_bloc.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_event.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_state.dart';
import 'package:dapper_user/router/router.dart';
import 'package:dapper_user/presentation/Authentication/signup_screen.dart';
import 'package:dapper_user/utils/constants/validator/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formSignInKey = GlobalKey<FormState>();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _username = TextEditingController();

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
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: screenHeight * 0.04,
                          fontWeight: FontWeight.w900,
                          color: Appcolor.blackColor,
                        ),
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
                            username: _username,
                            hint: "Username",
                            label: "Username",
                            validator: (value) =>
                                AppValidations.validateUsername(value ?? ""),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03, // Adjust spacing
                          ),
                          DTextFormField(
                              ispassword: true,
                              textInputType: TextInputType.name,
                              username: _password,
                              validator: (value) =>
                                  AppValidations.validatePassword(value),
                              label: "Password",
                              hint: "Password"),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),
                      //* Remember Section
                      RemeberSecion(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRouter.forgetPassword);
                        },
                        rememberPassword: rememberPassword,
                        isSignUp: true,
                        policys: "Remember me",
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),
                      //* Login button Section
                      BlocBuilder<UserAuthBloc, UserAuthState>(
                        builder: (context, state) {
                          if (state is UserAuthLoading) {
                            return SizedBox();
                          }
                          return SizedBox(
                            width: double.infinity,
                            height: screenHeight * 0.05,
                            child: ElevatedButton(
                                onPressed: () {
                                  if (_formSignInKey.currentState!.validate() &&
                                      rememberPassword) {
                                    BlocProvider.of<UserAuthBloc>(context).add(
                                        SignInRequested(
                                            _username.text, _password.text));

                                    Navigator.pushReplacementNamed(
                                        context, AppRouter.mynavigation);
                                  } else if (!rememberPassword) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Please agree to the processing of personal data',
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: Text("Sign In")),
                          );
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),

                      //* Divider Section
                      DividerSection(
                        text: '👖',
                      ),
                      SizedBox(
                        height: screenHeight * 0.03, // Adjust spacing
                      ),
                      const SizedBox(
                        height: 25.0,
                      ),
                      //* Dont
                      DontHaveAccount(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (e) => SignUpScreen(),
                            ),
                          );
                        },
                        text: ' Don\'t have an account? ',
                        singOrSignup: 'Sign Up',
                      ),
                      SizedBox(
                        height: screenHeight * 0.02, // Adjust spacing
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
