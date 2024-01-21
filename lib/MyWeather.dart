import 'package:flutter/material.dart';
import 'package:fitness/weather.dart';
import 'package:intl/intl.dart';
import 'apiservice.dart';

class MyWeather extends StatefulWidget {
  const MyWeather({super.key});

  @override
  State<MyWeather> createState() => _MyWeatherState();
}

class _MyWeatherState extends State<MyWeather> {
  // Weather? _weather;

  ApiService _apiService = ApiService();


  String getCurrentDate(){

    DateTime now = DateTime.now();
    String formattedDateTime = DateFormat('MMM dd, yyyy - H:mm:ss a').format(now);
    return formattedDateTime;
  }


  String _formatTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedTime = '${dateTime.hour}:${dateTime.minute}';
    return formattedTime;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(getCurrentDate())),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.more_vert))],
      ),
      body: FutureBuilder<Welcome>(
        future: _apiService.getWeather(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else if  (snapshot.hasError){
            return Center(child: Text("No data found ${snapshot.error}"));
          } else {
            Welcome?  _weather = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(_weather?.name ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _weather?.weather?.first.description ?? "",
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0),
                  ),
                ),
                Icon(Icons.cloud_circle_sharp, size: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${_weather?.main?.temp ?? ""}°C",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text("Max"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${_weather?.main?.tempMax ?? ""}°C"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Min"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${_weather?.main?.tempMin ?? ""}°C"),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.blueGrey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text("Wind Speed"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${_weather?.wind?.speed ?? ""} m/s"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Sunrise"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${_formatTime(_weather?.sys?.sunrise ?? 0)}"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Sunset"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${_formatTime(_weather?.sys?.sunset ?? 0)}"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Column(
                      children: [
                        Text("Humidity"),
                        SizedBox(
                          height: 10,
                        ),
                        Text("${_weather?.main?.humidity ?? 0}%"),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
      },
      )
    );
  }
}
