

import 'package:app_map/activities/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:app_map/constants/constants.dart' as constants;

class DisplayActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      body: PageView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          MainActivity(),
          MainViewActivity(),
        ],
      ),
    );
  }
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        Content(),
      ],
    );
  }
}

class Content extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(constants.SCROLL_TITLE, style: textStyle),
          Expanded(child: Container( )),
          Icon(Icons.keyboard_arrow_down, size: 100, color: Colors.white)
        ],
      ),
    );
  }
}

class BackGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink.shade50,
      height: double.infinity,
      alignment: Alignment.topCenter,
      child:Image( 
        height: 800,
        image: AssetImage('assets/sakura.jpg')
      ),
    ); 
  }
}