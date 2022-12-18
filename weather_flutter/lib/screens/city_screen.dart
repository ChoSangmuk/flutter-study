import 'package:flutter/material.dart';
import 'package:weather_flutter/utilities/constants.dart';
import 'package:weather_flutter/screens/location_screen.dart';
import 'package:weather_flutter/services/WeatherService.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var typedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    typedCity = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Please write the city name.',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("You entered $typedCity.")));
                  _getWeatherWithLocation();
                },
                child: Text('Get Weather', style: kButtonTextStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getWeatherWithLocation() async {
    dynamic resultJson = await WeatherService().getWeather(cityName: typedCity);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(weatherData: resultJson)),
      (route) => false,
    );
  }
}
