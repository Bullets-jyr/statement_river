import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/model/shopping_item_model.dart';

// 특정 속성이 변경되었을 때만, 반응을 하는 Provider
final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
  (ref) => SelectNotifier(),
);

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      // state의 기본값
      : super(
          ShoppingItemModel(
            name: '김치',
            quantity: 3,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    // state = ShoppingItemModel(
    //   name: state.name,
    //   quantity: state.quantity,
    //   hasBought: !state.hasBought,
    //   isSpicy: state.isSpicy,
    // );

    state = state.copyWith(
      hasBought: !state.hasBought,
    );
  }

  toggleIsSpicy() {
    final ts = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    );

    final ts2 = ts.copyWith(
      fontSize: 18.0,
    );

    // state = ShoppingItemModel(
    //   name: state.name,
    //   quantity: state.quantity,
    //   hasBought: state.hasBought,
    //   isSpicy: !state.isSpicy,
    // );

    state = state.copyWith(
      isSpicy: !state.isSpicy,
    );
  }
}
