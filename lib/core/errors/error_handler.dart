import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'exceptions.dart';
import 'failed_response.dart';
import 'failures.dart';

mixin CustomErrorHandler {
  CustomException gotNonSuccessResponse(OperationException e) {
    var error = Extensions.fromMap(e.graphqlErrors.first.extensions!);
    var code = int.tryParse(error.code ?? '') ?? 0;
    var message = error.response?.body ?? '';
    CustomException exceptionToThrow = UnhandledServerErrorException(body: message);

    if (code == 401) {
      throw ForbiddenException(body: message, statusCode: code);
    } else if (code == 403) {
      throw ForbiddenException(body: message, statusCode: code);
    } else if (code >= 400 && code <= 499) {
      throw ApiLogicException(
        errorCode: code,
        title: message,
        message: message,
      );
    } else if (code >= 500) {
      throw ServerErrorException(statusCode: code, body: message);
    }
    return exceptionToThrow;
  }

  /// Supported exception map to failure
  ///
  /// - FormatException => JsonFormatFailure
  /// - ConnectionUnavailableException => ConnectionUnavailableFailure
  /// - ServerErrorException => ServerFailure
  /// - UnhandledServerErrorException => UnhandledServerFailure
  /// - ApiLogicException => UnhandledLogicException. **NOTE** Passing this means logic error is not being handle at business logic side
  Failure mapCommonExceptionToFailure(Exception exception) {
    if (exception is FormatException) {
      debugPrint("FormatException ${exception.message}");
      return JsonFormatFailure(message: "format_failure");
    }

    if (exception is LocalDataSourceException) {
      debugPrint("FormatException ${exception.message}");
      return LocalDataSourceFailure(message: "reading_local_db_failed");
    }

    if (exception is ConnectionUnavailableException) {
      debugPrint("ConnectionUnavailableException");
      return ConnectionUnavailableFailure();
    }

    if (exception is ApiLogicException) {
      debugPrint("ApiLogicException ${exception.message}");
      return LogicFailure(message: exception.message, title: exception.title);
    }
    if (exception is ServerErrorException) {
      debugPrint("ServerErrorException ${exception.statusCode}");
      return ServerFailure(statusCode: exception.statusCode, message: exception.body);
    }

    if (exception is UnhandledServerErrorException) {
      return UnhandledServerFailure(message: exception.body);
    }

    if (exception is ForbiddenException) {
      debugPrint("ForbiddenException ${exception.statusCode}");
      return ForbiddenFailure(statusCode: exception.statusCode, message: exception.body);
    }
    if (exception is SocketException) {
      debugPrint("SocketException");
      return ConnectionUnavailableFailure();
    }

    debugPrint("UnhandledFailure ${exception.toString()}");
    return UnhandledFailure(message: "An error occurred, Try again");
  }
}
