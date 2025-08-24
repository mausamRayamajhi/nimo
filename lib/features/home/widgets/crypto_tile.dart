import 'package:crypto_app/model/market.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoTile extends StatelessWidget {
  final Market coin;

  const CryptoTile({super.key, required this.coin});

  static Widget _percentText(double? value) {
    if (value == null) {
      return const Text('N/A', style: TextStyle(color: Colors.grey));
    }
    bool isPositive = value >= 0;
    return Text(
      '${isPositive ? '+' : ''}${value.toStringAsFixed(2)}%',
      style: TextStyle(
        color: isPositive ? Colors.green : Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    );
    final String currentPrice = coin.currentPrice != null
        ? currencyFormatter.format(coin.currentPrice)
        : 'N/A';

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (coin.image != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.network(coin.image!, width: 24, height: 24),
                  ),
                Expanded(
                  child: Text(
                    '${coin.name}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Text(
              currentPrice,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("24h:", style: TextStyle(color: Colors.grey)),
                _percentText(coin.priceChangePercentage24H),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
