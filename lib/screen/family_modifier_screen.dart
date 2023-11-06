import 'package:flutter/material.dart';
import 'package:statement_river/layout/default_layout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statement_river/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 어떤 Provider든 상관없이 똑같이 사용할 수 있습니다.
    // family_modifier_provider에 있는 data값에 해당되는 파라미터를 넣어줘야합니다.
    // family_modifier는 Provider를 생성을 할 때, 생성하는 순간에 어떤 변수를 입력해줘서
    // 이 변수로 Provider안에 로직을 변경해야할 때 사용합니다.
    final state = ref.watch(familyModifierProvider(3));
    return DefaultLayout(
      title: 'FamilyModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(
            data.toString(),
          ),
          error: (err, stack) => Text(
            err.toString(),
          ),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
