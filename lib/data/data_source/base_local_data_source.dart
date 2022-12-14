import 'package:bank_system_app/core/services/db_helper.dart';
import 'package:bank_system_app/core/utils/constrant.dart';
import 'package:bank_system_app/data/model/user_data_model.dart';

import '../model/transfer_data_model.dart';

abstract class BaseLocalDataSource {

  Future<void> addUserToDatabase(UserParameter parameter);

  Future<List<UserDataModel>> getUsersData();
  Future<UserDataModel> getReceiverData(StatusParameter parameter);
  Future<void> transferOperation(
      TransferParameter transferParameter,
      UserParameter sender,
      UserParameter receiver,
      );
  Future<List<TransferDataModel>> getTransfersData();

}
class LocalDataSource extends BaseLocalDataSource{
  DatabaseHelper databaseHelper=DatabaseHelper.instance;
  @override
  Future<void> addUserToDatabase(UserParameter parameter)async {
    Map<String,dynamic> user= {
      DatabaseHelper.userName:parameter.name,
      DatabaseHelper.userEmail:parameter.email,
      DatabaseHelper.userBalance:parameter.balance,
    };

    await databaseHelper.insertUser(user);
    }

  @override
  Future<List<UserDataModel>> getUsersData() async{
    return databaseHelper.userQuery();
  }


  @override
  Future<void> transferOperation(TransferParameter transferParameter,UserParameter sender,
      UserParameter receiver,) async{

    Map<String,dynamic> senderData= {
      DatabaseHelper.userBalance:sender.balance-transferParameter.ammount
    };
    Map<String,dynamic> receiverData= {
      DatabaseHelper.userBalance:receiver.balance+transferParameter.ammount
    };
    Map<String,dynamic> transfer= {
      DatabaseHelper.senderName:transferParameter.sender,
      DatabaseHelper.recieverName:transferParameter.reciever,
      DatabaseHelper.ammountValue:transferParameter.ammount,
    };
    print(transferParameter.reciever);
    print(transfer);
    await databaseHelper.updateUser(senderData, sender.id);
    await databaseHelper.updateUser(receiverData, receiver.id);
    await databaseHelper.insertTransfer(transfer);

  }

  @override
  Future<UserDataModel> getReceiverData(StatusParameter parameter) async{
    print("DATAAAAAAAA: ${databaseHelper.findUserByName(parameter.id)}");
    return await databaseHelper.findUserByName(parameter.id);
  }

  @override
  Future<List<TransferDataModel>> getTransfersData()async {

    return await databaseHelper.transferQuery();
  }


}