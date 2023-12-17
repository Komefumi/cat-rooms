class UsernameInUseError implements Exception {
  final String username;
  const UsernameInUseError(this.username);
  String error() => '$username is already in use';
}

class UsernameNotFoundError implements Exception {
  final String username;
  const UsernameNotFoundError(this.username);
  String error() => '$username not found';
}

class IncorrectPasswordError implements Exception {
  String error() => 'Provided password seems to be incorrect';
}

class SomehowFailedError implements Exception {
  final Object errorObject;
  final String _operation = 'something';
  const SomehowFailedError(this.errorObject);
  String error() =>
      'For some reason, $_operation failed. Check attached error object';
}

class FailedToCreateUserError extends SomehowFailedError {
  @override
  final String _operation = 'user creation';
  const FailedToCreateUserError(super.errorObject);
}

class FailedToLoginUserError extends SomehowFailedError {
  @override
  final String _operation = 'user login';
  const FailedToLoginUserError(super.errorObject);
}
