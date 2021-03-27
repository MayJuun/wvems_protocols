class PdfSearchStrings {
  // todo: change required to required, when non-nullable
  PdfSearchStrings({
    required this.pageNumber,
    required this.beforeResult,
    required this.result,
    required this.afterResult,
  });

  final int pageNumber;

  final String beforeResult;
  final String result;
  final String afterResult;
}

// todo: remove when getstorage has been implemented
final List<PdfSearchStrings> tempSearchHistoryList = [
  PdfSearchStrings(
      pageNumber: 12,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 13,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 14,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 15,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 16,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
  PdfSearchStrings(
      pageNumber: 17,
      beforeResult: 'I will',
      result: ' NOT ',
      afterResult: 'waste chalk.'),
];
