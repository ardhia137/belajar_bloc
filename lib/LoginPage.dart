import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_statemanagement/cubit/cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: "Your Full Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: "Your Full Name",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: 150,
                color: Colors.red,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if(state is AuthSuccess){
                      Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                    }
                    else if(state is AuthGagal){
                      print(state.error);
                    }
                  },
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().signIn(email: emailController.text, password: passwordController.text);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
