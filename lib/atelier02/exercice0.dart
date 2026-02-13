import 'package:flutter/material.dart';

void main() {
  var myApp = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Page de Test", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Bonjour",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          Center(
            child: Text(
              "DS G3",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
        ],
      ),
    ),
  );
  runApp(myApp);
}
