import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  final String cityName;
  final double temperature;
  final String description;

  WeatherData({
    required this.cityName,
    required this.temperature,
    required this.description,
  });
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherData? _weatherData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getCurrentLocationWeather();
  }

  Future<void> getCurrentLocationWeather() async {
    // Replace 'YOUR_API_KEY' with your actual OpenWeatherMap API key
    const apiKey = 'b4ac9b968d5120f7808a91f10ca3b243';
    const url =
        'https://api.openweathermap.org/data/2.5/weather?appid=$apiKey&units=metric';

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final cityName = data['name'];
        final temperature = data['main']['temp'];
        final description = data['weather'][0]['description'];

        final weatherData = WeatherData(
          cityName: cityName,
          temperature: temperature,
          description: description,
        );

        setState(() {
          _weatherData = weatherData;
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the weather API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _weatherData != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _weatherData!.cityName,
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${_weatherData!.temperature}°C',
                      style: const TextStyle(fontSize: 48),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _weatherData!.description,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              : const Center(
                  child: Text(
                    'Failed to load weather data.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WeatherScreen(),
  ));
}
