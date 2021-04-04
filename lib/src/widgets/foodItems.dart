import 'package:flutter/material.dart';

class BoughtFood extends StatefulWidget {

  final String name;
  final String imagePath;
  final double price;
  final double ratings;

BoughtFood({ this.name, this.imagePath, this.price, this.ratings});
  @override
  _BoughtFoodState createState() => _BoughtFoodState();
}

class _BoughtFoodState extends State<BoughtFood> {
  @override
  Widget build(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(0.5),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            height: 200.0,
            width: 370.0,
            child: Image.asset(widget.imagePath, fit: BoxFit.cover,),
            ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Container(
            width: 370.0,
            height: 60.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.white12])),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        Icon(Icons.star,color: Theme.of(context).primaryColor,size: 16.0,),
                        SizedBox(width:20.0),
                        Text(
                          widget.ratings.toString(),
                          style:TextStyle(
                          color:Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      widget.price.toString(),
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'Price',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
    )
  );
  }
}