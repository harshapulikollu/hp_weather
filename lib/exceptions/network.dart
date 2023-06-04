class NetworkException implements Exception {
  final _message;
  final _prefix;

  NetworkException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message])
      : super(message, "Error: ");
}

class NotFoundException extends NetworkException {
  NotFoundException([String? message])
    : super(message, "Not Found: ");
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}