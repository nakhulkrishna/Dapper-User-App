import 'package:dapper_user/data/providers/create_user_profile_provider.dart';
import 'package:dapper_user/data/repos/create_user_profile_repository.dart';
import 'package:dapper_user/logic/bloc/user_profile_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dapper_user/data/providers/authentication_provider.dart';
import 'package:dapper_user/data/providers/cart_products_provider.dart';
import 'package:dapper_user/data/providers/products_providers.dart';
import 'package:dapper_user/data/repos/authRepos.dart';
import 'package:dapper_user/logic/StockQuantity/stock_quantity_bloc.dart';
import 'package:dapper_user/logic/addtocart/cart_item_bloc.dart';
import 'package:dapper_user/logic/auth/auth/timer_of_resend_otp_bloc.dart';
import 'package:dapper_user/logic/auth/auth/user_auth_bloc.dart';
import 'package:dapper_user/logic/category_selector/categorys_selector_bloc.dart';
import 'package:dapper_user/logic/filter/filter_bloc.dart';
import 'package:dapper_user/logic/navigation/navigation_bloc.dart';
import 'package:dapper_user/logic/products/products_bloc.dart';
import 'package:dapper_user/router/router.dart';
import 'package:dapper_user/utils/theme/theme.dart';

void main() async {
  final dio = Dio();
  final userAuthProvider = Authenticationprovider();
  final authRepository = Authrepos(userAuthProvider);
  final productsProviders = ProductsProviders(dio: dio);
  final cartProductsProvider = CartProductsProvider(dio: dio);
  final createUserProfileProvider = CreateUserProfileProvider(dio: dio);

  runApp(
    MyApp(
      createUserProfileProvider: createUserProfileProvider,
      cartProductsProvider: cartProductsProvider,
      authrepos: authRepository,
      productsProvider: productsProviders,
    ),
  );
}

class MyApp extends StatelessWidget {
  final ProductsProviders productsProvider;
  final CartProductsProvider cartProductsProvider;
  final CreateUserProfileProvider createUserProfileProvider;
  final Authrepos authrepos;
  const MyApp(
      {super.key,
      required this.createUserProfileProvider,
      required this.authrepos,
      required this.productsProvider,
      required this.cartProductsProvider});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomnavBloc>(
          create: (context) => BottomnavBloc(),
          child: Container(),
        ),
        BlocProvider<UserAuthBloc>(
          create: (context) => UserAuthBloc(authrepos),
        ),
        BlocProvider<TimerOfResendOtpBloc>(
          create: (context) => TimerOfResendOtpBloc(60),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
          child: MaterialApp(),
        ),
        BlocProvider<ProductsBloc>(
          create: (context) => ProductsBloc(productsProvider),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => FilterBloc(),
        ),
        BlocProvider(
          create: (context) =>
              CartBloc(cartProductsProvider: cartProductsProvider),
        ),
        BlocProvider(
          create: (context) => StockQuantityBloc(),
          child: Container(),
        ),
        BlocProvider(
          create: (context) =>
              UserProfileBloc(userProfileProvider: createUserProfileProvider),
          child: Container(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.generateRoute,
      ),
    );
  }
}
