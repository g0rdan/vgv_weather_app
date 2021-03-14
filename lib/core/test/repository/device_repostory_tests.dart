import 'package:flutter_test/flutter_test.dart';
import 'package:vgv_core/repositories/device/export.dart';

void main() {
  group('DeviceRepository tests', () {
    late DeviceRepository repo;

    setUp(() {
      repo = DeviceRepository();
    });

    test(
      'returns false for isWeb since the package doesn\'t support web',
      () async {
        expect(repo.isWeb, false);
      },
    );
  });
}
