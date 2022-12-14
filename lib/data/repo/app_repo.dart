import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/data/data_source/base_local_data_source.dart';
import 'package:bank_system_app/domain/entities/base_transfer_data.dart';
import 'package:bank_system_app/domain/entities/base_user_data.dart';
import 'package:bank_system_app/domain/repo/base_app_repo.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repo/base_app_repo.dart';

class AppRepository extends BaseAppRepository{
  final BaseLocalDataSource baseLocalDataSource;

  AppRepository(this.baseLocalDataSource);

  @override
  Future<Either<Failure, void>> addUserToDatabase(UserParameter parameter) async{
    await baseLocalDataSource.addUserToDatabase(parameter);
  try{
  return Right(print("Add Successfully"));

  }on DatabaseFailure catch (failure){
  return Left(DatabaseFailure(failure.message));
  }
}

  @override
  Future<Either<Failure, List<BaseUserData>>> getUsersData(NoParameters parameter) async{
   final result= await baseLocalDataSource.getUsersData();
    try{
      return Right(result);

    }on DatabaseFailure catch (failure){
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, void>> transferOperation(TransferParameter transferParameter, UserParameter sender,UserParameter receiver) async{
    await baseLocalDataSource.transferOperation(transferParameter, sender,receiver);
    try{
      return Right(print("Transfer Done Successfully"));

    }on DatabaseFailure catch (failure){
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, BaseUserData>> getReceiverData(StatusParameter parameter) async{
   final result= await baseLocalDataSource.getReceiverData(parameter);
    try{
      print("App Repoooooooo: $result");
      return Right(result);

    }on DatabaseFailure catch (failure){
      return Left(DatabaseFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, List<BaseTransferData>>> getTransfersData() async{
    final result= await baseLocalDataSource.getTransfersData();
    try{
      print(result);
      return Right(result);
    }on DatabaseFailure catch (failure){
      return Left(DatabaseFailure(failure.message));
    }
  }
}