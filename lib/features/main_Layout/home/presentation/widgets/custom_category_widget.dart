import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomCategoryWidget extends StatelessWidget {
  CategoryOrBrandEntity list;

  CustomCategoryWidget({required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
          imageUrl: list.image ?? '',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        //
        // ClipRRect(
        //   borderRadius: BorderRadius.circular(100.r),
        //   child: Container(
        //     height: 100.h,
        //     width: 100.w,
        //     decoration: const BoxDecoration(
        //       shape: BoxShape.circle,
        //     ),
        //     child: Image.network(
        //      list.image??'',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
        SizedBox(height: 8.h),
        Text(
          list.name ?? '',
          style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
        ),
      ],
    );
  }
}
