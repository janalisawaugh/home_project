import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/repository/menu_items_repository.dart';
import '../menu_item_dto.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemsRemoteRepository implements MenuItemsRepository {
  // final FirebaseFirestore _firestore;

  // MenuItemsRemoteRepository(this._firestore);
  @override
  Stream<List<MenuItemDto>> getMenuData() async* {
    try {
      // await for (var snapshot
      //     in _firestore.collection('menuItems').snapshots()) {
      //   List<MenuItemDto> menuItems = snapshot.docs.map((doc) {
      //     return MenuItemDto.fromJson(doc.data() as Map<String, dynamic>);
      //   }).toList();
      //   yield menuItems;
      // }
      String jsonString = await rootBundle.loadString('assets/menu_items.json');
      List<dynamic> jsonList = json.decode(jsonString);
      List<MenuItemDto> menuItems = jsonList.map((item) {
        return MenuItemDto.fromJson(item);
      }).toList();
      yield menuItems;
    } catch (e) {
      print("Error fetching menu data: $e");
      yield [];
    }
  }
}
