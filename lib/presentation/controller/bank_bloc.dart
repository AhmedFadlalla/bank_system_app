import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bloc/bloc.dart';

import '../../core/utils/enum.dart';
import '../../domain/use_case/add_user_use_case.dart';
import '../../domain/use_case/get_receiver_data_use_case.dart';
import '../../domain/use_case/get_transfers_data_use_case.dart';
import '../../domain/use_case/get_users_use_case.dart';
import '../../domain/use_case/transfer_operation_use_case.dart';
import 'bank_event.dart';
import 'bank_state.dart';

class BankBloc extends Bloc<BaseBankEvent, BankState> {
  final AddUserUseCase addUserUseCase;
  final GetUsersDataUseCase getUsersDataUseCase;
  final TransferOperationUseCase transferOperationUseCase;
  final GetReceiverDataUseCase getReceiverDataUseCase;
  final GetTransfersDataUseCase getTransfersDataUseCase;

  BankBloc(
    this.addUserUseCase,
    this.getUsersDataUseCase,
    this.transferOperationUseCase,
    this.getReceiverDataUseCase,
    this.getTransfersDataUseCase,
  ) : super(const BankState()) {
    on<AddUserToDBEvent>((event, emit) async {
      final result = await addUserUseCase(UserParameter(
          name: event.name, email: event.email, balance: event.balance));

      result.fold(
          (l) => emit(state.copyWith(
              addUserState: RequestState.error, addUserMessage: l.message)),
          (r) => emit(state.copyWith(
                addUserState: RequestState.loaded,
              )));
    });
    on<GetUsersDataEvent>((event, emit) async {
      final result = await getUsersDataUseCase(const NoParameters());

      result.fold(
          (l) => emit(state.copyWith(
              usersDataState: RequestState.error, usersDataMessage: l.message)),
          (r) => emit(state.copyWith(
              usersDataState: RequestState.loaded, usersData: r)));
    });
    on<GetReceiverDataEvent>((event, emit) async {
      final result = await getReceiverDataUseCase(StatusParameter(
        id: event.id,
      ));

      print("Bloc Resultttttttttt: $result");
      result.fold(
          (l) => emit(state.copyWith(
              receiverDataState: RequestState.error,
              receiverDataMessage: l.message)), (r) {
        print(r);
        emit(state.copyWith(
            receiverDataState: RequestState.loaded, receiverData: r));
      });
    });
    on<TransferOperationEvent>((event, emit) async {
      final result = await transferOperationUseCase(
          TransferParameter(
              sender: event.senderName,
              reciever: event.receiverName,
              ammount: event.amount),
          UserParameter(
              id: event.senderId,
              name: "",
              email: "",
              balance: event.senderBalance),
          UserParameter(
              id: event.receiverId,
              name: "",
              email: "",
              balance: event.receiverBalance));

      result.fold(
          (l) => emit(state.copyWith(
              transferOperationState: RequestState.error,
              transferOperationMessage: l.message)),
          (r) => emit(state.copyWith(
                transferOperationState: RequestState.loaded,
              )));
    });
    on<GetTransfersDataEvent>((event, emit) async{
      final result = await getTransfersDataUseCase(const NoParameters());

      result.fold(
              (l) => emit(state.copyWith(
              transfersDataState: RequestState.error,
              transfersDataMessage: l.message)), (r) => emit(
          state.copyWith(
              transfersDataState: RequestState.loaded,
              transfersData: r
          )));
    });
  }
}
