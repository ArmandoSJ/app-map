import 'package:app_map/activities/list_activity.dart';
import 'package:app_map/activities/main_activity.dart';
import 'package:app_map/activities/scroll_activity.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {

  return <String, WidgetBuilder> {

      'main'           : ( BuildContext context ) => MainViewActivity(),
      'scroll'         : ( _ ) => DisplayActivity(),  
      'services'          : ( BuildContext context ) => ListActivity(),
      
  };

}