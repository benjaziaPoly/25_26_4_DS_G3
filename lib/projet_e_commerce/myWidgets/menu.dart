import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/service/firebase_crud.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Menu> {
  var enabled = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("BenJazia"),
            accountEmail: Text("mail@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT11ii7P372sU9BZPZgOR6ohoQbBJWbkJ0OVA&s",
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Acceuil"),
            onTap: () {
              Navigator.pushNamed(context, "home");
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Liste Produit"),
            onTap: () {
              Navigator.pushNamed(context, "listProduit");
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Panier"),
            onTap: () {
              Navigator.pushNamed(context, "panier");
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Mes Favoris"),
            onTap: () {
              Navigator.pushNamed(context, "favori");
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profil"),
            onTap: () {
              Navigator.pushNamed(context, "profil");
            },
          ),
          ListTile(
            enabled: enabled,
            leading: Icon(Icons.import_export_rounded),
            title: Text("Exporter Data "),
            onTap: () {
              var fbc = FirebaseCrud();
              fbc.saveData(AllProductData.Produits);
              setState(() {
                enabled = false;
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.sunny),
            title: Text("Consulter Méteo"),
            onTap: () {
              Navigator.pushNamed(context, "meteo");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Quitter"),
            onTap: () {
              //Android : API <20 , >20
              // Web
              //IOS
              //SystemNavigator.pop();
              exit(0);
            },
          ),
        ],
      ),
    );
  }
}
