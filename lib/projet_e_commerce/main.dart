import 'package:flutter/material.dart';
import 'package:projet/firebase_options.dart';
import 'package:projet/projet_e_commerce/pages/barre_navigation.dart';
import 'package:projet/projet_e_commerce/pages/favori.dart';
import 'package:projet/projet_e_commerce/pages/home_page.dart';
import 'package:projet/projet_e_commerce/pages/meteo_screen.dart';
import 'package:projet/projet_e_commerce/pages/page_user.dart';
import 'package:projet/projet_e_commerce/pages/panier.dart';
import 'package:projet/projet_e_commerce/pages/produit_detail.dart';
import 'package:projet/projet_e_commerce/pages/produit_list.dart';
import 'package:projet/projet_e_commerce/provider/cart_provider.dart';
import 'package:provider/provider.dart';
//Projet
import 'package:firebase_core/firebase_core.dart';

void main() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Connecté à Firebase OKKKK!");
  } catch (e) {
    print("Erreur de connexion à Firebase: $e");
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PanierProvider()),
      ],
      child: EcommerceApp(),
    ),
  );
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => HomePage(),
        "listProduit": (context) => ListProduitPage(),
        "detailProduit": (context) => ProduitDetailPage(),
        "panier": (context) => PanierScreen(),
        "favori": (context) => FavoritePage(),
        "profil": (context) => UserInfoPage(),
        "meteo": (context) => MeteoScreen(),
        "barreNavigation": (context) => BarreNavigationScreen(),
      },
      initialRoute: "barreNavigation",
      //home: BarreNavigationScreen(),
      //HomePage()
    );
  }
}
// 
// Future<void> getData() async{
//   1.
//   2.// assez lourde 
//    res=    await Instruction.....
//   3.
//   4
// }
/*
MYSQL, MONGODB,POSTGREss
Connexion=> login(@ip,@port,nom_Databse,username,password)
Identification => Application 
*/