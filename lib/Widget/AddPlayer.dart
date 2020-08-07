import 'package:bank_of_luck/Models/Players.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:provider/provider.dart';

class AddPlayerWidget extends StatelessWidget {
  String _name;
  int score;
  Color c = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add player"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Name'),
            onChanged: (value) {
              _name = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Score'),
            onChanged: (value) {
              try{
                score = int.parse(value);
              }catch(e){
                score = 1500;
              }
            },
          ),
          CircleColorPicker(
            initialColor: Colors.blue,
            size: const Size(240, 240),
            strokeWidth: 4,
            thumbSize: 36,
            onChanged: (Color value) {
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
                  .addplayer(_name, c, score);
              Navigator.of(context).pop();
            }
          },
          child: const Text("Add"),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Cancel"),
        )
      ],
    );
  }
}