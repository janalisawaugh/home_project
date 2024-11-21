import 'package:flutter/material.dart';
import 'package:home_project/domain/promo_banner_model.dart';

class Promo extends StatelessWidget {
  final PromoModel promoModel;

  Promo({required this.promoModel});

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
    Color backgroundColor = getBackgroundColor(promoModel.category);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 144,
        width: 360,
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promoModel.title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    promoModel.description,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, promoModel.link);
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
                          promoModel.buttonLabel,
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
                promoModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
