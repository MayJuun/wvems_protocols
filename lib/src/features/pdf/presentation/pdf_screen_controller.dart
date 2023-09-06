import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../wvems_protocols.dart';

part 'pdf_screen_controller.g.dart';

@riverpod
class PdfScreenController extends _$PdfScreenController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }
  ActivePdfRepository get activePdfRepository =>
      ref.read(activePdfRepositoryProvider);

  Future<void> loadPdfFromAsset(String assetPath) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => activePdfRepository.setActivePdfFromAsset(assetPath));
  }

  Future<void> clearActivePdf() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => activePdfRepository.clearActivePdf());
  }
}
