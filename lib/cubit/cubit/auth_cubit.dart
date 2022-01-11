import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_statemanagement/model/user.dart';
import 'package:test_statemanagement/services/AuthServices.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void signIn({required String email,required String password})async{
    try {
      emit(AuthLoading());
      User user = await AuthServices().login(email: email,password: password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthGagal(e.toString()));
    }
  }
}
