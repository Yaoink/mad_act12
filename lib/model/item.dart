import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  String? id;
  String name;
  int quantity;
  double price;

  Item({
    this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  //dart object to Firestore map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }

  //Firestore document to dart object
  factory Item.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Item(
      id: doc.id,
      name: data['name'],
      quantity: data['quantity'],
      price: data['price'],
    );
  }
}