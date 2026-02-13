import 'package:flutter/material.dart';

class Produit {
  //att+getters/setters+constr+methode
  int _code = 0;
  String _lib = "";
  int _qte = 0;

  int get code => _code;
  String get lib => _lib;
  int get qte => _qte;

  set code(int c) => _code = c;
  set lib(String c) => _lib = c;
  set qte(int c) => _qte = c;

  Produit() {
    _code = 0;
    _qte = 0;
    _lib = "";
  }
  Produit.avecParam(int code, String lib, int qte) {
    _code = code;
    _qte = qte;
    _lib = lib;
  }
  Produit.avecParamOpt(int code, String lib, int qte);

  Produit.avecParamOptNomme({
    int code = 0,
    required String lib,
    required int qte,
  });
  @override
  String toString() {
    return "Produit=Code:$_code, lib:$_lib, qte:$_qte";
  }
}

void main() {
  var p = Produit();
  var p1 = Produit.avecParam(10, "aa", 10);
  var p2 = Produit.avecParamOpt(10, "aa", 10);
  var p3 = Produit.avecParamOptNomme(code: 10, lib: "aa", qte: 10); /////
  print(p);
}
MaterialApp(
  home:Scaffold(appBar: ,)
);//config de app: routage, langue, oritenation,theme
// SCAffold=> un screen :une page 