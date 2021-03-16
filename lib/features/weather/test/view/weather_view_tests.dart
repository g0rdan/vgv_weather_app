import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:vgv_theme/cubit/theme_cubit.dart';
import 'package:vgv_weather/bloc/weather_bloc.dart';
import 'package:vgv_weather_city/bloc/city_selection_bloc.dart';
import 'package:vgv_weather_measurement_system/cubit/measurement_system_cubit.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockThemeCubit extends MockCubit<ThemeState> implements ThemeCubit {}

class MockMeasurementSystemCubit extends MockCubit<MeasurementSystemState>
    implements MeasurementSystemCubit {}

class MockCitySelectionBloc
    extends MockBloc<CitySelectionEvent, CitySelectionState>
    implements CitySelectionBloc {}

void main() {
  group('main page', () {
    late WeatherBloc weatherBloc;
    late ThemeCubit themeCubit;
    late MeasurementSystemCubit temperatureSwitchCubit;
    late CitySelectionBloc citySelectionBloc;

    setUp(() {
      weatherBloc = MockWeatherBloc();
      themeCubit = MockThemeCubit();
      temperatureSwitchCubit = MockMeasurementSystemCubit();
      citySelectionBloc = MockCitySelectionBloc();
    });

    // TODO: add tests

    // testWidgets('renders weather page', (tester) async {
    //   await tester.pumpWidget(
    //     MultiBlocProvider(
    //       providers: [
    //         BlocProvider(
    //           create: (context) => weatherBloc,
    //         ),
    //         BlocProvider(
    //           create: (context) => themeCubit,
    //         ),
    //         BlocProvider(
    //           create: (context) => temperatureSwitchCubit,
    //         ),
    //         BlocProvider(
    //           create: (context) => citySelectionBloc,
    //         ),
    //       ],
    //       child: MaterialApp(
    //         home: Scaffold(
    //           body: WeatherPage(),
    //         ),
    //       ),
    //     ),
    //   );
    //   expect(find.byType(TemperatureSwitch), findsOneWidget);
    // });
  });
}
