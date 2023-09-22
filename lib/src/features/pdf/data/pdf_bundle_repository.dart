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

  Future<void> setPdfBundleFromAsset(AssetPaths assetPath) async {
    _pdfBundle.value = await loadBundleData(assetPath);
  }

  @visibleForTesting
  Future<PdfBundle> loadBundleData(AssetPaths assetPath) async {
    final pdf = await loadFile(assetPath);
    final pdfMeta = await loadMeta(assetPath);
    final pdfTableOfContents = await loadTableOfContents(assetPath);
    final pdfText = await loadText(assetPath);

    return PdfBundle(
        assetPath: assetPath,
        pdf: pdf,
        pdfMeta: pdfMeta,
        pdfTableOfContents: pdfTableOfContents,
        pdfText: pdfText);
  }

  @visibleForTesting
  Future<File> loadFile(AssetPaths assetPath) async {
    /// spec: https://pub.dev/packages/flutter_pdfviewBundle/example
    final Completer<File> completer = Completer();

    try {
      final path = assetPath.path;
      final fullAssetPath = '$path.pdf';
      final fileName = path.split('/').last;
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
  Future<PdfMeta> loadMeta(AssetPaths assetPath) async {
    final path = assetPath.path;
    final asset = await rootBundle.loadString('$path-meta.json');
    return PdfMeta.fromJson(asset);
  }

  @visibleForTesting
  Future<PdfTableOfContents> loadTableOfContents(AssetPaths assetPath) async {
    final path = assetPath.path;
    final asset = await rootBundle.loadString('$path-toc.json');
    return PdfTableOfContents.fromJson(asset);
  }

  @visibleForTesting
  Future<PdfText> loadText(AssetPaths assetPath) async {
    final path = assetPath.path;
    final asset = await rootBundle.loadString('$path-text.json');
    return PdfText.fromJson(asset);
  }

  Future<Map<PageId, TableOfContents>> searchPdfTableOfContents(
      String query) async {
    final lowerCaseQuery = query.toLowerCase();
    final tableOfContents = currentPdfBundle?.pdfTableOfContents;
    if (tableOfContents != null && tableOfContents.data.isNotEmpty) {
      final response = <PageId, TableOfContents>{};
      for (var entry in tableOfContents.data.entries) {
        if (entry.value.toLowerCase().contains(lowerCaseQuery)) {
          response[entry.key] = entry.value;
        }
      }
      return response;
    } else {
      throw StateError('No Data: Unable to load Table of Contents');
    }
  }

  Future<Map<PageId, PageText>> searchPdfText(String query) async {
    final lowerCaseQuery = query.toLowerCase();
    final pageText = currentPdfBundle?.pdfText;
    if (pageText != null && pageText.data.isNotEmpty) {
      final response = <PageId, PageText>{};
      for (var entry in pageText.data.entries) {
        if (entry.value.toLowerCase().contains(lowerCaseQuery)) {
          response[entry.key] = entry.value;
        }
      }
      return response;
    } else {
      throw StateError('No Data: Unable to load Page Text');
    }
  }
}

@Riverpod(keepAlive: true)
PdfBundleRepository pdfBundleRepository(PdfBundleRepositoryRef ref) {
  // set this in the app bootstrap section
  throw UnimplementedError();
}

@riverpod
Future<Map<PageId, TableOfContents>> pdfTableOfContentsSearch(
    PdfTableOfContentsSearchRef ref, String query) async {
  // put any debounce or timer/cancel methods here
  final pdfBundleRepository = ref.watch(pdfBundleRepositoryProvider);
  return pdfBundleRepository.searchPdfTableOfContents(query);
}

@riverpod
Future<Map<PageId, PageText>> pdfTextSearch(
    PdfTextSearchRef ref, String query) async {
  // put any debounce or timer/cancel methods here
  final pdfBundleRepository = ref.watch(pdfBundleRepositoryProvider);
  return pdfBundleRepository.searchPdfText(query);
}
