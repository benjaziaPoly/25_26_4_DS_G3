import 'package:flutter/material.dart';

class Compteur extends StatefulWidget {
  const Compteur({super.key});

  @override
  State<Compteur> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Compteur> {
  int cpt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                setState(() {
                print("click sur like");
                cpt += 1;
                print("Cpt=$cpt");  
                });
                
              },
              child: Icon(Icons.thumb_up, color: Colors.blue, size: 80),
            ),
            Text(cpt.toString(), style: TextStyle(fontSize: 30)),
            InkWell(
              onTap: () {
                setState(() {
                           print("click sur unlike");
                cpt -= 1;
                print("cpt=$cpt");
                });
       
              },
              child: Icon(Icons.thumb_down, color: Colors.red, size: 80),
            ),
          ],
        ),
      ),
    );
  }
}
