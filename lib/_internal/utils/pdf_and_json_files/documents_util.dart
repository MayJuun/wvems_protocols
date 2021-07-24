class DocumentsUtil {
  String toPdf(String path) => 'pdf/$path.pdf';
  String toJson(String path) => 'json/$path.json';
  String toJsonWithToc(String path) => 'json/$path-toc.json';

  String pathToFilename(String path) => path.split('/').last;
}
