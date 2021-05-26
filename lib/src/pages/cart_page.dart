import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference cr = FirebaseFirestore.instance.collection("Cart");


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}
class _CartPageState extends State<CartPage> {
  int total=0;
  int finaltotal;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.black,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.all(2.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.orangeAccent.shade200,
    );

  @override
  void initState()
  {
    super.initState();
    setState(() {
      getTotal();
    });
  }

    Future<void>getTotal() async {
      // print("Called in getTotal");
    FirebaseFirestore def = FirebaseFirestore.instance;
    await def.collection("Cart").get().then((QuerySnapshot snapshot){
      
    snapshot.docs.forEach((f){ 
      total= total+f.get("price");
      print(total);
    });
    });
    setState(() {
      finaltotal=total;
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
                            CartItemBox(name:cartItem["name"],img:cartItem["img"],price:cartItem["price"],q:cartItem["quantity"],id:cartItem.id);
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
                  child: Text("$finaltotal"),
                  ),
                  Container(
                  width: 70.0,
                  height: 50.0,
                  margin: EdgeInsets.all(10.0),
                  child: 
                  TextButton(
                    // padding: EdgeInsets.all(1.0),
                    style: flatButtonStyle,
                    child: Icon(Icons.arrow_forward),
                    onPressed:(){
                      print("Order placed");
                    }
                  ),
                ),
                
                ],)
                
        ]);
        
  }
}

class CartItemBox extends StatefulWidget {
  final String name,img;
  int price,q;
  String id;
  CartItemBox({this.name,this.img,this.price,this.q,this.id});
  @override
  _CartItemBoxState createState() => _CartItemBoxState();
}

class _CartItemBoxState extends State<CartItemBox> {
  String name,img;
  int price,q;
  String id;
  int temp;

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.blue,
      minimumSize: Size(88, 44),
      padding: EdgeInsets.all(2.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      backgroundColor: Colors.white,
    );

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
          image: NetworkImage(widget.img),
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
              
                child: Text(widget.q.toString()),
            )))),
        ),
        
          
           Container(
            height: 80.0,
            width: 200.0,
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child:Text(widget.name,style: TextStyle(color: Colors.orange,fontSize: 20.0))),

            Column(
              children:[
                Container(
                  margin: EdgeInsets.only(left:20.0,bottom: 25.0),
                child:Text(widget.price.toString(),style: TextStyle(color: Colors.white,fontSize: 20.0))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 10.0,),
                Container(
                  width: 30.0,
                  height: 30.0,
                  child: 
                  TextButton(
                    // color: Colors.white,
                    // padding: EdgeInsets.all(2.0),
                    style:flatButtonStyle,
                    child: Icon(Icons.add),
                    onPressed: (){
                      setState(() {
                        price = widget.price;
                        q=widget.q;
                        if(q<5){
                          q=q+1;
                          print(q);
                          print(price);
                          temp=q*price;
                          print(temp);
                          FirebaseFirestore.instance.collection("Cart").doc(widget.id.toString()).update({"quantity":q,"price":temp});
                          temp=0;
                        }
                        
                      });
                      
                    },
                  ),
                ),
                SizedBox(width: 10.0,),
                Container(
                  width: 30.0,
                  height: 30.0,
                  child: 
                  TextButton(
                    style: flatButtonStyle,
                    child: Icon(Icons.remove),
                    onPressed: (){
                      setState(() {
                        q=widget.q;
                        if(q>=1){
                          q=q-1;
                          print(q);
                          FirebaseFirestore.instance.collection("Cart").doc(widget.id.toString()).update({"quantity":q});
                        }
                        if(q==0){
                          FirebaseFirestore.instance.collection("Cart").doc(widget.id.toString()).delete();
                        }
                        
                      });
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



