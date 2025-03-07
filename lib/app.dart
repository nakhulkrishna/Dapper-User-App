import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:dapper_user/common/styles/appcolor2.dart';
import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/logic/navigation/navigation_bloc.dart';
import 'package:dapper_user/logic/navigation/navigation_event.dart';
import 'package:dapper_user/logic/navigation/navigation_state.dart';
import 'package:dapper_user/presentation/Profile/user_profile.dart';
import 'package:dapper_user/presentation/Shoping/shop_now_screen.dart';
import 'package:dapper_user/presentation/cart/checkout_screen.dart';
import 'package:dapper_user/presentation/homeScreen/home_screen.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomnavBloc(),
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<BottomnavBloc, NavigationState>(
          builder: (context, state) {
            // If the state is updated with selectedIndex, use it. Otherwise, default to 0
            int selectedIndex =
                (state is NavigationUpdatedState) ? state.selectedIndex : 0;

            return NavigationBar(
              height: 80,
              elevation: 0,
              backgroundColor: Appcolor.whiteColor,
              selectedIndex: selectedIndex,
              indicatorColor: AppColors2.brownColor,
              onDestinationSelected: (index) {
                context
                    .read<BottomnavBloc>()
                    .add(SelectNavigationEvent(index: index)); // Dispatch event
              },
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
                NavigationDestination(
                    icon: Icon(Iconsax.shop), label: "Shop Now"),
                NavigationDestination(icon: Icon(Iconsax.box), label: "Orders"),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: "Profile"),
              ],
            );
          },
        ),
        body: BlocBuilder<BottomnavBloc, NavigationState>(
          builder: (context, state) {
            int selectedIndex =
                (state is NavigationUpdatedState) ? state.selectedIndex : 0;

            final List<Widget> screens = [
              const HomeScreen(),
              Shopnowscreen(),
              CheckoutScreen(),
              UserProfile()
            ];

            return screens[
                selectedIndex]; // Return the screen based on the selected index
          },
        ),
      ),
    );
  }
}
