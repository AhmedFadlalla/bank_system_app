import 'package:bank_system_app/domain/entities/base_transfer_data.dart';
import 'package:equatable/equatable.dart';

import '../../core/utils/enum.dart';
import '../../domain/entities/base_user_data.dart';

class BankState extends Equatable {
  final RequestState addUserState;
  final String addUserMessage;
  final List<BaseUserData> usersData;
  final RequestState usersDataState;
  final String usersDataMessage;
  final RequestState transferOperationState;
  final String transferOperationMessage;
  final BaseUserData? receiverData;
  final RequestState receiverDataState;
  final String receiverDataMessage;
  final List<BaseTransferData> transfersData;
  final RequestState transfersDataState;
  final String transfersDataMessage;


  const BankState({
    this.addUserState=RequestState.loading,
    this.addUserMessage='',
    this.usersData=const [],
    this.usersDataState=RequestState.loading,
    this.usersDataMessage='',
    this.transferOperationState=RequestState.loading,
    this.transferOperationMessage='',
    this.receiverData,
    this.receiverDataState=RequestState.loading,
    this.receiverDataMessage='',
    this.transfersData=const [],
    this.transfersDataMessage='',
    this.transfersDataState=RequestState.loading
  });

  BankState copyWith({
    RequestState? addUserState,
    String? addUserMessage,
     List<BaseUserData>? usersData,
     RequestState? usersDataState,
     String? usersDataMessage,
     RequestState? transferOperationState,
     String? transferOperationMessage,
     BaseUserData? receiverData,
     RequestState? receiverDataState,
     String? receiverDataMessage,
    List<BaseTransferData>? transfersData,
    RequestState? transfersDataState,
    String? transfersDataMessage,


  })=>BankState(
    addUserMessage: addUserMessage??this.addUserMessage,
    addUserState: addUserState??this.addUserState,
    usersData: usersData??this.usersData,
    usersDataState: usersDataState??this.usersDataState,
    usersDataMessage: usersDataMessage??this.usersDataMessage,
    transferOperationMessage: transferOperationMessage??this.transferOperationMessage,
    transferOperationState: transferOperationState??this.transferOperationState,
    receiverData: receiverData??this.receiverData,
    receiverDataState: receiverDataState??this.receiverDataState,
    receiverDataMessage: receiverDataMessage??this.receiverDataMessage,
    transfersData: transfersData??this.transfersData,
    transfersDataState: transfersDataState??this.transfersDataState,
      transfersDataMessage: transfersDataMessage??this.transfersDataMessage
  );

  @override
  List<Object?> get props => [
    addUserState,addUserMessage,
    usersData,usersDataState,usersDataMessage,
    transferOperationState,transferOperationMessage,
    receiverData,receiverDataState,receiverDataMessage,
    transfersData,transfersDataState,transfersDataMessage
  ];
}
