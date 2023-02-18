// Package imports:
import 'package:timeago/timeago.dart' as timeago;

class DateFormatService {
  DateFormatService();

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    return timeago.format(now.subtract(difference), locale: 'en');
  }
}
