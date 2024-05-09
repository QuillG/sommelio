import 'package:dio/dio.dart';

class AuthenticationService {
  //connexion à l'API
    final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://120.0.0.1:localhost:44335',
      connectTimeout: const Duration(seconds: 6000),
      receiveTimeout: const Duration(seconds: 6000),
      responseType: ResponseType.json,
      contentType: "application/json"
    ),
  );

  //get de _dio
  Dio get dio => _dio;

}