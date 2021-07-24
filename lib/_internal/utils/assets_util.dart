class AssetsUtil {
  String toPdf(String asset) => 'assets/pdf/$asset.pdf';
  String toJson(String asset) => 'assets/json/$asset.json';
  String toJsonWithToc(String asset) => 'assets/json/$asset-toc.json';

  String assetToFilename(String asset) => asset.split('/').last;
}
