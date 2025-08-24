import 'package:crypto_app/core/navigation/navigators/app_navigator.dart';
import 'package:crypto_app/features/home/widgets/crypto_row.dart';
import 'package:crypto_app/model/market.dart';
import 'package:flutter/material.dart';

class CryptoTable extends StatelessWidget {
  final List<Market> coins;
  const CryptoTable({super.key, required this.coins});

  @override
  Widget build(BuildContext context) {
    // void _onRowTap(Market coin) {
    //   // Handle row tap, e.g., navigate to detail page or show a dialog
    //   print('Tapped on ${coin.name} in table');
    //   AppNavigator.homeTab.navigateToCoinScreen(context, coinID: coin.id);
    // }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: DataTable(
        columnSpacing: 20,
        headingRowColor: WidgetStateProperty.all(Colors.grey[200]),

        columns: const [
          DataColumn(label: Text("#")),

          DataColumn(label: Text("Coin")),

          DataColumn(label: Text("Price")),

          DataColumn(label: Text("24h")),

          DataColumn(label: Text("24h Volume")),

          DataColumn(label: Text("Market Cap")),
        ],

        rows: coins
            .asMap()
            .entries
            .map(
              (entry) => CryptoRow.buildRow(entry.key + 1, entry.value, (coin) {
                AppNavigator.homeTab.navigateToCoinScreen(
                  context,
                  coinID: coin.id,
                );
              }),
            )
            .toList(),
      ),
    );
  }
}
