import 'package:bank_of_luck/Models/Players.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'init.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return Players();
      },
      child: MaterialApp(
        home: Scaffold(
          body: init(),
        ),
      ),
    );
  }
}



