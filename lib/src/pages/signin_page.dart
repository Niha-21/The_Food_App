import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget{
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>{

  bool _togglevisibility = true;

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email or username",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _togglevisibility = !_togglevisibility;
            });
          },
          icon: _togglevisibility
              ? Icon(Icons.visibility_off)
              : Icon(Icons.visibility),
        ),
      ),
      obscureText: _togglevisibility,
    );
  }

   @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(top:40.0, left:20.0, right:20.0),
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height:40.0,),
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Forgotten Password?",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                  height: 20.0,
                ),
                  ],
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _buildEmailTextField(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildPasswordTextField(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
              
              Container(
                height: 50.0,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Center(
                  child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold,
                   ),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),     
              Container(
                height: 50.0,
                width: 250,
                decoration: BoxDecoration(
                   color: Colors.orangeAccent,
                ),
                
                child: Center(
                  // GestureDetector(
                  //     onTap: () {
                  //       // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //       //     builder: (BuildContext context) => SignUpPage()));
                  //       Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SignUpPage()));
                  //     },
                  child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold,),),
                ),
              ),
            ],
          ),
        ),
    );
  }
}

