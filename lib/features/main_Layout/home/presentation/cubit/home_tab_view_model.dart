import 'package:e_commerce_app/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:e_commerce_app/features/main_Layout/home/presentation/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/resources/assets_manager.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase categoriesUseCase;

  GetAllBrandsUseCase brandsUseCase;

  List<String> sliderImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  HomeTabViewModel(
      {required this.categoriesUseCase, required this.brandsUseCase})
      : super(HomeTabInitialState());
  List<CategoryOrBrandEntity> categoriesList=[];
  List<CategoryOrBrandEntity> brandsList=[];

  static HomeTabViewModel get(context) => BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoryLoadingState());
    var either = await categoriesUseCase.invoke();
    either.fold((error) {
      emit(HomeCategoryErrorState(failures: error));
    }, (response) {
     categoriesList=response.data??[];
      if (categoriesList.isNotEmpty) {
        emit(HomeCategorySuccessState(responseEntity: response));
      }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await brandsUseCase.invoke();
    either.fold((error) {
      emit(HomeBrandsErrorState(failures: error));
    }, (response) {
      brandsList = response.data!;
      if (brandsList.isNotEmpty) {
        emit(HomeBrandsSuccessState(responseEntity: response));
      }
    });
  }
}
