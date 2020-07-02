import 'package:bank_of_luck/Models/Players.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Models/Person.dart';

class playboard extends StatelessWidget {
  playboard(this._person);
  Person _person;
  TextEditingController _changenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var data = Provider.of<Players>(context);
    return Expanded(
      child: ListView(
        children: <Widget>[
          Text(
            _person.name,
            style: TextStyle(fontSize: 20, color: _person.color),
            textAlign: TextAlign.center,
          ),
          Text(
            _person.Score.toString(),
            style: TextStyle(color: Colors.blue, fontSize: 22),
            textAlign: TextAlign.center,
          ),
          Container(
              child: TextField(textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: _changenumber,
              )),
          RaisedButton(
            color: Colors.green.shade300,
            onPressed: () {
              if (_changenumber.text.isNotEmpty) {
                data.addtoScore(_person, int.parse("${_changenumber.text}"));
              }
              _changenumber.clear();
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 26),
            ),
          ),
          RaisedButton(
            color: Colors.red.shade300,
            onPressed: () {
              if (_changenumber.text.isNotEmpty) {
                data.addtoScore(_person, int.parse("-${_changenumber.text}"));
              }
              _changenumber.clear();
            },
            child: Text(
              '-',
              style: TextStyle(fontSize: 26),
            ),
          ),
          ...data.players.map((e) {
            if (_person.name != e.name) {
              return MaterialButton(
                color: e.color,
                onPressed: () {
                  data.tranfare(data.get(_person.name), data.get(e.name),
                      int.parse(_changenumber.text));
                  _changenumber.clear();
                },
                child: FittedBox(
                  child: Text(
                    "to ${e.name}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
            return SizedBox();
          }).toList(),
          ..._person.log
              .map((e) => Text(e, textAlign: TextAlign.center))
              .toList(),
          RaisedButton(
            color: Colors.red,
            onPressed: () {
              data.deleteplayer(_person);
            },
            child: FittedBox(child: Text('Remove')),
          )
        ],
      ),
    );
  }
}
