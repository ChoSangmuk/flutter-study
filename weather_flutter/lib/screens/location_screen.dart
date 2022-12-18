import 'package:flutter/material.dart';
import 'package:weather_flutter/screens/city_screen.dart';
import 'package:weather_flutter/screens/loading_screen.dart';
import 'package:weather_flutter/services/WeatherService.dart';
import 'package:weather_flutter/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen({this.weatherData});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  int weatherId;
  String imageResource;
  String weatherIcon;
  String message;
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageResource),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _NearMeIconButton(context),
                  Text(
                    'How are you today?',
                    style: kButtonTextStyle,
                  ),
                  _CityIconButton(context),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  message,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _updateUI(widget.weatherData);
  }

  void _updateUI(dynamic weatherData) {
    WeatherService weatherService = WeatherService();
    temperature = weatherData['main']['temp'].round();
    weatherIcon =
        weatherService.getWeatherIcon(weatherData['weather'][0]['id']);
    imageResource =
        weatherService.getImageResource(weatherData['weather'][0]['id']);
    message =
        '${weatherService.getMessage(temperature)} in ${weatherData['name']}';
  }

  TextButton _NearMeIconButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text("You clicked reload")));

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoadingScreen()),
          (route) => false,
        );
      },
      child: Icon(
        Icons.near_me,
        color: Colors.white,
        size: 50.0,
      ),
    );
  }

  TextButton _CityIconButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CityScreen()),
          (route) => false,
        );
      },
      child: Icon(
        Icons.location_city,
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
