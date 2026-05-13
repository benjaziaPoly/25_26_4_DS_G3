import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projet/projet_e_commerce/model/class_produit.dart';

class FirebaseCrud {
  /*
   Sauvegarde:list produit : fichier-> FB
   Recupération
  */
  Future<void> saveData(List<Produit> listeProd) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    WriteBatch batch = firestore.batch();
    try {
      for (var prod in listeProd) {
        DocumentReference docRef = firestore.collection('produits').doc();
        batch.set(docRef, prod.toMap());
      }

      await batch.commit();
      print("Data saved to FireStore : ${listeProd.length} Produits ");
    } catch (e) {
      print("Erreur détectée:$e");
    }
    //  Batch + transaction
    //  commit / Roolback
  }

  Future<List<Produit>> readData() async {
    List<Produit> tmp = [];
    final CollectionReference collectionProduits = FirebaseFirestore.instance
        .collection('produits');
    try {
      QuerySnapshot snapshot = await collectionProduits.get();
      for (var prod in snapshot.docs) {
        tmp.add(
          Produit.fromMap({
            "id": prod['id'] ?? '',
            "title": prod['title'] ?? '',
            "description": prod['description'] ?? '',
            "price": prod['price']?.toDouble() ?? 0.0,
            "imageUrl": prod['imageUrl'] ?? '',
            "brand": prod['brand'] ?? '',
            "produitCategoryName": prod['produitCategoryName'] ?? '',
            "quantity": prod['quantity']?.toInt() ?? 0,
          }),
        );
        print(prod.toString());
      }
    } catch (e) {
      print("Errerur détectéee:$e");
    } finally {
      return tmp;
    }
  }
}
