import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_template/data/models/purchase.dart';

class PurchaseRepository {
  late final CollectionReference<Purchase> _purchaseCollection;

  PurchaseRepository({
    required CollectionReference<Purchase> purchaseCollection,
  }) : _purchaseCollection = purchaseCollection;

  void addPurchase(Purchase purchase) {
    _purchaseCollection.add(purchase);
  }

  void markPurchased(String? id, bool purchased) {
    _purchaseCollection.doc(id).update({'purchased': purchased});
  }
}
