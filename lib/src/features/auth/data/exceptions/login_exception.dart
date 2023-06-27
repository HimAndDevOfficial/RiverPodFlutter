import 'package:dio/dio.dart';

class LoginException implements Exception {
  String? message;

  LoginException({this.message});

  LoginException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      default:
        message = 'Something went wrong';
        break;
    }
  }


  @override
  String toString() => message.toString();
}
