import 'package:crypto_app/features/home/widgets/crypto_tile.dart';
import 'package:crypto_app/model/market.dart';
import 'package:flutter/material.dart';

class CryptoListView extends StatelessWidget {
  final List<Market> coins;

  const CryptoListView({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // To prevent scrolling issues within a parent SingleChildScrollView
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            2, // You can adjust this to show 2 or more tiles per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio:
            1.5, // Adjust this for tile shape (width/height ratio)
      ),
      itemCount: coins.length,
      itemBuilder: (context, index) {
        return CryptoTile(coin: coins[index]);
      },
    );
  }
}
