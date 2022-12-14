import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/domain/entities/base_user_data.dart';
import 'package:dartz/dartz.dart';

import '../entities/base_transfer_data.dart';
abstract class BaseAppRepository {

  Future<Either<Failure,void>> addUserToDatabase(UserParameter parameter);

  Future<Either<Failure,List<BaseUserData>>> getUsersData(NoParameters parameter);
  Future<Either<Failure,BaseUserData>> getReceiverData(StatusParameter parameter);
  Future<Either<Failure,void>> transferOperation(TransferParameter transferParameter,UserParameter userParameter1,UserParameter userParameter2);
  Future<Either<Failure,List<BaseTransferData>>> getTransfersData();


}