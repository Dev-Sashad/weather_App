import 'package:flutter/material.dart';
import 'package:weather/ui/screens/homepage/homepage.dart';
import 'package:weather/ui/screens/sideNav/sideNav.dart';

class Home extends StatefulWidget {
@override
  HomePageState createState() => HomePageState();
} 

class HomePageState extends State<Home> with SingleTickerProviderStateMixin{
    
@override
Widget build(BuildContext context) {
return  Scaffold(
  backgroundColor: Colors.orange[400],
  body: Stack(
      children: <Widget>[
       SideNavpage(),
       Homepage(),
      
      ]
  
  ),
  );
}
}
