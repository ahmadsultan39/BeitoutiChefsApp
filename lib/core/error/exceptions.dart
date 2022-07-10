class HandledException implements Exception {
  String error;

  HandledException({this.error = ''});
}

class ServerException extends HandledException {
  ServerException({String error = ''}) : super(error: error);
}

class NullDataException extends HandledException {
  NullDataException({String error = ''}) : super(error: error);
}

class UnauthorizedException extends HandledException {
  UnauthorizedException({String error = ''}) : super(error: error);
}

class UnprocessableEntityException extends HandledException
    implements Exception {
  UnprocessableEntityException({String error = ''}) : super(error: error);
}

class BadRequestException extends HandledException {
  BadRequestException({String error = ''}) : super(error: error);
}

class ForbiddenException extends HandledException {
  ForbiddenException({String error = ''}) : super(error: error);
}

class NotFoundException extends HandledException {
  NotFoundException({String error = ''}) : super(error: error);
}

class InternalServerErrorException extends HandledException {
  InternalServerErrorException({String error = ''}) : super(error: error);
}

class ServiceUnavailableException extends HandledException {
  ServiceUnavailableException({String error = ''}) : super(error: error);
}

class CacheException implements Exception {
  String error;

  CacheException({this.error = ""});
}

class PickFileException implements Exception {}
