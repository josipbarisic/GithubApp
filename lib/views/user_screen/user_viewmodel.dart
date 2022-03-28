import 'package:flutter_github_app/services/mixins/navigation_service_mixin.dart';
import 'package:stacked/stacked.dart';

class UserViewModel extends BaseViewModel with NavigationServiceMixin {
  void navigateBack() => navigationService.back();
}
