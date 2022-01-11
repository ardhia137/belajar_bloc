import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.token);
  final String token;

  @override
  List<Object> get props => [token];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['token']);
  }
}