import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BalanceController extends ChangeNotifier {
  late double _balance = 0.0;

  double get balance => _balance;

  BalanceController(){
    _loadBalance();
  }

  //Função para carregar o saldo salvo
  Future<void> _loadBalance() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _balance = prefs.getDouble('balance') ?? 0.0;
    notifyListeners();
  }

  //Função para salvar o saldo atual
  Future<void> _saveBalance() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('balance', _balance);
  }

  void deposit() {
    _balance += 100;
    _saveBalance();
    notifyListeners();
  }

  void withdraw(context) {
    if (_balance >= 50) {
      _balance -= 50;
      _saveBalance();
      notifyListeners();
    }else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Saldo insuficiente")
      ));
    }
  }
}
