import 'dart:io';

class DocumentsUtil {
  String toPdf(String bundleId) => '$bundleId/$bundleId.pdf';
  String toJson(String bundleId) => '$bundleId/$bundleId.json';
  String toJsonWithToc(String bundleId) => '$bundleId/$bundleId-toc.json';

  String pathToFilename(String path) => path.split('/').last;

  String bundleIdToTitle(String bundleId) => bundleId.replaceAll('-', ' ');

  // Converts a full path (long) into one without the original App Directory name (short)
  String removeAppDirectoryPath(Directory appDirectory, String fullPath) =>
      fullPath.replaceFirst(appDirectory.path + '/', '');

  // Shorter paths are easier to work with, this method converts back to the full path (long)
  String addAppDirectoryPath(Directory appDirectory, String shortPath) =>
      appDirectory.path + '/' + shortPath;
}
