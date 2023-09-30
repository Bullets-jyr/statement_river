import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/model/shopping_item_model.dart';
import 'package:statement_river/riverpod/state_notifier_provider.dart';

// final filteredShoppingListProvider = Provider(
//   (ref) => ref.watch(shoppingListProvider),
// );

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final fillterState = ref.watch(fillterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (fillterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => fillterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();

    // return [];
  },
);

// 필터링 상태
enum FilterState {
  // 안매움
  notSpicy,
  // 매움
  spicy,
  // 전부
  all,
}

final fillterProvider = StateProvider<FilterState>((ref) => FilterState.all);
