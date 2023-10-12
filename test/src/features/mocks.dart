import 'package:mocktail/mocktail.dart';
import 'package:wvems_protocols/wvems_protocols.dart';

class MockPdfBundleRepository extends Mock implements PdfBundleRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
