import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<void> addOrder(Order order) async {
    await _db.collection('orders').doc(order.id).set(order.toJson());
  }

  Stream<List<Order>> getOrders() {
    return _db.collection('orders').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Order.fromJson(doc.data())).toList();
    });
  }
}
