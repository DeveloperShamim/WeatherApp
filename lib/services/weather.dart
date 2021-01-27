class WeatherModel {
  String getWeatherIcon(int condition) {
    if (condition < 232) {
      return 'thunderstorm.png';
    }else if (condition < 321) {
      return 'drizzle.png';
    } else if (condition < 531) {
      return 'rain.png';
    } else if (condition < 622) {
      return 'snow.png';
    } else if (condition < 781) {
      return 'mist.png';
    } else if (condition == 800) {
      return 'clearsky.png';
    } else if (condition <= 804) {
      return 'fewclouds.png';
    } else {
      return 'clearsky.png';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp >= 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
