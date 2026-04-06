import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/item.dart';

Class ItemService {
  final itemsRef = FirebaseFirestore.instance.collection('items');

  //create item
  Future<void> addItem(Item item) async {
    await itemsRef.add(item.toMap());
  }

  //read item
  Stream<List<Item>> streamItems() {
    return itemsRef.snapshots().map(
      (snap) => snap.docs.map((d) => Item.fromMap(d.id, d.data())).toList(),
    );
  }

  //update item
  Future<void> updateItem(Item item) async {
    await itemsRef.doc(item.id).update(item.toMap());
  }

  //delete item
  Future<void> deleteItem(String id) async {
    await itemsRef.doc(id).delete();
  }
}