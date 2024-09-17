
import 'package:e_commerce_app/data/model/RegisetrResponseDto.dart';
import 'package:e_commerce_app/domain/entity/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({
    super.message,
    super.user,
    this.statusMsg,
    super.token,
  });

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }

  String? statusMsg;
}