class BaseState {
  bool error;
  bool isLoading;
  String message;

  BaseState({
    required this.error,
    required this.message,
    required this.isLoading,
  });

  factory BaseState.initial() => BaseState(
        error: false,
        message: '',
        isLoading: false,
      );
}
