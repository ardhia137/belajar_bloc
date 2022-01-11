import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_statemanagement/HomePage.dart';
import 'package:test_statemanagement/LoginPage.dart';
import 'package:test_statemanagement/cubit/cubit/auth_cubit.dart';
import 'package:test_statemanagement/cubit/cubit/data_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
          
        ),
        BlocProvider(
          create: (context) => DataCubit(),
          
        ),
      ],
      child:  MaterialApp(
        routes: {
            '/': (context) => LoginPage(),
            "/home":(context)=>HomePage(),
      },
      ),
    );
  }
}

