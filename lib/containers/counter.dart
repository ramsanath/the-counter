import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:counter/models/app_state.dart';
import 'package:redux/redux.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (Store<AppState> store) => store.state,
      builder: (BuildContext context, AppState state) {
        return Text(
          "${state.count}",
          style: Theme.of(context).textTheme.display3,
        );
      },
    );
  }
}
