import 'package:flutter/material.dart';
import '../looks.dart';
import '../data/explorepage_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  
String img;
var price;
String tag_name,description;
var quantity = 1;
Map data;
CollectionReference cart = FirebaseFirestore.instance.collection("Cart");

class ExplorePage extends StatefulWidget{
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>{

   @override
   Widget build(BuildContext context){
     return ListView.builder(
        itemCount: tags.length,
        itemBuilder: (BuildContext context,int x){
          return Container(
            color:Colors.orangeAccent,
            margin: EdgeInsets.only(top:20.0, left:10.0, right:10.0) ,
            child:ExpansionTile(
            backgroundColor: Colors.orangeAccent.shade200,
            title:CustomText(x:tags[x].name),
            children: [
            Container(
              height:100.0,
              child:StreamBuilder(
                stream: FirebaseFirestore.instance.collection("items").where("category",isEqualTo: tags[x].name).snapshots(),
                builder: (context,snapshot){
                  if(snapshot.data == null) return CircularProgressIndicator();
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context,index){
                      DocumentSnapshot items = snapshot.data.documents[index];
                        return Container(
                          // width:120.0,
                          // height: 100.0,
                          // margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(5.0),
                          child:GestureDetector(
                            child:Image.network(items['img'],width: 120.0,height:100.0,fit: BoxFit.cover,),
                            onTap: (){
                                  img=items['img'];
                                  tag_name=items['tag_name'];
                                  price=items['price'];
                                  description=items['description'];
                                  itemPopUp(context);
                            },
                          ));
                    },
                  );
                })
              )],
          ));
        }       
  );
   }

   void itemPopUp(context){
     showModalBottomSheet(context: context, builder: (BuildContext bc){
       return Container(color: Colors.blueGrey, height:500.0,child: Items(),);
     });
   }
}


class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          children: <Widget>[
          
              Container(
                height: 170.0,
                width: 200.0,
                margin: EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.fill,
                ), borderRadius:BorderRadius.circular(10.0),)),
            
            Row(children: [
              Expanded(
                child: 
              ListTile(
                title: Text(tag_name),
                subtitle: Text(description),
              )),
              
              FlatButton(
                color: Colors.orangeAccent.shade200,
                child: Text("Add"),
                onPressed: (){
                  
                  Map<String,dynamic> demodata = {
                    "name":tag_name,
                    "img":img,
                    "price":price,
                    "quantity":quantity
                  };

                  // dynamic snapshot = cart.where("name",isEqualTo: tag_name).get();
                  // if(!snapshot.exists)
                  // {
                    cart.add(demodata);
                  // }
                },
                ),
              
            ],),
            
            Container(
              margin: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child:Text("Price: "+price.toString())
              ),
            ),
          ]),
    );
  }
}

