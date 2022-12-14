import 'package:bank_system_app/domain/entities/base_user_data.dart';

class UserDataModel extends BaseUserData{
  const UserDataModel({required super.email, required super.balance, required super.name,required super.id});

  factory UserDataModel.fromJson(Map<String,dynamic> json){
    return UserDataModel(
      id: json["id"],
        email: json["email"],
        name: json["name"],
        balance:json["balance"],
    );
  }
  Map<String,dynamic> toMap()=>{
    "name":name,
    "email":email,
    "balance":balance,
    "id":id
  };

}