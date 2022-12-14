import 'package:bank_system_app/core/utils/enum.dart';
import 'package:bank_system_app/presentation/controller/bank_bloc.dart';
import 'package:bank_system_app/presentation/controller/bank_event.dart';
import 'package:bank_system_app/presentation/controller/bank_state.dart';
import 'package:bank_system_app/presentation/screens/component/compenent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/services/service_locator.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({Key? key}) : super(key: key);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var balanceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BankBloc, BankState>(
      builder: (context, state) {
        return ScreenUtilInit(
          builder: (context, Widget? widget) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Add User"),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    defaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Name must not be empty';
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h,),
                    defaultFormField(
                        controller: emailController,
                        type: TextInputType.text,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Email must not be empty';
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h,),
                    defaultFormField(
                        controller: balanceController,
                        type: TextInputType.number,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'balance must not be empty';
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h,),
                    defaultButton(function: () {
                      sl<BankBloc>().add(AddUserToDBEvent(
                          name: nameController.text,
                          email: emailController.text,
                          balance: double.parse(balanceController.text)));
                    }, text: "Add User")
                  ],
                ),
              ),
            );
          },
        );
      },
      listener: (context, state) {
        if(state.addUserState==RequestState.loaded){
          showToast(text: "Added Successfully", state: ToastStates.SUCCESS);
        }
      },
    );
  }
}
