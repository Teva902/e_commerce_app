import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/widget/heart_button.dart';
import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';


class ProductItemWidget extends StatelessWidget {

ProductEntity product;
ProductItemWidget({required this.product});
  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:191.w,
      height: 237.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(14.r)),
                  child:
                  CachedNetworkImage(
                    imageUrl: product.imageCover??'',
                    height: 128.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Positioned(
                    top: 8.h,
                    right:8.w,
                    child: HeartButton(onTap: () {
                      ProductScreenViewModel.get(context).addToWatchList(product.id??'');

                    })),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(product.title??''),
                    style: getMediumStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    truncateDescription(product.description??''),
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height:2.h),
                  Text(
                    "EGP ${product.price??''}",
                    style: getRegularStyle(
                      color: ColorManager.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                  // SizedBox(height: height * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // width: width * 0.22,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Review (${product.ratingsAverage})",
                              style: getRegularStyle(
                                color: ColorManager.textColor,
                                fontSize: 12.sp,
                              ),
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: ColorManager.starRateColor,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            ProductScreenViewModel.get(context)..addToCart(product.id??'');
                          },
                          child: Container(
                            height:30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primary,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
