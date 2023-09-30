import 'package:flutter/material.dart';
import 'package:statement_river/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/riverpod/listen_provider.dart';

// StatefullWidget == ConsumerStatefulWidget
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  // Consumer
  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

// Consumer
// ref는 context처럼 기본으로 제공해줍니다.
class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  // initState에서는 어떤 경우에도 watch를 하면 안됩니다.
  @override
  void initState() {
    super.initState();

    controller = TabController(
      length: 10,
      vsync: this,
      // initState안에서 ref를 사용하는 방법도 동일합니다.
      initialIndex: ref.read(listenProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 따로 dispose해줄 필요가 없습니다.
    // 값이 변경될 때 마다 함수를 실행하기 위한 목적
    ref.listen<int>(listenProvider, (previous, next) {
      // 기존 상태
      print(previous);
      // 변경될 다음 상태
      print(next);
      if (previous != next) {
        controller.animateTo(
          next,
        );
      }
    });

    return DefaultLayout(
      title: 'ListenProviderScreen',
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 10 ? 10 : state + 1);
                },
                child: Text('다음'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(listenProvider.notifier).update((state) => state == 0 ? 0 : state - 1);
                },
                child: Text('뒤로'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
