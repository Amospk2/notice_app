import 'package:flutter/widgets.dart';
import 'package:notice_app/services/prefs_services.dart';

class LoginController {
  // ignore: non_constant_identifier_names
  ValueNotifier<bool> InLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _senha;
  setSenha(String value) => _senha = value;

  Future<bool> auth() async {
    InLoader.value = true;
    await Future.delayed(const Duration(seconds: 2));
    InLoader.value = false;
    if (_login == 'admin' && _senha == '123') {
      PrefsServices.save(_login!);
      return true;
    }

    return false;
  }
}
