import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/layout/default_layout.dart';
import 'package:statement_river/model/shopping_item_model.dart';
import 'package:statement_river/riverpod/state_notifier_provider.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvider);

    print('===== build =====');

    return DefaultLayout(
      title: 'StateNotifierProviderScreen',
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name),
                // 체크박스의 체크 유무
                value: e.hasBought,
                // value: 현재 값
                onChanged: (value) {
                  // ref.read(shoppingListProvider.notifier): 클래스
                  ref.read(shoppingListProvider.notifier).toggleHasBought(
                        name: e.name,
                      );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
