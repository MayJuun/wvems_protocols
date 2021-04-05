class AssetsUtil {
  String pdfToJson(String assetPath) =>
      assetPath.replaceAll(RegExp(r'pdf'), 'json');
  String jsonToPdf(String assetPath) =>
      assetPath.replaceAll(RegExp(r'json'), 'pdf');

  /// TOC, or table of contents. Defines the content of each page
  /// using escape characters for . and for /
  /// second replaceAll is used to swap between /pdf/ and /json/ asset folders
  String pdfToJsonWithToc(String assetPath) => assetPath
      .replaceAll(RegExp(r'\.pdf'), '-toc.json')
      .replaceAll(RegExp(r'\/pdf\/'), '/json/');
  String jsonWithTocToPdf(String assetPath) => assetPath
      .replaceAll(RegExp(r'-toc\.json'), '.pdf')
      .replaceAll(RegExp(r'\/json\/'), '/pdf/');
}
