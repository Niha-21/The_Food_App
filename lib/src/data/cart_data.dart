import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_utube/src/models/cart_model.dart';

class CartData{
  
  List<CartModel> news = [];

  Future<void> getNews() async{
    final fb = FirebaseFirestore.instance;
    fb.collection("Cart").get().then((QuerySnapshot querySnapshot){
      querySnapshot.docs.forEach((result) {
        CartModel cartmodel = CartModel(
          name:result.data()["name"],
          description: result.data()["description"],
        
      );
      news.add(cartmodel);
      });
    });

  
}
}