import 'package:flutter/material.dart';

class GestionCouleur extends StatefulWidget {
  const GestionCouleur({super.key});

  @override
  State<GestionCouleur> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GestionCouleur> {
  Color couleur = Colors.green;
  List<Color> mesCouleurs = [
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.indigoAccent,
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mesCouleurs[index],
      appBar: AppBar(
        title: Text("ATL 3- Exercice 2", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (index < mesCouleurs.length - 1)
                    index++;
                  else
                    index = 0;
                });
              },
              child: Text("Changer Couleur"),
            ),
          ],
        ),
      ),
    );
  }
}
