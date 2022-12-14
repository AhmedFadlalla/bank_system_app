import 'package:equatable/equatable.dart';

abstract class BaseBankEvent extends Equatable{

  const BaseBankEvent();

  @override
  List<Object> get props => [];

}
class AddUserToDBEvent extends BaseBankEvent{
  final String name ;
  final  String email;
  final double balance;


  const AddUserToDBEvent({
    required this.name,
    required this.email,
    required this.balance,
  });
}
class GetUsersDataEvent extends BaseBankEvent{

}
class GetReceiverDataEvent extends BaseBankEvent{
  final int id ;
  const GetReceiverDataEvent({
   required this.id
});
}
class TransferOperationEvent extends BaseBankEvent{
 final int senderId;
 final int receiverId;
  final double senderBalance;
  final double receiverBalance;
 final String senderName;
 final String receiverName;
  final double amount;

 const TransferOperationEvent(
      {
        required this.senderId,
        required   this.senderBalance,
        required    this.senderName,
        required    this.receiverBalance,
        required    this.receiverName,
        required   this.receiverId,
      required this.amount});
}
class GetTransfersDataEvent extends BaseBankEvent{}