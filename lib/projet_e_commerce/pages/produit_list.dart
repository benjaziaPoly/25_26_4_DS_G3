import 'package:flutter/material.dart';

import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';
import 'package:projet/projet_e_commerce/myWidgets/un_produit.dart';
import 'package:projet/projet_e_commerce/pages/produit_detail.dart';
import 'package:projet/projet_e_commerce/service/firebase_crud.dart';

class ListProduitPage extends StatefulWidget {
  const ListProduitPage({super.key});

  @override
  State<ListProduitPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListProduitPage> {
  List<Produit> data = [];
  List<Produit> tmp = [];
  var fbc = FirebaseCrud();

  bool isLoading = false;

  Future<void> getdatafromFirebase() async {
    setState(() {
      isLoading = true;
    });
    isLoading = true;
    tmp = await fbc.readData();

    setState(() {
      data = tmp;
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getdatafromFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liste des Produits"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.4,
              children: List.generate(data.length, (index) {
                return InkWell(
                  onTap: () {
                    /**
               * A. dans le constructeur DetailProduit
               *     Index 
               *     Produit
               * B. Navigator: le parametre nommé Arguments
               *     index , produit 
               */
                    Navigator.pushNamed(
                      context,
                      "detailProduit",
                      arguments: index,
                    );
                    // ProduitDetailPage(produit: AllProductData.Produits[index]);
                  },
                  child: WidgetProduit(p: data[index]),
                );
              }),
            ),
    );
  }
}
