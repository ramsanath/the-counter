import 'package:flutter/material.dart';
import 'package:counter/home_screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:counter/models/app_state.dart';
import 'package:counter/reducers/app_reducer.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final title = "The Counter";

  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: title,
        home: HomeScreen(title: title),
      ),
    );
  }
}
