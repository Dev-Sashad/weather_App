import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:weather/core/model/current_weather.dart';
import 'package:weather/ui/widget/WeatherWidgets/today_weather.dart';
import 'package:weather/utils/constants/screensizer.dart';
import 'today_view_model.dart';

class Today extends StatelessWidget {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TodayViewModel>.withConsumer(
        viewModelBuilder: () => TodayViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Container(
              height: height(1, context),
              width: width(1, context),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              )),
              child: FutureBuilder<CurrentWeather>(
                  future: model.fetchCurrent(),
                  builder: (context, snapshot) {
                     print('data is processed');
                    if (snapshot.hasData) {
                      print('data is true');
                            return TodayWeather(
                              todayModel: snapshot.data,);
                         
                     } 
                    else if (snapshot.hasError) {
                      return Center( 
                          child: Text(
                        "An Error Occured",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ));
                    }

                    return Center(
                        child: Container(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator()));
                  }),
            ),
          );
        });
  }
}
