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
  wvems23(
    title: 'WVEMS Protocols 2023',
    condensedTitle: '2023',
    path: 'assets/2023-WVEMS-Protocols/2023-WVEMS-Protocols',
  ),
  wvems24(
    title: 'WVEMS Protocols 2024',
    condensedTitle: '2024',
    path: 'assets/2024-WVEMS-Protocols/2024-WVEMS-Protocols',
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
      'wvems23' => AssetPaths.wvems23,
      'wvems24' => AssetPaths.wvems24,
      'testBundle' => AssetPaths.testBundle,
      String() => null,
    };
  }
}
