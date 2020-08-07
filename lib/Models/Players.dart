import 'package:bank_of_luck/Models/Person.dart';
import 'package:flutter/material.dart';

class Players with ChangeNotifier {
  List<Person> _pplayers = [];

  addplayer(String name, Color c, int Score) {
    if (Score == null) {
      Score = 1500;
    }
    _pplayers.add(Person(name, Score, c, ["Start +$Score"]));
    notifyListeners();
  }

  addtoScore(Person p, int money) {
    p.AddToScore(money);
    notifyListeners();
  }

  deleteplayer(Person pp) {
    _pplayers.remove(pp);
    notifyListeners();
  }

  List<Person> get players => _pplayers;

  Person get(String name) {
    return _pplayers.firstWhere((element) => element.name == name);
  }

 void transfare(Person from, Person to, int money) {
    if (from.Score >= money) {
      to.AddToScore(money);
      from.AddToScore(-money);
    }
    notifyListeners();
  }
}
