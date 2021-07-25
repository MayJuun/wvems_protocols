import 'package:validators2/validators.dart' as validate;
import 'package:validators2/sanitizers.dart' as sanitize;

class ValidatorsUtil {
  bool isValidInteger(String str) => validate.isInt(str) && str != '';

  int stringToInt(String str) => sanitize.toInt(str).toInt();
  // here's another option to consider, if the above doesn't work
  // {
  //   try {
  //     final result = sanitize.toInt(str);
  //     return result.isNaN ? -1 : result.toInt();
  //   } catch (e) {
  //     return -1;
  //   }
  // }

  final _div = 1024;

  double intBitsToMegabytes(int bits) => bits.toDouble() / _div / _div;

  double intBytesToMegabytes(int bytes) => bytes.toDouble() / 1000 / 1000;

  String numToStringAsFixed(num number, int fractionDigits) =>
      number.toStringAsFixed(fractionDigits);
}
