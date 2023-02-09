// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabIndexProvider = StateProvider((ref) => 0);
final questionIndexProvider = StateProvider((ref) => 0);
final questionTypeProvider = StateProvider<String>((ref) => 'Random');
final numQuestionProvider = StateProvider((ref) => 5);
