import './bloc/weather_bloc_tests.dart' as bloc_tests;
import './repository/weather_data_provider_tests.dart' as data_provider_tests;
import './repository/weather_repository_tests.dart' as repo_tests;
import './view/weather_view_tests.dart' as view_tests;

void main() {
  bloc_tests.main();
  data_provider_tests.main();
  repo_tests.main();
  view_tests.main();
}
