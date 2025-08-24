import 'package:crypto_app/model/market.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CryptoRow {
  static DataRow buildRow(
    int rank,
    Market coin,
    Function(Market market)? callback,
  ) {
    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
      decimalDigits: 2,
    );
    final NumberFormat volumeFormatter = NumberFormat.compact(locale: 'en_US');

    // Use null-aware operators to handle potential null values
    final String currentPrice = coin.currentPrice != null
        ? currencyFormatter.format(coin.currentPrice)
        : 'N/A';
    final String volume = coin.totalVolume != null
        ? currencyFormatter.format(coin.totalVolume)
        : 'N/A';
    final String marketCap = coin.marketCap != null
        ? volumeFormatter.format(coin.marketCap)
        : 'N/A';
    final double? priceChangePercentage24H = coin.priceChangePercentage24H;

    return DataRow(
      cells: [
        DataCell(Text('$rank'), onTap: () => callback!(coin)),
        DataCell(
          onTap: () => callback!(coin),
          Row(
            children: [
              if (coin.image != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image.network(coin.image!, width: 20, height: 20),
                ),
              Text(
                '${coin.name} ${coin.symbol?.toUpperCase() ?? ''}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        DataCell(onTap: () => callback!(coin), Text(currentPrice)),
        DataCell(
          onTap: () => callback!(coin),
          _percentText(priceChangePercentage24H),
        ),
        DataCell(onTap: () => callback!(coin), Text(volume)),
        DataCell(onTap: () => callback!(coin), Text(marketCap)),
      ],
    );
  }

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
}
