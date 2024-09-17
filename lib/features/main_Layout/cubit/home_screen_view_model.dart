import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/main_Layout/cubit/home_screen_states.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/home_tab.dart';
import 'package:e_commerce_app/features/product_screen/screen/products_screen.dart';
import 'package:flutter/material.dart';

import '../favourite_screen/favourite_screen.dart';
import '../profile_tab/presentation/profile_tab.dart';


class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());
  int currentIndex = 0;
  List<Widget> tabs = [
     HomeTab(),
     ProductsScreen(),
     FavouriteScreen(),
     ProfileTab(),
  ];
  void changeSelectedIndex(int newSelectedIndex){
    emit(HomeScreenInitialState());
    currentIndex = newSelectedIndex ;
    emit(ChangeSelectedIndexState());
  }
}