import 'package:flutter/material.dart';
import 'ui/screens/splashscreens/splashscreen_view.dart';
import 'utils/constants/colors.dart';
import 'utils/locator.dart';
import 'utils/progressBarManager/dialogManager.dart';
import 'utils/progressBarManager/dialogService.dart';
import 'utils/router/navigation_service.dart';
import 'utils/router/router.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      builder: (context, child) =>  Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(builder: (context) {
          return ProgressManager(child: child);
          //DialogManager(child: child);
        }),
      ),
      
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.primaryColor
      ),
      home: SplashscreenView(),
      onGenerateRoute: generateRoute,
    );
  }
}
