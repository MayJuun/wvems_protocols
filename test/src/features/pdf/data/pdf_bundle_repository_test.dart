import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'pdf_bundle_repository_test.data.dart';

void main() {
  PdfBundleRepository makePdfBundleRepository() =>
      PdfBundleRepository(addDelay: false);

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<PdfMeta>());
  });

  group('ActivePdfRepository', () {
    test('repository returns null on first load', () {
      // setup
      final pdfBundleRepository = makePdfBundleRepository();
      addTearDown(pdfBundleRepository.dispose);

      // verify
      expect(pdfBundleRepository.currentPdfBundle, null);
      expect(pdfBundleRepository.bundleStateChanges(), emits(null));
    });

    // TODO(FireJuun): figure out why this test is failing
    test(
        'setPdfBundleFromAsset should set currentPdfBundle with the correct values',
        () async {
      // setup
      TestWidgetsFlutterBinding.ensureInitialized();

      // required to access pdf assets in testing
      // https://stackoverflow.com/questions/56158676/why-does-applicationsdocumentsdirectory-return-null-for-unit-test
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
              const MethodChannel('plugins.flutter.io/path_provider'),
              (MethodCall methodCall) async {
        return '.';
      });
      final pdfBundleRepository = makePdfBundleRepository();

      // run
      await pdfBundleRepository.setPdfBundleFromAsset(testBundle);

      // verify
      expect(pdfBundleRepository.currentPdfBundle?.pdf, isNotNull);
      expect(pdfBundleRepository.currentPdfBundle?.pdfMeta, isNotNull);
      expect(
          pdfBundleRepository.currentPdfBundle?.pdfTableOfContents, isNotNull);
      expect(pdfBundleRepository.currentPdfBundle?.pdfText, isNotNull);
    });

    group('load pdf metadata', () {
      test(
        'success',
        () async {
          // setup
          TestWidgetsFlutterBinding.ensureInitialized();
          final activePdfRepository = makePdfBundleRepository();

          // run
          final response = await activePdfRepository.loadMeta(testBundle);

          // verify
          expect(response, PdfMeta.fromMap(testMeta));
        },
      );

      test(
        'fails',
        () async {
          // TODO(FireJuun): setup failing tests, such as missing colors or inaccurate data
        },
      );
    });
    group('load pdf table of contents', () {
      test(
        'success',
        () async {
          // setup
          TestWidgetsFlutterBinding.ensureInitialized();
          final activePdfRepository = makePdfBundleRepository();

          // run
          final response =
              await activePdfRepository.loadTableOfContents(testBundle);

          // verify
          expect(response, PdfTableOfContents.fromMap(testTableOfContents));
        },
      );

      test(
        'fails',
        () async {
          // TODO(FireJuun): setup failing tests, such as non-integers in a key
        },
      );
    });
    group('load pdf text', () {
      test(
        'success',
        () async {
          // setup
          TestWidgetsFlutterBinding.ensureInitialized();
          final activePdfRepository = makePdfBundleRepository();

          // run
          final response = await activePdfRepository.loadText(testBundle);

          // verify
          expect(response, PdfText.fromMap(testText));
        },
      );

      test(
        'fails',
        () async {
          // TODO(FireJuun): setup failing tests, such as non-integers in a key
        },
      );
    });
  });
}
