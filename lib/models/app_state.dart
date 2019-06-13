class AppState {
  final bool isLoading;
  final int count;

  AppState({this.count = 0, this.isLoading = true});

  AppState copyWith({int count, bool isLoading}) {
    return AppState(
      count: count ?? this.count,
      isLoading: isLoading ?? this.isLoading
    );
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, count: $count}';
  }

}