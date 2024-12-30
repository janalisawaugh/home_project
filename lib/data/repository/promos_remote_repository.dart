import 'dart:convert';
import 'package:flutter/services.dart';

import '../../domain/repository/promos_repository.dart';
import '../promo_dto.dart';

class PromosRemoteRepository implements PromosRepository {
  final AssetBundle bundle;

  PromosRemoteRepository({AssetBundle? bundle}) : bundle = bundle ?? rootBundle;
  @override
  Stream<List<PromoDto>> getPromoData() async* {
    try {
      String jsonString = await bundle.loadString('assets/promos.json');
      List<dynamic> jsonList = json.decode(jsonString);
      List<PromoDto> promos = jsonList.map((item) {
        return PromoDto.fromJson(item);
      }).toList();
      yield promos;
    } catch (e) {
      print("Error fetching promo data: $e");
      yield [];
    }
  }
}
