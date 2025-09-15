import 'package:intl/intl.dart';

class DateTimeHelper {
  /// Parse a string into DateTime
  static DateTime? parse(String dateStr, {String format = "yyyy-MM-dd HH:mm:ss"}) {
    try {
      return DateFormat(format).parse(dateStr);
    } catch (e) {
      return null;
    }
  }

  /// Format a DateTime into string
  static String format(DateTime? date, {String format = "yyyy-MM-dd HH:mm:ss"}) {
    return date!=null?DateFormat(format).format(date):"";
  }


  static String getDateAndTime(String dateStr,{format="dd MMM yyyy hh:mm a"}){
    final date = parse(dateStr);

    return date!=null?DateFormat(format).format(date):"";
  }



  /// Convert from one date format to another
  static String convertFormat(String dateStr,
      {String fromFormat = "yyyy-MM-dd HH:mm:ss",
        String toFormat = "dd MMM yyyy"}) {
    try {
      final date = DateFormat(fromFormat).parse(dateStr);
      return DateFormat(toFormat).format(date);
    } catch (e) {
      return dateStr; // return original if parsing fails
    }
  }

  /// Convert UTC to local time
  static DateTime toLocal(DateTime date) => date.toLocal();

  /// Convert local time to UTC
  static DateTime toUtc(DateTime date) => date.toUtc();

  /// Get time ago string (e.g., "2 hours ago")
  static String timeAgo(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inSeconds < 60) return "${diff.inSeconds}s ago";
    if (diff.inMinutes < 60) return "${diff.inMinutes}m ago";
    if (diff.inHours < 24) return "${diff.inHours}h ago";
    if (diff.inDays < 7) return "${diff.inDays}d ago";
    return DateFormat("dd MMM yyyy").format(date);
  }

  /// Add days to a DateTime
  static DateTime addDays(DateTime date, int days) => date.add(Duration(days: days));

  /// Subtract days from a DateTime
  static DateTime subtractDays(DateTime date, int days) =>
      date.subtract(Duration(days: days));

  /// Get current UTC timestamp
  static String nowUtcString({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(DateTime.now().toUtc());
  }

  /// Get current local timestamp
  static String nowLocalString({String format = "yyyy-MM-dd HH:mm:ss"}) {
    return DateFormat(format).format(DateTime.now());
  }
}
