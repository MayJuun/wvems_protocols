import 'dart:convert';
import 'dart:io';

import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/models/models.dart';

class BundleValidationUtil {
  final DocumentsUtil _documentsUtil = DocumentsUtil();

  /// Verify that the three files that are necessary for a
  /// given bundle are named appropriately:
  ///
  /// Naming convention is defined by the `bundleId` value
  /// 1) bundleID/bundleID.pdf
  /// 2) bundleID/bundleID.json
  /// 3) bundleID/bundleID-toc.pdf
  ///
  bool doesMapContainAllBundleKeys(
          String bundleId, Map<String, dynamic> dynamicMap) =>
      dynamicMap.containsKey(_documentsUtil.toPdf(bundleId)) &&
      dynamicMap.containsKey(_documentsUtil.toJson(bundleId)) &&
      dynamicMap.containsKey(_documentsUtil.toJsonWithToc(bundleId));

  Future<PdfTableOfContentsState> loadTocJsonFromJsonString(
      String jsonString) async {
    var tocJsonState = const PdfTableOfContentsState.loading();

    /// Attempt to load the Table of Contents JSON
    try {
      final Map<String, dynamic> textList = jsonDecode(jsonString);

      tocJsonState = PdfTableOfContentsState.data(textList);
      print('Temporary JSON TOC loaded from Asset');
    } catch (e, st) {
      print('Error checking JSON Asset for bundle version: $e');
      tocJsonState = PdfTableOfContentsState.error(e, st);
    }
    return tocJsonState;
  }

  /// Bundle versions returned as -1 occur if integer is invalid, is NAN, or if null.
  /// It also returns as -1 if any errors occurred loading the Table of Contents JSON.
  int getBundleVersionFromTocJson(PdfTableOfContentsState tocJsonState) {
    final ValidatorsUtil validatorsUtil = ValidatorsUtil();

    late final int bundleVersion;
    late final String bundleVersionString;

    tocJsonState.when(
      /// Only attempt to decode bundleVersionString if the JSON was successfully loaded
      data: (data) {
        /// Obtain the string value assigned to the key 'version'.
        /// This should be an integer referencing the bundle's current version.
        bundleVersionString = data['version'] ?? '';

        /// Set bundleVersion integer, if valid. Else, set it as -1
        bundleVersion = validatorsUtil.isValidInteger(bundleVersionString)
            ? validatorsUtil.stringToInt(bundleVersionString)
            : -1;
      },
      loading: () {
        print('Cannot set bundle version: still LOADING');
        bundleVersionString = '';
        bundleVersion = -1;
      },
      error: (error, st) {
        print('Error checking bundle version: $error');
        bundleVersionString = '';
        bundleVersion = -1;
      },
    );

    print('Bundle #: $bundleVersion');

    return bundleVersion;
  }

  /// Bundle versions returned as -1 occur if integer is invalid, is NAN, or if null.
  /// It also returns as -1 if any errors occurred loading the Table of Contents JSON.
  int getYearFromTocJson(PdfTableOfContentsState tocJsonState) {
    final ValidatorsUtil validatorsUtil = ValidatorsUtil();

    late final int year;
    late final String yearString;

    tocJsonState.when(
      /// Only attempt to decode bundleVersionString if the JSON was successfully loaded
      data: (data) {
        /// Obtain the string value assigned to the key 'version'.
        /// This should be an integer referencing the bundle's current version.
        yearString = data['year'] ?? '';

        /// Set bundleVersion integer, if valid. Else, set it as -1
        year = validatorsUtil.isValidInteger(yearString)
            ? validatorsUtil.stringToInt(yearString)
            : -1;
      },
      loading: () {
        print('Cannot set bundle year: still LOADING');
        yearString = '';
        year = -1;
      },
      error: (error, st) {
        print('Error checking bundle year: $error');
        yearString = '';
        year = -1;
      },
    );

    print('Bundle #: $year');

    return year;
  }
}
