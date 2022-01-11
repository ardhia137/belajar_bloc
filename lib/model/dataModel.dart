import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  const DataModel(this.id,this.email,this.avatar,this.first_name,this.last_name);
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  @override
  List<Object> get props => [id,email,first_name,last_name,avatar];

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(json['id'],json['email'],json['first_name'],json['last_name'],json['avatar']);
  }
}