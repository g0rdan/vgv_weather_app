import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vgv_weather_app/core/models/temperature.dart';
import 'package:vgv_weather_app/core/repositories/weather/weather.dart';
import 'package:vgv_weather_app/settings/cubit/settings_cubit.dart';
import 'package:vgv_weather_app/theme/cubit/theme_cubit.dart';
import 'package:vgv_weather_app/weather/bloc/weather_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:vgv_weather_app/weather/view/weather.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherRepository = WeatherRepository(
      weatherApiClient: WeatherDataProvider(
        httpClient: http.Client(),
      ),
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(
            weatherRepository: weatherRepository,
          ),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(ThemeState(
            theme: ThemeData.light(),
            color: Colors.lightBlue,
          )),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(),
        ),
      ],
      child: Weather(),
    );
  }
}
