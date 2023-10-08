import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider<int>(
  // 상태관리하고 싶은 값을 반환해주면 됩니다.
  (ref) => 0,
);
