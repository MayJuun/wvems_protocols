import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

void main() {
  const testBundle = 'test-bundle';

  PdfBundleRepository makeActivePdfRepository() =>
      PdfBundleRepository(addDelay: false);

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<PdfMeta>());
  });

  group('ActivePdfRepository', () {
    test('repository returns null on first load', () {
      // setup
      final activePdfRepository = makeActivePdfRepository();
      addTearDown(activePdfRepository.dispose);

      // verify
      expect(activePdfRepository.currentPdfBundle, null);
      expect(activePdfRepository.bundleStateChanges(), emits(null));
    });

    group(
      'load pdf metadata',
      () {
        test('success', () async {
          // setup

          // run

          // verify
        });
      },
    );
  });
}
