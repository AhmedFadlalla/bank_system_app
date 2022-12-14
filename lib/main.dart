import 'package:bank_system_app/presentation/controller/bank_bloc.dart';
import 'package:bank_system_app/presentation/controller/bank_event.dart';
import 'package:bank_system_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/services/db_helper.dart';
import 'core/services/service_locator.dart';
import 'core/utils/app_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>sl<BankBloc>()..add(GetUsersDataEvent())..add(GetTransfersDataEvent()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.poppins(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ).fontFamily,
          textTheme:  TextTheme(
              headline1: const TextStyle(
                  color: Colors.black,
                  fontSize: 45
              ),
              caption: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400

              ),
              bodyText1: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  height: 25
              )
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}


