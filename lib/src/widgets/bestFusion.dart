import 'package:flutter/material.dart';

class BestFusion extends StatelessWidget{

  @override
  Widget build(BuildContext context){
  return Container(
    padding:EdgeInsets.only(left: 10.0),
    width:340.0,
    height:78.0,
    color: Colors.orangeAccent,
    child: Row(
              // mainAxisAlignment: MainAxisAlignment.space,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                    Text("Best Fusions",style: TextStyle(fontSize: 25.0, fontStyle: FontStyle.italic,
                        color: Colors.white,
                        ),      
                    ),
              ],
            ),
  );
  }
}
