import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TabBarWidget extends StatelessWidget {
  TabBarWidget(isSelected, this.item);
  bool isSelected;
  NavigationItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: Icon(item.icon, size: 30,color: isSelected? Colors.blue: Colors.black,),
                           onPressed: (){}),
       
        Text(
          item.title,
          style: TextStyle(
              color: isSelected? Colors.blue: Colors.black,
              fontFamily: 'Caros',
              fontSize: 17.0,
              fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

    class NavigationItem {
      final IconData icon;
      final String title;

  NavigationItem(this.icon, this.title);

}

