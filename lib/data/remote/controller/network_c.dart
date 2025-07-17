import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../common/utilities/logger.dart';
import '../../../presentation/views/global/widgets/show_toast.dart';
import '../config/api_endpoints.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class NetworkController {
  Dio? _dio;

  static header() => {"Accept": "application/json", "Content-Type": "application/json"};

  Future<NetworkController> init() async {
    _dio = Dio(
      BaseOptions(baseUrl: ApiEndPoints.baseUrl, headers: header(), connectTimeout: const Duration(seconds: 30), receiveTimeout: const Duration(seconds: 30)),
    );
    initInterceptors();
    return this;
  }

  void initInterceptors() {
    _dio!.interceptors.add(dioLogger);
  }

  Future<Response?> request({required String url, required Method method, dynamic params, String? authToken, Map<String, dynamic>? headers}) async {
    Response? response;

    // NO AUTH REQUIRED FOR THIS PROJ
    // authToken ??= localStorageInstance.getString(key: LocalStorageKeys.token);

    try {
      Options options = Options(headers: headers ?? {"Authorization": "Bearer $authToken"});

      switch (method) {
        case Method.POST:
          response = await _dio!.post(url, data: params, options: options);
          break;
        case Method.DELETE:
          response = await _dio!.delete(url, options: options);
          break;
        case Method.PATCH:
          response = await _dio!.patch(url, data: params, options: options);
          break;
        case Method.PUT:
          response = await _dio!.put(url, data: params, options: options);
          break;
        case Method.GET:
          response = await _dio!.get(url, queryParameters: params, options: options);
          break;
      }

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode == 401) {
        logger.error("Unauthorized: ${response.data}");
        showToast("Unauthorized", "You are not authorized", backgroundColor: Colors.red);
      } else if (response.statusCode == 422) {
        String msg = response.data['message'] ?? "Validation error";
        logger.error("Validation Error: $msg");
        showToast("Snap", msg, backgroundColor: Colors.red, icon: const Icon(Icons.error_outline, size: 40));
      } else if (response.statusCode == 500) {
        logger.error("Server Error: ${response.data}");
        showToast("Oops", "Server error");
      } else {
        logger.error("Unexpected Status: ${response.statusCode} - ${response.data}");
        showToast("Oops", "Something went wrong");
      }

      return response;
    } on SocketException catch (e) {
      logger.error("No Internet Connection: $e");
      showToast("Oops", "No Internet Connection");
      return response;
    } on FormatException catch (e) {
      logger.error("Bad response format: $e");
      showToast("Oops", "Bad response format");
      return response;
    } on DioException catch (e) {
      logger.error("DioException: ${e.message}");
      return e.response;
    } catch (e) {
      logger.error("Unhandled Error: $e");
      showToast("Oops", "Something went wrong");
      return response;
    }
  }
}

final NetworkController networkControllerInstance = GetIt.I<NetworkController>();
