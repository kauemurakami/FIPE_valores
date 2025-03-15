import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fipe_valor/core/constants/api_constants.dart';
import 'package:fipe_valor/data/models/app_error.dart';
import 'package:fipe_valor/data/models/either.dart';
import 'package:fipe_valor/data/models/fipe_value.dart';

class AppApi {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<Either<AppError, List<FipeValue>>> fetchValue(String fipeCode) async {
    final response = await _dio.get('${ApiConstants.endpoint}/$fipeCode');

    if (response.statusCode == 200) {
      return Either.right(fipeValueFromJson(json.encode(response.data)));
    }
    return Either.left(AppError.fromJson(response.data));
  }
}
