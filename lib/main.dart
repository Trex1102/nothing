import 'package:flutter/material.dart';
import 'features/weather_management/add_location_weather.dart';
import 'features/weather_management/get_api_data.dart';
import 'features/weather_management/location.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  dynamic weatherData;

  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  Future<void> getLocationWeather() async {
    WeatherModel weatherModel = WeatherModel();
    weatherData = await weatherModel.getLocationWeather();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: weatherData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    weatherData['name'],
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${weatherData['main']['temp']}°C',
                    style: TextStyle(fontSize: 48),
                  ),
                  SizedBox(height: 16),
                  Text(
                    weatherData['weather'][0]['description'],
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
