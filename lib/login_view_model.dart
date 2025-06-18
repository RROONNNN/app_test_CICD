import 'package:flutter/material.dart';

class LoginViewModel {
  final Navigator navigator;

  LoginViewModel({required this.navigator});

  void login(BuildContext context, String email) {
    if (email.isNotEmpty) {
      Navigator.pushNamed(context, 'home');
    }
  }
}
