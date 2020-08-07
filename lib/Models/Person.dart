import 'package:flutter/material.dart';

class Person {
  final String name;
  int Score;
  final Color color;
  List<String> _log;
  Person(this.name, this.Score, this.color, this._log);

  List<String> get log => _log;

  addlog(String note) {
    _log.add(note);
  }

  void AddToScore(int money) {
    Score += money;
    if (money.isNegative) {
      addlog(money.toString());
    } else {
      addlog("+$money");
    }
  }
}
