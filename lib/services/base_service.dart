import 'package:flutter_github_app/models/base_model.dart';
import 'package:stacked/stacked.dart';

class BaseService<T extends BaseModel<dynamic>> {
  late ReactiveValue<T> _rxModel;

  void initRxModel(T value) {
    _rxModel = ReactiveValue(value);
  }

  ReactiveValue<T> getRxModel() => _rxModel;

  void setRxModelValue(T value) => _rxModel.value = value;

  T getRxModelValue() => _rxModel.value;
}
