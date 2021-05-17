import 'package:app_map/backend/user_data.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';


class ServiceProvider {

  List<dynamic> data = [];

  ServiceProvider() {
   // getData();
  }

  Future<List<dynamic>> getData() async {

    
    final vResponse = await rootBundle.loadString('data/services.json');
    Map dataMap = json.decode( vResponse );

    data = dataMap['services']; 

    return data;
  }

}
