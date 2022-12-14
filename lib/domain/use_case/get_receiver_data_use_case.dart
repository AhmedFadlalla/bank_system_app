import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/domain/repo/base_app_repo.dart';
import 'package:dartz/dartz.dart';

import '../entities/base_user_data.dart';

class GetReceiverDataUseCase extends BaseUseCase<BaseUserData,StatusParameter>{
  final BaseAppRepository baseAppRepository;

  GetReceiverDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, BaseUserData>> call(StatusParameter parameter) async{
   return await baseAppRepository.getReceiverData(parameter);
  }
}