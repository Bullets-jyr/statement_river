import 'package:flutter/material.dart';
import 'package:statement_river/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/riverpod/state_provider.dart';

// StatelessWidget == ConsumerWidget
// class StateProviderScreen extends StatelessWidget {
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  // WidgetRef ref: 차이점
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 값을 가져오기 (UI 반영)
    // 변경 감지
    // build 재실행
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                // 상태 값을 변경하기 (onPressed)
                // (state): 지금 현재 상태
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text(
                'UP',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // 상태 값을 변경하는 또 다른 방법
                ref.read(numberProvider.notifier).state = ref.read(numberProvider.notifier).state - 1;
              },
              child: Text(
                'DOWN',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => _NextScreen(),
                  ),
                );
              },
              child: Text(
                'Next Screen',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 스크린을 추가로 만들어봅니다.
// _NextScreen과 상태 공유 가능
// One Source Of Truth
class _NextScreen extends ConsumerWidget {
  const _NextScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(numberProvider);

    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update((state) => state + 1);
              },
              child: Text(
                'UP',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
