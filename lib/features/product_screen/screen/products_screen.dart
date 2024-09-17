import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/features/product_details/product_details.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_states.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_view_model.dart';
import 'package:e_commerce_app/features/product_screen/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/routes_manager/routes.dart';

class ProductsScreen extends StatelessWidget {
  get automaticallyImplyLeading => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductScreenViewModel, ProductScreenState>(
      bloc: ProductScreenViewModel.get(context)..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.white,
            title: SvgPicture.asset(
              SvgAssets.routeLogo,
              height: 25.h,
              width: 25.w,
              colorFilter: const ColorFilter.mode(
                  ColorManager.textColor, BlendMode.srcIn),
            ),
            bottom: PreferredSize(
                preferredSize: const Size(AppSize.s100, AppSize.s60),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
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
                )),
            // leading: const SizedBox.shrink(),
          ),
          body: state is ProductScreenLoadingState ||
                  state is AddToCartLoadingState
              ? Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primaryDark,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: ProductScreenViewModel.get(context)
                              .productList
                              .length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProductDetails(
                                        product:
                                            ProductScreenViewModel.get(context)
                                                .productList[index])));
                              },
                              child: ProductItemWidget(
                                product: ProductScreenViewModel.get(context)
                                    .productList[index],
                              ),
                            );
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
