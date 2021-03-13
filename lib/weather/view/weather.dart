import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/city/view/city_selection.dart';
import 'package:vgv_weather_app/core/views/gradient_container.dart';
import 'package:vgv_weather_app/core/views/widgets.dart';
import 'package:vgv_weather_app/settings/view/settings_widget.dart';
import 'package:vgv_weather_app/theme/cubit/theme_cubit.dart';
import 'package:vgv_weather_app/weather/bloc/weather_bloc.dart';
import 'package:vgv_weather_app/weather/view/combined_weather_temperature.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CitySelection()),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<WeatherBloc, WeatherState>(
              listener: (context, state) {
                if (state is WeatherLoadSuccess) {
                  BlocProvider.of<ThemeCubit>(context)
                      .weatherChanged(state.weather.condition);
                  _refreshCompleter.complete();
                  _refreshCompleter = Completer();
                }
              },
              builder: (context, state) {
                if (state is WeatherInitial) {
                  return const Center(child: Text('Please Select a Location'));
                }
                if (state is WeatherLoadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is WeatherLoadSuccess) {
                  final weather = state.weather;

                  return BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, themeState) {
                      return GradientContainer(
                        color: themeState.color,
                        child: RefreshIndicator(
                          onRefresh: () {
                            BlocProvider.of<WeatherBloc>(context).add(
                              WeatherRefreshRequested(city: weather.location),
                            );
                            return _refreshCompleter.future;
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 100.0),
                                      child: Center(
                                        child: Location(
                                            location: weather.location),
                                      ),
                                    ),
                                    Center(
                                      child: LastUpdated(
                                          dateTime: weather.lastUpdated),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 50.0),
                                      child: Center(
                                        child: CombinedWeatherTemperature(
                                          weather: weather,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Settings(),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is WeatherLoadFailure) {
                  return const Center(
                    child: Text(
                      'Something went wrong!',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
