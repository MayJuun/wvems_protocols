class AssetsUtil {
  String toPdf(String asset) => 'assets/$asset/$asset.pdf';
  String toJson(String asset) => 'assets/$asset/$asset.json';
  String toJsonWithToc(String asset) => 'assets/$asset/$asset-toc.json';

  String assetToFilename(String asset) => asset.split('/').last;
}
