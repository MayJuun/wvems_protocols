import 'package:wvems_protocols/_internal/utils/utils.dart';
import 'package:wvems_protocols/controllers/commands/abstract_command.dart';
import 'package:wvems_protocols/models/models.dart';

class SearchItemRemovedCommand extends AbstractCommand {
  @override
  Future<void> execute({PdfSearchStrings? pdfSearchStrings}) async {
    // todo: optimize 'execute' abstract command
    // I'm not sure if this is the best way to implement execute
    // Previously, I would make the named parameter a required element
    // Now, I'm instead implementing custom null checks w/ a const value
    final searchString = pdfSearchStrings ?? _ERROR_SEARCH_STRING;

    /// Add search strings to history
    searchController.removeFromSearchHistory(searchString);
  }
}

const _ERROR_SEARCH_STRING = PdfSearchStrings(
    pageNumber: 1,
    pageIndex: 0,
    beforeResult: 'Error: ',
    result: 'No search data',
    afterResult: ' are available.');
