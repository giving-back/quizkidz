// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider((ref) => 0);
final questionIndexProvider = StateProvider((ref) => 0);
final questionTypeIndexProvider = StateProvider<String>((ref) => '');
final numQuestionsIndexProvider = StateProvider((ref) => 0);
