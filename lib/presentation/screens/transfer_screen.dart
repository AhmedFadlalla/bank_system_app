import 'package:bank_system_app/domain/entities/base_transfer_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/enum.dart';
import '../controller/bank_bloc.dart';
import '../controller/bank_state.dart';
class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankBloc, BankState>(
      builder: (context, state) {
        switch (state.transfersDataState) {
          case RequestState.loading:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:

            var transfers = state.transfersData;
            double total=0;
            for(int i=0;i<transfers.length;i++){
              total+=transfers[i].amount;
            }
            print(transfers);
            return ScreenUtilInit(builder: (context, Widget? widget) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("List Of Transfers"),
                  actions: [
                    Text("Total:$total"),
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          buildTransferItem(transfers[index], context),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemCount: transfers.length),
                ),
              );
            });
          case RequestState.error:
            return Scaffold(
              body: Center(child: Text(state.usersDataMessage)),
            );
        }
      },
      listener: (context, state) {},
    );
  }
  Widget buildTransferItem(BaseTransferData data,context)=>Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade400, width: 2)),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(
            data.senderName,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 20.sp),
          ),
          SizedBox(width: 6.w,),
          const Image(image: AssetImage("assets/icons/transfer.png"),width: 25,color: Colors.red,),
          SizedBox(width: 6.w,),
          Text(
            data.receiverName,
            style: Theme.of(context).textTheme.headline1!.copyWith(
              fontSize: 20.sp,
            ),
          ),
          const Spacer(),
          Text(
            "\$${data.amount}",
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 15.sp),
          ),
        ],
      ),
    ),
  );
}
