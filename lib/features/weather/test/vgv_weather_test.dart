import './bloc/weather_bloc_tests.dart' as blocTests;
import './repository/weather_data_provider_tests.dart' as dataProviderTests;
import './repository/weather_repository_tests.dart' as repoTests;
import './view/weather_view_tests.dart' as viewTests;

void main() {
  blocTests.main();
  dataProviderTests.main();
  repoTests.main();
  viewTests.main();
}
