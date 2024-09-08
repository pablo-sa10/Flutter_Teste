import '../pages/home.dart';
import 'package:flutter/material.dart';

class Balance extends ChangeNotifier {
  double _balance = 0;

  double get balance => _balance;

  void deposit() {
    _balance += 100;
    notifyListeners();
  }

  void withdraw(context) {
    if (_balance >= 50) {
      _balance -= 50;
      notifyListeners();
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Saldo insuficiente")
      ));
    }
  }
}
