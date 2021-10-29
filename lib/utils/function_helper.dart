import 'package:intl/intl.dart';

String getSourceByName(String assets) => 'assets/images/png/$assets.png';

String getFormattedDate(DateTime? date) =>
    date == null ? 'N/A' : DateFormat('EEEE, dd MMMM yyyy').format(date);
