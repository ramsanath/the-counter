import 'package:flutter/material.dart';
import 'package:counter/containers/counter.dart';
import 'package:counter/containers/increment_button.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:counter/models/app_state.dart';
import 'package:redux/redux.dart';
import 'package:counter/actions/counter_actions.dart';
import 'package:counter/api/firebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({this.title});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<Event> _counterSubscription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Counter(),
      ),
      floatingActionButton: IncrementButton(),
    );
  }

  _onCounterValueChange(Event event) {
    Store<AppState> store = StoreProvider.of<AppState>(context);

    int count = event.snapshot.value;
    store.dispatch(OnCountUpdatedAction(count));
  }

  @override
  void dispose() {
    _counterSubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    DatabaseReference _counterRef =
        Firebase.database.reference().child("counter");

    _counterSubscription = _counterRef.onValue.listen(_onCounterValueChange);
    _counterRef.keepSynced(true);
  }
}
