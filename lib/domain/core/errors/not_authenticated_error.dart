class NotAuthenticatedError extends Error {
  @override
  String toString() {
    const explanation = 'Encountered NOT_AUTHENTICATED ERROR.';
    return Error.safeToString(
      '$explanation \nTERMINATING...',
    );
  }
}
