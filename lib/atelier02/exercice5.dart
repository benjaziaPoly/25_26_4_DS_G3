import 'package:flutter/material.dart';

void main() {
  var myApp = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Exercice 1", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print("click sur like");
              },
              child: Icon(Icons.thumb_up, color: Colors.blue, size: 80),
            ),
            Text("0", style: TextStyle(fontSize: 30)),
            InkWell(
              onTap: () {
                print("click sur unlike");
              },
              child: Icon(Icons.thumb_down, color: Colors.red, size: 80),
            ),
          ],
        ),
      ),
    ),
  );
  runApp(myApp);
}