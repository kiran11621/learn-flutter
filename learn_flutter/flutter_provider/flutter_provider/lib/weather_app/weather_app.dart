import 'package:flutter/material.dart';
import 'package:flutter_provider/weather_app/weather_provider.dart';
import 'package:provider/provider.dart';

class WeatherAppScreen extends StatefulWidget {
  const WeatherAppScreen({super.key});

  @override
  State<WeatherAppScreen> createState() => _WeatherAppScreenState();
}

class _WeatherAppScreenState extends State<WeatherAppScreen> {
  late WeatherProvider _weatherProvider;

  TextEditingController _cityNameController = TextEditingController();

  // @override
  // Future<void> initState() async {
  //   isloading
  //   await _weatherProvider.fetchWeather('');
  //   isloading
  // }

  @override
  Widget build(BuildContext context) {
    _weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Weather!"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            8,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _cityNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your City Name",
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              if (_weatherProvider.isLoading) ...[
                const SizedBox(
                  height: 10,
                  width: 10,
                  child: CircularProgressIndicator(),
                ),
              ] else ...[
                OutlinedButton(
                  onPressed: () async {
                    await _weatherProvider
                        .fetchWeather(_cityNameController.text);
                  },
                  child: const Text(
                    'Search',
                  ),
                ),
              ],
              const SizedBox(
                height: 16,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 400,
                    width: 300,
                    child: Column(
                      children: [
                        Divider(),
                        Text(
                          'Location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        Text(
                          'City: ${_weatherProvider.todaysWeather?.location?.name}',
                        ),
                        Text(
                          'State: ${_weatherProvider.todaysWeather?.location?.region}',
                        ),
                        Text(
                          'Country: ${_weatherProvider.todaysWeather?.location?.country}',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        Text(
                          'Current Temperature',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        Text(
                          'Tempeature (Cel): ${_weatherProvider.todaysWeather?.current?.tempC}',
                        ),
                        Text(
                          'Feels Like (Cel): ${_weatherProvider.todaysWeather?.current?.feelslikeC}',
                        ),
                        Text(
                          'Condition: ${_weatherProvider.todaysWeather?.current?.condition?.text}',
                        ),
                        Text(
                          'Humidty: ${_weatherProvider.todaysWeather?.current?.humidity}',
                        ),
                        Divider(),
                        Text(
                          'Wind Condition',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        Text(
                          'Wind Chill: ${_weatherProvider.todaysWeather?.current?.windchillC}',
                        ),
                        Text(
                          'Wind Speed (kph): ${_weatherProvider.todaysWeather?.current?.windKph}',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
