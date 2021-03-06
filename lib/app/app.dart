// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_theme/repository/theme_repository.dart';
import 'package:vgv_weather/bloc/weather_bloc.dart';
import 'package:vgv_weather/repository/weather/export.dart';
import 'package:vgv_weather/view/export.dart';
import 'package:vgv_weather_app/l10n/l10n.dart';

import 'package:http/http.dart' as http;
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherRepository = WeatherRepository(
      weatherApiClient: WeatherDataProvider(
        httpClient: http.Client(),
      ),
    );
    final themeRepository = ThemeRepository();

    return MaterialApp(
      theme: ThemeData(
        accentColor: const Color(0xFF13B9FF),
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: weatherRepository,
            ),
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              themeRepository: themeRepository,
              initialState: const ThemeState(
                color: Colors.lightBlue,
                prevColor: Colors.lightBlue,
              ),
            ),
          ),
          BlocProvider(
            create: (context) => MeasurementSystemCubit(),
          ),
          BlocProvider(
            create: (context) => CitySelectionBloc(),
          ),
        ],
        child: WeatherPage(),
      ),
    );
  }
}
