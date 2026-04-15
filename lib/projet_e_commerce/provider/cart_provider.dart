import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit_panier.dart';

class PanierProvider with ChangeNotifier {
  //attribut PArivate
  List<ProduitPanier> _panier = [];

  //gertter
  List<ProduitPanier> get Panier {
    return _panier;
  }

  // Deux Méthodes prédéfinies :
  // firstwhere => recherche dans une liste
  // add => Ajoiuter un nouveau élément à une liste
  void ajouterProduit(ProduitPanier nouveauProduit) {
    ProduitPanier? produitTrouve = _panier.firstWhere(
      (art) {
        if (art.id == nouveauProduit.id) {
          art.quantite += 1;
          return true;
        }
        return false;
      },
      orElse: () {
        print("Ajout nouveau produit :" + nouveauProduit.title);
        nouveauProduit.quantite = 1;
        _panier.add(nouveauProduit);
        return nouveauProduit;
      },
    );
    notifyListeners();
  }
}
