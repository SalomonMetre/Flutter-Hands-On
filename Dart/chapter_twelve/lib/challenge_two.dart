import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

mixin UriParser{
  Uri parseUrl(String url) => Uri.parse(url);
}

abstract class DataRepository {
  Future<double> fetchTemperature (double latitude, double longitude);
}

class Temperature{
  final double temperature;
  final double temperatureFeelsLike;
  final int humidity;

  Temperature({required this.temperature, required this.temperatureFeelsLike, required this.humidity});

  factory Temperature.fromJson(Map<String, dynamic> json) => Temperature(
    temperature: json["temp"] as double, 
    temperatureFeelsLike: json["feels_like"] as double, 
    humidity: json["humidity"] as int,
  );
}

class FakeWebServer with UriParser implements DataRepository{ 
  @override
  Future<double> fetchTemperature(double latitude, double longitude) async {
    try{
      final url = "https://fcc-weather-api.glitch.me/api/current?lat=$latitude&lon=$longitude";
      final httpResponse = await http.get(parseUrl(url));
      final jsonString = httpResponse.body;
      final jsonMap = json.decode(jsonString);
      final temperatureObj = Temperature.fromJson(jsonMap["main"]);
      return temperatureObj.temperature;
    } on SocketException catch (e){
      print("Socker error : ${e.message}");
    } on HttpException catch(e){
      print("Http error : ${e.message}");
    }
    throw ArgumentError("Error occurred during parsing");
  }
}

void main(List<String> args) async {
  final tempServer = FakeWebServer();
  print("Temperature is : ${await tempServer.fetchTemperature(45.5, -122.7)}");
}