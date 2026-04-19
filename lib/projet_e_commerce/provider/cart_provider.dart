import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projet/projet_e_commerce/model/class_produit_panier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanierProvider with ChangeNotifier {
  //attribut PArivate
  List<ProduitPanier> _panier = [];

  PanierProvider() {
    getCart();
  }

  //gertter
  List<ProduitPanier> get Panier {
    return _panier;
  }

  ///------------
  Future<void> saveCart() async {
    // sauvegarde du panier => LocalStorage, ShredPreferences
    final SharedPreferences data = await SharedPreferences.getInstance();
    //JSON: [{  "cle":valeur }]=> STRING FORMATEe
    //panier =>Json=> String
    final dynamic tmp = _panier.map((item) => item.toJson()).toList();
    await data.setString('savedCart', json.encode(tmp));
  }

  Future<void> getCart() async {
    //Récupération du panier => LocalStorage, ShredPreferences
    final SharedPreferences data = await SharedPreferences.getInstance();
    String? tmp = data.getString("savedCart");
    if (tmp == null) {
      _panier = [];
    } else {
      List<dynamic> tmpData = json.decode(tmp);
      _panier = tmpData.map((item) => ProduitPanier.fromJson(item)).toList();
    }
    notifyListeners();
  }

  ///------------
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
