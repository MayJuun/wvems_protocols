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
    name: 'WVEMS 2022',
    path: 'assets/2022-WVEMS-Protocols/2022-WVEMS-Protocols',
  ),
  Wvems23(
    name: 'WVEMS 2023',
    path: 'assets/2023-WVEMS-Protocols/2023-WVEMS-Protocols',
  );

  const AssetPaths({required this.name, required this.path});

  final String name;
  final String path;
}
