import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/myWidgets/un_produit.dart';
import 'package:projet/projet_e_commerce/pages/produit_detail.dart';

class ListProduitPage extends StatefulWidget {
  const ListProduitPage({super.key});

  @override
  State<ListProduitPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListProduitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Produits"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.4,
        children: List.generate(AllProductData.Produits.length, (index) {
          return InkWell(
            onTap: () {
              ProduitDetailPage(produit:AllProductData.Produits[index]);
            },
            child: WidgetProduit(p: AllProductData.Produits[index]),
          );
        }),
      ),
    );
  }
}
