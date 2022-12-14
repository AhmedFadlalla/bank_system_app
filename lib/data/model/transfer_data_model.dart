import 'package:bank_system_app/domain/entities/base_transfer_data.dart';

class TransferDataModel extends BaseTransferData{
  const TransferDataModel({required super.id, required super.senderName, required super.receiverName, required super.amount});


  factory TransferDataModel.fromJson(Map<String,dynamic> json){
    return TransferDataModel(
      id: json["id"],
      senderName: json["sender"],
      receiverName: json["reciever"],
      amount:json["ammount"],
    );
  }
}