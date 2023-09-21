import 'package:flutter_riverpod/flutter_riverpod.dart';

// 자동으로 캐시를 삭제한다는 뜻입니다. 처음부터 다시 생성을 한다는 뜻입니다.
// 필요가 없을 때, 캐시를 삭제하고 필요할 때, 다시 생성을 한다는 뜻입니다.
final autoDisposeModifierProvider = FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(Duration(seconds: 2));

  return [1, 2, 3, 4, 5];
});