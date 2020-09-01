import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injector/injector.dart';
import 'package:refactory_flutter_test/app/infrastructures/endpoints.dart';
import 'package:refactory_flutter_test/app/infrastructures/persistences/api_service.dart';

class RootModule {
  static void init(Injector injector) {
    injector.registerSingleton<Endpoints>((_) => Endpoints(DotEnv().env['BASE_URL']));

    injector.registerDependency<Dio>((Injector injector) {
      var dio = Dio();
      dio.options.connectTimeout = 60000;
      dio.options.receiveTimeout = 60000;

      var endpoints = injector.getDependency<Endpoints>();

      // use for log response and request data
      dio.interceptors.add(LogInterceptor(
          requestBody: false,
          responseBody: false,
          requestHeader: false,
          responseHeader: false,
          request: false));
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: endpoints.baseUrl)).interceptor);
      dio.options.baseUrl = endpoints.baseUrl;

      (dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
      return dio;
    });

    injector.registerSingleton<EventBus>((Injector injector) {
      return EventBus();
    });

    injector.registerDependency<ApiService>((Injector injector) {
      return ApiService(injector.getDependency<Dio>());
    });
  }

  static parseAndDecode(String response) {
    return jsonDecode(response);
  }

  static parseJson(String text) {
    return compute(parseAndDecode, text);
  }
}