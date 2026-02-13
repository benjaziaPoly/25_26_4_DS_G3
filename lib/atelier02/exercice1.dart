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
            monBouton(texte: "Enregsitrer", h: 70, l: 160),
            monBouton(
              texte: "Annuler",
              h: 70,
              l: 160,
              couleur: Colors.redAccent,
            ),
          ],
        ),
      ),
    ),
  );
  runApp(myApp);
}

Widget monBouton({
  required String texte,
  required double l,
  required double h,
  Color couleur = Colors.green,
}) {
  return SizedBox(
    width: l,
    height: h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: couleur,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: () {},
      child: Text(texte),
    ),
  );
}
