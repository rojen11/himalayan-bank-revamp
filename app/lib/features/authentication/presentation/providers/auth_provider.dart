import 'package:app/features/authentication/data/repositories/authentication_repository.dart';
import 'package:app/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late String _accessToken;
  bool _isLoggedIn = false;

  String get accessToken => _accessToken;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String username, String password) async {
    var res = await AuthenticationRepository.login(username, password);

    if (res.success && res.data != null) {
      _isLoggedIn = true;
      _accessToken = res.data!.accessToken;
      notifyListeners();
      return;
    } else {
      throw Exception();
    }
  }

  void logout(BuildContext context) {
    _accessToken = '';
    _isLoggedIn = false;
    notifyListeners();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
