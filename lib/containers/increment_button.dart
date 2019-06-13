import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:counter/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:counter/widgets/switch.dart';
import 'package:counter/api/firebase.dart';

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) {
        return _ViewModel(
            isLoading: store.state.isLoading,
            incrementCount: () => Firebase.database
                .reference()
                .child("counter")
                .set(store.state.count + 1));
      },
      builder: (context, _ViewModel vm) {
        return FloatingActionButton(
          child: Switcher(
            condition: vm.isLoading,
            trueWidget:
                CircularProgressIndicator(backgroundColor: Colors.white),
            falseWidget: Icon(Icons.add),
          ),
          onPressed: vm.isLoading ? null : vm.incrementCount,
        );
      },
    );
  }
}

class _ViewModel {
  bool isLoading;
  VoidCallback incrementCount;

  _ViewModel({this.isLoading, this.incrementCount});
}
