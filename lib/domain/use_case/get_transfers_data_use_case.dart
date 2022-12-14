import 'package:bank_system_app/core/error/failure.dart';
import 'package:bank_system_app/domain/repo/base_app_repo.dart';

import 'package:dartz/dartz.dart';

import '../../core/use_case/base_use_case.dart';
import '../entities/base_transfer_data.dart';

class GetTransfersDataUseCase extends BaseUseCase<List<BaseTransferData>,NoParameters>{
  final BaseAppRepository baseAppRepository;


  GetTransfersDataUseCase(this.baseAppRepository);

  @override
  Future<Either<Failure, List<BaseTransferData>>> call(NoParameters parameter) async{
    return await baseAppRepository.getTransfersData();
  }

}