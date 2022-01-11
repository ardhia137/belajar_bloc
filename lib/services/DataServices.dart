import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_statemanagement/model/dataModel.dart';
import 'package:test_statemanagement/model/user.dart';

class DataServices{
  String baseUrl = 'https://reqres.in/api';
  Future<List<DataModel>>data() async {
    var url = '$baseUrl/users';
    var headers = {'Content-Type': 'application/json; charset=utf-8'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print(url);
    print(response.statusCode);
    // List dataa = jsonDecode(response.body)['data'];
    // print();
    if (response.statusCode == 200) {
      List dataa = jsonDecode(response.body)['data'];
      List<DataModel> datamodel = [];
      // DataModel dataModel = DataModel.fromJson(datamodel);
      for(var item in dataa){
        datamodel.add(DataModel.fromJson(item));
      }
      // print(dataa);
      return datamodel;
    } else {
      throw Exception('Gagal Login');
    }
  }
}