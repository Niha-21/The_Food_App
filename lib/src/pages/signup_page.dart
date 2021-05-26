import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget{
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

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

  Widget _buildAddressTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your Address",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }


  Widget _buildPhoneTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Phone Number",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }


  Widget _buildReEnterTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Re-enter Password",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
    );
  }


   @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.only(top:40.0, left:20.0, right:20.0),
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // HomeTopInfo(),
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
               SizedBox(
                  height: 20.0,
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
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildAddressTextField(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildPhoneTextField(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _buildReEnterTextField(),
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
                  child: FlatButton(child: Text("Register") ,
                  onPressed: (){
                    print("Registered User");
                  },)
                  
                
                ),
              ),
            ],
          ),
        ),
    );
  }
}

