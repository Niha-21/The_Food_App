import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget{

  final String imagePath;

  FoodCard({this.imagePath});

  @override
  Widget build(BuildContext context){
    return Container(
      margin:EdgeInsets.only(right:20.0),
      child: Card(
            child: Row(
              children: <Widget>[
                Image(
                  image: AssetImage(imagePath),
                  height: 202.0,
                  width: 334.0,
                ),
              ],
            ),
          ),
    );
  }
}