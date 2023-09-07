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

    test(
        'setPdfBundleFromAsset should set currentPdfBundle with the correct values',
        () async {
      // setup
      TestWidgetsFlutterBinding.ensureInitialized();

      // while the File('*.pdf') has a different hashtag, and thus can't be checked easily...the other JSON data don't have this same limitation
      final expectedMeta = PdfMeta.fromJson(
          await rootBundle.loadString('$testBundle-meta.json'));
      final expectedTableOfContents = PdfTableOfContents.fromJson(
          await rootBundle.loadString('$testBundle-toc.json'));
      final expectedText = PdfText.fromJson(
          await rootBundle.loadString('$testBundle-text.json'));

      // required to access pdf assets in testing
      // of note, this will also save the file locally
      // https://stackoverflow.com/questions/56158676/why-does-applicationsdocumentsdirectory-return-null-for-unit-test
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
              const MethodChannel('plugins.flutter.io/path_provider'),
              (MethodCall methodCall) async {
        return './test/src/features/pdf/data';
      });
      final pdfBundleRepository = makePdfBundleRepository();

      // run
      await pdfBundleRepository.setPdfBundleFromAsset(testBundle);

      // verify
      expect(pdfBundleRepository.currentPdfBundle?.pdf, isA<File>());
      expect(pdfBundleRepository.currentPdfBundle?.pdfMeta, expectedMeta);
      expect(pdfBundleRepository.currentPdfBundle?.pdfTableOfContents,
          expectedTableOfContents);
      expect(pdfBundleRepository.currentPdfBundle?.pdfText, expectedText);
      expect(pdfBundleRepository.currentPdfBundle, isA<PdfBundle>());
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

      // TODO(FireJuun): setup additional failing tests, such as missing colors or inaccurate data
      test(
        'fails, inaccurate data',
        () async {},
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
