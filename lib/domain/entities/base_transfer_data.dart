import 'package:equatable/equatable.dart';

class BaseTransferData extends Equatable{
  final int id;
  final String senderName;
  final String receiverName;
  final double amount;

const  BaseTransferData({
  required  this.id,
    required  this.senderName,
    required  this.receiverName,
    required  this.amount,
  });

  @override
  List<Object?> get props => [
    id,senderName,receiverName,amount
  ];

}