part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  final User user;
  const AuthSuccess(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}
class AuthGagal extends AuthState{
  final String error;
  const AuthGagal(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
