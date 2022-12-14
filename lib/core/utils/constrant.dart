import 'package:equatable/equatable.dart';

class UserParameter extends Equatable{
  int? id;
   final String name ;
   final  String email;
   final double balance;


   UserParameter({
    this.id,
     required this.name,
    required this.email,
    required this.balance,
  });

  @override
  List<Object?> get props => [name,email,balance];

}

class TransferParameter extends Equatable{

  final String sender;
  final String reciever;
  final double ammount;


 const  TransferParameter(
      {
        required this.sender,
        required this.reciever,
        required this.ammount,

       });

  @override
  // TODO: implement props
  List<Object?> get props => [sender,reciever,ammount];

}
class SearchStatus extends Equatable{
  final String name;

  const SearchStatus({
    required this.name});

  @override
  List<Object?> get props => [
    name
  ];

}
class StatusParameter extends Equatable{
  final String? name ;
  final int id;


  StatusParameter({
     this.name,
    required this.id

  });

  @override
  // TODO: implement props
  List<Object?> get props => [name];

}
String? uId;
