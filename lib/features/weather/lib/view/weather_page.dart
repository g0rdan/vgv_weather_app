import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_theme/view/export.dart';
import 'package:vgv_weather/bloc/weather_bloc.dart';
import 'package:vgv_weather/view/export.dart';
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_city/view/export.dart';
import 'package:vgv_weather_measurement_system/view/export.dart';

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
      body: BlocListener<CitySelectionBloc, CitySelectionState>(
        listener: (context, state) {
          if (state is CityNameSubmitted) {
            if (FocusScope.of(context).isFirstFocus) {
              FocusScope.of(context).requestFocus(FocusNode());
            }
            BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(
              city: state.name,
              requestTime: DateTime.now(),
            ));
          }
        },
        child: StaticBackground(
          child: Column(
            children: [
              Expanded(
                child: BlocConsumer<WeatherBloc, WeatherState>(
                  listener: (context, state) {
                    if (state is WeatherLoadSuccess) {
                      _refreshCompleter.complete();
                      _refreshCompleter = Completer();
                      BlocProvider.of<ThemeCubit>(context)
                          .weatherChanged(state.weather.condition);
                    }
                  },
                  builder: (context, state) {
                    if (state is WeatherInitial) {
                      return const Center(
                        child: Text(
                          'Please Select Location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      );
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
                      return AnimatedBackground(
                        child: RefreshIndicator(
                          onRefresh: () {
                            BlocProvider.of<WeatherBloc>(context).add(
                              WeatherRefreshRequested(
                                city: weather.location,
                                requestTime: DateTime.now(),
                              ),
                            );
                            return _refreshCompleter.future;
                          },
                          child: Column(
                            children: [
                              Expanded(
                                child: ForecastView(weather: weather),
                              ),
                              MeasurementSystemSwitch(),
                            ],
                          ),
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
