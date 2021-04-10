class PdfSearchStrings {
  // todo: change required to required, when non-nullable
  const PdfSearchStrings({
    required this.pageNumber,
    required this.pageIndex,
    required this.beforeResult,
    required this.result,
    required this.afterResult,
  });

  final int pageNumber;
  final int pageIndex;

  final String beforeResult;
  final String result;
  final String afterResult;
}
