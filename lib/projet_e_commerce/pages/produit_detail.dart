import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/data/list_produits.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';
import 'package:projet/projet_e_commerce/model/class_produit_panier.dart';
import 'package:projet/projet_e_commerce/provider/cart_provider.dart';
import 'package:provider/provider.dart';

/**
 * Corriger le CR
 * Finaliser le menu
 * Presenter le pricnipe StateManager
 */
class ProduitDetailPage extends StatefulWidget {
  // Produit produit = Produit(
  //   id: "",
  //   title: "",
  //   description: "",
  //   price: 0.0,
  //   imageUrl: "",
  //   brand: "",
  //   produitCategoryName: "",
  //   quantity: 0,
  // );

  ProduitDetailPage({
    super.key,
    //required this.produit
  });

  @override
  State<ProduitDetailPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProduitDetailPage> {
  @override
  Widget build(BuildContext context) {
    final panier = Provider.of<PanierProvider>(context);

    final dynamic param = ModalRoute.of(context)!.settings.arguments;
    int indexProduit;

    if (param == null || param.toString().isEmpty) {
      indexProduit = 0;
    } else {
      indexProduit = int.parse(param.toString());
    }

    //Produit productInfo = widget.produit;
    Produit productInfo = AllProductData.Produits[indexProduit];

    return Scaffold(
      appBar: AppBar(title: Text(productInfo.title)),
      body: Stack(
        children: [
          Container(
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            child: Image.network(productInfo.imageUrl),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: Column(
              children: [
                const SizedBox(height: 250.0),
                Container(
                  color: Colors.grey[300],
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          productInfo.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        productInfo.price.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          productInfo.description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(),
                      infoProduct("Brand", productInfo.brand),
                      infoProduct("Quantity", productInfo.quantity.toString()),
                      infoProduct("Category", productInfo.produitCategoryName),
                    ],
                  ),
                ),
                //bouton en ba
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {
                          panier.ajouterProduit(
                            ProduitPanier(
                              id: productInfo.id,
                              title: productInfo.title,
                              price: productInfo.price,
                              imageUrl: productInfo.imageUrl,
                              description: productInfo.description,
                              quantite: 1,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        child: const Text("Add to Cart"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoProduct(String title, String value) {
    return Row(children: [Text(title), Text(value)]);
  }
}
