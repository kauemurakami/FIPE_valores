import 'package:fipe_valor/core/services/api_service.dart';
import 'package:fipe_valor/data/models/app_error.dart';
import 'package:fipe_valor/data/models/either.dart';
import 'package:fipe_valor/data/models/fipe_value.dart';

class HomeRepository {
  final AppApi api;

  HomeRepository(this.api);

  Future<Either<AppError, List<FipeValue>>> fetchValue(String fipeCode) async =>
      await api.fetchValue(fipeCode);
}
