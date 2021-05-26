import 'package:flutter/material.dart';
import 'package:food_utube/src/widgets/bestFusion.dart';
import '../widgets/food_category.dart';
import '../widgets/bestFusion.dart';
import '../widgets/foodItems.dart';
import '../data/food_data.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   
  List<Food> _foods = foods;

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.only(top:50.0, left:20.0, right:20.0),
        children: <Widget>[
          
          FoodCategory(),
          SizedBox(height:15.0,),
          BestFusion(),
          SizedBox(height:20.0,),
          Column(
           children: _foods.map(_buildFoodItems).toList(),
          ),
        ],
      
    );
  }
  Widget _buildFoodItems(Food food){
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: BoughtFood(
      name:food.name,
      imagePath:food.imagePath,
      price: food.price,
      ratings: food.ratings,
    ),

  );
}
}