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

// todo: remove when getstorage has been implemented
const List<PdfSearchStrings> tempSearchHistoryList = [
  PdfSearchStrings(
      pageNumber: 12,
      pageIndex: 11,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 13,
      pageIndex: 12,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 14,
      pageIndex: 13,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 15,
      pageIndex: 14,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 16,
      pageIndex: 15,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 17,
      pageIndex: 16,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
];
