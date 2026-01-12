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
  wvems25(
    title: 'WVEMS Protocols 2025',
    condensedTitle: '2025',
    path: 'assets/2025-WVEMS-Protocols/2025-WVEMS-Protocols',
  ),
  wvems26(
    title: 'WVEMS Protocols 2026',
    condensedTitle: '2026',
    path: 'assets/2026-WVEMS-Protocols/2026-WVEMS-Protocols',
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
      'wvems25' => AssetPaths.wvems25,
      'wvems26' => AssetPaths.wvems26,
      'testBundle' => AssetPaths.testBundle,
      String() => null,
    };
  }
}
