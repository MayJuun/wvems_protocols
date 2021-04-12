import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_search_strings.freezed.dart';
part 'pdf_search_strings.g.dart';

@freezed
class PdfSearchStrings with _$PdfSearchStrings {
  const factory PdfSearchStrings(
      {required int pageNumber,
      required int pageIndex,
      required String beforeResult,
      required String result,
      required String afterResult}) = PdfSearchStringsData;

  factory PdfSearchStrings.fromJson(Map<String, dynamic> json) =>
      _$PdfSearchStringsFromJson(json);
}
