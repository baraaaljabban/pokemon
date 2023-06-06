import 'dart:convert';

class FailedResponse {
  List<Error> errors;

  FailedResponse({
    required this.errors,
  });

  factory FailedResponse.fromMap(Map<String, dynamic> map) {
    return FailedResponse(
      errors: List<Error>.from(map['errors']?.map((x) => Error.fromMap(x))),
    );
  }

  factory FailedResponse.fromJson(String source) => FailedResponse.fromMap(json.decode(source));
}

class Error {
  String? message;
  List<Location>? locations;
  List<String>? path;
  Extensions? extensions;

  Error({
    this.message,
    this.locations,
    this.path,
    this.extensions,
  });

  factory Error.fromMap(Map<String, dynamic> map) {
    return Error(
      message: map['message'],
      locations: map['locations'] != null ? List<Location>.from(map['locations']?.map((x) => Location.fromMap(x))) : null,
      path: List<String>.from(map['path']),
      extensions: map['extensions'] != null ? Extensions.fromMap(map['extensions']) : null,
    );
  }

  factory Error.fromJson(String source) => Error.fromMap(json.decode(source));
}

class Extensions {
  String? code;
  Response? response;
  List<String>? stacktrace;

  Extensions({
    this.code,
    this.response,
    this.stacktrace,
  });

  factory Extensions.fromMap(Map<String, dynamic> map) {
    return Extensions(
      code: map['code'],
      response: map['response'] != null ? Response.fromMap(map['response']) : null,
      stacktrace: List<String>.from(map['stacktrace']),
    );
  }

  factory Extensions.fromJson(String source) => Extensions.fromMap(json.decode(source));
}

class Response {
  String? url;
  int? status;
  String? statusText;
  String? body;

  Response({
    this.url,
    this.status,
    this.statusText,
    this.body,
  });

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      url: map['url'],
      status: map['status']?.toInt(),
      statusText: map['statusText'],
      body: map['body'],
    );
  }

  factory Response.fromJson(String source) => Response.fromMap(json.decode(source));
}

class Location {
  int? line;
  int? column;

  Location({
    this.line,
    this.column,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      line: map['line']?.toInt(),
      column: map['column']?.toInt(),
    );
  }

  factory Location.fromJson(String source) => Location.fromMap(json.decode(source));
}
