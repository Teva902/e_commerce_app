import 'package:e_commerce_app/domain/entity/CategoryOrBrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entity/ProductResponseEntity.dart';

class GetWatchListResponseEntity {
  GetWatchListResponseEntity({
    this.status,
    this.count,
    this.data,
  });

  String? status;
  num? count;
  List<GetDataWatchListEntity>? data;
}

class GetDataWatchListEntity {
  GetDataWatchListEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.v,
  });

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
  num? v;
}
