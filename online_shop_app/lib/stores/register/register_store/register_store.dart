import 'dart:developer';

import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  _RegisterStore() {
    autorun((_) {
      log(email);
    });
  }

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get isEmailValid =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
              caseSensitive: false)
          .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get isConfirmPasswordValid => confirmPassword == password;

  @computed
  bool get isFormValid =>
      isEmailValid && isPasswordValid && isConfirmPasswordValid;
}
