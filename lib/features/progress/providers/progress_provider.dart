import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/progress_model.dart';
import '../../../data/repositories/progress_repository.dart';

final progressProvider =
    FutureProvider.autoDispose<ProgressModel>((ref) async {
  final repo = ref.read(progressRepositoryProvider);
  return repo.getProgress('current_user');
});
