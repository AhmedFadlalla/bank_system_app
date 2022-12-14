import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/core/use_case/base_use_case.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/domain/repo/base_app_repo.dart';
import 'package:dartz/dartz.dart';

class AddUserUseCase extends BaseUseCase<void,UserParameter>{
  BaseAppRepository baseAppRepository;


  AddUserUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, void>> call(UserParameter parameter) async{
    return await baseAppRepository.addUserToDatabase(parameter);
  }

}