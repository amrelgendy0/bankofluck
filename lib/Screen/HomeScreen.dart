import 'package:bank_of_luck/Widget/AddPlayer.dart';
import 'package:bank_of_luck/Models/Players.dart';
import 'package:bank_of_luck/widget/PlayBoard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
               showDialog(context: context,child: AddPlayerWidget());
              },
            )
          ],
        ),
        body: Consumer<Players>(
          builder: (BuildContext context, Players value, Widget child) {
            return Row(
                children: value.players.map((e) => playboard(e,value)).toList());
          },
        ));
  }
}



