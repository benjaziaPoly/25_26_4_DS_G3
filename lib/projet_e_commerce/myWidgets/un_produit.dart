import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';

// DataBinding : passge des données : Widget PERE => Widget Fils =>widget
class WidgetProduit extends StatefulWidget {
  Produit p = Produit(
    id: "",
    title: "",
    description: "",
    price: 0.0,
    imageUrl: "",
    brand: "",
    produitCategoryName: "",
    quantity: 0,
  );
  //construteur de la classe WidgetProduit
  WidgetProduit({super.key, required this.p});

  //produit=Produit();
  //x=WidgetProduit(p:produit);
  @override
  _WidgetProduitState createState() => _WidgetProduitState();
}

class _WidgetProduitState extends State<WidgetProduit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                child: Image.network(
                  widget.p.imageUrl,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.38,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 30,
                top: 20,
                child: Badge(
                  label: Text('New', style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.purple,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.p.description,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${widget.p.price} tnd',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Quantité : ${widget.p.quantity}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
