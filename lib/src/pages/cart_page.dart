import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference cr = FirebaseFirestore.instance.collection("Cart");
var total=0;

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  @override
  void initState()
  {
    super.initState();
      total=0;
      cr
      .get()
      .then((QuerySnapshot snapshot) {
    snapshot.docs.forEach((f) => total=total+f.get("price"));
    // print(total);
  });

  }
  Widget build(BuildContext context) {
    return Column(
        children:[
                Text("My Cart"),

                Expanded(
                  child: StreamBuilder(
                  stream: cr.snapshots(),
                  builder: (context,snapshot){
                    if(snapshot.data == null) return CircularProgressIndicator();
                    return ListView.builder(
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context,index){
                        DocumentSnapshot cartItem = snapshot.data.documents[index];
                          return 
                            CartItemBox(cartItem["name"],cartItem["img"],cartItem["price"],cartItem["quantity"],cartItem.id);
                      },
                    );
                  }),
                ),
                Row(children: [
                  Container(
                  width: 280.0,
                  height: 50.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(15.0),
                  color: Colors.orangeAccent.shade200,
                  child: Text("TOTAL:$total"),
                  ),
                  Container(
                  width: 70.0,
                  height: 50.0,
                  margin: EdgeInsets.all(10.0),
                  child: 
                  FlatButton(
                    color: Colors.orangeAccent.shade200,
                    // padding: EdgeInsets.all(1.0),
                    child: Icon(Icons.arrow_forward),
                    onPressed: (){
                      print("Order Placed !");
                    },
                  ),
                ),
                
                ],)
                
        ]);
        
  }
}


class CartItemBox extends StatelessWidget {
  final String name,img;
  final price,q;
  String id;
  CartItemBox(this.name,this.img,this.price,this.q,this.id);
  @override
  Widget build(BuildContext context) {
    return Container(
    child:Row(
      children: [
        Container(
          height: 80.0,
          width: 80.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
          image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.fill,
          ), borderRadius:BorderRadius.circular(10.0),),

          
          child:Container( 
            // margin: EdgeInsets.all(5.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child:CircleAvatar(
              backgroundColor: Colors.blueGrey, 
              radius: 11.0,
              child: CircleAvatar(
                backgroundColor: Colors.white, 
                radius: 9.0,
              
                child: Text(q.toString()),
            )))),
        ),
        
          
           Container(
            height: 80.0,
            width: 200.0,
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child:Text(name,style: TextStyle(color: Colors.orange,fontSize: 20.0))),

            Column(
              children:[
                Container(
                  margin: EdgeInsets.only(left:20.0,bottom: 25.0),
                child:Text(price.toString(),style: TextStyle(color: Colors.white,fontSize: 20.0))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0,),
                Container(
                  width: 30.0,
                  height: 30.0,
                  child: 
                  FlatButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.add),
                    onPressed: (){
                      FirebaseFirestore.instance.collection("Cart").doc("6cUKZyFgIaZonrLMjHQP").update({"quantity":2});
                    },
                  ),
                ),
                SizedBox(width: 10.0,),
                Container(
                  width: 30.0,
                  height: 30.0,
                  child: 
                  FlatButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(2.0),
                    child: Icon(Icons.remove),
                    onPressed: (){
                      FirebaseFirestore.instance.collection("Cart").doc("6cUKZyFgIaZonrLMjHQP").update({"quantity":2});
                    },
                  ),
                ),
                ],
                ),
              ])
           
      ],
      
    ));
  }
}
