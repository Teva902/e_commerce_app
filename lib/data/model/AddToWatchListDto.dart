import 'package:e_commerce_app/domain/entity/AddToWatchListEntity.dart';

class AddToWatchListDto extends AddToWatchListEntity {
  AddToWatchListDto({
      super.status,
      super.message,
      super.data,});

  AddToWatchListDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}