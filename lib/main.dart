import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/screen/main_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title:"Food Delivery App", 
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ));
} 
  


// void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp();
//    runApp(new MaterialApp(
//      home: MyApp(),
//    ));
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("FETCH DEMO")),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("items").where('category',isEqualTo: "Curry").snapshots(),
//         builder: (context,snapshot){
//           if(snapshot.data == null) return CircularProgressIndicator();
//           return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context,index){
//               DocumentSnapshot items = snapshot.data.documents[index];
              
//               return ListTile(
//                 leading: Image.network(items['img']),
//                 title: Text(items['tag_name']),
//                 subtitle: Text(items['price'].toString()),);
//             },
//             );
//         },
//         )
//     );
//   }
// }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'src/app.dart';
// import 'package:firebase_core/firebase_core.dart';

// void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp();
//    runApp(new MaterialApp(
//      title:"Demo ",
//      home: LoginPage(),
//    ));
// }

// final FirebaseAuth mAuth = FirebaseAuth.instance;

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = new TextEditingController();
//   TextEditingController passwordController = new TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(title: Text("Demo"),),
//       body:Container(
//       child:Column(
//         children: [
//           TextField(
//             controller: emailController,
//           ),
//           TextField(
//             controller: passwordController,
//           ),
//           RaisedButton(
//             child:Text("SIGN IN"),
//             onPressed: (){
//               signUp();
//             },
//           ),
//         ],
//       ),
//     )
//     );
//   }
//   void signUp() async{
//   UserCredential user;
//   user = await mAuth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
// }
// }

