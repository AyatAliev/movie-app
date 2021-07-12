
import 'package:intl/intl.dart';

class Utils {

  static parseDateToddMMyyyy(String time){
    var date = DateFormat("yyyy-MM-dd").parse(time);
    return DateFormat("dd MMM yyyy").format(date);
  }

}