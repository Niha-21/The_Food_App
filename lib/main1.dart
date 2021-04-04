// //my initial custom appbar (not required now)
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         brightness: Brightness.dark,
//         primaryColor: Colors.orangeAccent.shade200,
//       ),
//       home:Scaffold(
//       // body: CustomAppBar(),
//       body: SafeArea(
//       child:CartPage(),
//       ), 
//     ),
//     );
//   }
// }

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       // crossAxisAlignment: CrossAxisAlignment.center,
//       children:[
//         CustomAppBar(),
//         Container(
//           height: 200.0,
//           width: 250.0,
//           margin: EdgeInsets.all(30.0),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//             image: AssetImage('assets/images/biryani.jpg'),
//             fit: BoxFit.fill,), 
//             borderRadius:BorderRadius.circular(7.0), color: Colors.white,
//             border: Border.all(color: Colors.grey,
//             width:5.0)),
//         ),

//         Container( 
//           // margin: EdgeInsets.all(20.0),
//           child:Container(
//             child:Row(
//             children: [
//               Container(
//                 margin: EdgeInsets.all(20.0),
//                 child:Text("Biryani",style: TextStyle(color: Colors.orangeAccent,fontSize: 20.0)),
//                 decoration: BoxDecoration(
//                   borderRadius:BorderRadius.circular(7.0), color: Colors.blueGrey,
//                 ),
//                 height: 30,
//                 width:200.0,
//                 // color: Colors.teal,
//               ),
//               Container(
//                 margin: EdgeInsets.all(10.0),
//                 child:Text("400",style: TextStyle(color: Colors.orangeAccent,fontSize: 20.0)),
//                 decoration: BoxDecoration(
//                   borderRadius:BorderRadius.circular(7.0), color: Colors.blueGrey,
//                 ),
//                 height: 30,
//                 width:50.0,
//                 // color: Colors.teal,
//               ),
//             ],
//           ),
//         ),),
//       ],
      
      
//     );
//   }
// }

      
  
        
      
    
  


// class CustomAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children:[
//         SizedBox(
//           child:Container(
//           padding: EdgeInsets.only(top:30.0),
//           child:Text("FOOD ZONE",
//           style: TextStyle(color: Colors.white,fontSize: 30.0)),
//           color: Colors.blueGrey,
          
//         ),
//         height:70.0,
//         width:double.maxFinite),
//         SizedBox(
//           child:Container(
//           color: Colors.orangeAccent,
//         ),
//         height:5.0,
//         width:double.maxFinite
//         ),],);
//   }
// }