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
  Wvems22(
    title: 'WVEMS Protocols 2022',
    path: 'assets/2022-WVEMS-Protocols/2022-WVEMS-Protocols',
  ),
  Wvems23(
    title: 'WVEMS Protocols 2023',
    path: 'assets/2023-WVEMS-Protocols/2023-WVEMS-Protocols',
  ),

  /// used only for testing
  TestBundle(title: 'Test Bundle', path: 'assets/test-bundle/test-bundle'),
  ;

  const AssetPaths({required this.title, required this.path});

  final String title;
  final String path;

  AssetPaths? fromString(String data) {
    return switch (data) {
      'Wvems22' => AssetPaths.Wvems22,
      'Wvems23' => AssetPaths.Wvems23,
      String() => null,
    };
  }
}
