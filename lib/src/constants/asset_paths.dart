/// The location (and title) where locally stored PDFs exist
/// files in this folder must follow the following naming convention:
///
/// PDF to load
/// - assets/NAME/NAME.pdf
///
/// Metadata with year, version, primaryColor
/// - assets/NAME/NAME-meta.json
///
/// Table of contents for each page, used in search
/// - assets/NAME/NAME-toc.json
///
/// Text seen in each page, used in search
/// - assets/NAME/NAME-text.json
///
enum AssetPaths {
  wvems22(
    title: 'WVEMS Protocols 2022',
    condensedTitle: '2022',
    path: 'assets/2022-WVEMS-Protocols/2022-WVEMS-Protocols',
  ),
  wvems23(
    title: 'WVEMS Protocols 2023',
    condensedTitle: '2023',
    path: 'assets/2023-WVEMS-Protocols/2023-WVEMS-Protocols',
  ),

  /// used only for testing
  testBundle(
    title: 'Test Bundle',
    condensedTitle: 'Test',
    path: 'assets/test-bundle/test-bundle',
  ),
  ;

  const AssetPaths({
    required this.title,
    required this.condensedTitle,
    required this.path,
  });

  final String title;
  final String condensedTitle;
  final String path;

  AssetPaths? fromString(String data) {
    return switch (data) {
      'wvems22' => AssetPaths.wvems22,
      'wvems23' => AssetPaths.wvems23,
      'testBundle' => AssetPaths.testBundle,
      String() => null,
    };
  }
}
