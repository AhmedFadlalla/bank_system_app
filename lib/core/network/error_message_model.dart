import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusCode;
  final String statusMessage;
  final int code;

   ErrorMessageModel({required this.statusCode,required this.statusMessage,required this.code});
  
  factory ErrorMessageModel.fromJson(Map<String,dynamic>json){
    return ErrorMessageModel(
        statusCode: json["status"]??"",
        statusMessage: json["message"],
        code: json["code"]??0);


  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    statusCode,statusMessage,code
  ];


}

class WrongDataModel extends Equatable{

  final int status;
  final String message;


  const WrongDataModel({
    required this.status,required this.message});


  factory WrongDataModel.fromJson(Map<String,dynamic>json){
    return WrongDataModel(
        status: json["status"],
        message: json["message"]["message"],
        );


  }
  @override
  List<Object?> get props => [];

}