import 'package:flutter/material.dart';
import 'package:weather/utils/constants/colors.dart';
class SideNavpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
 
          return  Drawer(
              elevation: 8.0,
              child: SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(15, 40, 15, 0),
                    color: AppColors.blackShade1,
                    alignment: Alignment.topLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/weather.png'),
                              fit: BoxFit.fill
                              )
                          ), ),
                        Text('Weather App', style: TextStyle(fontSize: 30, color: Colors.white),)
                      ],
                    ),
                             
                    ),
              ),
          );
  }
}
