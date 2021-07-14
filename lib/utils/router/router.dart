import 'package:flutter/material.dart';
import 'package:weather/ui/screens/homepage/homepage.dart';
import 'routeNames.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {  
    
   case HomepageViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Homepage(),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

// ignore: unused_element
PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
