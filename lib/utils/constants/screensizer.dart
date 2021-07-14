import 'package:flutter/material.dart';
//Helps to scale size on different device and maintain UI looks

 width(value, BuildContext context)
  {
    return MediaQuery.of(context).size.width * value;
  }

 height(value, BuildContext context)
  {
    return MediaQuery.of(context).size.height * value;
  }


sizeBoxValue(BuildContext context){
  return height(0.02,context);
}


