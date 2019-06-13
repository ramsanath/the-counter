import 'package:counter/models/app_state.dart';
import 'package:counter/actions/counter_actions.dart';

AppState appReducer(AppState prev, dynamic action) {
  if (action is OnCountUpdatedAction) {
    return prev.copyWith(count: action.newCount, isLoading: false);
  } else {
    return prev;
  }
}
