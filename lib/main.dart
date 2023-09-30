import 'package:flutter/material.dart';
import 'package:statement_river/riverpod/provider_observer.dart';
import 'package:statement_river/screen/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // ProviderScope가 상위에 있어야지만, 상태관리 툴을 사용할 수 있습니다.
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
