import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageFutureProvider =
    FutureProvider.family<String, String>((ref, title) async {
  await Future.delayed(const Duration(seconds: 3));

  return 'message $title';
});

final countFutureProvider = FutureProvider.autoDispose<int>((ref) async {
  ref.onDispose(() {
    debugPrint('dispose');
  });
  await Future.delayed(const Duration(seconds: 3));

  return 0;
});
