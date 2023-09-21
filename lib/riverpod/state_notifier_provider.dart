import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/model/shopping_item_model.dart';

// StateNotifierProvider는 StateNotifier를 상속한 클래스를 Provider로 만들 수 있는 클래스 입니다.
final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
  // 관리할 클래스를 인스턴스화 합니다.
  (ref) => ShoppingListNotifier(),
);

// StateNotifier에는 상태관리할 타입이 어떤 타입인지를 지정을 해줘야합니다.
// StateNotifier는 StateNotifierProvider에 제공이될 클래스가 상속하는 것입니다.
class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  // super에는 처음에 어떤 값으로 상태를 초기화할 지 넣어줘야합니다.
  ShoppingListNotifier()
      : super(
          [
            ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );

  void toggleHasBought({required String name}) {
    // state : super에서 초기화한 값
    state = state
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
