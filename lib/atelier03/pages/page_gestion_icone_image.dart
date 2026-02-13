import 'package:flutter/material.dart';

class GestionIconeImage extends StatefulWidget {
  const GestionIconeImage({super.key});

  @override
  State<GestionIconeImage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GestionIconeImage> {
  int index = 0;
  List<IconData> mesIcones = [Icons.abc_rounded, Icons.alarm, Icons.circle];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: Text(
          "ATL 3- Application ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(mesIcones[index], size: 60, color: Colors.red),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (index < mesIcones.length - 1)
                            index++;
                          else
                            index = 0;
                        });
                      },
                      child: Text("Changer Icone"),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 60, color: Colors.red),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Changer Icone"),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.add, size: 60, color: Colors.red),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Changer Icone"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
