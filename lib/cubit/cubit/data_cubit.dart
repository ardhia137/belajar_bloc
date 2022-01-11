import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_statemanagement/model/dataModel.dart';
import 'package:test_statemanagement/services/DataServices.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());
  void getData() async{
    try {
      List<DataModel> data = await DataServices().data();
      emit(DataSuccess(data));
    } catch (e) {
      print(e);
      emit(DataGagal(e.toString()));
    }
  }
}