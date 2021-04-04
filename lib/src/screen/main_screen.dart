import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/explore_page.dart';
import '../pages/cart_page.dart';
import '../pages/signin_page.dart';
import '../pages/signup_page.dart';
import '../widgets/home_top_info.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;

  List<Widget> pages;
  Widget currentPage;

 
  HomePage homePage;
  ExplorePage explorePage;
  CartPage cartPage;
  SignInPage signInPage;
  SignUpPage signUpPage;

  @override
  void initState(){
    super.initState();
    homePage = HomePage();
    explorePage = ExplorePage();
    cartPage = CartPage();
    signInPage = SignInPage();
    signUpPage = SignUpPage();
    pages = [homePage, explorePage, cartPage, signInPage, signUpPage];
    currentPage=homePage;
  }

  

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff181B47),
      appBar: AppBar(        
        backgroundColor: Color(0xff181B47),
        title:HomeTopInfo(),),
      bottomNavigationBar: BottomNavigationBar(
        onTap:(int index){
          setState((){
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fastfood,
              ),
              title: Text("Explore"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              title: Text("Cart"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text("Profile"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text("Register"),
            ),
        ],
      ),

      body:Column(children: [
              Container(color:Colors.orangeAccent.shade400,
                  height:5.0,),
              Expanded(child:currentPage),
      ]),
    );
  }
  void setMainState(int x){
    currentTabIndex = x;
  }
}