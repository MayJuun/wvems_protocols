import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/controllers/commands/set_page_command.dart';
import 'package:wvems_protocols/models/models.dart';

class SearchItemSelectedCommand extends AbstractCommand {
  @override
  Future<void> execute({PdfSearchStrings? pdfSearchStrings}) async {
    // todo: optimize 'execute' abstract command
    // I'm not sure if this is the best way to implement execute
    // Previously, I would make the named parameter a required element
    // Now, I'm instead implementing custom null checks w/ a const value
    final searchString = pdfSearchStrings ?? _ERROR_SEARCH_STRING;

    /// Go to specific page
    final pageIndex = PagesUtil().pageNumToPageIndex(searchString.pageNumber);
    SetPageCommand().execute(pageIndex: pageIndex);

    /// Add search strings to history
    searchController.addToSearchHistory(searchString);

    /// if we want to clear the controller on each search...
    /// then re-implement this method
    // Future.delayed(
    //   const Duration(milliseconds: 500),
    //   () => searchController.clear(),
    // );
  }
}

const _ERROR_SEARCH_STRING = PdfSearchStrings(
    pageNumber: 1,
    pageIndex: 0,
    beforeResult: 'Error: ',
    result: 'No search data',
    afterResult: ' are available.');
