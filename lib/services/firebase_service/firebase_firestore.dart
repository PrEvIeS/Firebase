import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/data/models/purchase.dart';

class FirebaseFirestoreService {
  FirebaseFirestoreService._();

  static FirebaseFirestore instance = FirebaseFirestore.instance;

  static CollectionReference<Purchase> getPurchasesCollection() {
    return instance.collection('purchases').withConverter<Purchase>(
          fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
            Map<String, dynamic> purchase = snapshot.data()!;
            purchase.addAll({"id": snapshot.id});
            return Purchase.fromJson(purchase);
          },
          toFirestore: (purchase, _) => purchase.toJson(),
        );
  }
}
