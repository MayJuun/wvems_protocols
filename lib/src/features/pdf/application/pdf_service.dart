import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'pdf_service.g.dart';

@Riverpod(keepAlive: true)
Stream<PdfBundle?> pdfBundle(PdfBundleRef ref) {
  return ref.watch(activePdfRepositoryProvider).watchPdf();
}
