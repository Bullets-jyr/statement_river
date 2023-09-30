import 'package:flutter_riverpod/flutter_riverpod.dart';

// int 대신 Parameter을 넣어줍니다.
// 위 방법이 귀찮은 과정이기 때문에 Code Generation의 2번이 나왔습니다.
class Parameter {
  final String name;
  final String company;

  Parameter({
    required this.name,
    required this.company,
  });
}

// family<반환 값, 받는 값>
final familyModifierProvider = FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(Duration(seconds: 2));

  return List.generate(5, (index) => index * data);

  // return [1, 2, 3, 4, 5, 6, 7, 8, 9];
});