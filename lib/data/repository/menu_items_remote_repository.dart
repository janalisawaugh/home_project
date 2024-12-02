import '../../domain/repository/menu_items_repository.dart';
import '../menu_item_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItemsRemoteRepository implements MenuItemsRepository {
  final FirebaseFirestore _firestore;

  MenuItemsRemoteRepository(this._firestore);
  @override
  Stream<List<MenuItemDto>> getMenuData() async* {
    // yield* _firestore.get//getting endpoint
    //   mapper: (Object response) {
    //     return MenuItemDto.fromJson(response as Map<String, dynamic>);
    //   }
    try {
      await for (var snapshot
          in _firestore.collection('menuItems').snapshots()) {
        List<MenuItemDto> menuItems = snapshot.docs.map((doc) {
          return MenuItemDto.fromJson(doc.data() as Map<String, dynamic>);
        }).toList();
        yield menuItems;
      }
    } catch (e) {
      print("Error fetching menu data: $e");
      yield [];
    }
  }
}
