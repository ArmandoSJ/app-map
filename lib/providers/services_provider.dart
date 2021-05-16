import 'package:app_map/backend/user_data.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';


class ServiceProvider {

  List<UserData> data = [];

  ServiceProvider() {
   // getData();
  }

  Future<List<UserData>> getData() async {

    /* 
    
    Map dataMap = json.decode( vResponse );

    data = dataMap['services']; */
    final vResponse = await rootBundle.loadString('data/services.json');
     Map dataMap = json.decode(vResponse);
    final List values = dataMap["services"];
    
    if ( dataMap == null ) return [];

    if(dataMap != null){
        values.forEach((element) {
        final usuTemp = UserData.fromJson(element);
            data.add( usuTemp );
        });
        
    }


    return data;
  }

}
