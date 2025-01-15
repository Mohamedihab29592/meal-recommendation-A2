class CustomeException implements Exception {
  final String message;

  CustomeException({required this.message});
  @override
  String toString() => message;
}

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
