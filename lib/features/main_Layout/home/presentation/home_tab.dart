import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/styles_manager.dart';
import 'package:e_commerce_app/core/resources/values_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_states.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_view_model.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/widgets/announcement_widget.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38, left: 10),
                child: SvgPicture.asset(
                  SvgAssets.routeLogo,
                  height: 25.h,
                  width: 25.w,
                  colorFilter: const ColorFilter.mode(
                      ColorManager.textColor, BlendMode.srcIn),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: 8.0, left: 8.0, top: 10, bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: ColorManager.primary,
                        style: getRegularStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppMargin.m12.w,
                              vertical: AppMargin.m8.h),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: ColorManager.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: ColorManager.primary)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: ColorManager.primary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: ColorManager.primary)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1,
                                  color: ColorManager.error)),
                          prefixIcon: ImageIcon(
                            AssetImage(IconsAssets.icSearch),
                            color: ColorManager.primary,
                          ),
                          hintText: "what do you search for?",
                          hintStyle: getRegularStyle(
                              color: ColorManager.primary,
                              fontSize: FontSize.s16),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.cartRoute),
                        icon: Badge(
                          label: Text(ProductScreenViewModel.get(context)
                              .numOfCartItem
                              .toString()),
                          child: ImageIcon(
                            AssetImage(IconsAssets.icCart),
                            color: ColorManager.primary,
                          ),
                        ))
                  ],
                ),
              ),
              AnnouncementWidget(),
              Column(
                children: [
                  CustomSectionBar(sectionName: 'Categories', function: () {}),
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
                                    .categoriesList[index],
                              );
                      },
                      itemCount: HomeTabViewModel.get(context)
                                .categoriesList
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
                                    .brandsList[index],
                              );
                            },
                            itemCount:
                                HomeTabViewModel.get(context).brandsList.length,
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
