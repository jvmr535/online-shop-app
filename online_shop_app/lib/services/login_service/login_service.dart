import 'package:online_shop_app/models/login/login_model.dart';
import 'package:online_shop_app/models/session/session_model/session_model.dart';

class LoginService {
  Future<Session> login(Login login) async {
    login.toJson();

    var response = await Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        return {'jwtToken': 'penis', 'userId': 'userId'};
      },
    );

    return Session.fromJson(response);
  }
}
