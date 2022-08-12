class BadGatewayException implements Exception {
  @override
  String toString() => 'BadGatewayException: [HTTP 502]';
}

class BadRequestException implements Exception {
  @override
  String toString() => 'BadRequestException: [HTTP 400]';
}

class ClientTimeoutExpection implements Exception {
  @override
  String toString() => 'HttpTimeoutExpection: [HTTP 408]';
}

class DefaultExpection implements Exception {
  @override
  String toString() => 'DefaultExpection: [HTTP Unknown Status]';
}

class ForbiddenException implements Exception {
  @override
  String toString() => 'ForbiddenException: [HTTP 403]';
}

class InternalServerException implements Exception {
  @override
  String toString() => 'InternalServerException: [HTTP 500]';
}

class LockedException implements Exception {
  @override
  String toString() => 'LockedException: [HTTP 423]';
}

class NoContentException implements Exception {
  @override
  String toString() => 'NoContentException: [HTTP 204]';
}

class NotFoundException implements Exception {
  @override
  String toString() => 'NotFoundException: [HTTP 404]';
}

class ServerTimeoutExpection implements Exception {
  @override
  String toString() => 'ServerTimeoutExpection: [HTTP 524]';
}

class UnAuthorizedException implements Exception {
  @override
  String toString() => 'UnAuthorizedException: [HTTP 401]';
}

class ConflictException implements Exception {
  @override
  String toString() => 'ConflictException: [HTTP 409]';
}
