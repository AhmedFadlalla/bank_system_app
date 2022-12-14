import 'package:equatable/equatable.dart';

class BaseUserData extends Equatable{

  final int id;
  final String email;
  final String name;
  final double balance;


 const BaseUserData({
    required  this.email,
    required  this.balance,
    required  this.name,
   required this.id

  });


  @override
  List<Object?> get props => [
    name,email,balance,id
  ];

}