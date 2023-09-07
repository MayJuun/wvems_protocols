import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

part 'pdf_service.g.dart';

@Riverpod(keepAlive: true)
Stream<PdfBundle?> pdfBundle(PdfBundleRef ref) {
  return ref.watch(pdfBundleRepositoryProvider).bundleStateChanges();
}

@riverpod
PdfMeta pdfMeta(PdfMetaRef ref) {
  final pdfBundle = ref.watch(pdfBundleProvider);
  final pdfMeta =
      pdfBundle.maybeWhen(data: (data) => data?.pdfMeta, orElse: () => null);
  if (pdfMeta != null) {
    return pdfMeta;
  } else {
    return PdfMeta.fromMap(const {});
  }
}

@riverpod
PdfText pdfText(PdfTextRef ref) {
  final pdfBundle = ref.watch(pdfBundleProvider);
  final pdfText =
      pdfBundle.maybeWhen(data: (data) => data?.pdfText, orElse: () => null);

  if (pdfText != null) {
    return pdfText;
  } else {
    return PdfText.fromMap(const {});
  }
}

@riverpod
PdfTableOfContents pdfTableOfContents(PdfTableOfContentsRef ref) {
  final pdfBundle = ref.watch(pdfBundleProvider);
  final pdfTableOfContents = pdfBundle.maybeWhen(
      data: (data) => data?.pdfTableOfContents, orElse: () => null);

  if (pdfTableOfContents != null) {
    return pdfTableOfContents;
  } else {
    return PdfTableOfContents.fromMap(const {});
  }
}
