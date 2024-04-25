import 'package:intl/intl.dart';

String formate(DateTime d,{format='yyyy-MM-dd'}){
  return DateFormat(format).format(d);
}