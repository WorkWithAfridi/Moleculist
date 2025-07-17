import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../common/utilities/logger.dart';
import '../config/api_endpoints.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class NetworkController {
  Dio? _dio;

  static header() => {
        "Accept": "application/json",
        "Content-Type": "application/json",
      };

  Future<NetworkController> init() async {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        headers: header(),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(
      dioLogger,
    );
  }

  Future<dynamic> request({
    required String url,
    required Method method,
    params,
    String? authToken,
  }) async {
    try {
      final response = await compute(_performHttpRequest, {
        'url': url,
        'method': method,
        'params': params,
        'authToken': authToken,
      });

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else if (response.statusCode == 422) {
        throw Exception("Error 422");
      } else {
        throw Exception("Something went wrong");
      }
    } on SocketException catch (e) {
      logger.error(e.message);
      throw Exception("No Internet Connection");
    } on FormatException catch (e) {
      logger.error(e.message);
      throw Exception("Bad response format");
    } on DioException catch (e) {
      logger.error(e.message ?? e.toString());
      handleDioError(e);
      throw Exception(e);
    } catch (e) {
      logger.error(e.toString());
      throw Exception("Something went wrong");
    }
  }

  static Future<Response> _performHttpRequest(Map<String, dynamic> data) async {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiEndPoints.baseUrl,
        headers: header(),
      ),
    );

    final url = data['url'];
    final method = data['method'];
    final params = data['params'];
    final authToken = data['authToken'];

    try {
      Response response;

      switch (method) {
        case Method.POST:
          response = await dio.post(url, data: params, options: Options(headers: {"Authorization": "Bearer $authToken"}));
          break;
        case Method.DELETE:
          response = await dio.delete(url);
          break;
        case Method.PATCH:
          response = await dio.patch(url);
          break;
        default:
          response = await dio.get(url, queryParameters: params, options: Options(headers: {"Authorization": "Bearer $authToken"}));
          break;
      }

      return response;
    } on DioException catch (e) {
      handleDioError(e);
      throw Exception(e);
    }
  }

  static void handleDioError(DioException e) {
    logger.error(e.toString());
  }
}
