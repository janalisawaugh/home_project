import 'package:flutter/material.dart';

import '../../domain/entities/promo_entity.dart';

class Promo extends StatelessWidget {
  final PromoEntity promoEntity;

  const Promo({super.key, required this.promoEntity});

  Color getBackgroundColor(String category) {
    switch (category) {
      case 'Food':
        return Colors.blue;
      case 'Health':
        return Colors.green;
      case 'Shopping':
        return Colors.orange;
      case 'Music':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = getBackgroundColor(promoEntity.category);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      promoEntity.title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      promoEntity.description,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, promoEntity.link);
                    },
                    child: Container(
                      height: 36,
                      width: 93,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          promoEntity.buttonLabel,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                promoEntity.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
