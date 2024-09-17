import 'package:e_commerce_app/domain/entity/GetWatchListResponseEntity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import 'custom_txt_widget.dart';

class FavouriteItemDetails extends StatelessWidget {
  GetDataWatchListEntity watchList;

  FavouriteItemDetails({required this.watchList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: watchList.title ?? '',
          textStyle: getSemiBoldStyle(
              color: ColorManager.primaryDark, fontSize: AppSize.s18.sp),
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${watchList.price}  ',
              textStyle: getSemiBoldStyle(
                      color: ColorManager.primaryDark, fontSize: AppSize.s18.sp)
                  .copyWith(
                letterSpacing: 0.17,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: AppSize.s10.h,
                  ),
                  CustomTextWgt(
                      data: 'EGP ${watchList.price ?? ["salePrice"]}',
                      textStyle: getMediumStyle(
                              color:
                                  ColorManager.appBarTitleColor.withOpacity(.6))
                          .copyWith(
                              letterSpacing: 0.17,
                              decoration: TextDecoration.lineThrough,
                              color:
                                  ColorManager.appBarTitleColor.withOpacity(.6),
                              fontSize: AppSize.s10.sp)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
