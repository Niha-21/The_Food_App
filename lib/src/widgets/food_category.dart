import 'package:flutter/material.dart';
import '../data/category_data.dart';
import '../models/category_model.dart';
import 'food_cart.dart';

class FoodCategory extends StatelessWidget{

  final List<Category> _categories = categories;

  @override
  Widget build(BuildContext context){
    return Container(
      height: 202.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (BuildContext context, int index){
            return FoodCard(
              imagePath: _categories[index].imagePath,
            );
          },
        ),
    );
  }
}
