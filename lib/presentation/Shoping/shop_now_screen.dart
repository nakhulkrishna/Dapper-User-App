import 'package:dapper_user/common/styles/colors.dart';
import 'package:dapper_user/logic/products/products_bloc.dart';
import 'package:dapper_user/logic/products/products_event.dart';
import 'package:dapper_user/logic/products/products_state.dart';
import 'package:dapper_user/logic/filter/filter_bloc.dart';
import 'package:dapper_user/logic/filter/filter_event.dart';
import 'package:dapper_user/logic/filter/filter_state.dart';
import 'package:dapper_user/logic/category_selector/categorys_selector_bloc.dart';
import 'package:dapper_user/logic/category_selector/categorys_selector_event.dart';
import 'package:dapper_user/logic/category_selector/categorys_selector_state.dart';
import 'package:dapper_user/presentation/Shoping/products_details.dart';
import 'package:dapper_user/utils/widgets/products_cart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Shopnowscreen extends StatelessWidget {
  const Shopnowscreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(FetchProductsEvent());
    List<String> categorys = [
      "All",
      "Shirts",
      "Shorts",
      "Tees",
      "Pants",
      "Jeans",
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Appcolor.whiteColor,
      appBar: AppBar(
        backgroundColor: Appcolor.whiteColor,
        surfaceTintColor: Appcolor.whiteColor,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Shop now",
              style: GoogleFonts.poppins(),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          //* categories
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              return Container(
                height: screenHeight * 0.055,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    bool isSelected = state.selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<CategoryBloc>(context)
                            .add(SelectCategoryEvent(index));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: isSelected
                                      ? Appcolor.blackColor
                                      : Appcolor.color2),
                              borderRadius: BorderRadius.circular(20)),
                          height: screenHeight * 0.055,
                          width: screenWidth * 0.15,
                          child: Center(
                            child: Text(categorys[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      isSelected ? Colors.black : Colors.grey,
                                )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          //* sort and filter
          Row(
            children: [
              IconButton(
                onPressed: () {
                  showFilterOptions(context); // Filter options modal
                },
                icon: Icon(Iconsax.filter),
              ),
              SizedBox(width: screenWidth * 0.001),
              Text(
                "Filter",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.sort4)),
              SizedBox(width: screenWidth * 0.001),
              Text(
                "Sort",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: screenWidth * 0.02),
            ],
          ),
          Expanded(
            child: BlocBuilder<ProductsBloc, ProductState>(
                builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: LoadingIndicator(
                      indicatorType: Indicator.ballPulse,
                      colors: const [Appcolor.blackColor],
                    ),
                  ),
                );
              } else if (state is ProductLoaded) {
                return GridView.builder(
                    itemCount: state.products.length, // Number of grid items
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (screenWidth > 600)
                          ? 3
                          : 2, // Adjust based on screen width
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 10.0, // Spacing between rows
                      childAspectRatio: (screenWidth / (screenHeight * 0.6)),
                    ),
                    itemBuilder: (context, index) {
                      if (state.products.isNotEmpty) {
                        return ProductsCard(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsDetails(
                                        productModel: state.products[index]),
                                  ));
                            },
                            productModel: state.products[index]);
                      } else {
                        return Center(child: Text("No Products available"));
                      }
                    });
              } else if (state is ProductError) {
                return Center(child: Text('Something Went Wrong'));
              } else {
                return SizedBox();
              }
            }),
          )
        ],
      ),
    );
  }

  void showFilterOptions(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true, // Allow full screen width and height
      context: context,
      builder: (context) {
        return BlocBuilder<FilterBloc, FilterState>(
          builder: (context, state) {
            double screenWidth = MediaQuery.of(context).size.width;
            return Container(
              width: screenWidth, // Adjust height if needed
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Filter Options",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  filterOption(context, state, "Material"),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Apply filters here
                    },
                    child: Text("Apply Filters"),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget filterOption(
      BuildContext context, FilterState state, String filterName) {
    final materials = [
      "Cotton",
      "Polyester",
      "Linen",
      "Silk",
      "Wool",
      "Nylon",
      "Denim",
      "Rayon"
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(filterName),
        Wrap(
          children: materials.map((material) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(material),
                Checkbox(
                  value: state.selectedMaterials[material] ?? false,
                  onChanged: (value) {
                    BlocProvider.of<FilterBloc>(context).add(
                      ToggleMaterialFilterEvent(material, value!),
                    );
                  },
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
