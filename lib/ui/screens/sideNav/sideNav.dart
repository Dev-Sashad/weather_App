import 'package:flutter/material.dart';
import 'package:weather/utils/constants/colors.dart';
class SideNavpage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
 
          return  Drawer(
              elevation: 8.0,
              child: SafeArea(
                child: Container(
                    padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
                    color: AppColors.blackShade1,
                             
                    ),
              ),
          );
  }
}
