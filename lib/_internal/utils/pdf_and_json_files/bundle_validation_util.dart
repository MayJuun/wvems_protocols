import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/models/models.dart';

class BundleValidationUtil {
  Future<int> checkJsonForBundleVersion(String assetPath) async {
    var jsonTocState = const PdfTableOfContentsState.loading();
    final ValidatorsUtil validatorsUtil = ValidatorsUtil();

    late final int bundleVersion;
    late final String bundleVersionString;

    /// First, attempt to load the Table of Contents JSON and obtain
    /// the string value assigned to the key 'version'.
    /// This should be an integer referencing the bundle's current version.
    try {
      final jsonString = await rootBundle.loadString(assetPath);
      final Map<String, dynamic> textList = jsonDecode(jsonString);

      jsonTocState = PdfTableOfContentsState.data(textList);
      print('Temporary json TOC loaded');

      /// set bundleVersion as a string variable
      bundleVersionString = textList['version'] ?? '';
    } catch (e, st) {
      print('error checking JSON for bundle version: $e');
      jsonTocState = PdfTableOfContentsState.error(e, st);
    }

    /// Only attempt to decode bundleVersionString if the JSON was successfully loaded
    if (jsonTocState is PdfTableOfContentsStateData) {
      bundleVersion = validatorsUtil.isValidInteger(bundleVersionString)
          ? validatorsUtil.stringToInt(bundleVersionString)
          : -1;
    } else {
      bundleVersion = -1;
    }
    print('Asset: $assetPath, Bundle #: $bundleVersion');

    /// Bundle versions retruned as -1 occur if integer is invalid, is NAN, or if null.
    /// It also returns as -1 if any errors occurred loading the Table of Contents JSON.
    return bundleVersion;
  }
}
