import 'package:movies/core/network/error-message-model.dart';

class ServerExceptions implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerExceptions({required this.errorMessageModel});
}

class LocalDatabaseExceptions implements Exception{
  final String message;

  LocalDatabaseExceptions({required this.message});
}