import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_bundle_repository.g.dart';

class PdfBundleRepository {
  PdfBundleRepository({this.addDelay = false});
  final bool addDelay;

  final _pdfBundle = InMemoryStore<PdfBundle?>(null);

  PdfBundle? get currentPdfBundle => _pdfBundle.value;
  Stream<PdfBundle?> bundleStateChanges() => _pdfBundle.stream;

  Future<void> clearPdfBundle() async => _pdfBundle.value = null;
  void dispose() => _pdfBundle.close();

  Future<void> setPdfBundleFromAsset(String assetPath) async {
    final pdf = await loadFile(assetPath);
    final pdfMeta = await loadMeta(assetPath);
    final pdfTableOfContents = await loadTableOfContents(assetPath);
    final pdfText = await loadText(assetPath);

    _pdfBundle.value = PdfBundle(
        pdf: pdf,
        pdfMeta: pdfMeta,
        pdfTableOfContents: pdfTableOfContents,
        pdfText: pdfText);
  }

  @visibleForTesting
  Future<File> loadFile(String assetPath) async {
    /// spec: https://pub.dev/packages/flutter_pdfviewBundle/example
    final Completer<File> completer = Completer();

    try {
      final fullAssetPath = '$assetPath.pdf';
      final fileName = assetPath.split('/').last;
      final dir = await getApplicationDocumentsDirectory();
      final File file = File('${dir.path}/$fileName');
      final data = await rootBundle.load(fullAssetPath);
      final bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (error) {
      throw StateError('Error parsing asset path');
    }
    return completer.future;
  }

  @visibleForTesting
  Future<PdfMeta> loadMeta(String assetPath) async {
    final asset = await rootBundle.loadString('$assetPath-meta.json');
    return PdfMeta.fromJson(asset);
  }

  @visibleForTesting
  Future<PdfTableOfContents> loadTableOfContents(String assetPath) async {
    final asset = await rootBundle.loadString('$assetPath-toc.json');
    return PdfTableOfContents.fromJson(asset);
  }

  @visibleForTesting
  Future<PdfText> loadText(String assetPath) async {
    final asset = await rootBundle.loadString('$assetPath-text.json');
    return PdfText.fromJson(asset);
  }
}

@Riverpod(keepAlive: true)
PdfBundleRepository pdfBundleRepository(PdfBundleRepositoryRef ref) {
  return PdfBundleRepository(addDelay: false);
}
