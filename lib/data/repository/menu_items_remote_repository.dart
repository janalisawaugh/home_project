import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/repository/menu_items_repository.dart';
import '../menu_item_dto.dart';

class MenuItemsRemoteRepository implements MenuItemsRepository {
  final AssetBundle bundle;

  MenuItemsRemoteRepository({AssetBundle? bundle})
      : bundle = bundle ?? rootBundle;

  @override
  Stream<List<MenuItemDto>> getMenuData() async* {
    try {
      String jsonString = await bundle.loadString('assets/menu_items.json');
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
