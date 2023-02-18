// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:quizkidz/services/date_format_service.dart';

final dateFormatServiceProvider = Provider<DateFormatService>(
  (ref) => DateFormatService(),
);
