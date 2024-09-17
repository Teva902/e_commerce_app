import 'package:e_commerce_app/domain/entity/GetCartResponseEntity.dart';
import 'package:e_commerce_app/features/cart/cubit/cart_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routes_manager/routes.dart';

class CartItemWidget extends StatelessWidget {
  GetProductCartEntity productEntity ;
  CartItemWidget({required this.productEntity});


  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.productDetails),
      child: Container(
        height: isPortrait ? height * 0.14 : width * 0.23,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
        ),
        child: Row(children: [
          // display image in the container
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
            ),
            child: Image.network(
              productEntity.product?.imageCover??'',
              fit: BoxFit.cover,
              height: isPortrait ? height * 0.142 : height * 0.23,
              width: isPortrait ? width * 0.29 : 165.w,
            ),
          ),
          // SizedBox(width: 8.w),
          // display details product=========================
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p8.w,
                vertical: AppPadding.p8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // title and delete button ==
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          productEntity.product?.title??'',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                            color: ColorManager.textColor,
                            fontSize: AppSize.s18.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          CartScreenViewModel.get(context).deleteItemInCart(productEntity.product?.id??'');
                        },
                        child: Image.asset(
                          IconsAssets.icDelete,
                          color: ColorManager.textColor,
                          height: 22.h,
                        ),
                      )
                    ],
                  ),

                  // SizedBox(height: 7.h),
                  const Spacer(),
                  // display color and size===================

                  // display price and quantity =================
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${productEntity.price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: getBoldStyle(
                              color: ColorManager.textColor,
                              fontSize: AppSize.s18.sp),
                        ),
                      ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(24.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        int count =productEntity.count!.toInt();
                        count-- ;
                        CartScreenViewModel.get(context).updateItemCountInCart(productEntity.product?.id??'',
                            count);
                      },
                      child: Icon(
                        Icons.remove_circle_outline,
                        size: 20.w,
                        color: ColorManager.white,
                      )),
                  SizedBox(
                    width: 18.w,
                  ),
                  Text(
                    '${productEntity.count}',
                    style: getMediumStyle(color: ColorManager.white)
                        .copyWith(fontSize: 18.sp),
                  ),
                  SizedBox(
                    width: 18.w,
                  ),
                  InkWell(
                      onTap: () {
                        int count =productEntity.count!.toInt();
                        count++ ;
                        CartScreenViewModel.get(context).updateItemCountInCart(productEntity.product?.id??'',
                            count);
                      },
                      child: Icon(
                        Icons.add_circle_outline,
                        color: ColorManager.white,
                        size: 20.w,
                      )),
                ],
              ),
            )
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
