// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:ecommerce/core/functions/checkinternet.dart';
// import 'package:http/http.dart' as http;
// import 'statusrequest.dart';

// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
//     try {
//       if (await checkInternet()) {
//         var respons = await http.post(Uri.parse(url), body: data);
//         if (respons.statusCode == 200 || respons.statusCode == 201) {
//           Map responsBody = jsonDecode(respons.body);
//           // print(responsBody);
//           return Right(responsBody);
//         } else {
//           return const Left(StatusRequest.serverFailure);
//         }
//       } else {
//         return const Left(StatusRequest.offlineFailure);
//       }
//     } catch (_) {
//       return const Left(StatusRequest.serverFailure);
//     }
//   }
// }
import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:khafif/core/functions/checkinternet.dart';
import 'statusrequest.dart';

/// A generic HTTP client interface to allow mocking in tests.
abstract class IHttpClient {
  Future<http.Response> post(
    Uri uri, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  });
}

class HttpClientImpl implements IHttpClient {
  final http.Client _client;
  HttpClientImpl([http.Client? client]) : _client = client ?? http.Client();

  @override
  Future<http.Response> post(
    Uri uri, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    return _client.post(uri, headers: headers, body: body, encoding: encoding);
  }
}

class Crud {
  final IHttpClient _httpClient;
  final Duration timeout;

  Crud({IHttpClient? httpClient, this.timeout = const Duration(seconds: 10)})
    : _httpClient = httpClient ?? HttpClientImpl();

  /// Posts [data] to [url] and returns either a StatusRequest or decoded JSON.
  Future<Either<StatusRequest, Map<String, dynamic>>> postData(
    String url,
    Map<String, dynamic> data, {
    Map<String, String>? headers,
  }) async {
    try {
      final isOnline = await checkInternet();
      if (!isOnline) {
        return const Left(StatusRequest.offlineFailure);
      }

      final uri = Uri.parse(url);
      final defaultHeaders = {
        'Content-Type': 'application/json',
        if (headers != null) ...headers,
      };

      final response = await _httpClient
          .post(uri, headers: defaultHeaders, body: jsonEncode(data))
          .timeout(timeout);

      switch (response.statusCode) {
        case 200:
        case 201:
          final Map<String, dynamic> body = jsonDecode(response.body);
          return Right(body);
        case 400:
          return const Left(StatusRequest.badRequest);
        case 401:
        case 403:
          return const Left(StatusRequest.authFailure);
        case 500:
          return const Left(StatusRequest.serverFailure);
        default:
          return const Left(StatusRequest.unknownFailure);
      }
    } on TimeoutException {
      return const Left(StatusRequest.timeoutFailure);
    } on FormatException {
      return const Left(StatusRequest.formatFailure);
    } catch (e) {
      // You may log e.toString() or send to your analytics
      return const Left(StatusRequest.serverFailure);
    }
  }
}
