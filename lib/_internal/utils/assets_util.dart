class AssetsUtil {
  String pdfToJson(String assetPath) =>
      assetPath.replaceAll(RegExp(r'pdf'), 'json');
  String jsonToPdf(String assetPath) =>
      assetPath.replaceAll(RegExp(r'json'), 'pdf');
}
