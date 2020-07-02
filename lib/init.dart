import 'package:bank_of_luck/Models/Players.dart';
import 'package:bank_of_luck/play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:provider/provider.dart';

class init extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                String _name;
                int score;
                Color c  = Colors.blue ;
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("Add player"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Name'
                            ),
                            onChanged: (value) {
                              _name = value;
                            },
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintText: 'Score'
                            ),
                            onChanged: (value) {
score = int.parse(value);
                            },
                          ),
                          CircleColorPicker(
                            initialColor: Colors.blue,size: const Size(240, 240),
                            strokeWidth: 4,
                            thumbSize: 36,
                            onChanged: (Color value){
                              c = value;
                            },
                          )
                        ],
                      ),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            if (_name != null && _name.trim() != '') {
                              Provider.of<Players>(context, listen: false)
                                  .addplayer(_name,c,score);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text("add"),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("cancel"),
                        )
                      ],
                    ));
              },
            )
          ],
        ),
        body: Consumer<Players>(
          builder: (BuildContext context, Players value, Widget child) {
            return Row(
                children: value.players.map((e) => playboard(e)).toList());
          },
        ));
  }
}