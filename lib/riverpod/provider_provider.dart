import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/model/shopping_item_model.dart';
import 'package:statement_river/riverpod/state_notifier_provider.dart';

// final filteredShoppingListProvider = Provider(
//   (ref) => ref.watch(shoppingListProvider),
// );

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    print('===== filteredShoppingListProvider =====');
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy
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

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
