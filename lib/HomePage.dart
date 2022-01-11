import 'package:flutter/material.dart';
import 'package:test_statemanagement/cubit/cubit/auth_cubit.dart';
import 'package:test_statemanagement/cubit/cubit/data_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<DataCubit>().getData();
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthSuccess) {
              return Text('${state.user.token}');
            } else {
              return SizedBox();
            }
          },
        ),
      ),
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(state.data[index].first_name,
                        style: TextStyle(fontSize: 30)),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
