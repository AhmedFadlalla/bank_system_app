import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/domain/repo/base_app_repo.dart';
import 'package:dartz/dartz.dart';

class TransferOperationUseCase extends UseCase<void,TransferParameter,UserParameter,UserParameter>{
  final BaseAppRepository baseAppRepository;

  TransferOperationUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(TransferParameter parameter, UserParameter sender,UserParameter receiver) async{
    return await baseAppRepository.transferOperation(parameter, sender,receiver);
  }
}