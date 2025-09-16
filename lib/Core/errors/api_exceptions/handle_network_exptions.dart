import 'dart:io';

import 'package:dio/dio.dart';

import '../error_model.dart';
import 'network_exptions.dart';

class HandleNetworkExceptions {
  static NetworkExceptions _getDioStatusCodeException(Response? response) {
    final int statusCode = response?.statusCode ?? 0;

    switch (statusCode) {
      case 400:
        return const BadRequestException();
      case 401:
      case 403:
        return UnauthorizedRequestException(_getDioBadResponseExceptions(response));
      case 404:
        return NotFoundException(_getDioBadResponseExceptions(response));
      case 408:
        return const RequestTimeoutException();
      case 409:
        return const ConflictException();
      case 422:
        return UnprocessableEntityException(_getDioBadResponseExceptions(response));
      case 500:
        return const InternalServerErrorException();
      case 503:
        return const ServiceUnavailableException();
      default:
        return DefaultErrorException(
          "Received invalid status code: $statusCode",
        );
    }
  }

  static String _getDioBadResponseExceptions(Response? response) {
    List<ErrorModel> listOfErrors = [];
    if (response!.data is List) {
      listOfErrors = (response.data as List)
          .map((e) => ErrorModel.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    String allErrors = listOfErrors.map((e) => e.toString()).join(", ");

    if (allErrors.isEmpty) {
      allErrors = "Unknown error occurred";
    }
    return allErrors;
  }

  static NetworkExceptions _handleDioBadResponse(Response? response) {
    if (response?.data == null) {
      return UnexpectedErrorException(response.toString());
    }
    try {
      return _getDioStatusCodeException(response);
    } catch (e) {
      return UnexpectedErrorException(e.toString());
    }
  }

  static NetworkExceptions _getDioExceptionType(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return const RequestCancelledException();
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return const RequestTimeoutException();
      case DioExceptionType.connectionError:
      case DioExceptionType.unknown:
        return const NoInternetConnectionException();
      case DioExceptionType.badResponse:
        return _handleDioBadResponse(error.response);
      case DioExceptionType.sendTimeout:
        return const SendTimeoutException();
      case DioExceptionType.badCertificate:
        return const UnauthorizedRequestException("Bad certificate");
      default:
        return UnexpectedErrorException(error.toString());
    }
  }

  static NetworkExceptions _handleExceptionType(Exception error) {
    try {
      if (error is DioException) {
        return _getDioExceptionType(error);
      } else if (error is SocketException) {
        return const NoInternetConnectionException();
      } else if (error is FormatException) {
        return const FormatException();
      } else {
        return UnexpectedErrorException(error.toString());
      }
    } on FormatException {
      return const FormatException();
    } catch (_) {
      return UnexpectedErrorException(error.toString());
    }
  }

  static NetworkExceptions getExceptionType(Object error) {
    if (error is Exception) {
      return _handleExceptionType(error);
    } else if (error.toString().contains("is not a subtype of")) {
      return UnableToProcessException(error.toString());
    }
    return UnexpectedErrorException(error.toString());
  }
}
