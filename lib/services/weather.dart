import '../services/location.dart';
import 'package:clima/services/networking.dart';

var appID = "Use your own AppId";//Use your own AppId

class WeatherModel {
  getCityWeather(cityName) async {
    NetworkingData networkingData = NetworkingData(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$appID&units=metric');
    var weatherData = await networkingData.getData();
    return (weatherData);
  }

  getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkingData networkingData = NetworkingData(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$appID&units=metric');
    var weatherData = await networkingData.getData();
    return (weatherData);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
