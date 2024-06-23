import 'package:abast_pk/abast_pk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AbastProvider extends ChangeNotifier {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String collection = "abastecimentos";

  List<Abastecimento> abastecimentos = [];

  void addAbast(Abastecimento abast) {
    abastecimentos.add(abast);
    // print(abastecimentos?.length);
    notifyListeners();
  }

  list() {
    db.collection(collection).get().then((QuerySnapshot qs) {
      for (var doc in qs.docs) {
        var abast = doc.data() as Map<String, dynamic>;
        abastecimentos.add(Abastecimento.fromMap(doc.id, abast));
        notifyListeners();
      }
    });
  }

  insert(Abastecimento abast) {
    var data = <String, dynamic>{
      'valorTotal': abast.valorTotal,
      'quantidadeLitros': abast.quantidadeLitros,
      'quilometragemRodada': abast.quilometragemRodada
    };

    var future = db.collection(collection).add(data);

    future.then((DocumentReference doc) {
      String id = doc.id;
      abast.id = id;
      abastecimentos.add(abast);
      notifyListeners();
    });
  }

  delete(Abastecimento abast) {
    var future = db.collection(collection).doc(abast.id).delete();
    future.then((_) {
      abastecimentos.remove(abast);
      notifyListeners();
    });
  }
}
