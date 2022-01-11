part of 'data_cubit.dart';

abstract class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataSuccess extends DataState{
  final List <DataModel> data;
  const DataSuccess(this.data);
  @override
  // TODO: implement props
  List<Object> get props => [data];
}
class DataGagal extends DataState{
  final String error;
  const DataGagal(this.error);
  // print(error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}