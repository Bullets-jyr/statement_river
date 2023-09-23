import 'package:flutter/material.dart';
import 'package:statement_river/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(
      number1: 10,
      number2: 20,
    ));
    final state5 = ref.watch(gStateNotifierProvider);

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('State1 : $state1'),
          // Text('State2 : $state2'),
          state2.when(
            // data가 있을 때
            data: (data) {
              return Text(
                'State2 : $data',
                textAlign: TextAlign.center,
              );
            },
            // error가 있을 때
            error: (err, stack) => Text(
              err.toString(),
            ),
            // loading 일 때
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            // data가 있을 때
            data: (data) {
              return Text(
                'State3 : $data',
                textAlign: TextAlign.center,
              );
            },
            // error가 있을 때
            error: (err, stack) => Text(
              err.toString(),
            ),
            // loading 일 때
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Text('State4 : $state4'),
          Text('State5 : $state5'),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: Text('Decrement'),
              ),
            ],
          ),
          // invalidate()
          // Provider를 유효하지 않게 하다
          // 초기화된 상태로 돌아갑니다.
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: Text('Invalidate'),
          ),
        ],
      ),
    );
  }
}
