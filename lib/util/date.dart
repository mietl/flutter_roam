import 'package:intl/intl.dart';

String dateFormat(DateTime d,{format='yyyy-MM-dd'}){
  return DateFormat(format).format(d);
}