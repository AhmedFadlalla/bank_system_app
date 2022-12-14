import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/domain/entities/base_user_data.dart';
import 'package:bank_system_app/domain/repo/base_app_repo.dart';
import 'package:dartz/dartz.dart';

class GetUsersDataUseCase extends BaseUseCase<List<BaseUserData>,NoParameters>{
  final BaseAppRepository baseAppRepository;

  GetUsersDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseUserData>>> call(NoParameters parameter)async {
    return await baseAppRepository.getUsersData(parameter);
  }

}
