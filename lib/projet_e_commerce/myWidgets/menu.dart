import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Menu> {
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
        ],
      ),
    );
  }
}
