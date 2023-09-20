import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_screen_controller.g.dart';

@riverpod
class PdfScreenController extends _$PdfScreenController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  PdfBundleRepository get pdfBundleRepository =>
      ref.read(pdfBundleRepositoryProvider);

  Future<void> loadPdfFromAsset(AssetPaths assetPath) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => pdfBundleRepository.setPdfBundleFromAsset(assetPath));

    /// set new theme based on pdf color scheme
    final currentPdfBundle = pdfBundleRepository.currentPdfBundle;
    if (currentPdfBundle != null) {
      ref
          .read(themeRepositoryProvider)
          .setAppSeedColor(currentPdfBundle.pdfMeta.primaryColor);
    }
  }

  Future<void> clearActivePdf() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => pdfBundleRepository.clearPdfBundle());
  }
}
