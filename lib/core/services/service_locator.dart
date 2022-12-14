

import 'package:bank_system_app/domain/use_case/add_user_use_case.dart';
import 'package:bank_system_app/domain/use_case/get_transfers_data_use_case.dart';
import 'package:bank_system_app/domain/use_case/transfer_operation_use_case.dart';
import 'package:bank_system_app/presentation/controller/bank_bloc.dart';
import 'package:bank_system_app/presentation/controller/bank_event.dart';
import 'package:get_it/get_it.dart';

import '../../data/data_source/base_local_data_source.dart';
import '../../data/repo/app_repo.dart';
import '../../domain/repo/base_app_repo.dart';
import '../../domain/use_case/get_receiver_data_use_case.dart';
import '../../domain/use_case/get_users_use_case.dart';





final sl=GetIt.instance;
class ServicesLocator{
  void init(){
    //Bloc
   sl.registerLazySingleton<BankBloc>(() =>BankBloc(sl(),sl(),sl(),sl(),sl()));
    //use case
   sl.registerLazySingleton<AddUserUseCase>(() =>AddUserUseCase(sl()));
   sl.registerLazySingleton<GetUsersDataUseCase>(() =>GetUsersDataUseCase(sl()));
   sl.registerLazySingleton<TransferOperationUseCase>(() =>TransferOperationUseCase(sl()));
   sl.registerLazySingleton<GetReceiverDataUseCase>(() =>GetReceiverDataUseCase(sl()));
   sl.registerLazySingleton<GetTransfersDataUseCase>(() =>GetTransfersDataUseCase(sl()));
    //Repository
    sl.registerLazySingleton<BaseAppRepository>(() =>AppRepository(sl()));
    //data source
    sl.registerLazySingleton<BaseLocalDataSource>(() =>LocalDataSource());
  }

}