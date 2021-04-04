import 'package:flutter/material.dart';

class HomeTopInfo extends StatelessWidget{

  @override
  Widget build(BuildContext context){
  return Container(
    margin:EdgeInsets.only(bottom: 20.0),
    child: Row(
              // mainAxisAlignment: MainAxisAlignment.space
              // crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("FooD",style: TextStyle(fontSize: 40.0, fontStyle: FontStyle.italic,
                        color: Colors.orange,
                        ),      
                    ),
                    Text("Zone",style: TextStyle(fontSize: 40.0, fontStyle: FontStyle.italic,
                        color: Colors.white,
                        ),
                    ),
                  ],
                ),
                Icon(Icons.fastfood, size: 50.0,color: Colors.orange,),               
              ],
            ),
  );
  }
}
