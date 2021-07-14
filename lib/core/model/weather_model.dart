// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

WeatherData welcomeFromJson(String str) => WeatherData.fromJson(json.decode(str));

String welcomeToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
    WeatherData({
        this.lat,
        this.lon,
        this.timezone,
        this.timezoneOffset,
        this.daily,
    });

    var lat;
    var lon;
    String timezone;
    int timezoneOffset;
    List<Daily> daily;

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        lat: json["lat"],
        lon: json["lon"],
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        daily: List<Daily>.from(json["daily"].map((x) => Daily.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "daily": List<dynamic>.from(daily.map((x) => x.toJson())),
    };
}

class Daily {
    Daily({
        this.dt,
        this.sunrise,
        this.sunset,
        this.moonrise,
        this.moonset,
        this.moonPhase,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.dewPoint,
        this.windSpeed,
        this.windDeg,
        this.windGust,
        this.weather,
        this.clouds,
        this.pop,
        this.rain,
        this.uvi,
    });

    int dt;
    int sunrise;
    int sunset;
    int moonrise;
    int moonset;
    var moonPhase;
    Temp temp;
    FeelsLike feelsLike;
    int pressure;
    int humidity;
    var dewPoint;
    var windSpeed;
    int windDeg;
    var windGust;
    List<Weather> weather;
    int clouds;
    var pop;
    var rain;
    var uvi;

    factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"],
        temp: Temp.fromJson(json["temp"]),
        feelsLike: FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"],
        windSpeed: json["wind_speed"],
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"],
        weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"],
        rain: json["rain"],
        uvi: json["uvi"],
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp.toJson(),
        "feels_like": feelsLike.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
        "uvi": uvi,
    };
}

class FeelsLike {
    FeelsLike({
        this.day,
        this.night,
        this.eve,
        this.morn,
    });

    var day;
    var night;
    var eve;
    var morn;

    factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"],
        night: json["night"],
        eve: json["eve"],
        morn: json["morn"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class Temp {
    Temp({
        this.day,
        this.min,
        this.max,
        this.night,
        this.eve,
        this.morn,
    });

     var day;
     var min;
     var max;
     var night;
     var eve;
     var morn;

    factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"],
        min: json["min"],
        max: json["max"],
        night: json["night"],
        eve: json["eve"],
        morn: json["morn"],
    );

    Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
    };
}

class Weather {
    Weather({
        this.id,
        this.main,
        this.description,
        this.icon,
    });

    int id;
    String main;
    String description;
    String icon;

    factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
    };
}
