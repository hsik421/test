sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final Exception exception;
  const Failure(this.exception);
}

class Connected<T> extends Result<T> {
  final bool isConnected;
  const Connected(this.isConnected);
}