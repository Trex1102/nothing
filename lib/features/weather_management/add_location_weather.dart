import 'location.dart';
import 'get_api_data.dart';
import '../../core/constants.dart';

const weatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    /// await for methods that return future
    Location location = Location();
    await location.getCurrentLocation();

    /// Get location data
    ///&units=metric change the temperature metric
    NetworkData networkHelper = NetworkData(
        '$weatherApiUrl?lat=${location.latitude}&lon=${location.longitide}&appid=$Constants.openWeatherMapApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

}