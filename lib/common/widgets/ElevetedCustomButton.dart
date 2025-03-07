// import 'package:dapper_user/common/styles/colors.dart';
// import 'package:dapper_user/logic/auth/user_auth_bloc.dart';
// import 'package:dapper_user/logic/auth/user_auth_event.dart';
// import 'package:dapper_user/router/router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ElevetedButton extends StatelessWidget {
//   const ElevetedButton({
//     super.key,
//     required GlobalKey<FormState> formSignInKey,
//     required this.rememberPassword,
//     TextEditingController? username,
//     TextEditingController? password,
//     TextEditingController? email,
//     required this.label,
//     required this.onpressed,
//   })  : _formSignInKey = formSignInKey,
//         _username = username,
//         _password = password,
//         _email = email;

//   final GlobalKey<FormState> _formSignInKey;
//   final bool rememberPassword;
//   final String label;
//   final TextEditingController? _email;
//   final TextEditingController? _username;
//   final TextEditingController? _password;
//   final VoidCallback onpressed;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             elevation: 0,
//             backgroundColor: Appcolor.blackColor,
//             foregroundColor: Appcolor.whiteColor),
//         onPressed: onpressed,
//         child: Text(label),
//       ),
//     );
//   }
// }
