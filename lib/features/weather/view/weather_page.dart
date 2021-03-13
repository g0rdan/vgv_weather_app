import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/core/views/gradient_container.dart';
import 'package:vgv_weather_app/features/city/view/export.dart';
import 'package:vgv_weather_app/features/temperature_switch/view/export.dart';
import 'package:vgv_weather_app/features/theme/cubit/theme_cubit.dart';
import 'package:vgv_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:vgv_weather_app/features/weather/view/export.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
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
                if (state is WeatherLoadFailure) {
                  return const Center(
                    child: Text(
                      'Something went wrong!',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
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
                              ForecastView(weather: weather),
                              TemperatureSwitch(),
                            ],
                          ),
                        ),
                      );
                    },
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
