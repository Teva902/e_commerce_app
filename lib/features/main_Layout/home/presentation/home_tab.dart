import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/widgets/announcement_widget.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: HomeTabViewModel.get(context)
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AnnouncementWidget(),
              Column(
                children: [
                  CustomSectionBar(sectionName: 'Categories', function: () {}),
                  state is HomeCategorySuccessState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryDark,
                          ),
                        )
                      : SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryWidget(
                                list: HomeTabViewModel.get(context)
                                    .categoriesList![index],
                              );
                            },
                            itemCount: HomeTabViewModel.get(context)
                                .categoriesList!
                                .length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        ),
                  SizedBox(height: 12.h),
                  CustomSectionBar(sectionName: 'Brands', function: () {}),
                  state is HomeCategoryLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorManager.primaryDark,
                          ),
                        )
                      : SizedBox(
                          height: 270.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CustomCategoryWidget(
                                list: HomeTabViewModel.get(context)
                                    .brandsList![index],
                              );
                            },
                            itemCount: 20,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                          ),
                        )
                  // CustomSectionBar(
                  //   sectionNname: 'Most Selling Products',
                  //   function: () {},
                  // ),
                  // SizedBox(
                  //   child: SizedBox(
                  //     height: 360.h,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return const ProductCard(
                  //           title: "Nike Air Jordon",
                  //           description:
                  //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                  //           rating: 4.5,
                  //           price: 1100,
                  //           priceBeforeDiscound: 1500,
                  //           image: ImageAssets.categoryHomeImage,
                  //         );
                  //       },
                  //       itemCount: 20,
                  //     ),
                  //   ),
                  // ),
                  ,
                  SizedBox(height: 12.h),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
