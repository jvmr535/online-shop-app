import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    // funciona como se fosse um useEffect do React
    autorun((_) {
      print(isFormValid);
    });
  }

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get isEmailValid =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$',
              caseSensitive: false)
          .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;
}
