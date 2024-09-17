import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:e_commerce_app/core/resources/styles_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/features/main_Layout/favourite_screen/cubit/watch_list_screen_state.dart';
import 'package:e_commerce_app/features/main_Layout/favourite_screen/cubit/watch_list_screen_view_model.dart';
import 'package:e_commerce_app/features/main_Layout/favourite_screen/widgets/favourite_item.dart';
import 'package:e_commerce_app/features/product_screen/cubit/products_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/values_manager.dart';
import '../../../core/resources/assets_manager.dart';

class FavouriteScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocListener<WatchListScreenViewModel, WatchListStates>(
      listener: (context, state) {
        if (state is GetWatchListInitialState) {
          WatchListScreenViewModel.get(context).getWatchList();
        }
        else if (state is DeleteWatchListErrorState){
          DialogUtils.showMassage(context: context, content: state.failures.errorMessage,posActionName: 'OK',title: 'Error');
          print(state.failures.errorMessage);
        }
      },
      child: BlocBuilder<WatchListScreenViewModel,WatchListStates>(
        bloc: WatchListScreenViewModel.get(context)..getWatchList(),
        builder: (context,state){
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 38,left:10),
                child: SvgPicture.asset(
                  SvgAssets.routeLogo,
                  height: 25.h,
                  width: 25.w,
                  colorFilter:
                  const ColorFilter.mode(ColorManager.textColor,
                      BlendMode.srcIn),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(right: 8.0,left: 8.0,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: ColorManager.primary,
                        style: getRegularStyle(
                            color: ColorManager.primary, fontSize: FontSize.s16),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppMargin.m12.w,
                              vertical: AppMargin.m8.h),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1, color: ColorManager.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1, color: ColorManager.primary)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1, color: ColorManager.primary)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1, color: ColorManager.primary)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10000),
                              borderSide: BorderSide(
                                  width: AppSize.s1, color: ColorManager.error)),
                          prefixIcon: ImageIcon(
                            AssetImage(IconsAssets.icSearch),
                            color: ColorManager.primary,
                          ),
                          hintText: "what do you search for?",
                          hintStyle: getRegularStyle(
                              color: ColorManager.primary, fontSize: FontSize.s16),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.cartRoute),
                        icon: Badge(
                          label: Text(
                              ProductScreenViewModel.get(context).numOfCartItem.toString()
                          ),
                          child: ImageIcon(
                            AssetImage(IconsAssets.icCart),
                            color: ColorManager.primary,
                          ),
                        ))
                  ],
                ),
              ),
              state is GetWatchListSuccessState ?
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
                    child: ListView.builder(
                      itemCount:state.getWatchListResponseEntity.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                          child:
                          FavoriteItem(watchList:state.getWatchListResponseEntity.data![index]),
                        );
                      },
                    )),
              ):
              Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,
                ),
              )
            ],
          );
        },

      ),
    );
  }
}
