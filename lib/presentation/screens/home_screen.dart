import 'package:bank_system_app/core/services/db_helper.dart';
import 'package:bank_system_app/domain/entities/base_user_data.dart';
import 'package:bank_system_app/presentation/controller/bank_event.dart';
import 'package:bank_system_app/presentation/screens/component/compenent.dart';
import 'package:bank_system_app/presentation/screens/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/services/service_locator.dart';
import '../../core/utils/enum.dart';
import '../controller/bank_bloc.dart';
import '../controller/bank_state.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var amountController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankBloc, BankState>(
      builder: (context, state) {
        switch (state.usersDataState) {
          case RequestState.loading:
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            var users = state.usersData;
            return ScreenUtilInit(builder: (context, Widget? widget) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text("Bank Home Screen"),
                  actions: [
                   IconButton(onPressed: (){
                     navigateTo(context, const TransferScreen());

                   }, icon: Icon(Icons.no_transfer))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          buildUserItem(users[index], context),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 8,
                          ),
                      itemCount: users.length),
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

  Widget buildUserItem(BaseUserData data, context) => GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            barrierDismissible: false,
            // user must tap button!

            builder: (BuildContext context) {
              return BlocConsumer<BankBloc, BankState>(
                  builder: (context, state) => Form(
                      key: _formKey,
                      child: AlertDialog(
                        title: Text('Transfer Money from ${data.name}'),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              defaultFormField(
                                  controller: nameController,
                                  type: TextInputType.text,
                                  label: "Receiver Name",
                                  onsubmit: (value) {
                                    print(value);
                                    print("Users:${state.usersData}");
                                    for (int i = 0;
                                        i < state.usersData.length;
                                        i++) {
                                      print("item:$i");
                                      if (state.usersData[i].name == value) {
                                        print("item:$i");
                                        sl<BankBloc>().add(GetReceiverDataEvent(
                                            id: state.usersData[i].id));
                                      } else {
                                        print("No Found");
                                      }
                                    }
                                  },
                                  // onChange: (value){
                                  //   print(value);
                                  //   state.usersData.map((e) {
                                  //     print(e);
                                  //     if(e.name==value){
                                  //       print(e.name);
                                  //       sl<BankBloc>().add(GetReceiverDataEvent(id: e.id));
                                  //     }
                                  //   });
                                  // },
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Name must not be empty';
                                    }
                                    return null;
                                  }),
                              const SizedBox(
                                height: 15,
                              ),
                              defaultFormField(
                                  controller: amountController,
                                  type: TextInputType.number,
                                  label: "Amount",
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Amount must not be empty';
                                    } else if (double.parse(value) >
                                        data.balance) {
                                      return 'Your balance smaller than amount';
                                    }
                                    return null;
                                  }),
                            ],
                          ),
                        ),
                        actions: [
                          defaultButton(
                              function: () {
                                if (_formKey.currentState!.validate()) {
                                  print("receiverrrrrrrr: ${state.receiverData!.name}");
                                    sl<BankBloc>().add(TransferOperationEvent(
                                      senderId: data.id,
                                      senderBalance: data.balance,
                                      senderName: data.name,
                                      receiverBalance: state.receiverData!.balance,
                                      receiverName: state.receiverData!.name,
                                      receiverId: state.receiverData!.id,
                                      amount: double.parse(amountController.text),
                                    ));

                                }
                              },
                              text: "Submit"),

                        ],
                      )),
                  listener: (context, state) {});
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey.shade400, width: 2)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 20.sp),
                      ),
                      Text(
                        data.email,
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "\$${data.balance}",
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ),
      );
}
