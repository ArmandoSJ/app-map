import 'package:flutter/material.dart';
import 'package:app_map/constants/constants.dart' as constants;
class MainViewActivity extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      resizeToAvoidBottomInset: false,
      body: MainBackGround(),
    );
  }
}

class MainBackGround extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
      return  Stack(
        children: <Widget>[
          Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.pink.shade50,
          ), 
          Container(
              padding: EdgeInsets.only(top:80.0),
              child: Column(
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/logo.png"),
                    height: 80.0,
                  ),
                  SizedBox(height: 10.0, width: double.infinity)
                ],
              ),
          ),
          MainContainer(),
        ],
      );
      
  }
}


class MainContainer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 20.0, color: Colors.black);
        return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Column(
                  children: <Widget>[
                     SafeArea(
                      child: Container(
                          height: 140.0
                      ),
                    ),
                    Text(constants.PRESENTATION_TITLE, style: textStyle ),
                SizedBox(height: 10.0),
                FooterUI()
              ],
            ),
          ),
        );
  }
}

class FooterUI extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 20.0, color: Colors.black);
    return Column( 
      mainAxisAlignment: MainAxisAlignment.center ,//Center Column contents vertically,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(constants.SUB_TITLE , style: textStyle),
        SizedBox(height: 10.0),
        Text(constants.USER, style: textStyle),
        SizedBox(height: 10.0),
        TextButton(  
            child: Text('Ingresar'),
            style: TextButton.styleFrom(
                   primary: Colors.black,
                   backgroundColor: Colors.blue.shade200,
                   textStyle: TextStyle(fontSize: 20),
                   shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                  ),
            ),
            onPressed: () { Navigator.pushReplacementNamed(context, 'services'); },
        ),
      ]                      
    );
    
  }
}