import 'package:flutter/material.dart';
import 'package:statement_river/layout/default_layout.dart';
import 'package:statement_river/screen/auto_dispose_modifier_screen.dart';
import 'package:statement_river/screen/code_generation_screen.dart';
import 'package:statement_river/screen/family_modifier_screen.dart';
import 'package:statement_river/screen/future_provider_screen.dart';
import 'package:statement_river/screen/listen_provider_screen.dart';
import 'package:statement_river/screen/provider_screen.dart';
import 'package:statement_river/screen/select_provider_screen.dart';
import 'package:statement_river/screen/state_notifier_provider_screen.dart';
import 'package:statement_river/screen/state_provider_screen.dart';
import 'package:statement_river/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          // 맛보기
          // StateProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StateProviderScreen(),
                ),
              );
            },
            child: Text('StateProviderScreen'),
          ),
          // StateNotifierProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StateNotifierProviderScreen(),
                ),
              );
            },
            child: Text('StateNotifierProviderScreen'),
          ),
          // FutureProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FutureProviderScreen(),
                ),
              );
            },
            child: Text('FutureProviderScreen'),
          ),
          // StreamProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => StreamProviderScreen(),
                ),
              );
            },
            child: Text('StreamProviderScreen'),
          ),
          // FamilyModifierScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => FamilyModifierScreen(),
                ),
              );
            },
            child: Text('FamilyModifierScreen'),
          ),
          // AutoDisposeModifierScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AutoDisposeModifierScreen(),
                ),
              );
            },
            child: Text('AutoDisposeModifierScreen'),
          ),
          // ListenProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ListenProviderScreen(),
                ),
              );
            },
            child: Text('ListenProviderScreen'),
          ),
          // SelectProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => SelectProviderScreen(),
                ),
              );
            },
            child: Text('SelectProviderScreen'),
          ),
          // ProviderScreen
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ProviderScreen(),
                ),
              );
            },
            child: Text('ProviderScreen'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CodeGenerationScreen(),
                ),
              );
            },
            child: Text('CodeGenerationScreen'),
          ),
        ],
      ),
    );
  }
}