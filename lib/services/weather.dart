import 'package:weather_app/screens/loading_screen.dart';
import 'package:weather_app/services/location.dart';

class WeatherModel {
  Location location = Location();
  AllGets getdata = AllGets();

  getCityWeather(String cityname) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric";

    var weatherData = await getdata.getURl(url);
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    await location.getCurrentLocation();

    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric";

    var weatherData = await getdata.getURl(url);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
