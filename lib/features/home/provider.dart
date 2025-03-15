import 'package:fipe_valor/data/models/app_error.dart';
import 'package:fipe_valor/data/models/either.dart';
import 'package:fipe_valor/data/models/fipe_value.dart';
import 'package:fipe_valor/features/home/repository.dart';
import 'package:flutter/foundation.dart';

class HomeProvider extends ChangeNotifier {
  final HomeRepository repository;
  final ValueNotifier<List<FipeValue>> fipeValues = ValueNotifier(
    <FipeValue>[],
  );
  final ValueNotifier<String> code = ValueNotifier('');
  final ValueNotifier<bool> load = ValueNotifier(false);
  HomeProvider(this.repository);

  Future<Either<AppError, List<FipeValue>>> fetchValues() async {
    load.value = true;
    notifyListeners();
    Either<AppError, List<FipeValue>> result = await repository.fetchValue(
      code.value,
    );
    result.fold(
      (AppError error) {
        // TODO handler error
      },
      (List<FipeValue> values) {
        fipeValues.value = values;
        fipeValues.notifyListeners();
      },
    );
    load.value = false;
    notifyListeners();
    return result;
  }

  onChangedCode(String value) => code.value = value;
  onsavedCode(String newValue) => code.value = newValue;
  validateCode(String value) =>
      value.length < 7 ? 'Insira um código válido' : null;
}
